////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	lininterp.v
// {{{
// Project:	Example Interpolators
//
// Purpose:	This file shows how to build an example linear interpolator,
//		for the purpose of changing data rates.  While linear
//	interpolators can typically be used for more than upsampling, this
//	version will only upsample your data.
//
// Parameters:
//
// Inputs:
//
//	i_clk	Your system clock
//
//	i_ce	A logic strobe.  True whenever there is a new input sample
//		on i_data.  There must be enough clocks between i_ce values
//		to output all of the o_data values.
//
//	i_step	This controls the outgoing sample rate.  Set this value to
//		2^N * (incoming sample rate / outgoing sample rate), where
//		"N" is given by the CTRBITS parameter.
//
//	i_data	The input sample.  This value need only valid any time i_ce
//		is also true.  It will be ignored on any other clock(s).
//
// Outputs:
//
//	o_ce	A logic strobe similar to i_ce, but true once for every valid
//		output.
//
//		This implementation of a linear interpolator does nothing to
//		space o_ce values out.  Hence, if you are upsampling a 1/4 rate
//		signal to 1/2 rate, the inputs: 0, x, x, x, 1, x, x, x, 2, x,etc
//		will produce outputs: 0,1,x,x, 2,3,x,x, 4,5,x,x, etc.
//
//	o_data	The output sample, produced by linear interpolation within
//		this core.
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
`default_nettype none
//
`ifdef	VERILATOR
`define	TESTPOINTS
`endif
// }}}
module	lininterp #(
		// {{{
		parameter	INW   = 28,	// Input width
				OWID  = 28,	// Output width
				MPREC = 28,	// Multiply precision
				CTRBITS = 32	// Bits in our counter
		// This core only supports upsampling
		// parameter [0:0]	UPSAMPLE = 1'b1;
		// }}}
	) (
		// {{{
		input	wire			i_clk,
		input	wire			i_ce,
		input	wire	[(CTRBITS-1):0]	i_step,
		input	wire	[(INW-1):0]	i_data,
		output	wire			o_ce,
		output	wire	[(OWID-1):0]	o_data
`ifdef	TESTPOINTS
		, output reg	[(INW-1):0]	o_last, o_next,
		output	reg	[(INW):0]	o_slope,
		output	reg	[(MPREC-1):0]	o_offset
`endif
		// }}}
	);

	// Local declarations
	// {{{
	localparam	FWID = MPREC+INW;

	reg				pre_ce;

	reg				r_ce, r_ovfl;
	reg	signed	[(INW-1):0]	r_next, r_last;
	reg	signed	[(INW):0]	r_slope;
	reg		[(CTRBITS-1):0]	r_counter;
	reg	signed	[(MPREC):0]	r_offset;

	wire	signed [(MPREC):0]	pre_offset;
	reg				x_ce;
	reg	[(INW-1):0]		x_base;
	reg	signed [(MPREC+INW+1):0] x_offset;
	reg	[(MPREC+INW-1):0]		pre_rounding;
	reg	[(FWID-1):0]	rounded_result;
	// }}}

	always @(posedge i_clk)
		pre_ce <= i_ce;
	////////////////////////////////////////////////////////////////////////
	//
	// r_* stage.
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	////////////////////////////////////////////////////////////////////////
	//
	// r_
	// {{{
	// This stage contains values freshly clocked in from the inputs.
	// r_ variables are not input (i_) variables, but may have been input
	// variables one clock ago.

	// r_next, r_last, r_slope
	// {{{
	initial	r_next  = 0;
	initial	r_last  = 0;
	initial	r_slope = 0;
	always @(posedge i_clk)
	if (i_ce)
	begin
		r_next <= i_data;
		r_last <= r_next;
		// Add a bit, to make sure we don't overflow during
		// our subtraction
		r_slope <= { i_data[(INW-1)], i_data }
			- { r_next[(INW-1)], r_next };
	end
	// }}}

	// r_ovfl, r_counter
	// {{{
	// Start with ovfl true, so that we wait for the first valid input
	initial	r_ovfl  = 1'b1;
	initial	r_counter = 0;
	always @(posedge i_clk)
	if (i_ce)
		{ r_ovfl, r_counter } <= r_counter + i_step;
	else if (!r_ovfl)
		{ r_ovfl, r_counter } <= r_counter + i_step;
	// }}}

	// r_ce
	// {{{
	// Calculate when we want to do our next step.  In other words,
	// when do we want to use these r_* values
	initial	r_ce = 1'b0;
	always @(posedge i_clk)
		r_ce <= ((pre_ce)||(!r_ovfl));
	// }}}

	// pre_offset, r_offset
	// {{{
	// Do a bit select of our counter to get the offset which will be
	// multiplied by our slope
	assign	pre_offset = { 1'b0, r_counter[(CTRBITS-1):(CTRBITS-MPREC)] };

	always @(posedge i_clk)
	if (r_ce)
		r_offset <= pre_offset;
	// }}}
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// x_* stage.
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// The X stage where we multiply the incoming data.  It follows on
	// the clock following the r_ stage, and so the inputs to this stage
	// are the r_ variables from above.
	//

	// x_base, x_offset
	// {{{
	always @(posedge i_clk)
	if (r_ce)
	begin
		x_base   <= r_last;
		x_offset <= r_slope * r_offset;
	end
	// }}}

	// x_ce
	// {{{
	always @(posedge i_clk)
		x_ce <= r_ce;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// pre-rounding stage, and output the results
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// The pre_rounding stage, where we add things back together.
	// Specifically, we'll add the result of our multiply to the last data
	// value, to get the pre_rounding value.
	//
	always @(posedge i_clk)
	if (x_ce)
		pre_rounding <= { x_base, {(MPREC){1'b0}} }
				+ x_offset[(MPREC+INW-1):0];
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Result
	// {{{

	always @(posedge i_clk)
	if (x_ce)
		rounded_result <= pre_rounding
			+ { {(OWID){1'b0}},
				pre_rounding[(FWID-OWID)],
			{(FWID-OWID-1){!pre_rounding[(FWID-OWID)]}} };

	//
	// Here's where we output the results
	//
	//
	assign	o_ce = x_ce;
	//
	// The big trick here, though, is that we need to grab only OWID
	// bits from a value that is MPREC+INW+1 bits wide.  Which bits
	// shall we select?
	//
	// Although this result "works", it still has a problem.  The answer
	// below "truncates" our result.  "Rounding" would be better,
	// and specifically "convergent rounding."  We'll leave that for a
	// later discussion.
	assign	o_data = rounded_result[(FWID-1):(FWID-OWID)];
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Test points for debugging--if so defined
	// {{{
	////////////////////////////////////////////////////////////////////////
`ifdef	TESTPOINTS
	// {{{
	// These test points are not normally part of the linear interpolator,
	// but they can be included here in order to help you "see" what's
	// going on within the interpolator.  Using these test points, you
	// should be able to ...
	//
	// 1. reconstruct the slope offline, to test it against this slope,
	//	making sure it looks good
	//
	// 2. Reconstruct the output value offline, to verify each of the
	//	operations within this core were done correctly.
	//
	reg	[(INW-1):0]	x_last, x_next;
	reg	[(INW):0]	x_slope;
	reg	[(MPREC-1):0]	x_sclock;

	reg	[(INW-1):0]	pr_last, pr_next;
	reg	[(INW):0]	pr_slope;
	reg	[(MPREC-1):0]	pr_offset;


	always @(posedge i_clk)
	if (r_ce)
	begin
		x_last   <= r_last;
		x_next   <= r_next;
		x_slope  <= r_slope;
		// Avoid name collision, with two x_offsets having
		// different meanings.
		x_sclock <= r_offset[(MPREC-1):0];
	end

	// One more clock for the pre-rounding step
	//
	always @(posedge i_clk)
	if (r_ce)
	begin
		x_last   <= r_last;
		x_next   <= r_next;
		x_slope  <= r_slope;
		// Avoid name collision, with two x_offsets having
		// different meanings.
		x_sclock <= r_offset[(MPREC-1):0];
	end

	// One more clock for the pre-rounding step
	//
	always @(posedge i_clk)
	if (x_ce)
	begin
		pr_last   <= x_last;
		pr_next   <= x_next;
		pr_slope  <= x_slope;
		pr_offset <= x_sclock;
	end

	always @(posedge i_clk)
	if (x_ce)
	begin
		o_last   <= pr_last;
		o_next   <= pr_next;
		o_slope  <= pr_slope;
		o_offset <= pr_offset;
	end
	// }}}
`endif
	// }}}

	// Make verilator -Wall happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, x_offset[(MPREC+INW+1):(MPREC+INW)],
			rounded_result[(FWID-OWID-1):0] };
	// verilator lint_on  UNUSED
	// }}}
endmodule
