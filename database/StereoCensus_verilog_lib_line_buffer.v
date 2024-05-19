// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  Line buffer producing a window of inputs.
 *
 *  Copyright (c) 2016, Stephen Longfield, stephenlongfield.com
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

`ifndef LIB_LINE_BUFFER_V_
`define LIB_LINE_BUFFER_V_

`timescale 1ns/1ps

`include "fifo.v"
`include "tapped_fifo.v"

// This line buffer generates a "window" of pixels from an input stream, with no
// flow control. It's parameterized in four ways:
//   WIDTH:        Wordsize
//   LINE_LENGTH:  Length of each line
//   NUM_LINES:    How many lines to buffer
//   WINDOW_WIDTH: How wide the window should be.
//
// The first line is just the tapped fifo, of WINDOW_WIDTH width, and after
// that, each line is a vanilla fifo of (LINE_LENGTH-WINDOW_WIDTH) length, and
// a tapped fifo of length WINDOW_LENGTH.
//
// In essence, if + is a tapped buffer, and - is a plain FIFO, for a 5x5 window
// with a line length of 20:
//
//               in>+++++>1
// 1>---------------+++++>2
// 2>---------------+++++>3
// 3>---------------+++++>4
// 4>---------------+++++
//
// Where 1 is connected to 1, 2 is connected to 2, and so on.
module line_buffer#(
  parameter WIDTH=1,
  parameter LINE_LENGTH=1,
  parameter NUM_LINES=1,
  parameter WINDOW_WIDTH=1
  ) (
    input wire clk,
    input wire rst,

    input wire  [WIDTH-1:0] inp,
    output wire [WIDTH*NUM_LINES*WINDOW_WIDTH-1:0] outp
  );

  localparam OUT_WIDTH = WIDTH*NUM_LINES*WINDOW_WIDTH;
  localparam TAP_WIDTH = WIDTH*WINDOW_WIDTH;

  wire[WIDTH*WINDOW_WIDTH-1:0] window_line[NUM_LINES];

  wire[WIDTH-1:0] next_line[NUM_LINES];

  tapped_fifo#(.WIDTH(WIDTH), .DEPTH(WINDOW_WIDTH))
      tf(clk, rst, inp, window_line[0], next_line[0]);
  assign outp[(OUT_WIDTH-1):(OUT_WIDTH-TAP_WIDTH)] = window_line[0];

  genvar i;
  generate
  for (i = 1; i < NUM_LINES; i++) begin : lines
    wire[WIDTH-1:0] connection;
    fifo#(.WIDTH(WIDTH), .DEPTH(LINE_LENGTH-WINDOW_WIDTH))
         f(clk, rst, next_line[i-1], connection);
    tapped_fifo#(.WIDTH(WIDTH), .DEPTH(WINDOW_WIDTH))
         tf(clk, rst, connection, window_line[i], next_line[i]);
    assign outp[(OUT_WIDTH-TAP_WIDTH*(i)-1):(OUT_WIDTH-TAP_WIDTH*(i+1))] = 
      window_line[i];
  end
  endgenerate
endmodule

`endif // LIB_LINE_BUFFER_V_
