// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// register file with RAM64X1D
module jelly_ram64x1d_w1r2
        #(
            parameter   WIDTH  = 32,
            parameter   DEVICE = "RTL"
        )
        (
            input   wire                clk,
            
            input   wire                wr_en,
            input   wire    [5:0]       wr_addr,
            input   wire    [WIDTH-1:0] wr_data,
            
            input   wire    [5:0]       rd0_addr,
            output  wire    [WIDTH-1:0] rd0_data,
            
            input   wire    [5:0]       rd1_addr,
            output  wire    [WIDTH-1:0] rd1_data
        );
    
    genvar      i;
    
    generate
    for ( i = 0; i < WIDTH; i = i+1 ) begin : loop_ram64
        jelly_ram64x1d
                #(
                    .INIT       (64'h0000000000000000),
                    .DEVICE     (DEVICE)
                )
            i_ram64x1d_0
                (
                    .dpo        (rd0_data[i]),
                    .spo        (),
                    .a          (wr_addr),
                    .d          (wr_data[i]),
                    .dpra       (rd0_addr),
                    .wclk       (clk),
                    .we         (wr_en)
                );
        
        jelly_ram64x1d
                #(
                    .INIT       (64'h0000000000000000),
                    .DEVICE     (DEVICE)
                )
            i_ram64x1d_1
                (
                    .dpo        (rd1_data[i]),
                    .spo        (),
                    .a          (wr_addr),
                    .d          (wr_data[i]),
                    .dpra       (rd1_addr),
                    .wclk       (clk),
                    .we         (wr_en)
                );
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
