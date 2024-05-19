// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_matrix_divider();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_fixed_matrix_divider.vcd");
        $dumpvars(0, tb_fixed_matrix_divider);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    // parameter
    parameter   NUM                       = 2;
    parameter   S_DIVIDEND_INT_WIDTH      = 16;
    parameter   S_DIVIDEND_FRAC_WIDTH     = 16;
    parameter   S_DIVISOR_INT_WIDTH       = 16;
    parameter   S_DIVISOR_FRAC_WIDTH      = 16;
    parameter   M_QUOTIENT_INT_WIDTH      = 12;
    parameter   M_QUOTIENT_FRAC_WIDTH     = 4;
    
    parameter   DIVIDEND_FIXED_INT_WIDTH  = 16;
    parameter   DIVIDEND_FIXED_FRAC_WIDTH = 8;
    
    parameter   DIVISOR_FLOAT_EXP_WIDTH   = 6;
    parameter   DIVISOR_FLOAT_EXP_OFFSET  = (1 << (DIVISOR_FLOAT_EXP_WIDTH-1)) - 1;
    parameter   DIVISOR_FLOAT_FRAC_WIDTH  = 16;
    
    parameter   CLIP                      = 1;
    
    parameter   D_WIDTH                   = 8;  // interpolation table addr bits
    parameter   K_WIDTH                   = DIVISOR_FLOAT_FRAC_WIDTH - D_WIDTH;
    parameter   GRAD_WIDTH                = DIVISOR_FLOAT_FRAC_WIDTH;
    parameter   RAM_TYPE                  = "block";
    
    parameter   MASTER_IN_REGS            = 1;
    parameter   MASTER_OUT_REGS           = 1;
    
    parameter   DEVICE                    = "7SERIES"; // "RTL";
    
    localparam  S_DIVIDEND_WIDTH          = S_DIVIDEND_INT_WIDTH + S_DIVIDEND_FRAC_WIDTH;
    localparam  S_DIVISOR_WIDTH           = S_DIVISOR_INT_WIDTH  + S_DIVISOR_FRAC_WIDTH;
    localparam  M_QUOTIENT_WIDTH          = M_QUOTIENT_INT_WIDTH + M_QUOTIENT_FRAC_WIDTH;
    
    
    
    // マクロ
    localparam  FLOAT_EXP_WIDTH  = DIVISOR_FLOAT_EXP_WIDTH;
    localparam  FLOAT_EXP_OFFSET = DIVISOR_FLOAT_EXP_OFFSET;
    localparam  FLOAT_FRAC_WIDTH = DIVISOR_FLOAT_FRAC_WIDTH;
    localparam  FLOAT_WIDTH      = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH;
    
    function [FLOAT_WIDTH-1:0] real2float(input real r);
    reg     [63:0]  b;
    begin
        b                                    = $realtobits(r);
        real2float[FLOAT_WIDTH-1]            = b[63];
        real2float[FLOAT_FRAC_WIDTH +: FLOAT_EXP_WIDTH]  = (b[62:52] - 1023) + FLOAT_EXP_OFFSET;
        real2float[0                +: FLOAT_FRAC_WIDTH] = b[51 -: FLOAT_FRAC_WIDTH];
    end
    endfunction
    
    
    function real float2real(input [FLOAT_WIDTH-1:0] f);
    reg     [63:0]  b;
    begin
        b                         = 64'd0;
        b[63]                     = f[FLOAT_WIDTH-1];
        b[62:52]                  = (f[FLOAT_FRAC_WIDTH +: FLOAT_EXP_WIDTH] - FLOAT_EXP_OFFSET) + 1023;
        b[51 -: FLOAT_FRAC_WIDTH] = f[0 +: FLOAT_FRAC_WIDTH];
        float2real                = $bitstoreal(b);
    end
    endfunction
    
    function real isnan_float(input [FLOAT_WIDTH-1:0] f);
    begin
        isnan_float = ((f[FLOAT_FRAC_WIDTH +: FLOAT_EXP_WIDTH] == {FLOAT_EXP_WIDTH{1'b0}}) || (f[FLOAT_FRAC_WIDTH +: FLOAT_EXP_WIDTH] == {FLOAT_EXP_WIDTH{1'b1}}));
    end
    endfunction
    
    reg                                         cke = 1;
    
    reg     signed  [M_QUOTIENT_WIDTH-1:0]      s_tmp_quotient0;
    reg     signed  [M_QUOTIENT_WIDTH-1:0]      s_tmp_quotient1;
    reg     signed  [S_DIVISOR_WIDTH-1:0]       s_tmp_divisor;
    
    wire            [NUM*S_DIVIDEND_WIDTH-1:0]  s_dividend = {s_dividend1, s_dividend0};
    reg     signed  [S_DIVISOR_WIDTH-1:0]       s_divisor;
    reg                                         s_valid;
    wire                                        s_ready;
    reg             [S_DIVIDEND_WIDTH-1:0]      s_dividend1, s_dividend0;
    
    wire    signed  [S_DIVIDEND_WIDTH-1:0]      m_src_dividend1, m_src_dividend0;
    wire    signed  [S_DIVISOR_WIDTH-1:0]       m_src_divisor;
    wire            [NUM*M_QUOTIENT_WIDTH-1:0]  m_quotient;
    wire                                        m_valid;
    reg                                         m_ready = 1;
    
    wire    signed  [M_QUOTIENT_WIDTH-1:0]      m_quotient1, m_quotient0;
    assign {m_quotient1, m_quotient0} = m_quotient;
    
    real    real_s_quotient0;
    real    real_s_quotient1;
    real    real_s_dividend0;
    real    real_s_dividend1;
    real    real_s_divisor;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_dividend0 <= 1 <<< S_DIVIDEND_FRAC_WIDTH;
            s_dividend1 <= 1 <<< S_DIVIDEND_FRAC_WIDTH;
            s_divisor   <= 100 ; // 1 <<< S_DIVISOR_FRAC_WIDTH;
            s_valid     <= 1'b0;
        end
        else begin
            if ( s_valid && s_ready ) begin
                s_divisor <= s_divisor - 1;
                /*
                s_tmp_quotient0 = $random();
                s_tmp_quotient1 = $random();
                s_tmp_divisor   = $random() >>> (S_DIVISOR_INT_WIDTH - 1);
                
                real_s_quotient0 = $itor(s_tmp_quotient0) / $itor(1 << M_QUOTIENT_FRAC_WIDTH);
                real_s_quotient1 = $itor(s_tmp_quotient1) / $itor(1 << M_QUOTIENT_FRAC_WIDTH);
                real_s_divisor   = $itor(s_tmp_divisor)   / $itor(1 << S_DIVISOR_FRAC_WIDTH);
                real_s_dividend0 = real_s_quotient0 * real_s_divisor;
                real_s_dividend1 = real_s_quotient1 * real_s_divisor;
                
                s_dividend0 <= $rtoi(real_s_dividend0 * (1 << S_DIVIDEND_FRAC_WIDTH));
                s_dividend1 <= $rtoi(real_s_dividend1 * (1 << S_DIVIDEND_FRAC_WIDTH));
                s_divisor   <= s_tmp_divisor;
                */
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid <= 1; // {$random()};
            end
        end
    end
    
    always @(posedge clk) begin
        m_ready <= 1; // {$random()};
    end
    
    
    real    real_src_divisor   ;
    real    real_src_dividend0 ;
    real    real_src_dividend1 ;
    real    real_quotient0     ;
    real    real_quotient1     ;
    real    real_exp0;
    real    real_exp1;
    always @* begin
        real_src_divisor   = $itor(m_src_divisor)   / $itor(1 << S_DIVISOR_FRAC_WIDTH);
        real_src_dividend0 = $itor(m_src_dividend0) / $itor(1 << S_DIVIDEND_FRAC_WIDTH);
        real_src_dividend1 = $itor(m_src_dividend1) / $itor(1 << S_DIVIDEND_FRAC_WIDTH);
        real_quotient0     = $itor(m_quotient0)     / $itor(1 << M_QUOTIENT_FRAC_WIDTH);
        real_quotient1     = $itor(m_quotient1)     / $itor(1 << M_QUOTIENT_FRAC_WIDTH);
        
        real_exp0          = real_src_dividend0 / real_src_divisor;
        real_exp1          = real_src_dividend1 / real_src_divisor;
    end
    
    
    jelly_fixed_matrix_divider
            #(
                .USER_WIDTH                (NUM*S_DIVIDEND_WIDTH +  S_DIVISOR_WIDTH              ),
                .NUM                       (NUM                      ),
                .S_DIVIDEND_INT_WIDTH      (S_DIVIDEND_INT_WIDTH     ),
                .S_DIVIDEND_FRAC_WIDTH     (S_DIVIDEND_FRAC_WIDTH    ),
                .S_DIVISOR_INT_WIDTH       (S_DIVISOR_INT_WIDTH      ),
                .S_DIVISOR_FRAC_WIDTH      (S_DIVISOR_FRAC_WIDTH     ),
                .M_QUOTIENT_INT_WIDTH      (M_QUOTIENT_INT_WIDTH     ),
                .M_QUOTIENT_FRAC_WIDTH     (M_QUOTIENT_FRAC_WIDTH    ),
                .DIVIDEND_FIXED_INT_WIDTH  (DIVIDEND_FIXED_INT_WIDTH ),
                .DIVIDEND_FIXED_FRAC_WIDTH (DIVIDEND_FIXED_FRAC_WIDTH),
                .DIVISOR_FLOAT_EXP_WIDTH   (DIVISOR_FLOAT_EXP_WIDTH  ),
                .DIVISOR_FLOAT_EXP_OFFSET  (DIVISOR_FLOAT_EXP_OFFSET ),
                .DIVISOR_FLOAT_FRAC_WIDTH  (DIVISOR_FLOAT_FRAC_WIDTH ),
                .CLIP                      (CLIP                     ),
                .D_WIDTH                   (D_WIDTH                  ),
                .K_WIDTH                   (K_WIDTH                  ),
                .GRAD_WIDTH                (GRAD_WIDTH               ),
                .RAM_TYPE                  (RAM_TYPE                 ),
                .MASTER_IN_REGS            (MASTER_IN_REGS           ),
                .MASTER_OUT_REGS           (MASTER_OUT_REGS          ),
                .DEVICE                    (DEVICE                   )
            )
        i_fixed_matrix_divider
            (
                .reset                      (reset      ),
                .clk                        (clk        ),
                .cke                        (cke        ),
                
                .s_user                     ({s_dividend, s_divisor}),
                .s_dividend                 (s_dividend ),
                .s_divisor                  (s_divisor  ),
                .s_valid                    (s_valid    ),
                .s_ready                    (s_ready    ),
                
                .m_user                     ({m_src_dividend1, m_src_dividend0, m_src_divisor}),
                .m_quotient                 (m_quotient ),
                .m_valid                    (m_valid    ),
                .m_ready                    (m_ready    )
            );
    
    
endmodule


`default_nettype wire


// end of file
