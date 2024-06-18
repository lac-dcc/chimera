// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0



/* This file is part of JT51.


    JT51 program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 27-1-2017

*/

module jt51_kon(
    input           rst,
    input           clk,
    input           cen,
    input   [3:0]   keyon_op,
    input   [2:0]   keyon_ch,
    input   [1:0]   cur_op,
    input   [2:0]   cur_ch,
    input           up_keyon,
    input           csm,
    input           overflow_A,

    output  reg     keyon_II
);

//reg csm_copy;

reg din;
wire drop;

reg [3:0] cur_op_hot;

always @(posedge clk) if (cen)
    keyon_II <= (csm&&overflow_A) || drop;

always @(*) begin
    case( cur_op )
        2'd0: cur_op_hot = 4'b0001; // S1 / M1
        2'd1: cur_op_hot = 4'b0100; // S3 / M2
        2'd2: cur_op_hot = 4'b0010; // S2 / C1
        2'd3: cur_op_hot = 4'b1000; // S4 / C2
    endcase
    din = keyon_ch==cur_ch && up_keyon ? |(keyon_op&cur_op_hot) : drop;
end

jt51_sh #(.width(1),.stages(32)) u_konch(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .cen    ( cen       ),
    .din    ( din       ),
    .drop   ( drop      )
);

endmodule
