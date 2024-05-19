// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_fixed_to_float();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_fixed_to_float.vcd");
        $dumpvars(0, tb_fixed_to_float);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    parameter   FIXED_SIGNED      = 1;
    parameter   FIXED_INT_WIDTH   = 16;
    parameter   FIXED_FRAC_WIDTH  = 16;
    parameter   FIXED_WIDTH       = FIXED_INT_WIDTH + FIXED_FRAC_WIDTH;
    
    parameter   FLOAT_EXP_WIDTH   = 8;
    parameter   FLOAT_EXP_OFFSET  = (1 << (FLOAT_EXP_WIDTH-1)) - 1;
    parameter   FLOAT_FRAC_WIDTH  = 23;
    parameter   FLOAT_WIDTH       = 1 + FLOAT_EXP_WIDTH + FLOAT_FRAC_WIDTH;
    
    
    
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
    
    
    
    reg     [FLOAT_WIDTH-1:0]   in_fixed;
    reg                         in_valid = 1'b0;
    wire                        in_ready;
    
    wire    signed  [FIXED_WIDTH-1:0]   out_fixed;
    wire            [FLOAT_WIDTH-1:0]   out_float;
    wire                                out_valid;
    reg                                 out_ready = 1'b1;
    
    reg     [31:0]                      reg_random = 10;
    
    integer                             in_count = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            in_fixed  <= 32'h0000_0000;
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
                    in_fixed <= (in_fixed + 32'h1);// | 32'h8000_0000;
                end
                else begin
                    in_fixed <= {$random(reg_random)};
                end
            end
        end
    end
    
    
    real        result;
    
    integer fp;
    integer count = 0;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    real    real_src;
    reg     ok = 1;
    
    always @(posedge clk) begin
        if ( !reset && out_valid && out_ready ) begin
            result = $bitstoreal(float2real(out_float));
            
            $display("%f %f", $itor(out_fixed)/(1<<FIXED_FRAC_WIDTH), result);
            
            real_src = $itor(out_fixed)/(1<<FIXED_FRAC_WIDTH);
            
            ok = 1;
            if ( (real_src - result) / result >= 0.001 ) begin
                ok = 0;
            end
            
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
    
    
    jelly_fixed_to_float
            #(
                .FIXED_SIGNED           (FIXED_SIGNED),
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
                
                .s_user         (in_fixed),
                .s_fixed        (in_fixed),
                .s_valid        (in_valid),
                .s_ready        (in_ready),
                
                .m_user         (out_fixed),
                .m_float        (out_float),
                .m_valid        (out_valid),
                .m_ready        (out_ready)
            );
    
    
    /*
    wire            [FLOAT_WIDTH-1:0]   out_float2;
    jelly_fixed_to_float2
            #(
                .FIXED_SIGNED           (FIXED_SIGNED),
                .FIXED_INT_WIDTH        (FIXED_INT_WIDTH),
                .FIXED_FRAC_WIDTH       (FIXED_FRAC_WIDTH),
                .FIXED_WIDTH            (FIXED_WIDTH),
                
                .FLOAT_EXP_WIDTH        (FLOAT_EXP_WIDTH),
                .FLOAT_EXP_OFFSET       (FLOAT_EXP_OFFSET),
                .FLOAT_FRAC_WIDTH       (FLOAT_FRAC_WIDTH),
                .FLOAT_WIDTH            (FLOAT_WIDTH),
                
                .USER_WIDTH             (32)
            )
        i_fixed_to_float2
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_user         (in_fixed),
                .s_fixed        (in_fixed),
                .s_valid        (in_valid),
                .s_ready        (in_ready),
                
                .m_user         (),
                .m_float        (out_float2),
                .m_valid        (),
                .m_ready        (out_ready)
            );
    
    wire match = (out_float == out_float2);
    */
    
    
endmodule


`default_nettype wire


// end of file
