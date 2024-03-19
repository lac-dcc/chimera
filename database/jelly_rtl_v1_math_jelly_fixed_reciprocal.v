// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_fixed_reciprocal
        #(
            parameter   USER_WIDTH         = 0,
            
            parameter   S_FIXED_SIGNED     = 1,
            parameter   S_FIXED_INT_WIDTH  = 16,
            parameter   S_FIXED_FRAC_WIDTH = 16,
            parameter   S_FIXED_EXP_WIDTH  = 0,
            parameter   S_FIXED_EXP_OFFSET = S_FIXED_EXP_WIDTH > 0 ? (1 << (S_FIXED_EXP_WIDTH-1)) - 1 : 0,
            
            parameter   M_FIXED_INT_WIDTH  = 16,
            parameter   M_FIXED_FRAC_WIDTH = 16,
            
            parameter   FLOAT_EXP_WIDTH    = 8,
            parameter   FLOAT_EXP_OFFSET   = (1 << (FLOAT_EXP_WIDTH-1)) - 1,
            parameter   FLOAT_FRAC_WIDTH   = 23,
            parameter   D_WIDTH            = 8,                             // interpolation table addr bits
            parameter   K_WIDTH            = FLOAT_FRAC_WIDTH - D_WIDTH,
            parameter   GRAD_WIDTH         = FLOAT_FRAC_WIDTH,
            parameter   RAM_TYPE           = "block",
            
            parameter   MASTER_IN_REGS     = 1,
            parameter   MASTER_OUT_REGS    = 1
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire            [USER_BITS-1:0]         s_user,
            input   wire    signed  [S_FIXED_WIDTH-1:0]     s_fixed,
            input   wire    signed  [S_FIXED_EXP_BITS-1:0]  s_exp,
            input   wire                                    s_valid,
            output  wire                                    s_ready,
            
            output  wire            [USER_BITS-1:0]         m_user,
            output  wire    signed  [M_FIXED_WIDTH-1:0]     m_fixed,
            output  wire                                    m_valid,
            input   wire                                    m_ready
        );
    
    localparam  S_FIXED_WIDTH    = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH;
    localparam  S_FIXED_EXP_BITS = S_FIXED_EXP_WIDTH > 0 ? S_FIXED_EXP_WIDTH : 1;
    localparam  M_FIXED_WIDTH    = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH;
    localparam  FLOAT_WIDTH      = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH;          // sign + exp + frac
    localparam  USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    
    wire    [USER_BITS-1:0]         float_user;
    wire    [FLOAT_WIDTH-1:0]       float_float;
    wire                            float_valid;
    wire                            float_ready;
    
    jelly_fixed_to_float
            #(
                .USER_WIDTH             (USER_WIDTH),
                
                .FIXED_SIGNED           (S_FIXED_SIGNED),
                .FIXED_INT_WIDTH        (S_FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (S_FIXED_FRAC_WIDTH),
                .FIXED_EXP_WIDTH        (S_FIXED_EXP_WIDTH),
                .FIXED_EXP_OFFSET       (S_FIXED_EXP_OFFSET),
                
                .FLOAT_EXP_WIDTH        (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET       (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH       (FLOAT_FRAC_WIDTH),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0)
            )
        i_fixed_to_float
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (s_user),
                .s_fixed                (s_fixed),
                .s_exp                  (s_exp),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_user                 (float_user),
                .m_float                (float_float),
                .m_valid                (float_valid),
                .m_ready                (float_ready)
            );
    
    wire    [USER_BITS-1:0]         recip_user;
    wire    [FLOAT_WIDTH-1:0]       recip_float;
    wire                            recip_valid;
    wire                            recip_ready;
    
    jelly_float_reciprocal
            #(
                .USER_WIDTH             (USER_WIDTH),
                
                .EXP_WIDTH              (FLOAT_EXP_WIDTH ),
                .EXP_OFFSET             (FLOAT_EXP_OFFSET),
                .FRAC_WIDTH             (FLOAT_FRAC_WIDTH),
                
                .D_WIDTH                (D_WIDTH),
                .K_WIDTH                (K_WIDTH),
                .GRAD_WIDTH             (GRAD_WIDTH),
                .RAM_TYPE               (RAM_TYPE),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .MAKE_TABLE             (1)
            )
        i_float_reciprocal
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (float_user),
                .s_float                (float_float),
                .s_valid                (float_valid),
                .s_ready                (float_ready),
                
                .m_user                 (recip_user ),
                .m_float                (recip_float),
                .m_valid                (recip_valid),
                .m_ready                (recip_ready)
            );
    
    
    jelly_float_to_fixed
            #(
                .USER_WIDTH             (USER_WIDTH),
                
                .FLOAT_EXP_WIDTH        (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET       (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH       (FLOAT_FRAC_WIDTH),
                                         
                .FIXED_INT_WIDTH        (M_FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (M_FIXED_FRAC_WIDTH),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS)
            )
        i_float_to_fixed
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (recip_user),
                .s_float                (recip_float),
                .s_valid                (recip_valid),
                .s_ready                (recip_ready),
                
                .m_user                 (m_user),
                .m_fixed                (m_fixed),
                .m_valid                (m_valid),
                .m_ready                (m_ready)
            );
    
    
endmodule



`default_nettype wire



// end of file
