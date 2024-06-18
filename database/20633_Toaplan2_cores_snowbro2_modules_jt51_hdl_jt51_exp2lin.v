// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

  Author: Jose Tejada Gomez. Twitter: @topapate
  Version: 1.0
  Date: 27-10-2016
  */


module jt51_exp2lin(
    input      signed [ 9:0] man,
    input             [ 2:0] exp,
    output reg signed [15:0] lin
);

always @(*) begin
    case( exp )
        3'd7: lin = { man, 6'b0 };
        3'd6: lin = { {1{man[9]}}, man, 5'b0 };
        3'd5: lin = { {2{man[9]}}, man, 4'b0 };
        3'd4: lin = { {3{man[9]}}, man, 3'b0 };
        3'd3: lin = { {4{man[9]}}, man, 2'b0 };
        3'd2: lin = { {5{man[9]}}, man, 1'b0 };
        3'd1: lin = { {6{man[9]}}, man };
        3'd0: lin = 16'd0;
    endcase
end

endmodule
