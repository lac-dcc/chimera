////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	rounding.v
// {{{
// Project:	Example Interpolators
//
// Purpose:	
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
module	rounding #(
		parameter	IWID=8, OWID=5;
	) (
		// {{{
		input	wire			i_clk,
		input	wire	[(IWID-1):0]	i_data,
		output	reg	[(OWID-1):0]	o_truncate,
					o_halfup,
					o_halfdown,
					o_tozero,
					o_fromzero,
					o_convergent
		// }}}
	);

	// Local declarations
	// {{{
	wire	[(IWID-1):0]	w_halfup,
				w_halfdown,
				w_tozero,
				w_fromzero,
				w_convergent;
	// }}}
	
	always @(posedge i_clk)
		o_truncate <= i_data[(IWID-1):(IWID-OWID)];

	assign	w_halfup = i_data[(IWID-1):0]
			+ { {(OWID){1'b0}}, 1'b1, {(IWID-OWID-1){1'b0}} };
	always @(posedge i_clk)
		o_halfup <= w_halfup[(IWID-1):(IWID-OWID)];

	assign	w_halfdown = i_data[(IWID-1):0]
			+ {{(OWID+1){1'b0}},{(IWID-OWID-1){1'b1}}};
	always @(posedge i_clk)
		o_halfdown <= w_halfdown[(IWID-1):(IWID-OWID)];

	assign	w_tozero = i_data[(IWID-1):0] + {{(OWID){1'b0}}, i_data[(IWID-1)],
				{(IWID-OWID-1){!i_data[(IWID-1)]}}};
	always @(posedge i_clk)
		o_tozero <= w_tozero[(IWID-1):(IWID-OWID)];

	assign	w_fromzero = i_data[(IWID-1):0] + {{(OWID){1'b0}}, !i_data[(IWID-1)],
				{(IWID-OWID-1){i_data[(IWID-1)]}}};
	always @(posedge i_clk)
		o_fromzero <= w_fromzero[(IWID-1):(IWID-OWID)];


	assign	w_convergent = i_data[(IWID-1):0] + {{(OWID){1'b0}}, i_data[(IWID-OWID)],
				{(IWID-OWID-1){!i_data[(IWID-OWID)]}}};
	always @(posedge i_clk)
		o_convergent <= w_convergent[(IWID-1):(IWID-OWID)];

	// Make verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, w_halfup[2:0], w_halfdown[2:0], w_tozero[2:0],
				w_fromzero[2:0], w_convergent[2:0] };
	// verilator lint_on  UNUSED
	// }}}
endmodule
