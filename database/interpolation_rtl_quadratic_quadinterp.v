////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	quadinterp.v
// {{{
// Project:	Example Interpolators
//
// Purpose:	This file describes the implementation of one of three quadratic
//		upsamplers: 1) A quadratic fit, 2) a better quadratic filter,
//	3) an actual quadratic interpolator.
// {{{
//
//	Quadratic fit--OPT_IMPROVED_FIT=1'b0, OPT_INTERPOLATOR=1'b0
//
//	The quadratic fit just fits a quadratic to every set of three points,
//	and then uses this quadratic interpolate from halfway between the
//	first two points to halfway between the last two.  This may be the
//	standard means of using quadratic interpolation, but the result it
//	produces is quite discontinuous.
//
//
//	Better filter--OPT_IMPROVED_FIT=1'b1, OPT_INTERPOLATOR=1'b0
//
//	The better filter, OPT_IMPROVED_FIT=1'b1, is actually the result of
//	convolving a rectangle with itself three times.  The filter is
//	not only continuous, but also continuous in its first derivative.
//	Sadly, while this filter has very good low pass filtering properties,
//	and perhaps the best out of band rejection, it also tends to distort
//	signals within the band--rendering it unreliable in practice.
//
//	This OPT_IMPROVED_FIT differs from the original quadratic fit only
//	in its constant term.
//
//	Actual Interpolator--OPT_IMPROVED_FIT=1'bx, OPT_INTERPOLATOR=1'b1
//
//	The third quadratic, OPT_INTERPOLATOR=1'b1, is actually an interpolator.
//	By that I mean that it is designed to fit a function through the
//	original sample points given to it.  Unlike the quadratic fit, the
//	resulting waveform will remain continuous.  Further, unlike the
//	OPT_IMPROVED_FIT option above, this one offers much less distortion
//	for signals within the passband of the filter.
//
//	Further, the OPT_INTERPOLATOR quadratic fit was designed to meet
//	a couple of criteria:
//
//		1. The fitted quadratic must pass through the points given to
//			it.
//		2. It must be continuous
//		3. If given a constant, it must return that constant as a
//			constant.  There should be no linear or quadratic
//			components for constant inputs.
//		4. If given a linear ramp for an input, there should be no
//			quadratic component--only a linear output.
// }}}
// Parameters:
// {{{
//	OPT_INTERPOLATOR	If set, creates a quadratic that interpolates
//		between sample points, so the result goes through the original
//		sample points.  OPT_INTERPOLATOR dominates OPT_IMPROVED_FIT
//		below, so when OPT_INTERPOLATOR is in effect, the
//		OPT_IMPROVED_FIT and quadratic fitting code will be ignored.
//
//	OPT_IMPROVED_FIT  	Attempts to improve upon the traditional
//		quadratic fit approach by filtering the constant coefficients.
//		The result will not, however, be an interpolator in that it
//		may not go through the original data points.  However, it will
//		be continuous and continuous in its first *and* second
//		derivatives.
//
//
//	INW		The number of bits at the input
//	OWID		The number of bits at the output
//	MP 		The number of bits from the counter used in the multiply
//	CTRBITS		The number of bits used to keep track of the internal
//		resampling timer.
// }}}
// Inputs:
// {{{
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
// }}}
// Outputs:
// {{{
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
// }}}
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
// }}}
module	quadinterp #(
		// {{{
		parameter	INW   = 25,	// Input width
				OWID  = INW,	// Output width
				MP    = 25,	// Multiply precision
				CTRBITS = 32,	// Bits in our counter
		parameter  [0:0]	OPT_IMPROVED_FIT = 1'b1,
		parameter  [0:0]	OPT_INTERPOLATOR = 1'b1,
		localparam [0:0]	DBG_LINEAR_ONLY  = 1'b0,
		localparam		GAIN_OFFSET = (OPT_INTERPOLATOR)? 3:2
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
		// }}}
	);

	// Local declarations
	// {{{
			// Bit-Width's of the quadratic, linear, and constant
			// coefficients
	localparam	AW = (OPT_INTERPOLATOR)?INW+6:INW+2,
			BW = (OPT_INTERPOLATOR)?INW+6:INW+1,
			CW = (OPT_INTERPOLATOR)?INW  :((OPT_IMPROVED_FIT)?(INW+3):INW),
			ADEC=(OPT_INTERPOLATOR)? 4:1,
			BDEC=(OPT_INTERPOLATOR)? 4:1,
			CDEC=(OPT_INTERPOLATOR)? 0:((OPT_IMPROVED_FIT)? 3:0);

	// Good quadratic interpolation is done around a given point, not
	// between points.  (i.e., the offset will be between +/- 1/2, not
	// between [0..1])  As a result, we'll need to switch coefficients
	// midway through the interval.  So ... keep track of both the current
	// and old coefficients for that purpose.
	reg	[(AW-1):0]	av, avold;
	reg	[(BW-1):0]	bv, bvold;
	reg	[(CW-1):0]	cv, cvold;

	reg				r_ce, r_ovfl;
	reg	signed	[(AW-1):0]	r_av;
	reg	signed	[(BW-1):0]	r_bv;
	reg	signed	[(CW-1):0]	r_cv;
	reg	signed	[(MP-1):0]	r_offset;
	reg		[(CTRBITS-1):0]	r_counter;

	reg				pre_ce;
	reg	signed [(MP-1):0]	pre_offset;
	reg	signed	[(AW+MP-1):0]	qp_quad;
	reg	signed	[(BW-1):0]	qp_bv;
	reg	signed	[(CW-1):0]	qp_cv;
	reg	signed	[(MP-1):0]	qp_offset;

	wire	signed	[(BMW-1):0]	lw_quad;

	reg	signed	[BMW:0]		ls_bv;
	reg	signed	[(CW-1):0]	ls_cv;
	reg	signed	[(MP-1):0]	ls_offset;

	reg	signed	[(BMW+MP):0]	lp_bv;
	reg	signed	[(CW-1):0]	lp_cv;

	wire	signed	[(CMW-1):0]	wp_bv;
	reg	signed	[CMW:0]	r_done;
	// }}}

	// Interpolation pre-filter
	// {{{
	// Used to generate the filter coefficients: av, bv, and cv
	generate if (OPT_INTERPOLATOR)
	begin : GEN_INTERPOLATOR
		// {{{
		reg	signed	[(INW-1):0]	mem	[0:3];
		reg	[(INW+2):0]	pmidv;
		reg	[(INW+3):0]	diffn;
		reg	[INW:0]		psumn, pdifn, sumw, diffw;
		reg	[(INW+3):0]	midvpsumn;


		// Four sample shift register
		// {{{
		initial	mem[0] = 0;
		initial	mem[1] = 0;
		initial	mem[2] = 0;
		initial	mem[3] = 0;
		always @(posedge i_clk)
		if (i_ce)
			{ mem[3], mem[2], mem[1], mem[0] }
				<= { mem[2], mem[1], mem[0], i_data };
		// }}}

		// pmidv, psumn, pdifn, sumw, diffn, diffw, midvpsumn
		// {{{
		// Take an extra clock to calculate some prior values
		initial	pmidv = 0;
		initial	psumn = 0;
		initial	pdifn = 0;
		initial	sumw  = 0;
		initial	diffn  = 0;
		initial	diffw  = 0;
		initial	midvpsumn = 0;
		always @(posedge i_clk)
		if (i_ce)
		begin
			pmidv <= { mem[0], 3'b000 }
					- { {(3){mem[0][INW-1]}},mem[0]};//x7
			psumn <= { i_data[(INW-1)], i_data }
					+ { mem[1][(INW-1)], mem[1] };
			pdifn <= { i_data[(INW-1)], i_data }
					- { mem[1][(INW-1)], mem[1] };
			//
			sumw <= { mem[3][(INW-1)], mem[3] }
					+ { i_data[(INW-1)], i_data };
			// sumn <= psumn;
			diffn<= { pdifn[INW], pdifn, 2'b00 }
					+ {{(3){pdifn[INW]}},pdifn };// x5
			diffw<= { i_data[(INW-1)], i_data }
					- { mem[3][(INW-1)], mem[3] };
			// midv <= pmidv;
			midvpsumn <= -{ pmidv[(INW+2)],pmidv }
					+ { psumn[INW], psumn, 2'h0 };//-x7+ x4
		end
		// }}}

		// av, bv, cv
		// {{{
		// These are our (final) quadratic coefficients
		initial	av = 0;
		initial	bv = 0;
		always @(posedge i_clk)
		if (i_ce)
		begin
			// av = x28 + x16 + x2
			// av = - { midv, 2'b00 } + { sumn, 4'h0 } - { sumw, 1'b0 };
			av <= { midvpsumn, 2'b00 }
					- { {(4){sumw[INW]}}, sumw, 1'b0 };
			bv <= { diffn[INW+3],diffn, 1'b0 }
				- { {(5){diffw[INW]}}, diffw };
			cv <= mem[2];
		end
		// }}}
	end else begin : BASIC_QUADRATIC_FIT
		// {{{
		reg	signed	[(INW-1):0]	mem	[0:1];
		reg	[INW:0]		psum, pdif;

		// mem: 2-Sample shift register
		// {{{
		initial	mem[0] = 0;
		initial	mem[1] = 0;
		always @(posedge i_clk)
		if (i_ce)
			{ mem[1], mem[0] } <= { mem[0], i_data };
		// }}}

		// psum, pdif
		// {{{
		initial	psum = 0;
		initial	pdif = 0;
		always @(posedge i_clk)
		if (i_ce)
		begin
			psum <= { i_data[(INW-1)], i_data } + { mem[1][(INW-1)], mem[1] };
			pdif <= { i_data[(INW-1)], i_data } - { mem[1][(INW-1)], mem[1] };
		end
		// }}}

		// av, bv
		// {{{
		initial	av = 0;
		initial	bv = 0;
		always @(posedge i_clk)
		if (i_ce)
		begin
			av <= { psum[INW],psum }-{ mem[1][INW-1], mem[1], 1'b0 };
					// * 2^-ADEC
			bv <= pdif;	// * 2^-BDEC
		end
		// }}}

		if (OPT_IMPROVED_FIT)
		begin : GEN_IMPROVED_FIT
			// {{{
			reg	[(INW+1):0]	pmid;
			initial	pmid = 0;
			always @(posedge i_clk)
			if (i_ce)
			begin
				pmid <= { mem[0][(INW-1)], mem[0], 1'b0 } +
					{ {(2){mem[0][(INW-1)]}}, mem[0] };
				// 0.75 * mem[2] + 0.125 * (mem[3]+mem[1])
				cv <= { pmid, 1'b0 } + { {(2){psum[INW]}}, psum };
			end
			// }}}
		end else begin : QUAD_FIT
			// {{{
			always @(posedge i_clk)
			if (i_ce)
				cv <= mem[1]; // * 1
			// }}}
		end
		// }}}
	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// r_*, counter: discover which half of the quadratic to evaluate
	// {{{
	// r_*, *old, r_ce, counter, step

	// avold, bvold, cvold
	// {{{
	initial	avold = 0;
	initial	bvold = 0;
	initial	cvold = 0;
	always @(posedge i_clk)
	if (i_ce)
	begin
		avold <= av;
		bvold <= bv;
		cvold <= cv;
	end
	// }}}

	// pre_ce
	// {{{
	initial	pre_ce = 0;
	always @(posedge i_clk)
		pre_ce <= i_ce;
	// }}}

	// r_ovfl, r_counter -- know when to produce a sample out
	// {{{
	// Start with ovfl true, so that we wait for the first valid input
	initial	r_counter = 0;
	initial	r_ovfl  = 1'b1;
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

	// pre_offset
	// {{{
	// Do a bit select of our counter to get the offset which will be
	// multiplied by our slope
	always @(posedge i_clk)
	if (r_ce)
		pre_offset <= r_counter[(CTRBITS-1):(CTRBITS-MP)];
	// }}}

	// r_offset, r_av, r_bv, r_cv
	// {{{
	initial	r_offset = 0;
	initial	r_av = 0;
	initial	r_bv = 0;
	initial	r_cv = 0;
	always @(posedge i_clk)
	if (r_ce)
	begin
		r_offset <= { pre_offset[MP-1], pre_offset[(MP-2):0] };
		if (pre_offset[(MP-1)])
		begin
			r_av <= av;
			r_bv <= bv;
			r_cv <= cv;
		end else begin
			r_av <= avold;
			r_bv <= bvold;
			r_cv <= cvold;
		end
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Quadratic product: av * t
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// qp_quad, qp_bv, qp_cv, qp_offset
	// {{{
	initial	qp_quad = 0;
	initial	qp_bv   = 0;
	initial	qp_cv   = 0;
	initial	qp_offset = 0;
	always @(posedge i_clk)
	if (r_ce)
	begin
		qp_quad  <= r_av * r_offset;	// * 2^(-MP-ADEC)
		qp_bv    <= r_bv;		// * 2^(-BDEC)
		qp_cv    <= r_cv;		// * 2^(-CDEC)
		qp_offset<= r_offset;		// * 2^(-MP)
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Pre-linear step: av * t + bv
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	localparam	BMW = ((AW-ADEC>BW-BDEC) ? (AW-ADEC+BDEC) : BW);
	// qp_quad (AW-ADEC).(MP+ADEC)
	// qb_bv   (BW-BDEC).(BDEC)
	// lw_quad (BW-BDEC).(BDEC)
	assign	lw_quad = { {(BMW-(AW+MP-(MP+ADEC-BDEC))){qp_quad[(AW+MP-1)]}},
				qp_quad[(AW+MP-1):(MP+ADEC-BDEC)] };

	// ls_bv, ls_cv, ls_offset
	// {{{
	initial	ls_bv = 0;
	initial	ls_cv = 0;
	initial	ls_offset = 0;
	always @(posedge i_clk)
	if (r_ce)
	begin
		if (!DBG_LINEAR_ONLY)
			ls_bv    <= {{(BMW+1-BW){qp_bv[BW-1]}}, qp_bv }
				+ { lw_quad[BMW-1], lw_quad };
		else
			ls_bv    <= {{(BMW-BW+1){qp_bv[(BW-1)]}}, qp_bv };
		ls_cv    <= qp_cv;
		ls_offset<= qp_offset;
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Linear product: (av * t + bv) * t
	// {{{
	////////////////////////////////////////////////////////////////////////
	//

	// lp_bv, lp_cv
	// {{{
	initial	lp_bv = 0;
	initial	lp_cv = 0;
	always @(posedge i_clk)
	if (r_ce)
	begin
		lp_bv    <= ls_bv * ls_offset;	// * 2^(-MP-BDEC)
		lp_cv    <= ls_cv;		// * 2^(-   CDEC)
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Add the final constant for the result: (av * t + bv) * t + cv
	// {{{
	////////////////////////////////////////////////////////////////////////
	//

	// lp_bv, lp_cv
	localparam	CMW = ((BMW+1-BDEC>CW-CDEC) ? (BMW+1-BDEC+CDEC) : CW);
	// lp_bv (BMW+1-BDEC).(BDEC+MP)
	// lp_cv    (CW-CDEC).(CDEC)
	assign	wp_bv = {
			//{(CMW-(BMW+1+MP-(MP+BDEC-CDEC))){lp_bv[BMW+MP]}},
				lp_bv[(BMW+MP):(MP+BDEC-CDEC)] };

	initial	r_done = 0;
	always @(posedge i_clk)
	if (r_ce)
		r_done <= { wp_bv[CMW-1], wp_bv }
				 + {{(CMW+1-CW){lp_cv[CW-1]}}, lp_cv};
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Round (if necessary) to produce the final result
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// o_data
	// {{{
	generate if (CMW+1-GAIN_OFFSET > OWID)
	begin : GEN_ROUNDING
		// {{{
		reg	[CMW-GAIN_OFFSET:0]	rounded;

		initial rounded = 0;
		always @(posedge i_clk)
		if (r_ce)
			rounded <= r_done[(CMW-GAIN_OFFSET):0]
				+ { {(OWID){1'b0}},
					r_done[CMW-GAIN_OFFSET-OWID],
				{(CMW-OWID-GAIN_OFFSET-1)
					{!r_done[CMW-GAIN_OFFSET-OWID]}} };

		assign	o_data = rounded[(CMW-GAIN_OFFSET):(CMW+1-GAIN_OFFSET-OWID)];

		// verilator lint_off UNUSED
		wire	unused_rounding_bits;

		assign	unused_rounding_bits = &{ 1'b0,
					rounded[(CMW-GAIN_OFFSET-OWID):0] };
		// verilator lint_on  UNUSED
		// }}}
	end else if (CMW+1-GAIN_OFFSET == OWID)
	begin : NO_ROUNDING
		// {{{
		assign	o_data = r_done[(CMW-GAIN_OFFSET):0];
		// }}}
	end else // if (CMW-GAIN_OFFSET < OWID)
	begin : GEN_ONEBIT_ROUNDING
		// {{{
		assign	o_data = { r_done[(CMW-GAIN_OFFSET):0],
				{(CMW+1-GAIN_OFFSET-OWID){1'b0}} };
		// }}}
	end endgenerate
	// }}}

	assign	o_ce = r_ce;
	// }}}

	// Make verilator -Wall happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, qp_quad, lp_bv, r_done };
	// verilator lint_on  UNUSED
	// }}}
endmodule
