// This program was cloned from: https://github.com/SteffenReith/TT06_PiMac
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Steffen Reith 
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_SteffenReith_PiMACTop (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

   // A reset signal for the MAC-unit
  wire reset = !(rst_n && ena);

  // Don't use the IOs as outputs
  assign uio_out = 8'b0000_0000;

  // Set the directions for the IOs 
  assign uio_oe = 8'bZZZZ_0000;

  //Instantiate the PiMAC and connect the signals
  PiMAC piMAC (
    .a(ui_in[3:0]),
    .b(ui_in[7:4]),
    .c(uio_in[3:0]),
    .result(uo_out),
    .reset(reset),
    .clk(clk)
  );

endmodule
