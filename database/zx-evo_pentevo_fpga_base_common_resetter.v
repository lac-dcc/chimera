// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// reset generator 

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/

`include "tune.v"

module resetter(

	clk,

	rst_in_n,

	rst_out_n );

parameter RST_CNT_SIZE = 4;


	input clk;

	input rst_in_n; // input of external asynchronous reset

	output rst_out_n; // output of end-synchronized reset (beginning is asynchronous to clock)
	reg    rst_out_n;



	reg [RST_CNT_SIZE:0] rst_cnt; // one bit more for counter stopping

	reg rst1_n,rst2_n;



`ifdef SIMULATE
	initial
	begin
		rst_cnt = 0;
		rst1_n = 1'b0;
		rst2_n = 1'b0;
		rst_out_n = 1'b0;
	end
`endif


	always @(posedge clk, negedge rst_in_n)
	if( !rst_in_n ) // external asynchronous reset
	begin
		rst_cnt <= 0;
		rst1_n <= 1'b0;
		rst2_n <= 1'b0;
		rst_out_n <= 1'b0; // this zeroing also happens after FPGA configuration, so also power-up reset happens
	end
	else // clocking
	begin
		rst1_n <= 1'b1;
		rst2_n <= rst1_n;

		if( rst2_n && !rst_cnt[RST_CNT_SIZE] )
		begin
			rst_cnt <= rst_cnt + 1;
		end

		if( rst_cnt[RST_CNT_SIZE] )
		begin
			rst_out_n <= 1'b1;
		end
	end


endmodule

