// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_float_reciprocal();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_float_reciprocal.vcd");
        $dumpvars(0, tb_float_reciprocal);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    
    
    parameter   EXP_WIDTH   = 6;
    parameter   EXP_OFFSET  = (1 << (EXP_WIDTH-1)) - 1;
    parameter   FRAC_WIDTH  = 16;
    parameter   FLOAT_WIDTH = 1 + EXP_WIDTH + FRAC_WIDTH;
    
    parameter   D_WIDTH     = 8; // 6;
    parameter   K_WIDTH     = FRAC_WIDTH - D_WIDTH;
    parameter   GRAD_WIDTH  = FRAC_WIDTH;
    
    
    
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
    
    
    
    reg     [FLOAT_WIDTH-1:0]   in_float = 32'h3f80_0000; // {FLOAT_WIDTH{1'b0}};
    reg                         in_valid = 1'b0;
    wire                        in_ready;
    
    wire    [FLOAT_WIDTH-1:0]   out_float;
    wire    [FLOAT_WIDTH-1:0]   out_src;
    wire                        out_valid;
    reg                         out_ready = 1'b1;
    
    reg     [31:0]              reg_random = 10;
    
    integer                     in_count = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            in_float  <= 32'h3f80_0000;
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
                if ( in_count < 32'h0010_0010 ) begin
    //              in_float <= in_float + 32'h01;
                    in_float <= in_float - 32'h01;
                end
                else begin
                    in_float <= {$random(reg_random)};
                end
                
                in_float <= {1'b0, 6'h1a, 16'h5cea};
            end
        end
    end
    
    
    real        exp;
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
            exp    = 1.0/$bitstoreal(float2real(out_src));
            result = float2real(out_float);
            error  = (result - exp) / exp;
            if ( error < 0 ) begin error = -error; end
            
//          $display("%g %g %g", result, exp, error);
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
            
        end
    end
    
    
    // 進行モニタ
    initial begin
        while (1) begin
            #100000;
            $display("error_max: %g %h", error_max, in_float);
        end
    end
    
    
    
    
    jelly_float_reciprocal
            #(
                .EXP_WIDTH      (EXP_WIDTH),
                .EXP_OFFSET     (EXP_OFFSET),
                .FRAC_WIDTH     (FRAC_WIDTH),
                .FLOAT_WIDTH    (FLOAT_WIDTH),
                
                .USER_WIDTH     (32),
                
                .D_WIDTH        (D_WIDTH),
                .K_WIDTH        (K_WIDTH),
                .GRAD_WIDTH     (GRAD_WIDTH),
                
                .WRITE_TABLE    (1)
            )
        i_float_reciprocal
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_user         (in_float),
                .s_float        (in_float),
                .s_valid        (in_valid),
                .s_ready        (in_ready),
                
                .m_user         (out_src),
                .m_float        (out_float),
                .m_valid        (out_valid),
                .m_ready        (out_ready)
            );
    
    
    // debug
    integer iEXP_WIDTH                = EXP_WIDTH;
    integer iEXP_OFFSET               = EXP_OFFSET;
    integer iFRAC_WIDTH               = FRAC_WIDTH;
    integer iFLOAT_WIDTH              = FLOAT_WIDTH;
    integer iD_WIDTH                  = D_WIDTH;
    integer iK_WIDTH                  = K_WIDTH;
    integer iGRAD_WIDTH               = GRAD_WIDTH;
    
    wire                        in_float_sign = in_float[EXP_WIDTH  + FRAC_WIDTH];
    wire    [EXP_WIDTH-1:0]     in_float_exp  = in_float[FRAC_WIDTH +: EXP_WIDTH];
    wire    [FRAC_WIDTH-1:0]    in_float_frac = in_float[FRAC_WIDTH-1:0];
    integer     int_in_float_exp;
    real        rel_in_float;
    always @* begin
        int_in_float_exp = in_float_exp - EXP_OFFSET;
        rel_in_float     = in_float_frac;
        rel_in_float     = rel_in_float / (1 << FRAC_WIDTH) + 1.0;
        if ( in_float_exp > EXP_OFFSET )    rel_in_float = rel_in_float * (1 << (in_float_exp - EXP_OFFSET));
        else                                rel_in_float = rel_in_float / (1 << (EXP_OFFSET - in_float_exp));
        if ( in_float_sign )                rel_in_float = -rel_in_float;
    end

    wire                        out_float_sign = out_float[EXP_WIDTH  + FRAC_WIDTH];
    wire    [EXP_WIDTH-1:0]     out_float_exp  = out_float[FRAC_WIDTH +: EXP_WIDTH];
    wire    [FRAC_WIDTH-1:0]    out_float_frac = out_float[FRAC_WIDTH-1:0];
    integer     int_out_float_exp;
    real        rel_out_float;
    real        exp_out_float;
    real        out_value;
    always @* begin
        out_value = float2real(out_float);
        
        int_out_float_exp = out_float_exp - EXP_OFFSET;
        rel_out_float     = out_float_frac;
        rel_out_float     = rel_out_float / (1 << FRAC_WIDTH) + 1.0;
        if ( out_float_exp > EXP_OFFSET )   rel_out_float = rel_out_float * (1 << (out_float_exp - EXP_OFFSET));
        else                                rel_out_float = rel_out_float / (1 << (EXP_OFFSET - out_float_exp));
        if ( out_float_sign )               rel_out_float = -rel_out_float;
        
        exp_out_float = 1.0 / rel_in_float;
    end
    
endmodule


`default_nettype wire


// end of file
