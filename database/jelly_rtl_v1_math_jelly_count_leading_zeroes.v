// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   reciprocal
//
//                                 Copyright (C) 2008-2010 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// reciprocal
module jelly_count_leading_zeroes
        #(
            parameter   DATA_WIDTH    = 16,
            parameter   OUT_WIDTH     = 6,
            parameter   IN_REGS       = 1,
            parameter   OUT_REGS      = 1,
            parameter   INIT_IN_REGS  = {DATA_WIDTH{1'bx}},
            parameter   INIT_OUT_REGS = {OUT_WIDTH{1'bx}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        inreg_cke,
            input   wire                        outreg_cke,
            
            input   wire    [DATA_WIDTH-1:0]    in_data,
            
            output  wire    [OUT_WIDTH-1:0]     out_clz
        );
    
    wire    [DATA_WIDTH-1:0]    sig_data;
    generate
    if ( OUT_REGS ) begin
        reg     [DATA_WIDTH-1:0]    reg_data;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_data <= INIT_IN_REGS;
            end
            else if ( inreg_cke ) begin
                reg_data <= in_data;
            end
        end
        assign sig_data = reg_data;
    end
    else begin
        assign sig_data = in_data;
    end
    endgenerate
    
    
    integer                     i;
    reg     [OUT_WIDTH-1:0]     sig_clz;
    
    always @* begin
        sig_clz = {OUT_WIDTH{1'b0}};
        for ( i = 0; i < DATA_WIDTH; i=i+1 ) begin : clz_loop
            if ( sig_data[DATA_WIDTH-1 - i] != 1'b0 ) begin
                sig_clz = i;
                disable clz_loop;
            end
        end
    end
    
    generate
    if ( OUT_REGS ) begin
        reg     [OUT_WIDTH-1:0]     reg_clz;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_clz <= INIT_OUT_REGS;
            end
            else if ( outreg_cke ) begin
                reg_clz <= sig_clz;
            end
        end
        assign out_clz = reg_clz;
    end
    else begin
        assign out_clz = sig_clz;
    end
    endgenerate
    
endmodule


`default_nettype wire



// end of file
