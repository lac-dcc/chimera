// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_float_to_fixed();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_float_to_fixed.vcd");
        $dumpvars(0, tb_float_to_fixed);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    
    parameter   FLOAT_EXP_WIDTH   = 8;
    parameter   FLOAT_EXP_OFFSET  = (1 << (FLOAT_EXP_WIDTH-1)) - 1;
    parameter   FLOAT_FRAC_WIDTH  = 23;
    parameter   FLOAT_WIDTH       = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH;
    
    parameter   FIXED_INT_WIDTH   = 16;
    parameter   FIXED_FRAC_WIDTH  = 16;
    parameter   FIXED_WIDTH       = FIXED_INT_WIDTH + FIXED_FRAC_WIDTH;
    
    
    
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
    
    
    
    reg     [FLOAT_WIDTH-1:0]   in_float;
    reg                         in_valid = 1'b0;
    wire                        in_ready;
    
    wire    signed [FIXED_WIDTH-1:0]    out_fixed;
    wire    [FLOAT_WIDTH-1:0]   out_src;
    wire                        out_valid;
    reg                         out_ready = 1'b1;
    
    reg     [31:0]              reg_random = 10;
    
    integer                     in_count = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            in_float  <= 32'h4080_0000;
            in_valid  <= 1'b0;
            out_ready <= 1'b1;
        end
        else begin
            in_valid  <= 1'b1;
            out_ready <= 1'b1;
            
            in_valid  <= {$random};
            out_ready <= {$random};
            
            if ( in_valid && in_ready ) begin
                in_count = in_count + 1;
                if ( in_count < 32'h0001_0000 ) begin
                    in_float <= (in_float + 32'h123);// | 32'h8000_0000;
                end
                else begin
                    in_float <= {$random(reg_random)};
                end
            end
        end
    end
    
    
    real        expect;
    real        result;
    real        error;
    real        error_max = 0;
    reg         error_update = 0;
    
    integer fp;
    integer count = 0;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( !reset && out_valid && out_ready && !isnan_float(out_src) ) begin
            expect = $bitstoreal(float2real(out_src));
            
            $display("%h %f", out_fixed, expect);
            
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
    
    
    
    jelly_float_to_fixed
            #(
                .FLOAT_EXP_WIDTH        (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET       (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH       (FLOAT_FRAC_WIDTH),
                .FLOAT_WIDTH            (FLOAT_WIDTH),
                
                .FIXED_INT_WIDTH        (FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (FIXED_FRAC_WIDTH),
                .FIXED_WIDTH            (FIXED_WIDTH),
                
                .USER_WIDTH             (32)
            )
        i_float_to_fixed
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_user         (in_float),
                .s_float        (in_float),
                .s_valid        (in_valid),
                .s_ready        (in_ready),
                
                .m_user         (out_src),
                .m_fixed        (out_fixed),
                .m_valid        (out_valid),
                .m_ready        (out_ready)
            );
    
    jelly_fixed_to_float
            #(
                .FIXED_INT_WIDTH        (FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (FIXED_FRAC_WIDTH),
                .FIXED_WIDTH            (FIXED_WIDTH),
                
                .FLOAT_EXP_WIDTH        (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET       (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH       (FLOAT_FRAC_WIDTH),
                .FLOAT_WIDTH            (FLOAT_WIDTH),
                
                .USER_WIDTH             (32)
            )
        i_fixed_to_float
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_user         (out_fixed),
                .s_fixed        (out_fixed),
                .s_valid        (out_valid),
                .s_ready        (),
                
                .m_user         (),
                .m_float        (),
                .m_valid        (),
                .m_ready        (1'b1)
            );
    
    
endmodule


`default_nettype wire


// end of file
