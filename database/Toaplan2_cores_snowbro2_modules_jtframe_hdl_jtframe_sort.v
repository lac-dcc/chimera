// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 14-1-2022 */

module jtframe_sort(
    input      [7:0] debug_bus,
    input      [3:0] busin,
    output reg [3:0] busout
);

always @* begin
    case( debug_bus[4:0] )
       5'h00: busout = { busin[3], busin[2], busin[1], busin[0] };
       5'h01: busout = { busin[3], busin[2], busin[0], busin[1] };
       5'h02: busout = { busin[3], busin[1], busin[2], busin[0] };
       5'h03: busout = { busin[3], busin[1], busin[0], busin[2] };
       5'h04: busout = { busin[3], busin[0], busin[1], busin[2] };
       5'h05: busout = { busin[3], busin[0], busin[2], busin[1] };

       5'h06: busout = { busin[2], busin[3], busin[1], busin[0] };
       5'h07: busout = { busin[2], busin[3], busin[0], busin[1] };
       5'h08: busout = { busin[2], busin[1], busin[3], busin[0] };
       5'h09: busout = { busin[2], busin[1], busin[0], busin[3] };
       5'h0a: busout = { busin[2], busin[0], busin[1], busin[3] };
       5'h0b: busout = { busin[2], busin[0], busin[3], busin[1] };

       5'h0c: busout = { busin[1], busin[2], busin[3], busin[0] };
       5'h0d: busout = { busin[1], busin[2], busin[0], busin[3] };
       5'h0e: busout = { busin[1], busin[3], busin[2], busin[0] };
       5'h0f: busout = { busin[1], busin[3], busin[0], busin[2] };
       5'h10: busout = { busin[1], busin[0], busin[3], busin[2] };
       5'h11: busout = { busin[1], busin[0], busin[2], busin[3] };

       5'h12: busout = { busin[0], busin[2], busin[1], busin[3] };
       5'h13: busout = { busin[0], busin[2], busin[3], busin[1] };
       5'h14: busout = { busin[0], busin[1], busin[2], busin[3] };
       5'h15: busout = { busin[0], busin[1], busin[3], busin[2] };
       5'h16: busout = { busin[0], busin[3], busin[1], busin[2] };
       5'h17: busout = { busin[0], busin[3], busin[2], busin[1] };
       default: busout = busin;
    endcase
end

endmodule
