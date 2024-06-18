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
	Date: March, 7th 2017
	*/

`timescale 1ns / 1ps

module jt51_sincf #(parameter win=1, wout=5)
(
	input clk,
	input [win-1:0] din,
	output reg [wout-1:0] dout
);

reg [win-1:0] mem[23:0];

genvar i;


generate 
for (i=23; i>0; i=i-1) begin: meminput
	always @(posedge clk)
		mem[i] <= mem[i-1];	
end

endgenerate

always @(posedge clk) begin
	mem[0] <= din;
	dout <= mem[0] + mem[1] + mem[2] + mem[3] +
		mem[4] + mem[5] + mem[6] + mem[7] +
		mem[8] + mem[9] + mem[10] + mem[11] +
		mem[12] + mem[13] + mem[14] + mem[15] +
		mem[16] + mem[17] + mem[18] + mem[19] +
		mem[20] + mem[21] + mem[22] + mem[23];
end

endmodule