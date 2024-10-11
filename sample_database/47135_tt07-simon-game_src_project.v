// This program was cloned from: https://github.com/urish/tt07-simon-game
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// verilator lint_off UNUSED

module tt_um_urish_simon (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [3:0] led;
  wire [6:0] segments;
  wire [1:0] segment_digits;
  wire sound;

  assign uo_out  = {1'b0, segment_digits, sound, led};
  assign uio_out = {1'b0, segments};
  assign uio_oe  = 8'b0111_1111;

  simon simon1 (
      .clk   (clk),
      .rst   (!rst_n),
      .ticks_per_milli (16'd50),
      .btn   (ui_in[3:0]),
      .led   (led),
      .segments(segments),
      .segment_digits(segment_digits),
      .segments_invert(ui_in[4]),
      .sound (sound)
  );

endmodule
