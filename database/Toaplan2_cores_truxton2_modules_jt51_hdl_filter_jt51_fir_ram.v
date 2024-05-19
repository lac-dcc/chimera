// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of jt51.

    jt51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    jt51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with jt51.  If not, see <http://www.gnu.org/licenses/>.

	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: March, 7th 2017
	*/

`timescale 1ns / 1ps

module jt51_fir_ram 
#(parameter data_width=8, parameter addr_width=7)
(
	input [(data_width-1):0] data,
	input [(addr_width-1):0] addr,
	input we, clk,
	output [(data_width-1):0] q
);

(* ramstyle = "no_rw_check" *) reg [data_width-1:0] ram[2**addr_width-1:0];

	reg [addr_width-1:0] addr_reg;

	always @ (posedge clk) begin
		if (we)
			ram[addr] <= data;
		addr_reg <= addr;
	end
	
	assign q = ram[addr_reg];
endmodule
