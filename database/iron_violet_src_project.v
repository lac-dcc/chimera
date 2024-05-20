// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

/*
 * Copyright (c) 2023 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

//============================================================================//
// Top-Level
//============================================================================//

`define default_netname none

module tt_um_iron_violet_simon (
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // Will go high when the design is enabled
  input  wire       clk,      // Clock
  input  wire       rst_n     // Reset_n - active low
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:4]    = 0;
  assign uio_out        = 0;
  assign uio_oe         = 0;

  wire [1:0] in_sync;
  wire       in_valid;

  wire [1:0] lamp_out;
  wire       lamp_ena;

  wire [1:0] rand_num;

  assign uo_out[0] = lamp_ena & !lamp_out[1] & !lamp_out[0];
  assign uo_out[1] = lamp_ena & !lamp_out[1] &  lamp_out[0];
  assign uo_out[2] = lamp_ena &  lamp_out[1] & !lamp_out[0];
  assign uo_out[3] = lamp_ena &  lamp_out[1] &  lamp_out[0];

  wire timer_go;
  
  wire clk_10khz;

  clk_div #(
    .FREQ_IN  (50_000_000),
    .FREQ_OUT (10_000)
  ) clk_div_u1 (
    .CLK      (clk),
    .RST_N    (rst_n),
    .CLK_OUT  (clk_10khz)
  );

  io_sync io_sync_u1 (
    .CLK      (clk_10khz),
    .RST_N    (rst_n),
    .SYNC_IN  (ui_in[3:0]),
    .SYNC_OUT (in_sync),
    .VALID    (in_valid)
  );

  rng rng_u1 (
    .CLK   (clk_10khz),
    .RST_N (rst_n),
    .RAND  (rand_num)
  );

  controller controller_u1 (
    .CLK          (clk_10khz),
    .RST_N        (rst_n),
    .IN           (in_sync),
    .IN_VALID     (in_valid),
    .OUT          (lamp_out),
    .OUT_ENA      (lamp_ena),
    .RAND         (rand_num),
    .START_GAME   (ui_in [5])
  );

endmodule : tt_um_iron_violet_simon
