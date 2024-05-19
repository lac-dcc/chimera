// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  One step in the argmin tree.
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

`ifndef CENSUS_ARGMIN_STAGE_V_
`define CENSUS_ARGMIN_STAGE_V_

`timescale 1ns/1ps

`include "dff.v"

// This is an individual stage of the argmin tree. It takes in two arguments,
// along with their candidates for the argmin value, and produces a new
// candidate (the minimum of the two inputs), and a new argmin value.  The
// argmin value gets a 0 in the stage's bit if the left input is smaller, and
// a 1 if the right input is smaller.
module argmin_stage#(
  parameter WIDTH=1,
  parameter ADDR_WIDTH=1,
  parameter STAGE=1
  ) (
  input wire clk,
  input wire rst,

  input wire [WIDTH-1:0] left_val,
  // One bit of the address input will go unused
  /* verilator lint_off UNUSED */
  input wire [ADDR_WIDTH-1:0] left_addr,
  /* verilator lint_on UNUSED */

  input wire [WIDTH-1:0] right_val,
  /* verilator lint_off UNUSED */
  input wire [ADDR_WIDTH-1:0] right_addr,
  /* verilator lint_on UNUSED */

  output wire [WIDTH-1:0] outp,
  output wire [ADDR_WIDTH-1:0] outp_addr
  );

  wire left_lte;

  wire [WIDTH-1:0] outp_next;
  wire [ADDR_WIDTH-1:0] outp_addr_next;

  dff#(.WIDTH(WIDTH)) out_ff(clk, rst, outp_next, outp);
  dff#(.WIDTH(ADDR_WIDTH)) out_addr_ff(clk, rst, outp_addr_next, outp_addr);

  assign left_lte = left_val <= right_val;

  assign outp_next = left_lte ? left_val : right_val;

  genvar i;
  generate
  for (i = 0; i < ADDR_WIDTH; i++) begin
    if (i == STAGE) begin
      assign outp_addr_next[i] = !left_lte;
    end else begin
      assign outp_addr_next[i] = left_lte ? left_addr[i] : right_addr[i];
    end
  end
  endgenerate

endmodule

`endif // CENSUS_ARGMIN_STAGE_V_
