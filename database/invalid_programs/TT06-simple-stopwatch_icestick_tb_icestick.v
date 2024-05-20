// This program was cloned from: https://github.com/faramire/TT06-simple-stopwatch
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Fabio Ramirez Stern
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`include "stopwatch_top_icestick.v"
`include "clockDividerIce.v"

module ice_stopwatch(
  input CLK_IN,
  input i_board_reset,
  input i_button_start_stop,
  input i_button_lap_time,
  input i_button_reset,

  output wire o_mosi,
  output wire o_cs,
  output wire o_sck,
  output wire o_stopwatch_enabled,
  output wire o_display_enabled,

  output wire l_mosi,
  output wire l_cs,
  output wire l_sck,
  output wire l_stopwatch_enabled,
  output wire l_display_enabled
);

  wire clk_tt;

  assign reset_either = i_board_reset || i_button_reset;
  wire reset_either; // an OR of the input reset and the chip wide reset, for those that shall be affected by both

  clockDividerIce clockDividerIce1 ( // divides the 12 MHz clock to 1MHz
    .clk_in  (CLK_IN),
    .ena     (1'b1),
    .res     (1'b1),
    .clk_out (clk_tt)
  );

  wire [2:0] sink1;

  tt_um_faramire_stopwatch stopwatch1 (
    .ui_in({5'b00000, i_button_reset, i_button_lap_time, i_button_start_stop}),
    .uo_out({sink1, o_display_enabled, o_stopwatch_enabled, o_sck, o_cs, o_mosi}),
    .uio_in(8'b0),
    .uio_out(),
    .uio_oe(),
    .ena(1'b1),
    .clk(clk_tt),
    .rst_n(i_board_reset)
  );

  assign l_mosi = o_mosi;
  assign l_cs = o_cs;
  assign l_sck = o_sck;
  assign l_stopwatch_enabled = o_stopwatch_enabled;
  assign l_display_enabled = o_display_enabled;

endmodule // ice_stopwatch
