// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT_FRAME.
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
    Date: 6-9-2021 */

// Enable the LATCHIN parameter if the raw input comes
// from combinational logic

module jtframe_sync #(parameter W=1, LATCHIN=0)(
    input   clk_in,
    input   clk_out,
    input   [W-1:0] raw,
    output  [W-1:0] sync
);

reg  [W-1:0] latched;
wire [W-1:0] eff;

always @(posedge clk_in) latched <= raw;
assign eff = LATCHIN ? latched : raw;

generate
    genvar i;
    for( i=0; i<W; i=i+1 ) begin : synchronizer
        reg [1:0] s;
        assign sync[i] = s[1];

        always @(posedge clk_out) begin
            s <= { s[0], eff[i] };
        end
    end
endgenerate

endmodule