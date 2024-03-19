// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module jelly_fixed_float_projective_transformation_2d
        #(
            parameter   FLOAT_EXP_WIDTH         = 8,
            parameter   FLOAT_EXP_OFFSET        = (1 << (FLOAT_EXP_WIDTH-1)) - 1,
            parameter   FLOAT_FRAC_WIDTH        = 23,
            parameter   FLOAT_WIDTH             = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH,   // sign + exp + frac
            
            parameter   S_FIXED_INT_WIDTH       = 12,
            parameter   S_FIXED_FRAC_WIDTH      = 0,
            parameter   S_FIXED_WIDTH           = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH,
            
            parameter   M_FIXED_INT_WIDTH       = 12,
            parameter   M_FIXED_FRAC_WIDTH      = 8,
            parameter   M_FIXED_WIDTH           = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH,
            
            parameter   USER_WIDTH              = 0,
            parameter   USER_BITS               = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   MUL_DENORM_X_EXP_WIDTH  = FLOAT_EXP_WIDTH,
            parameter   MUL_DENORM_X_EXP_OFFSET = FLOAT_EXP_OFFSET,
            parameter   MUL_DENORM_X_INT_WIDTH  = 16,
            parameter   MUL_DENORM_X_FRAC_WIDTH = 8,
                                   
            parameter   MUL_DENORM_Y_EXP_WIDTH  = FLOAT_EXP_WIDTH,
            parameter   MUL_DENORM_Y_EXP_OFFSET = FLOAT_EXP_OFFSET,
            parameter   MUL_DENORM_Y_INT_WIDTH  = 16,
            parameter   MUL_DENORM_Y_FRAC_WIDTH = 8,
            
            parameter   MUL_DENORM_W_EXP_WIDTH  = FLOAT_EXP_WIDTH,
            parameter   MUL_DENORM_W_EXP_OFFSET = FLOAT_EXP_OFFSET,
            parameter   MUL_DENORM_W_INT_WIDTH  = 16,
            parameter   MUL_DENORM_W_FRAC_WIDTH = 8,
            
            parameter   RECIP_FLOAT_EXP_WIDTH   = FLOAT_EXP_WIDTH,
            parameter   RECIP_FLOAT_EXP_OFFSET  = FLOAT_EXP_OFFSET,
            parameter   RECIP_FLOAT_FRAC_WIDTH  = 16,
            parameter   RECIP_D_WIDTH           = 6,
            parameter   RECIP_K_WIDTH           = RECIP_FLOAT_FRAC_WIDTH - RECIP_D_WIDTH,
            parameter   RECIP_GRAD_WIDTH        = RECIP_FLOAT_FRAC_WIDTH,
            parameter   RECIP_RAM_TYPE          = "distributed",
            
            parameter   DIV_DENORM_X_EXP_WIDTH  = MUL_DENORM_X_EXP_WIDTH,
            parameter   DIV_DENORM_X_EXP_OFFSET = MUL_DENORM_X_EXP_OFFSET,
            parameter   DIV_DENORM_X_INT_WIDTH  = MUL_DENORM_X_INT_WIDTH + MUL_DENORM_W_INT_WIDTH,
            parameter   DIV_DENORM_X_FRAC_WIDTH = MUL_DENORM_X_FRAC_WIDTH,
            
            parameter   DIV_DENORM_Y_EXP_WIDTH  = MUL_DENORM_Y_EXP_WIDTH,
            parameter   DIV_DENORM_Y_EXP_OFFSET = MUL_DENORM_Y_EXP_OFFSET,
            parameter   DIV_DENORM_Y_INT_WIDTH  = MUL_DENORM_Y_INT_WIDTH + MUL_DENORM_W_INT_WIDTH,
            parameter   DIV_DENORM_Y_FRAC_WIDTH = MUL_DENORM_Y_FRAC_WIDTH,
            
            parameter   MASTER_IN_REGS          = 1,
            parameter   MASTER_OUT_REGS         = 1,
            
            parameter   DEVICE                  = "7SERIES" // "RTL"
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire            [FLOAT_WIDTH-1:0]   matrix00,
            input   wire            [FLOAT_WIDTH-1:0]   matrix01,
            input   wire            [FLOAT_WIDTH-1:0]   matrix02,
            input   wire            [FLOAT_WIDTH-1:0]   matrix10,
            input   wire            [FLOAT_WIDTH-1:0]   matrix11,
            input   wire            [FLOAT_WIDTH-1:0]   matrix12,
            input   wire            [FLOAT_WIDTH-1:0]   matrix20,
            input   wire            [FLOAT_WIDTH-1:0]   matrix21,
            input   wire            [FLOAT_WIDTH-1:0]   matrix22,
            
            input   wire            [USER_BITS-1:0]     s_user,
            input   wire    signed  [S_FIXED_WIDTH-1:0] s_x,
            input   wire    signed  [S_FIXED_WIDTH-1:0] s_y,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            output  wire            [USER_BITS-1:0]     m_user,
            output  wire            [M_FIXED_WIDTH-1:0] m_x,
            output  wire            [M_FIXED_WIDTH-1:0] m_y,
            output  wire                                m_valid,
            input   wire                                m_ready
        );
    
    
    
    
    // -----------------------------------------
    //  multiply
    // -----------------------------------------
        
    
    localparam  MUL_DENORM_X_FIXED_WIDTH = MUL_DENORM_X_INT_WIDTH + MUL_DENORM_X_FRAC_WIDTH;
    localparam  MUL_DENORM_Y_FIXED_WIDTH = MUL_DENORM_Y_INT_WIDTH + MUL_DENORM_Y_FRAC_WIDTH;
    localparam  MUL_DENORM_W_FIXED_WIDTH = MUL_DENORM_W_INT_WIDTH + MUL_DENORM_W_FRAC_WIDTH;
    
    
    wire            [MUL_DENORM_X_EXP_WIDTH-1:0]    mul_denorm_x_exp;
    wire    signed  [MUL_DENORM_X_FIXED_WIDTH-1:0]  mul_denorm_x_fixed;
    
    wire            [MUL_DENORM_Y_EXP_WIDTH-1:0]    mul_denorm_y_exp;
    wire    signed  [MUL_DENORM_Y_FIXED_WIDTH-1:0]  mul_denorm_y_fixed;
    
    wire            [MUL_DENORM_W_EXP_WIDTH-1:0]    mul_denorm_w_exp;
    wire    signed  [MUL_DENORM_W_FIXED_WIDTH-1:0]  mul_denorm_w_fixed;
    
    wire            [USER_BITS-1:0]                 mul_user;
    wire                                            mul_valid;
    wire                                            mul_ready;
    
    jelly_fixed_float_mul_add2
            #(
                .S_FIXED_INT_WIDTH      (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH     (S_FIXED_FRAC_WIDTH),
                
                .S_FLOAT_EXP_WIDTH      (FLOAT_EXP_WIDTH),
                .S_FLOAT_EXP_OFFSET     (FLOAT_EXP_OFFSET),
                .S_FLOAT_FRAC_WIDTH     (FLOAT_FRAC_WIDTH),
                
                .M_DENORM_EXP_WIDTH     (MUL_DENORM_X_EXP_WIDTH),
                .M_DENORM_EXP_OFFSET    (MUL_DENORM_X_EXP_OFFSET),
                .M_DENORM_INT_WIDTH     (MUL_DENORM_X_INT_WIDTH),
                .M_DENORM_FRAC_WIDTH    (MUL_DENORM_X_FRAC_WIDTH),
                
                .USER_WIDTH             (USER_WIDTH),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .DEVICE                 (DEVICE)
            )
        i_fixed_float_mul_add2_x
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (s_user),
                .s_fixed_x              (s_x),
                .s_fixed_y              (s_y),
                .s_float_a              (matrix00),
                .s_float_b              (matrix01),
                .s_float_c              (matrix02),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_user                 (mul_user),
                .m_denorm_exp           (mul_denorm_x_exp),
                .m_denorm_fixed         (mul_denorm_x_fixed),
                .m_valid                (mul_valid),
                .m_ready                (mul_ready)
            );
    
    
    jelly_fixed_float_mul_add2
            #(
                .S_FIXED_INT_WIDTH      (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH     (S_FIXED_FRAC_WIDTH),
                
                .S_FLOAT_EXP_WIDTH      (FLOAT_EXP_WIDTH),
                .S_FLOAT_EXP_OFFSET     (FLOAT_EXP_OFFSET),
                .S_FLOAT_FRAC_WIDTH     (FLOAT_FRAC_WIDTH),
                
                .M_DENORM_EXP_WIDTH     (MUL_DENORM_Y_EXP_WIDTH),
                .M_DENORM_EXP_OFFSET    (MUL_DENORM_Y_EXP_OFFSET),
                .M_DENORM_INT_WIDTH     (MUL_DENORM_Y_INT_WIDTH),
                .M_DENORM_FRAC_WIDTH    (MUL_DENORM_Y_FRAC_WIDTH),
                
                .USER_WIDTH             (0),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .DEVICE                 (DEVICE)
            )
        i_fixed_float_mul_add2_y
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (),
                .s_fixed_x              (s_x),
                .s_fixed_y              (s_y),
                .s_float_a              (matrix10),
                .s_float_b              (matrix11),
                .s_float_c              (matrix12),
                .s_valid                (s_valid),
                .s_ready                (),
                
                .m_user                 (),
                .m_denorm_exp           (mul_denorm_y_exp),
                .m_denorm_fixed         (mul_denorm_y_fixed),
                .m_valid                (),
                .m_ready                (mul_ready)
            );
    
    
    jelly_fixed_float_mul_add2
            #(
                .S_FIXED_INT_WIDTH      (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH     (S_FIXED_FRAC_WIDTH),
                
                .S_FLOAT_EXP_WIDTH      (FLOAT_EXP_WIDTH),
                .S_FLOAT_EXP_OFFSET     (FLOAT_EXP_OFFSET),
                .S_FLOAT_FRAC_WIDTH     (FLOAT_FRAC_WIDTH),
                
                .M_DENORM_EXP_WIDTH     (MUL_DENORM_W_EXP_WIDTH),
                .M_DENORM_EXP_OFFSET    (MUL_DENORM_W_EXP_OFFSET),
                .M_DENORM_INT_WIDTH     (MUL_DENORM_W_INT_WIDTH),
                .M_DENORM_FRAC_WIDTH    (MUL_DENORM_W_FRAC_WIDTH),
                
                .USER_WIDTH             (0),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .DEVICE                 (DEVICE)
            )
        i_fixed_float_mul_add2_w
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (),
                .s_fixed_x              (s_x),
                .s_fixed_y              (s_y),
                .s_float_a              (matrix20),
                .s_float_b              (matrix21),
                .s_float_c              (matrix22),
                .s_valid                (s_valid),
                .s_ready                (),
                
                .m_user                 (),
                .m_denorm_exp           (mul_denorm_w_exp),
                .m_denorm_fixed         (mul_denorm_w_fixed),
                .m_valid                (),
                .m_ready                (mul_ready)
            );
    
    
    
    // -----------------------------------------
    //  recip
    // -----------------------------------------
    
    localparam  RECIP_FLOAT_WIDTH = 1 + RECIP_FLOAT_EXP_WIDTH + RECIP_FLOAT_FRAC_WIDTH;
    
    wire            [MUL_DENORM_X_EXP_WIDTH-1:0]    recip_denorm_x_exp;
    wire    signed  [MUL_DENORM_X_FIXED_WIDTH-1:0]  recip_denorm_x_fixed;
    
    wire            [MUL_DENORM_Y_EXP_WIDTH-1:0]    recip_denorm_y_exp;
    wire    signed  [MUL_DENORM_Y_FIXED_WIDTH-1:0]  recip_denorm_y_fixed;
    
    wire            [RECIP_FLOAT_WIDTH-1:0]         recip_float_w;
    
    wire            [USER_BITS-1:0]                 recip_user;
    wire                                            recip_valid;
    wire                                            recip_ready;
    
    jelly_denorm_reciprocal_float
            #(
                .DENORM_SIGNED          (1),
                .DENORM_INT_WIDTH       (MUL_DENORM_W_INT_WIDTH),
                .DENORM_FRAC_WIDTH      (MUL_DENORM_W_FRAC_WIDTH),
                .DENORM_EXP_WIDTH       (MUL_DENORM_W_EXP_WIDTH),
                .DENORM_EXP_OFFSET      (MUL_DENORM_W_EXP_OFFSET),
                
                .FLOAT_EXP_WIDTH        (RECIP_FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET       (RECIP_FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH       (RECIP_FLOAT_FRAC_WIDTH),
                
                .USER_WIDTH             (USER_BITS+MUL_DENORM_Y_EXP_WIDTH+MUL_DENORM_Y_FIXED_WIDTH+MUL_DENORM_X_EXP_WIDTH+MUL_DENORM_X_FIXED_WIDTH),
                
                .D_WIDTH                (RECIP_D_WIDTH),
                .K_WIDTH                (RECIP_K_WIDTH),
                .GRAD_WIDTH             (RECIP_GRAD_WIDTH),
                
                .RAM_TYPE               (RECIP_RAM_TYPE),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0)
            )
        i_denorm_reciprocal_float
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 ({mul_user, mul_denorm_y_exp, mul_denorm_y_fixed, mul_denorm_x_exp, mul_denorm_x_fixed}),
                .s_denorm_fixed         (mul_denorm_w_fixed),
                .s_denorm_exp           (mul_denorm_w_exp),
                .s_valid                (mul_valid),
                .s_ready                (mul_ready),
                
                .m_user                 ({recip_user, recip_denorm_y_exp, recip_denorm_y_fixed, recip_denorm_x_exp, recip_denorm_x_fixed}),
                .m_float                (recip_float_w),
                .m_valid                (recip_valid),
                .m_ready                (recip_ready)
            );
    
    
    
    // -----------------------------------------
    //  divide
    // -----------------------------------------
    
    localparam  DIV_DENORM_X_FIXED_WIDTH = DIV_DENORM_X_INT_WIDTH + DIV_DENORM_X_FRAC_WIDTH;
    localparam  DIV_DENORM_Y_FIXED_WIDTH = DIV_DENORM_Y_INT_WIDTH + DIV_DENORM_Y_FRAC_WIDTH;
    
    wire            [DIV_DENORM_X_EXP_WIDTH-1:0]    div_denorm_x_exp;
    wire    signed  [DIV_DENORM_X_FIXED_WIDTH-1:0]  div_denorm_x_fixed;
    
    wire            [DIV_DENORM_Y_EXP_WIDTH-1:0]    div_denorm_y_exp;
    wire    signed  [DIV_DENORM_Y_FIXED_WIDTH-1:0]  div_denorm_y_fixed;
    
    wire            [USER_BITS-1:0]                 div_user;
    wire                                            div_valid;
    wire                                            div_ready;
    
    jelly_denorm_float_mul
            #(
                .S_DENORM_EXP_WIDTH     (MUL_DENORM_X_EXP_WIDTH),
                .S_DENORM_EXP_OFFSET    (MUL_DENORM_X_EXP_OFFSET),
                .S_DENORM_INT_WIDTH     (MUL_DENORM_X_INT_WIDTH),
                .S_DENORM_FRAC_WIDTH    (MUL_DENORM_X_FRAC_WIDTH),
                
                .S_FLOAT_EXP_WIDTH      (RECIP_FLOAT_EXP_WIDTH),
                .S_FLOAT_EXP_OFFSET     (RECIP_FLOAT_EXP_OFFSET),
                .S_FLOAT_FRAC_WIDTH     (RECIP_FLOAT_FRAC_WIDTH),
                
                .M_DENORM_EXP_WIDTH     (DIV_DENORM_X_EXP_WIDTH),
                .M_DENORM_EXP_OFFSET    (DIV_DENORM_X_EXP_OFFSET),
                .M_DENORM_INT_WIDTH     (DIV_DENORM_X_INT_WIDTH),
                .M_DENORM_FRAC_WIDTH    (DIV_DENORM_X_FRAC_WIDTH),
                
                .USER_WIDTH             (USER_WIDTH),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .DEVICE                 (DEVICE)
            )
        i_denorm_float_mul_x
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (recip_user),
                .s_denorm_exp           (recip_denorm_x_exp),
                .s_denorm_fixed         (recip_denorm_x_fixed),
                .s_float                (recip_float_w),
                .s_valid                (recip_valid),
                .s_ready                (recip_ready),
                
                .m_user                 (div_user),
                .m_denorm_exp           (div_denorm_x_exp),
                .m_denorm_fixed         (div_denorm_x_fixed),
                .m_valid                (div_valid),
                .m_ready                (div_ready)
            );
    
    jelly_denorm_float_mul
            #(
                .S_DENORM_EXP_WIDTH     (MUL_DENORM_Y_EXP_WIDTH),
                .S_DENORM_EXP_OFFSET    (MUL_DENORM_Y_EXP_OFFSET),
                .S_DENORM_INT_WIDTH     (MUL_DENORM_Y_INT_WIDTH),
                .S_DENORM_FRAC_WIDTH    (MUL_DENORM_Y_FRAC_WIDTH),
                                         
                .S_FLOAT_EXP_WIDTH      (RECIP_FLOAT_EXP_WIDTH),
                .S_FLOAT_EXP_OFFSET     (RECIP_FLOAT_EXP_OFFSET),
                .S_FLOAT_FRAC_WIDTH     (RECIP_FLOAT_FRAC_WIDTH),
                                         
                .M_DENORM_EXP_WIDTH     (DIV_DENORM_X_EXP_WIDTH),
                .M_DENORM_EXP_OFFSET    (DIV_DENORM_X_EXP_OFFSET),
                .M_DENORM_INT_WIDTH     (DIV_DENORM_X_INT_WIDTH),
                .M_DENORM_FRAC_WIDTH    (DIV_DENORM_X_FRAC_WIDTH),
                
                .USER_WIDTH             (0),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .DEVICE                 (DEVICE)
            )
        i_denorm_float_mul_y
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (),
                .s_denorm_exp           (recip_denorm_y_exp),
                .s_denorm_fixed         (recip_denorm_y_fixed),
                .s_float                (recip_float_w),
                .s_valid                (recip_valid),
                .s_ready                (),
                
                .m_user                 (),
                .m_denorm_exp           (div_denorm_y_exp),
                .m_denorm_fixed         (div_denorm_y_fixed),
                .m_valid                (),
                .m_ready                (div_ready)
            );
    
    
    
    // -----------------------------------------
    //  to fixed
    // -----------------------------------------
    
    jelly_denorm_to_fixed
            #(
                .DENORM_SIGNED          (1),
                .DENORM_INT_WIDTH       (DIV_DENORM_X_INT_WIDTH),
                .DENORM_FRAC_WIDTH      (DIV_DENORM_X_FRAC_WIDTH),
                .DENORM_EXP_WIDTH       (DIV_DENORM_X_EXP_WIDTH),
                .DENORM_EXP_OFFSET      (DIV_DENORM_X_EXP_OFFSET),
                
                .FIXED_INT_WIDTH        (M_FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (M_FIXED_FRAC_WIDTH),
                
                .USER_WIDTH             (USER_WIDTH),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS)
            )
        i_denorm_to_fixed_x
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (div_user),
                .s_denorm_fixed         (div_denorm_x_fixed),
                .s_denorm_exp           (div_denorm_x_exp),
                .s_valid                (div_valid),
                .s_ready                (div_ready),
                
                .m_user                 (m_user),
                .m_fixed                (m_x),
                .m_valid                (m_valid),
                .m_ready                (m_ready)
            );
    
    
    jelly_denorm_to_fixed
            #(
                .DENORM_SIGNED          (1),
                .DENORM_INT_WIDTH       (DIV_DENORM_Y_INT_WIDTH),
                .DENORM_FRAC_WIDTH      (DIV_DENORM_Y_FRAC_WIDTH),
                .DENORM_EXP_WIDTH       (DIV_DENORM_Y_EXP_WIDTH),
                .DENORM_EXP_OFFSET      (DIV_DENORM_Y_EXP_OFFSET),
                
                .FIXED_INT_WIDTH        (M_FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (M_FIXED_FRAC_WIDTH),
                
                .USER_WIDTH             (0),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS)
            )
        i_denorm_to_fixed_y
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (),
                .s_denorm_fixed         (div_denorm_y_fixed),
                .s_denorm_exp           (div_denorm_y_exp),
                .s_valid                (div_valid),
                .s_ready                (),
                
                .m_user                 (),
                .m_fixed                (m_y),
                .m_valid                (),
                .m_ready                (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
