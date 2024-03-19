
`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_reciprocal();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_fixed_reciprocal.vcd");
        $dumpvars(0, tb_fixed_reciprocal);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    parameter   S_FIXED_SIGNED     = 1;
    parameter   S_FIXED_INT_WIDTH  = 16;
    parameter   S_FIXED_FRAC_WIDTH = 16;
    parameter   S_FIXED_EXP_WIDTH  = 0;
    parameter   S_FIXED_EXP_OFFSET = S_FIXED_EXP_WIDTH > 0 ? (1 << (S_FIXED_EXP_WIDTH-1)) - 1 : 0;
    
    parameter   M_FIXED_INT_WIDTH  = 16;
    parameter   M_FIXED_FRAC_WIDTH = 16;
    
    parameter   FLOAT_EXP_WIDTH    = 8;
    parameter   FLOAT_EXP_OFFSET   = (1 << (FLOAT_EXP_WIDTH-1)) - 1;
    parameter   FLOAT_FRAC_WIDTH   = 23;
    parameter   D_WIDTH            = 9;                             // interpolation table addr bits
    parameter   K_WIDTH            = FLOAT_FRAC_WIDTH - D_WIDTH;
    parameter   GRAD_WIDTH         = FLOAT_FRAC_WIDTH;
    parameter   RAM_TYPE           = "block";
    
    parameter   MASTER_IN_REGS     = 1;
    parameter   MASTER_OUT_REGS    = 1;
    
    localparam  S_FIXED_WIDTH    = S_FIXED_INT_WIDTH + S_FIXED_FRAC_WIDTH;
    localparam  S_FIXED_EXP_BITS = S_FIXED_EXP_WIDTH > 0 ? S_FIXED_EXP_WIDTH : 1;
    localparam  M_FIXED_WIDTH    = M_FIXED_INT_WIDTH + M_FIXED_FRAC_WIDTH;
    localparam  FLOAT_WIDTH      = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH;          // sign + exp + frac
    
    
    
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
    
    
    
    reg                                     cke = 1;
    
    reg     signed  [S_FIXED_WIDTH-1:0]     s_fixed;
    reg                                     s_valid;
    wire                                    s_ready;
    
    wire    [S_FIXED_WIDTH-1:0]             m_src;
    wire    signed  [M_FIXED_WIDTH-1:0]     m_fixed;
    wire                                    m_valid;
    reg                                     m_ready = 1;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_fixed <= (1 << S_FIXED_FRAC_WIDTH);
            s_valid <= 1'b0;
        end
        else begin
            s_fixed <= ($random() >>> 8);
            s_valid <= 1'b1;
        end
    end

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
    
    
    jelly_fixed_reciprocal
            #(
                .USER_WIDTH                 (S_FIXED_WIDTH),
                .S_FIXED_SIGNED             (S_FIXED_SIGNED    ),
                .S_FIXED_INT_WIDTH          (S_FIXED_INT_WIDTH ),
                .S_FIXED_FRAC_WIDTH         (S_FIXED_FRAC_WIDTH),
                .S_FIXED_EXP_WIDTH          (S_FIXED_EXP_WIDTH ),
                .S_FIXED_EXP_OFFSET         (S_FIXED_EXP_OFFSET),
                .M_FIXED_INT_WIDTH          (M_FIXED_INT_WIDTH ),
                .M_FIXED_FRAC_WIDTH         (M_FIXED_FRAC_WIDTH),
                .FLOAT_EXP_WIDTH            (FLOAT_EXP_WIDTH   ),
                .FLOAT_EXP_OFFSET           (FLOAT_EXP_OFFSET  ),
                .FLOAT_FRAC_WIDTH           (FLOAT_FRAC_WIDTH  ),
                .D_WIDTH                    (D_WIDTH           ),
                .K_WIDTH                    (K_WIDTH           ),
                .GRAD_WIDTH                 (GRAD_WIDTH        ),
                .RAM_TYPE                   (RAM_TYPE          ),
                .MASTER_IN_REGS             (MASTER_IN_REGS    ),
                .MASTER_OUT_REGS            (MASTER_OUT_REGS   )
            )
        i_fixed_reciprocal
            (
                .reset                      (reset  ),
                .clk                        (clk    ),
                .cke                        (cke    ),
                                             
                .s_user                     (s_fixed),
                .s_fixed                    (s_fixed),
                .s_exp                      (0),
                .s_valid                    (s_valid),
                .s_ready                    (s_ready),
                                             
                .m_user                     (m_src  ),
                .m_fixed                    (m_fixed),
                .m_valid                    (m_valid),
                .m_ready                    (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
