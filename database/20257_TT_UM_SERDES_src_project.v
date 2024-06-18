// This program was cloned from: https://github.com/Santeep/TT_UM_SERDES
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_serdes (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
 
    
    wire ser_in = uio_in[0];
    wire ser_out = uio_out[0];
    wire data_en = uio_in[2];
    wire par_en = uio_in[3];
    wire ser_en = uio_in[4];

    serdes_top serdes_inst (
        .clk(clk),
        .rst_n(rst_n),
        .data_en(data_en),
        .ser_in(ser_in),
        .par_en(par_en),  
        .ser_en(ser_en),  
        .ser_out(ser_out),
        .data_out(uo_out),
        .data_8b_in(ui_in)  
    );
      assign uio_oe = 8'b0;  
    assign uio_out[7:1] = 7'b0;
endmodule
