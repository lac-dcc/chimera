////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	simpleinterp.v
// {{{
// Project:	Example Interpolators
//
// Purpose:	A *very* simple interpolator that only returns the last value,
//		but with a newer/updated clock.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2017-2024, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
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
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	simpleinterp #(
		// {{{
		parameter	INW   = 28,	// Input width
				CTRBITS = 32	// Bits in our counter
		// }}}
	) (
		// {{{
		input	wire			i_clk,
		input	wire			i_ce,
		input	wire	[(CTRBITS-1):0]	i_step,
		input	wire	[(INW-1):0]	i_data,
		output	reg			o_ce,
		output	wire	[(INW-1):0]	o_data
		// }}}
	);

	reg	[(CTRBITS-1):0]	r_counter;

	always @(posedge i_clk)
	if (i_ce)
		{ o_ce, r_counter } <= r_counter + i_step;
	else
		o_ce <= 1'b0;

	always @(posedge i_clk)
		o_data <= i_data;

endmodule
