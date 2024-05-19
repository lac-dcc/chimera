// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT6295.

    JT6295 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT6295 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT6295.  If not, see <http://www.gnu.org/licenses/>.

	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: 6-1-2020
	*/

// STAGES must be greater than 2
module jt6295_sh_rst #(parameter WIDTH=5, STAGES=32, RSTVAL=1'b0 )
(
	input					rst,	
	input 					clk,
	input					clk_en /* synthesis direct_enable */,
	input		[WIDTH-1:0]	din,
   	output		[WIDTH-1:0]	drop
);

reg [STAGES-1:0] bits[WIDTH-1:0];

genvar i;
integer k;
generate
initial
	for (k=0; k < WIDTH; k=k+1) begin
		bits[k] = { STAGES{RSTVAL}};
	end
endgenerate

generate
	for (i=0; i < WIDTH; i=i+1) begin: bit_shifter
		always @(posedge clk, posedge rst) 
			if( rst ) begin
				bits[i] <= {STAGES{RSTVAL}};
			end else if(clk_en) begin
				bits[i] <= {bits[i][STAGES-2:0], din[i]};
			end
		assign drop[i] = bits[i][STAGES-1];
	end
endgenerate

endmodule
