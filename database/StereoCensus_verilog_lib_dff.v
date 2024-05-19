// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  FIFOs with a variety of interfaces.
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

`ifndef LIB_DFF_V_
`define LIB_DFF_V_

`timescale 1ns/1ps

// D flip-flop with synchronous reset
module dff#(
    parameter WIDTH = 1
  ) (
    input wire clk,
    input wire rst,

    input wire [WIDTH-1:0] inp,
    output reg [WIDTH-1:0] outp
  );

  always @(posedge clk) begin
    outp <= rst ? 0 : inp;
  end

endmodule

`endif // LIB_DFF_V_
