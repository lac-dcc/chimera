// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_float_mul();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_fixed_float_mul.vcd");
        $dumpvars(0, tb_fixed_float_mul);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    // parameter
    parameter   S_FLOAT_EXP_WIDTH    = 6;
    parameter   S_FLOAT_EXP_OFFSET   = (1 << (S_FLOAT_EXP_WIDTH-1)) - 1;
    parameter   S_FLOAT_FRAC_WIDTH   = 16;
    
    parameter   S_FIXED_INT_WIDTH    = 16;
    parameter   S_FIXED_FRAC_WIDTH   = 8;
    
    parameter   M_FIXED_INT_WIDTH    = 12;
    parameter   M_FIXED_FRAC_WIDTH   = 4;
    
    parameter   CLIP                 = 0;
    
    parameter   MASTER_IN_REGS       = 1;
    parameter   MASTER_OUT_REGS      = 1;
    
    parameter   DEVICE               = "RTL"; // "7SERIES"; // "RTL"
        
    localparam  S_FLOAT_WIDTH   = 1 + S_FLOAT_EXP_WIDTH + S_FLOAT_FRAC_WIDTH;   // sign + exp + frac
    localparam  S_FIXED_WIDTH   = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH;
    localparam  M_FIXED_WIDTH   = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH;
    localparam  FRAC_DIFF       = M_FIXED_FRAC_WIDTH > S_FIXED_FRAC_WIDTH ? M_FIXED_FRAC_WIDTH - S_FIXED_FRAC_WIDTH : S_FIXED_FRAC_WIDTH - M_FIXED_FRAC_WIDTH;
    localparam  MUL_WIDTH       = S_FIXED_WIDTH + (S_FLOAT_FRAC_WIDTH+2);
    localparam  MUL_SHIFT_WIDTH = MUL_WIDTH + S_FLOAT_EXP_OFFSET + FRAC_DIFF;
    
    
    
    // マクロ
    localparam  FLOAT_EXP_WIDTH  = S_FLOAT_EXP_WIDTH;
    localparam  FLOAT_EXP_OFFSET = S_FLOAT_EXP_OFFSET;
    localparam  FLOAT_FRAC_WIDTH = S_FLOAT_FRAC_WIDTH;
    localparam  FLOAT_WIDTH      = S_FLOAT_WIDTH;
    
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
    
    reg             [S_FLOAT_WIDTH-1:0]         s_float;
    reg     signed  [S_FIXED_WIDTH-1:0]         s_fixed;
    reg                                         s_valid;
    wire                                        s_ready;
    
    reg     signed  [M_FIXED_WIDTH-1:0]         s_tmp_dst;
    real                                        s_tmp_float;
    
    wire            [S_FLOAT_WIDTH-1:0]         m_src_float;
    wire    signed  [S_FIXED_WIDTH-1:0]         m_src_fixed;
    wire    signed  [M_FIXED_WIDTH-1:0]         m_fixed;
    wire                                        m_valid;
    reg                                         m_ready = 1;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_float <= 1.0;
            s_fixed <= 1 <<< S_FIXED_FRAC_WIDTH;
            s_valid <= 1'b0;
        end
        else begin
            s_tmp_dst   = $random();
            s_tmp_float = $itor($random() >>> 8) / 65536.0;
            s_float    <= real2float(s_tmp_float);
            if ( s_float == 0.0 ) begin
                s_fixed <= 0;
            end
            else begin
                s_fixed <= $rtoi($itor(s_tmp_dst) / s_tmp_float * $itor(1 << M_FIXED_FRAC_WIDTH));
            end
            
    //      s_float <= real2float(1.0); // $itor($random() >>> 8) / 65536.0;
    //      s_fixed <= $random();
            s_valid <= 1'b1;
        end
    end
    
    
    real    real_exp;
    real    real_out;
    always @* begin
        real_exp = $itor(m_src_fixed) / $itor(1 << S_FIXED_FRAC_WIDTH) * float2real(m_src_float);
        real_out = $itor(m_fixed) / $itor(1 << M_FIXED_FRAC_WIDTH);
    end
    
    
    /*
    real    s_float;
    real    s_float_recip;
    
    real    real_float;
    real    real_float_recip;
    real    real_recip;
    
    real    real_exp;
    real    real_out;
    always @* begin
        s_float    = $itor(s_fixed) / $itor(1 << S_FIXED_FRAC_WIDTH);
        s_float_recip = 1.0 / s_float;
        
        real_float = float2real(i_fixed_reciprocal.float_float);
        real_float_recip = 1.0 / real_float;
        
        real_recip = float2real(i_fixed_reciprocal.recip_float);
        
        if ( m_src != 0 ) begin
            real_exp = 1.0 / ($itor(m_src) / $itor(1 << S_FIXED_FRAC_WIDTH));
        end
        else begin
            real_exp = 0.0;
        end
        
        real_out     = $itor(m_fixed) / $itor(1 << M_FIXED_FRAC_WIDTH);
    end
    */
    
    
    jelly_fixed_float_mul
            #(
                .USER_WIDTH             (S_FLOAT_WIDTH+S_FIXED_WIDTH),
                
                .S_FLOAT_EXP_WIDTH      (S_FLOAT_EXP_WIDTH),
                .S_FLOAT_EXP_OFFSET     (S_FLOAT_EXP_OFFSET),
                .S_FLOAT_FRAC_WIDTH     (S_FLOAT_FRAC_WIDTH),
                
                .S_FIXED_INT_WIDTH      (S_FIXED_INT_WIDTH),
                .S_FIXED_FRAC_WIDTH     (S_FIXED_FRAC_WIDTH),
                
                .M_FIXED_INT_WIDTH      (M_FIXED_INT_WIDTH),
                .M_FIXED_FRAC_WIDTH     (M_FIXED_FRAC_WIDTH),
                
                .CLIP                   (CLIP),
                
                .MASTER_IN_REGS         (MASTER_IN_REGS ),
                .MASTER_OUT_REGS        (MASTER_OUT_REGS),
                
                .DEVICE                 (DEVICE)
            )
        i_fixed_float_mul
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_user                 ({s_float, s_fixed}),
                .s_float                (s_float),
                .s_fixed                (s_fixed),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_user                 ({m_src_float, m_src_fixed}),
                .m_fixed                (m_fixed),
                .m_valid                (m_valid),
                .m_ready                (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
