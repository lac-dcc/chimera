////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	iiravg.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Implements a simple recursive filter.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2019-2024, Gisselquist Technology, LLC
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
//
`default_nettype	none
// }}}
module	iiravg #(
		// {{{
		parameter		IW=15, OW=16, LGALPHA=4,
		parameter		AW=(IW > OW ? IW : OW) +LGALPHA,
		parameter [AW-1:0]	RESET_VALUE = 0
		// }}}
	) (
		// {{{
		input	wire	i_clk, i_reset, i_ce,
		input	wire	[(IW-1):0]	i_data,
		output	wire	[(OW-1):0]	o_data
		// }}}
	);

	// Signal declarations
	// {{{
	wire	signed [(AW-1):0]	difference;
	reg	[(AW-1):0]	r_average, adjustment;
	// }}}

	assign	difference = { i_data, {(AW-IW){1'b0}} } - r_average;

	always @(posedge i_clk)
		adjustment <= { {(LGALPHA){(difference[(AW-1)])}},
				difference[(AW-1):LGALPHA] };

	always @(posedge i_clk)
	if (i_reset)
		r_average <= RESET_VALUE;
	else if (i_ce)
		r_average <= r_average + adjustment;

	assign	o_data = r_average[AW-1:AW-OW];

endmodule
