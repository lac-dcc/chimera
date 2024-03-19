////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	icomparison.v
// {{{
// Project:	Example Interpolators
//
// Purpose:	RTL to describe several interpolators, and to calculate output
//		products from each of them all at once.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2024, Gisselquist Technology, LLC
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
module	icomparison(i_clk, i_ce, i_step, i_data,
		o_nn_ce, o_nn_data,
		o_ln_ce, o_ln_data,
		o_qf_ce, o_qf_data,
		o_qm_ce, o_qm_data,
		o_qi_ce, o_qi_data);
	parameter	INW = 28, CTRBITS = 32;
	//
	input	wire			i_clk;
	input	wire			i_ce;
	input	wire	[CTRBITS-1:0]	i_step;
	input	wire	[INW-1:0]	i_data;
	//
	output	wire			o_nn_ce;
	output	wire	[INW-1:0]	o_nn_data;
	//
	output	wire			o_ln_ce;
	output	wire	[INW-1:0]	o_ln_data;
	//
	output	wire			o_qf_ce;
	output	wire	[INW-1:0]	o_qf_data;
	//
	output	wire			o_qm_ce;
	output	wire	[INW-1:0]	o_qm_data;
	//
	output	wire			o_qi_ce;
	output	wire	[INW-1:0]	o_qi_data;
	//

	//
	// Use dly to delay the various interpolator inputs, so that they are
	// all aligned.
	//
	reg	[(4*INW-1):0]	dly;
	initial	dly = 0;
	always @(posedge i_clk)
	if (i_ce)
		dly <= { dly[(3*INW-1):0], i_data };

	simpleinterp #(INW, CTRBITS)
		nearest_neighbor(i_clk, i_ce, i_step, dly[(4*INW-1):(3*INW)],
			o_nn_ce, o_nn_data);

	// verilator lint_off UNUSED
	wire	[(INW-1):0]	ln_last, ln_next;
	wire	[(INW):0]	ln_slope;
	wire	[(INW-1):0]	ln_offset;
	// verilator lint_on  UNUSED
	lininterp #(.INW(INW), .OWID(INW), .MPREC(INW), .CTRBITS(CTRBITS))
		linear(i_clk, i_ce, i_step, dly[(3*INW)-1:(2*INW)],
			o_ln_ce, o_ln_data,
			ln_last, ln_next, ln_slope, ln_offset);

	quadinterp #(.INW(INW), .OWID(INW), .MP(INW), .CTRBITS(CTRBITS),
			.OPT_IMPROVED_FIT(1'b0), .OPT_INTERPOLATOR(1'b0))
		quadfit(i_clk, i_ce, i_step, dly[(INW-1):0],
			o_qf_ce, o_qf_data);

	quadinterp #(.INW(INW), .OWID(INW), .MP(INW), .CTRBITS(CTRBITS),
			.OPT_IMPROVED_FIT(1'b1), .OPT_INTERPOLATOR(1'b0))
		rcubed(i_clk, i_ce, i_step, dly[(INW-1):0],
			o_qm_ce, o_qm_data);

	quadinterp #(.INW(INW), .OWID(INW), .MP(INW), .CTRBITS(CTRBITS),
			.OPT_IMPROVED_FIT(1'b1), .OPT_INTERPOLATOR(1'b1))
		betterq(i_clk, i_ce, i_step, i_data,
			o_qi_ce, o_qi_data);
endmodule
