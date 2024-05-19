// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  Static version of the census transform stereo vision algorithm.
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
 *  This file contains a simple static example of one possible configuration for
 *  the census transform implementation of the stereo vision algorithm. Its main
 *  purpose is reference, and integration testing.
 *
 *  This is the equivalent of running gen_stereo.py with:
 *    census_gen.py
 *      --bit_width 8
 *      --line_width 450
 *      --window_width = 20
 *      --window_height = 20
 *      --max_disparity = 40
 */

`ifndef STEREO_CENSUS_BASIC_V_
`define STEREO_CENSUS_BASIC_V_

`include "line_buffer.v"
`include "census.v"
`include "pop_count_9.v" // Generated
`include "argmin_40.v" // Generated

module census_basic (
  input wire clk,
  input wire rst,

  input wire [7:0] inp_left,
  input wire [7:0] inp_right,

  output wire [5:0] outp
);

  wire [(8*20*20-1):0] left_window;
  wire [(8*20*20-1):0] right_window;

  line_buffer#(.WIDTH(8), .LINE_LENGTH(450), .NUM_LINES(20), .WINDOW_WIDTH(20))
    left_buf(clk, rst, inp_left, left_window);

  line_buffer#(.WIDTH(8), .LINE_LENGTH(450), .NUM_LINES(20), .WINDOW_WIDTH(20))
    right_buf(clk, rst, inp_right, right_window);

  wire [(20*20-1):0] left_census;
  wire [(20*20-1):0] right_census;

  census#(.WIDTH(8), .WINDOW_WIDTH(20), .WINDOW_HEIGHT(20))
    lcensus(clk, rst, left_window, left_census);

  census#(.WIDTH(8), .WINDOW_WIDTH(20), .WINDOW_HEIGHT(20))
    rcensus(clk, rst, right_window, right_census);

  wire [20*20*40-1:0] left_census_history;
  wire [20*20-1:0] unused;

  tapped_fifo#(.WIDTH(20*20), .DEPTH(40))
    census_samples(clk, rst, left_census, left_census_history, unused);

  // Unpack the values of the census history.
  wire [20*20-1:0] left_unpacked[40];
  genvar i;
  generate
    for (i = 0; i < 40; i++) begin : unpack
      assign left_unpacked[i] =
        left_census_history[(20*20*(i+1)-1):(20*20*i)];
    end
  endgenerate

  // Compute the hamming distances.
  wire [8:0] hamming_distance[40];
  generate
    for (i = 0; i < 40; i++) begin: ham
      pop_count_9#(.WIDTH(400))
        count(clk, rst, right_census ^ left_unpacked[i], hamming_distance[i]);
    end
  endgenerate

  // Repack the hamming distances to feed them into the argmin.
  wire [(9*40-1):0] packed_ham;
  generate
    for (i = 0; i < 40; i++) begin: pack
      assign packed_ham[(9*(i+1)-1):(9*i)] = hamming_distance[i];
    end
  endgenerate

  wire [8:0] unused_min;
  argmin_40#(.WIDTH(9)) amin(clk, rst, packed_ham, unused_min, outp);

endmodule

`endif // STEREO_CENSUS_BASIC_V_

