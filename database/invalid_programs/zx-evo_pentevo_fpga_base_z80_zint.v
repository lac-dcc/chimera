// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// frame INT generation

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

module zint
(
	input  wire fclk,

	input  wire zpos,
	input  wire zneg,

	input  wire int_start,

	input  wire iorq_n,
	input  wire m1_n,

	input  wire wait_n,

	output reg  int_n
);

	wire intend;

	reg [9:0] intctr;

	reg [1:0] wr;


`ifdef SIMULATE
	initial
	begin
		intctr = 10'b1100000000;
	end
`endif

	always @(posedge fclk)
		wr[1:0] <= { wr[0], wait_n };

	always @(posedge fclk)
	begin
		if( int_start )
			intctr <= 10'd0;
		else if( !intctr[9:8] && wr[1] )
			intctr <= intctr + 10'd1;
	end


	assign intend = intctr[9:8] || ( (!iorq_n) && (!m1_n) && zneg );


	always @(posedge fclk)
	begin
		if( int_start )
			int_n <= 1'b0;
		else if( intend )
			int_n <= 1'bZ;
	end





endmodule

