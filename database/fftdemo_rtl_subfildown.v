////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	subfildown.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	This module implements a fairly generic 1/M downsampler.  It is
//		designed to first apply a filter, and then downsample the
//	result.
//
//	Filtering equation:
//		y[n] = SUM_{k=0}^{N-1} h[k]x[n-k]
//
//		where y[n] is the output, x[] are the incoming samples, h[] are
//		the filter coefficients, and N are the number of coefficients
//		used.
//
//	Downsampled filtering equation
//		y[n] = SUM_{k=0}^{N-1} h[k]x[nD-k]
//
//		where D is the downsample ratio, and [n] is now the output
//		sample index.
//
//	This particular algorithm is designed to accomplish one multiply every
//	system clock.  This multiply is shared across all of the products in
//	the summation.  As a result, there must be (filterlen+1)/D system clocks
//	between every desired output sample.
//
// Usage:
//	Reset
//		Reset can be used to hold the various ce flags low, and to
//		reset the coefficient address.  Reset is not used in the data
//		path.
//	Fixed coefficients:
//		Set INITIAL_COEFFS to point to a file of hexadecimal
//		coefficients, one coefficient per line.
//	Variable coefficients:
//		To load coefficients if FIXED_COEFFS is set to zero, set the
//		i_reset flag for one cycle.  Ever after wards, if/when
//		i_tap_wr is set a new value of coefficient memory will be set
//		to the input i_tap value.  The coefficient pointer will move
//		forward with every coefficient write.  if too many values are
//		written, the coefficient pointer will just return to zero and
//		rewrite previously written coefficients.
//
//		While writing coefficients in, output data will be unreliable.
//		You can either hold i_ce low while writing coefficients into
//		the core, or ignore the data output during this time.
//
//	Data processing:
//		Every time i_ce is raised, the input value, i_sample, will be
//		accepted in to this core as the next x[n] or data sample.  It's
//		important that i_ce is not raised too often.  This
//		implementation does not (currently) have a ready flag.
//
//		(Adding a ready flag is currently left as an exercise to the
//		student.)
//
//		One output will be produced for every NDOWN incoming samples.
//		When the output is valid, the o_ce flag will be set high and
//		o_result will contain the result of the filter.  The output will
//		remain valid (and constant) until the next o_ce and output.
//
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2024, Gisselquist Technology, LLC
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
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
//
// }}}
module	subfildown #(
		// {{{
		// Bit widths: input width (IW), output bit-width (OW), and
		//	coefficient bit-width (CW)
		parameter	IW=16,OW=24,CW=12,
		//
		// Downsample rate, NDOWN.  For every NDOWN incoming samples,
		// this core will produce one outgoing sample.
		parameter	NDOWN=5,
		// LGNDOWN is the number of bits necessary to represent a
		// counter holding values between 0 and NDOWN-1
		localparam	LGNDOWN=$clog2(NDOWN),
		//
		// If "FIXED_COEFFS" is set to one, the logic necessary to
		// update coefficients will be removed to save space.  If you
		// know the coefficients you need, you can set this for that
		// purpose.
		parameter [0:0]	FIXED_COEFFS = 1'b0,
		//
		// LGNCOEFFS is the log (based two) of the number of
		// coefficients.  So, for LGNCOEFFS=10, a 2^10 = 1024 tap
		// filter will be implemented.
		parameter	NCOEFFS=103,
		localparam	LGNCOEFFS=$clog2(NCOEFFS),
		//
		// For fixed coefficients, if INITIAL_COEFFS != 0 (i.e. ""),
		// then the filter's coefficients will be initialized from the
		// filename given.
		parameter	INITIAL_COEFFS = "",
		//
		parameter	SHIFT=2,
		localparam	AW = IW+CW+LGNCOEFFS
		// }}}
	) (
		// {{{
		input	wire		i_clk, i_reset,
		//
		input	wire		i_tap_wr,
		input	wire [(CW-1):0]	i_tap,
		//
		input	wire		i_ce,
		input	wire [(IW-1):0]	i_sample,
		//
		output	reg		o_ce,
		output	reg [(OW-1):0]	o_result
		// }}}
	);

	// Declare registers, nets, and memories
	// {{{
	reg	[(CW-1):0]	cmem	[0:((1<<LGNCOEFFS)-1)];
	reg	[(IW-1):0]	dmem	[0:((1<<LGNCOEFFS)-1)];
	//
	reg	[LGNDOWN-1:0]	countdown;
	reg	[LGNCOEFFS-1:0]	wraddr;
	reg			first_sample;
	//
	reg	[LGNCOEFFS-1:0]	didx, tidx;
	reg			running, last_coeff;
	//
	reg				d_ce, d_last;
	reg	signed	[IW-1:0]	dval;
	reg	signed	[CW-1:0]	cval;
	//
	reg				p_run, p_ce, p_last;
	//
	reg	signed [IW+CW-1:0]	product;
	//
	reg			acc_valid;
	reg	[AW-1:0]	accumulator;
	//
	wire			sgn, overflow;
	wire	[AW-1:0]	rounded_result;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Adjust the coefficients for our filter
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// Generate the decimator via: genfil 1024 decimator 23 0.45
	//
	generate if (FIXED_COEFFS || INITIAL_COEFFS != 0)
	begin : LOAD_INITIAL_COEFFS

		initial $readmemh(INITIAL_COEFFS, cmem);
	end

	if (FIXED_COEFFS)
	begin : NO_COEFF_UPDATES
		// Make Verilator's -Wall happy
		// {{{
		// verilator lint_off UNUSED
		wire	ignored_inputs;
		assign	ignored_inputs = &{ 1'b0, i_tap_wr, i_tap };
		// verilator lint_on  UNUSED
		// }}}
	end else begin : LOAD_COEFFICIENTS
		// {{{
		// Coeff memory write index
		reg	[LGNCOEFFS-1:0]	wr_coeff_index;

		initial	wr_coeff_index = 0;
		always @(posedge i_clk)
		if (i_reset)
			wr_coeff_index <= 0;
		else if (i_tap_wr)
			wr_coeff_index <= wr_coeff_index+1'b1;

		always @(posedge i_clk)
		if (i_tap_wr)
			cmem[wr_coeff_index] <= i_tap;
		// }}}
	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Write data logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	wraddr    = 0;
	always @(posedge i_clk)
	if (i_ce)
		wraddr <= wraddr + 1'b1;

	always @(posedge i_clk)
	if (i_ce)
		dmem[wraddr] <= i_sample;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Decimation logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	countdown = NDOWN[LGNDOWN-1:0]-1;
	initial	first_sample = 1;
	always @(posedge i_clk)
	if (i_ce)
	begin
		countdown <= countdown - 1;
		first_sample <= (countdown == 0);
		if (countdown == 0)
			countdown <= NDOWN[LGNDOWN-1:0]-1;
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Memory read index logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	last_coeff = 0;
	always @(posedge i_clk)
		last_coeff <= (!last_coeff && running && tidx >= NCOEFFS-2);

	initial	tidx = 0;
	initial running = 0;
	always @(posedge i_clk)
	if ((!running)&&(!i_ce))
	begin
		tidx <= 0;
		running <= 1'b0;
	end else if ((running)||((first_sample)&&(i_ce)))
	begin
		if (last_coeff)
		begin
			running <= 1'b0;
			tidx <= 0;
		end else begin
			tidx <= tidx + 1'b1;
			if ((first_sample)&&(i_ce))
				running <= 1'b1;
		end
	end

	initial	didx = 0;
	always @(posedge i_clk)
	if (!running || last_coeff)
		// Waiting here for the first sample to come through
		didx <= wraddr + (i_ce ? 1:0);
	else
		// Always read from oldest first, that way we can rewrite
		// the data as new data comes in--since we've already used it.
		didx <= didx + 1'b1;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Memory read(s)
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	begin
		dval <= dmem[didx];
		cval <= cmem[tidx];
	end


	initial	d_ce  = 0;
	initial	p_run = 0;
	initial	p_ce  = 0;
	initial	d_last= 0;
	initial	p_last= 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		d_ce  <= 0;
		p_ce  <= 0;
		p_run <= 0;
		d_last  <= 0;
		p_last  <= 0;
	end else begin
		// d_ce is true when the first memory read of data is valid
		d_ce  <= (first_sample)&&(i_ce);
		d_last<= last_coeff && p_run;
		p_last<= p_run && d_last;
		//
		//
		p_run <= !p_last && (p_run || p_ce);
		// p_ce is true when the first product is valid
		p_ce  <= d_ce;
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Product
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
		product <= dval * cval;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Accumulator
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	acc_valid = 0;
	always @(posedge i_clk)
	if (i_reset)
		acc_valid <= 0;
	else if (p_run || p_ce)
		acc_valid <= 1;
	else if (o_ce)
		acc_valid <= 0;

	initial	accumulator = 0;
	always @(posedge i_clk)
	if (i_reset)
		accumulator <= 0;
	else if (p_ce)
		// If p_ce is true, this is the first valid product of the set
		accumulator <= { {(LGNCOEFFS){product[IW+CW-1]}}, product };
	else if (p_run)
		accumulator <= accumulator
			+ { {(LGNCOEFFS){product[IW+CW-1]}}, product };
	else if (!acc_valid)
		accumulator <= 0;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Round the result to the right number of bits
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	generate if (OW == AW-SHIFT)
	begin : NO_SHIFT
		assign	sgn = accumulator[AW-1];
		assign	rounded_result = accumulator[AW-SHIFT-1:AW-SHIFT-OW];
		assign	overflow  = sgn  != rounded_result[AW-1];
	end else if (AW-SHIFT > OW)
	begin : SHIFT_OUTPUT
		wire	[AW-1:0]	prerounded = {accumulator[AW-SHIFT-1:0],
						{(SHIFT){1'b0}} };

		assign	sgn = accumulator[AW-1];
		assign	rounded_result = prerounded
				+ { {(OW){1'b0}}, prerounded[AW-OW-1],
					{(AW-OW-1){!prerounded[AW-OW-1]}} };
		assign	overflow = (sgn && !prerounded[AW-1]) || (!sgn && rounded_result[AW-1]);
	end else begin : UNIMPLEMENTED_SHIFT
	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Return the results
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//


	initial	o_ce = 1'b0;
	always @(posedge i_clk)
		o_ce <= !i_reset && p_ce && (acc_valid);

	always @(posedge i_clk)
	if (p_ce)
	begin
		if (overflow)
			o_result <= (sgn) ? { 1'b1, {(OW-1){1'b0}} }
					: { 1'b0, {(OW-1){1'b1}} };
		else
			o_result <= rounded_result[AW-1:AW-OW];
	end

	//
	// If we were to use a ready signal in addition to our i_ce (i.e. valid)
	// signal, it would look something like:
	// {{{
	//	assign	o_ready = (!running || !i_ce || !first_sample);
	//	assign	i_ce    = i_valid && o_ready
	// }}}
	// }}}

	// Make Verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, rounded_result[AW-OW-1:0] };
	// verilator lint_on  UNUSED
	// }}}
`ifdef	FORMAL
`endif // FORMAL
endmodule
