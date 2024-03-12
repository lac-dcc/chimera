////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	xddrck.v
// {{{
// Project:	A Set of Wishbone Controlled SPI Flash Controllers
//
// Purpose:	When outputting a clock, Xilinx recommends using the ODDR
//		primitive to insure the clock's stability.  This is a simple
//	wrapper around that primitive, although it does cost one delay.
//	For the QSPI, this helps to make certain that as much of the logic
//	delay as possible has been removed from the path--to get the full
//	80MHz speed of our clock.  (The QSPI device on the S6 can run at 108MHz,
//	here, we will run it at 80MHz.)
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2015-2021, Gisselquist Technology, LLC
// {{{
// This file is part of the set of Wishbone controlled SPI flash controllers
// project
//
// The Wishbone SPI flash controller project is free software (firmware):
// you can redistribute it and/or modify it under the terms of the GNU Lesser
// General Public License as published by the Free Software Foundation, either
// version 3 of the License, or (at your option) any later version.
//
// The Wishbone SPI flash controller project is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  (It's in the $(ROOT)/doc directory.  Run make
// with no target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	LGPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/lgpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
// }}}
module	xddrck(
		// {{{
		input	[1:0]	i_clk,
		input	[1:0]	i_v,
		output		o_pin
		// }}}
	);

	wire	w_internal;
	reg	last;

	ODDR2 #(
		// {{{
		.DDR_ALIGNMENT("C0"),
		.INIT(1'b1),
		.SRTYPE("ASYNC")
		// }}}
	) ODDRi(
		// {{{
		.Q(o_pin),
		.CE(1'b1),
		.C0(i_clk[0]),
		.D0(i_v[0]),	// Negative clock edge (goes first)
		.C1(i_clk[1]),
		.D1(i_v[1]),	// Positive clock edge
		.R(1'b0),
		.S(1'b0));
		// }}}

endmodule
