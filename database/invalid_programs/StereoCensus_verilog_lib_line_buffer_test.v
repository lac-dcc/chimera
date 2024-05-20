// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  Concrete parameterizations of a line buffer for testing.
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

`include "line_buffer.v"

module line_buffer_test(
  input clk,
  input rst,
  input wire  [31:0] inp,
  output wire [(32*10*10-1):0] outp
  );

  line_buffer #(.WIDTH(32), .LINE_LENGTH(20), .NUM_LINES(10), 
                .WINDOW_WIDTH(10))
    lb(clk, rst, inp, outp);

endmodule
