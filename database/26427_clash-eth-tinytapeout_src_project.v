// This program was cloned from: https://github.com/rowanG077/clash-eth-tinytapeout
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_clash_mac (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset dsdss
);

  topEntity ethmac (
    .ethRxClk(ui_in[0]),
    .ethTxClk(ui_in[1]),
    .rstN(rst_n),
    .rxDv(ui_in[2]),
    .rxErr(ui_in[3]),
    .rxData(ui_in[4:7]),

    .txEn(uo_out[0]),
    .txErr(uo_out[1]),
    .txData(uo_out[2:5])
  );

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[6] = 0;
  assign uo_out[7] = 0;

  assign uio_out = 0;
  assign uio_oe  = 0;

endmodule
