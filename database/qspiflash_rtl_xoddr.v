////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	xoddr.v
// {{{
// Project:	A Set of Wishbone Controlled SPI Flash Controllers
//
// Purpose:	
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2015-2021, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
// }}}
module	xoddr(
		// {{{
		input	wire		i_clk,
		input	wire	[1:0]	i_v,
		output	wire		o_pin
		// }}}
	);

	wire	w_internal;
	reg	last;

	always @(posedge i_clk)
		last <= i_v[1];

	ODDR #(
		// {{{
		.DDR_CLK_EDGE("SAME_EDGE"),
		.INIT(1'b0),
		.SRTYPE("SYNC")
		// }}}
	) ODDRi(
		// {{{
		.Q(o_pin),
		.C(i_clk),
		.CE(1'b1),
		.D1(last),	// Negative clock edge (goes first)
		.D2(i_v[0]),	// Positive clock edge
		.R(1'b0),
		.S(1'b0));
		// }}}

endmodule
