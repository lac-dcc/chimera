// This program was cloned from: https://github.com/faramire/TT06-simple-stopwatch
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Fabio Ramirez Stern
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none
`include "stopwatch_top.v"
module stopwatch (
  input wire clk,
  input wire reset_board,
  input wire button_start_stop,
  input wire button_lap_time,
  input wire button_reset,

  output wire mosi,
  output wire cs,
  output wire sck,
  output wire stopwatch_enabled,
  output wire display_enabled
);

  wire [7:0] sink1;
  wire [2:0] sink2;

  tt_um_faramire_stopwatch stopwatch1 (
    .ui_in({5'b0, button_reset, button_lap_time, button_start_stop}),
    .uo_out({sink2, display_enabled, stopwatch_enabled, sck, cs, mosi}),
    .uio_in(8'b0),
    .uio_out(sink1),
    .uio_oe(sink1),
    .ena(1'b1),
    .clk(clk),
    .rst_n(reset_board)
  );
endmodule