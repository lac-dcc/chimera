// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 固定小数点を、浮動小数点の逆数に変換
module jelly_denorm_reciprocal_float
        #(
            parameter   DENORM_SIGNED      = 1,
            parameter   DENORM_INT_WIDTH   = 32,
            parameter   DENORM_FRAC_WIDTH  = 0,
            parameter   DENORM_FIXED_WIDTH = DENORM_INT_WIDTH + DENORM_FRAC_WIDTH,
            parameter   DENORM_EXP_WIDTH   = 0,
            parameter   DENORM_EXP_BITS    = DENORM_EXP_WIDTH > 0 ? DENORM_EXP_WIDTH                : 1,
            parameter   DENORM_EXP_OFFSET  = DENORM_EXP_WIDTH > 0 ? (1 << (DENORM_EXP_WIDTH-1)) - 1 : 0,
            
            parameter   FLOAT_EXP_WIDTH    = 8,
            parameter   FLOAT_EXP_OFFSET   = (1 << (FLOAT_EXP_WIDTH-1)) - 1,
            parameter   FLOAT_FRAC_WIDTH   = 16,
            parameter   FLOAT_WIDTH        = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH,    // sign + exp + frac
            
            parameter   USE_FIXED_EXP      = (DENORM_EXP_WIDTH > 0),
            
            parameter   USER_WIDTH         = 0,
            parameter   USER_BITS          = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   D_WIDTH            = 6,                         // interpolation table addr bits
            parameter   K_WIDTH            = FLOAT_FRAC_WIDTH - D_WIDTH,
            parameter   GRAD_WIDTH         = FLOAT_FRAC_WIDTH,
            
            parameter   RAM_TYPE           = "distributed",
            
            parameter   MASTER_IN_REGS     = 1,
            parameter   MASTER_OUT_REGS    = 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    [USER_BITS-1:0]             s_user,
            input   wire    [DENORM_FIXED_WIDTH-1:0]    s_denorm_fixed,
            input   wire    [DENORM_EXP_BITS-1:0]       s_denorm_exp,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            output  wire    [USER_BITS-1:0]             m_user,
            output  wire    [FLOAT_WIDTH-1:0]           m_float,
            output  wire                                m_valid,
            input   wire                                m_ready
        );
    
    
    
    // -----------------------------------------
    //  fixed to float
    // -----------------------------------------
    
    wire    [USER_BITS-1:0]         float_user;
    wire    [FLOAT_WIDTH-1:0]       float_float;
    wire                            float_valid;
    wire                            float_ready;
    
    jelly_denorm_to_float
            #(
                .DENORM_SIGNED      (DENORM_SIGNED),
                .DENORM_INT_WIDTH   (DENORM_INT_WIDTH),
                .DENORM_FRAC_WIDTH  (DENORM_FRAC_WIDTH),
                .DENORM_EXP_WIDTH   (DENORM_EXP_WIDTH),
                .DENORM_EXP_OFFSET  (DENORM_EXP_OFFSET),
                
                .FLOAT_EXP_WIDTH    (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET   (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH   (FLOAT_FRAC_WIDTH),
                
                .USER_WIDTH         (USER_WIDTH),
                
                .MASTER_IN_REGS     (0),
                .MASTER_OUT_REGS    (0)
            )
        i_denorm_to_float
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             (s_user ),
                .s_denorm_fixed     (s_denorm_fixed),
                .s_denorm_exp       (s_denorm_exp),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user             (float_user),
                .m_float            (float_float),
                .m_valid            (float_valid),
                .m_ready            (float_ready)
            );
    
    
    // -----------------------------------------
    //  reciprocal
    // -----------------------------------------
    
    jelly_float_reciprocal
            #(
                .EXP_WIDTH          (FLOAT_EXP_WIDTH),
                .EXP_OFFSET         (FLOAT_EXP_OFFSET),
                .FRAC_WIDTH         (FLOAT_FRAC_WIDTH),
                
                .USER_WIDTH         (USER_WIDTH),
                
                .D_WIDTH            (D_WIDTH),
                .K_WIDTH            (K_WIDTH),
                .GRAD_WIDTH         (GRAD_WIDTH),
                
                .RAM_TYPE           (RAM_TYPE),
                
                .MASTER_IN_REGS     (MASTER_IN_REGS),
                .MASTER_OUT_REGS    (MASTER_OUT_REGS)
            )
        i_float_reciprocal
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             (float_user),
                .s_float            (float_float),
                .s_valid            (float_valid),
                .s_ready            (float_ready),
                
                .m_user             (m_user),
                .m_float            (m_float),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    
endmodule



`default_nettype wire



// end of file
