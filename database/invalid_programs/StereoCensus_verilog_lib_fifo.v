// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  Flip-flip FIFO.
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

`ifndef LIB_FIFO_V_
`define LIB_FIFO_V_

`timescale 1ns/1ps

`include "dff.v"

// This is a basic flip-flip FIFO with synchronous reset.
module fifo#(
      parameter WIDTH=1,
    parameter DEPTH=1
  ) (
      input wire clk,
      input wire rst,

      input  wire [WIDTH-1:0] inp,
      output wire [WIDTH-1:0] outp
  );

    reg [WIDTH-1:0] regs[DEPTH];

    assign outp = regs[DEPTH-1];

    dff#(WIDTH) sr0(clk, rst, inp, regs[0]);

    genvar i;
    generate
        for (i = 0; i < DEPTH-1; i++) begin : shift
            dff#(WIDTH) sr(clk, rst, regs[i], regs[i+1]);
        end
    endgenerate

endmodule

`endif // LIB_FIFO_V_
