// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// wait generator for Z80

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

module zwait(

	input  wire rst_n,

	input  wire wait_start_gluclock,
	input  wire wait_start_comport,

	input  wire wait_end,


	output reg  [6:0] waits,

	output wire wait_n,
	output wire spiint_n
);


`ifdef SIMULATE
	initial
	begin
//		force waits = 7'd0;
		waits <= 7'd0;
	end
`endif


	wire wait_off_n;
	assign wait_off_n = (~wait_end) & rst_n;

	// RS-flipflops
	//
	always @(posedge wait_start_gluclock, negedge wait_off_n)
	if( !wait_off_n )
		waits[0] <= 1'b0;
	else if( wait_start_gluclock )
		waits[0] <= 1'b1;
	//
	always @(posedge wait_start_comport, negedge wait_off_n)
	if( !wait_off_n )
		waits[1] <= 1'b0;
	else if( wait_start_comport )
		waits[1] <= 1'b1;


	always @(posedge wait_end) // just dummy for future extensions
	begin
		waits[6:2] <= 5'd0;
	end



`ifndef SIMULATE
	assign spiint_n = ~|waits;
	assign wait_n = spiint_n ? 1'bZ : 1'b0;
`else
	assign spiint_n = 1'b1;
	assign wait_n = 1'bZ;
`endif

endmodule

