// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   math
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_fixed_divider
        #(
            parameter   USER_WIDTH            = 0,
            parameter   S_DIVIDEND_INT_WIDTH  = 12,
            parameter   S_DIVIDEND_FRAC_WIDTH = 4,
            parameter   S_DIVISOR_INT_WIDTH   = 4,
            parameter   S_DIVISOR_FRAC_WIDTH  = 12,
            parameter   M_QUOTIENT_INT_WIDTH  = 12,
            parameter   M_QUOTIENT_FRAC_WIDTH = 4,
            parameter   MASTER_IN_REGS        = 1,
            parameter   MASTER_OUT_REGS       = 1,
            parameter   DEVICE                = "RTL",
            
            parameter   USER_BITS             = USER_WIDTH > 0 ? USER_WIDTH : 1,
            parameter   S_DIVIDEND_WIDTH      = S_DIVIDEND_INT_WIDTH + S_DIVIDEND_FRAC_WIDTH,
            parameter   S_DIVISOR_WIDTH       = S_DIVISOR_INT_WIDTH + S_DIVISOR_FRAC_WIDTH,
            parameter   M_QUOTIENT_WIDTH      = M_QUOTIENT_INT_WIDTH + M_QUOTIENT_FRAC_WIDTH
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire            [USER_BITS-1:0]         s_user,
            input   wire    signed  [S_DIVIDEND_WIDTH-1:0]  s_dividend,
            input   wire    signed  [S_DIVISOR_WIDTH-1:0]   s_divisor,
            input   wire                                    s_valid,
            output  wire                                    s_ready,
            
            output  wire            [USER_BITS-1:0]         m_user,
            output  wire    signed  [M_QUOTIENT_WIDTH-1:0]  m_quotient,
            output  wire                                    m_valid,
            input   wire                                    m_ready
        );
    
    localparam  FIXED_QUOTIENT_INT_WIDTH  = M_QUOTIENT_INT_WIDTH  < S_DIVIDEND_INT_WIDTH  ? M_QUOTIENT_INT_WIDTH  : S_DIVIDEND_INT_WIDTH;
    localparam  FIXED_QUOTIENT_FRAC_WIDTH = M_QUOTIENT_FRAC_WIDTH < S_DIVIDEND_FRAC_WIDTH ? M_QUOTIENT_FRAC_WIDTH : S_DIVIDEND_FRAC_WIDTH;
    localparam  FIXED_QUOTIENT_WIDTH      = FIXED_QUOTIENT_INT_WIDTH + FIXED_QUOTIENT_FRAC_WIDTH;
    
    localparam  FIXED_DIVIDEND_INT_WIDTH  = S_DIVIDEND_INT_WIDTH;
    localparam  FIXED_DIVIDEND_FRAC_WIDTH = FIXED_QUOTIENT_FRAC_WIDTH + S_DIVISOR_FRAC_WIDTH;
    localparam  FIXED_DIVIDEND_WIDTH      = FIXED_DIVIDEND_INT_WIDTH + FIXED_DIVIDEND_FRAC_WIDTH;
    
    wire    [FIXED_DIVIDEND_WIDTH-1:0]  fixed_dividend = (s_dividend <<< (FIXED_DIVIDEND_FRAC_WIDTH - S_DIVIDEND_FRAC_WIDTH));
    wire    [FIXED_QUOTIENT_WIDTH-1:0]  fixed_quotient;
    
    generate
    if ( FIXED_QUOTIENT_FRAC_WIDTH > M_QUOTIENT_FRAC_WIDTH ) begin
        assign m_quotient = (fixed_quotient >>> (FIXED_QUOTIENT_FRAC_WIDTH - M_QUOTIENT_FRAC_WIDTH));
    end
    else begin
        assign m_quotient = (fixed_quotient <<< (M_QUOTIENT_FRAC_WIDTH - FIXED_QUOTIENT_FRAC_WIDTH));
    end
    endgenerate
    
    jelly_integer_divider
            #(
                .USER_WIDTH             (USER_WIDTH),
                .S_DIVIDEND_WIDTH       (FIXED_DIVIDEND_WIDTH),
                .S_DIVISOR_WIDTH        (S_DIVISOR_WIDTH),
                .M_QUOTIENT_WIDTH       (FIXED_QUOTIENT_WIDTH),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS),
                
                .DEVICE                 (DEVICE),
                
                .NORMALIZE_REMAINDER    (0)
            )
        i_integer_divider
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 (s_user),
                .s_dividend             (fixed_dividend),
                .s_divisor              (s_divisor),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_user                 (m_user),
                .m_quotient             (fixed_quotient),
                .m_remainder            (),
                .m_valid                (m_valid),
                .m_ready                (m_ready)
            );
    
endmodule



`default_nettype wire



// end of file
