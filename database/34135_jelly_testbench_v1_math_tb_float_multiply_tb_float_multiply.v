// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_float_multiply();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_float_multiply.vcd");
        $dumpvars(0, tb_float_multiply);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    
    parameter   EXP_WIDTH   = 8;
    parameter   EXP_OFFSET  = (1 << (EXP_WIDTH-1)) - 1;
    parameter   FRAC_WIDTH  = 23;
    parameter   FLOAT_WIDTH       = 1 + EXP_WIDTH + FRAC_WIDTH;
    
    
    function [FLOAT_WIDTH-1:0] real2float(input real r);
    reg     [63:0]  b;
    begin
        b                                    = $realtobits(r);
        real2float[FLOAT_WIDTH-1]            = b[63];
        real2float[FRAC_WIDTH +: EXP_WIDTH]  = (b[62:52] - 1023) + EXP_OFFSET;
        real2float[0          +: FRAC_WIDTH] = b[51 -: FRAC_WIDTH];
    end
    endfunction
    
    
    function real float2real(input [FLOAT_WIDTH-1:0] f);
    reg     [63:0]  b;
    begin
        b                   = 64'd0;
        b[63]               = f[FLOAT_WIDTH-1];
        b[62:52]            = (f[FRAC_WIDTH +: EXP_WIDTH] - EXP_OFFSET) + 1023;
        b[51 -: FRAC_WIDTH] = f[0 +: FRAC_WIDTH];
        float2real          = $bitstoreal(b);
    end
    endfunction
    
    function real isnan_float(input [FLOAT_WIDTH-1:0] f);
    begin
        isnan_float = ((f[FRAC_WIDTH +: EXP_WIDTH] == {EXP_WIDTH{1'b0}}) || (f[FRAC_WIDTH +: EXP_WIDTH] == {EXP_WIDTH{1'b1}}));
    end
    endfunction
    
    reg     [FLOAT_WIDTH-1:0]   in_float0;
    reg     [FLOAT_WIDTH-1:0]   in_float1;
    reg                         in_valid = 1'b0;
    wire                        in_ready;
    
    wire    [FLOAT_WIDTH-1:0]   out_float;
    wire    [FLOAT_WIDTH-1:0]   out_src0, out_src1;
    wire                        out_valid;
    reg                         out_ready = 1'b1;
    
    reg     [31:0]              reg_random = 10;
    
    integer                     in_count = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            in_float0 <= 32'h0000_0000;
            in_float1 <= 32'h4080_0000;
            in_valid  <= 1'b0;
            out_ready <= 1'b1;
        end
        else begin
            in_valid  <= 1'b1;
            out_ready <= 1'b1;
            
            in_valid  <= {$random};
            out_ready <= {$random};
            
            if ( in_valid && in_ready ) begin
                in_float0 <= {$random(reg_random)};
                in_float1 <= {$random(reg_random)};
            end
        end
    end
    
    
    real        real_src0;
    real        real_src1;
    real        result;
    
    integer fp;
    integer count = 0;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( !reset && out_valid && out_ready ) begin
            real_src0 = float2real(out_src0);
            real_src1 = float2real(out_src1);
            result    = float2real(out_float);
            
            $display("%g (exp:%g <= %g * %g)", result, real_src0*real_src1, real_src0, real_src1);
            
            /*
            $fdisplay(fp, "%h %h %g %g %g", out_src, out_float, result, exp, error);
            if ( count > 32'h0011_0000 ) begin
                $fclose(fp);
                $finish;
            end
            count = count + 1;
            
            error_update <= 1'b0;
            if ( error > error_max ) begin
                error_update <= 1'b1;
                error_max = error;
                $display("%g %g %g", result, exp, error);
                $display("error_max: %g %h (%t)", error_max, out_float, $time);
            end
            */
        end
    end
    
    
    
    jelly_float_multiply
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .EXP_OFFSET     (EXP_OFFSET),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .FLOAT_WIDTH    (FLOAT_WIDTH),
                
                .USER_WIDTH     (32+32)
            )
        i_float_multiply
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_user         ({in_float1, in_float0}),
                .s_float0       (in_float0),
                .s_float1       (in_float1),
                .s_valid        (in_valid),
                .s_ready        (in_ready),
                
                .m_user         ({out_src1, out_src0}),
                .m_float        (out_float),
                .m_valid        (out_valid),
                .m_ready        (out_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
