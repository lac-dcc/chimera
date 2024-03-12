////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	pulseshaperiq.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	This module implements a fairly generic xM upsampler.  It is
//		designed to first apply a filter, and then resample the
//	result.
//
//	Filtering equation:
//		y[n] = SUM_{k=0}^{N-1} h[k]x[n-k]
//
//		where y[n] is the output, x[] are the incoming samples, h[] are
//		the filter coefficients, and N are the number of coefficients
//		used.
//
//	Upsampled filtering equation
//		y[n] = SUM_{k=0}^{N-1} h[k]x[n/M-k]
//
//		where M is the upsample ratio, and [n] is now the output
//		sample index.
//
//	This particular algorithm is designed to accomplish one multiply every
//	system clock.  This multiply is shared across all of the products in
//	the summation.  As a result, there must be (filterlen+1)/M system clocks
//	between every desired output sample.
//
// Usage:
// {{{
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
//		i_wr_coeff is set a new value of coefficient memory will be set
//		to the input i_coeff value.  The coefficient pointer will move
//		forward with every coefficient write.  if too many values are
//		written, the coefficient pointer will just return to zero and
//		rewrite previously written coefficients.
//
//		While writing coefficients in, output data will be unreliable.
//		You can either hold i_ce low while writing coefficients into
//		the core, or ignore the data output during this time.
// }}}
//	Data processing:
// {{{
//		Every time i_ce is raised, the input value, i_sample, will be
//		accepted in to this core as the next x[n] or data sample.  It's
//		important that i_ce is not raised too often.  This
//		implementation does not (currently) have a ready flag.
//
//		(Adding a ready flag is currently left as an exercise to the
//		student.)
//
//		NUP outputs will be produced for every incoming samples.
//		When the output is valid, the o_ce flag will be set high and
//		o_result will contain the result of the filter.  The output will
//		remain valid (and constant) until the next o_ce and output.
// }}}
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
module	pulseshaperiq
	#(
		// {{{
		//
		// Bit widths: input width (IW), output bit-width (OW), and
		//	coefficient bit-width (CW)
		parameter	IW=16, OW=24, CW=12,
		//
		// Upsample rate, NUP.  For every incoming samples, this core
		//	will produce NUP outgoing samples.
		parameter	NUP=5,
		// LGNUP is the number of bits necessary to represent a counter
		//	holding values between 0 and NUP-1
		localparam	LGNUP=$clog2(NUP),
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
		parameter	LGNCOEFFS=$clog2(NCOEFFS),
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
		input	wire		i_wr_coeff,
		input	wire [(CW-1):0]	i_coeff,
		//
		input	wire		i_valid,
		output	wire		o_ready,
		input	wire [(IW-1):0]	i_sample_i, i_sample_q,
		//
		output	reg		o_ce,
		output	reg [(OW-1):0]	o_result_i, o_result_q
		// }}}
	);

	// Register/signal declarations
	// {{{
	reg	[(CW-1):0]	cmem	[0:((1<<LGNCOEFFS)-1)];
	reg	[(IW-1):0]	dmem_i	[0:((1<<LGNCOEFFS)-1)];
	reg	[(IW-1):0]	dmem_q	[0:((1<<LGNCOEFFS)-1)];
	//
	reg	[LGNUP:0]	upcount;
	reg	[LGNCOEFFS-1:0]	wraddr;
	//
	reg	[LGNCOEFFS-1:0]	didx, tidx;
	reg			running, last_coeff;
	//
	reg				d_ce, d_run, p_ce, p_run;
	reg	signed	[IW-1:0]	dval_i, dval_q;
	reg	signed	[CW-1:0]	cval;
	//
	//
	reg	signed [IW+CW-1:0]	product_i, product_q;
	//
	wire			sign_i, overflow_i,
				sign_q, overflow_q;
	reg	[AW-1:0]	accumulator_i, accumulator_q;
	//
	wire	[AW-1:0]	rounded_result_i, rounded_result_q;
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
		// {{{
		initial $readmemh(INITIAL_COEFFS, cmem);
		// }}}
	end

	if (FIXED_COEFFS)
	begin : NO_COEFFICIENT_UPDATE_LOGIC

		// Make Verilator's -Wall happy
		// verilator lint_off UNUSED
		wire	ignored_inputs;
		assign	ignored_inputs = &{ 1'b0, i_wr_coeff, i_coeff };
		// verilator lint_on  UNUSED
		// }}}
	end else begin : UPDATE_COEFFICIENTS
		// {{{
		// Coeff memory write index
		reg	[LGNCOEFFS-1:0]	wr_coeff_index;

		initial	wr_coeff_index = 0;
		always @(posedge i_clk)
		if (i_reset)
			wr_coeff_index <= 0;
		else if (i_wr_coeff)
			wr_coeff_index <= wr_coeff_index+1'b1;

		always @(posedge i_clk)
		if (i_wr_coeff)
			cmem[wr_coeff_index] <= i_coeff;
		// }}}
	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Write data logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// Write the received data into a pair of memories
	//
	initial	wraddr    = 0;
	always @(posedge i_clk)
	if (i_valid && o_ready)
		wraddr <= wraddr + 1'b1;

	always @(posedge i_clk)
	if (i_valid && o_ready)
	begin
		dmem_i[wraddr] <= i_sample_i;
		dmem_q[wraddr] <= i_sample_q;
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Upsampling timing/counter logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial	upcount = 0;
	always @(posedge i_clk)
	if (i_valid && o_ready)
		upcount   <= NUP[LGNUP:0]-1;
	else if (upcount > 0)
	begin
		if (last_coeff)
			upcount <= upcount - 1;
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Memory read index logic
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(*)
		last_coeff = (tidx + NUP >= NCOEFFS-1);

	assign	o_ready = !running;

	initial	tidx = 0;
	initial running = 0;
	always @(posedge i_clk)
	if (!running)
	begin
		tidx <= (i_valid ? NUP : 0);
		running <= i_valid;
	end else begin // if (running)
		tidx <= tidx + NUP;
		if (last_coeff)
		begin
			// Verilator lint_off WIDTH
			if (upcount == 0)
				tidx <= 0;
			else
				tidx    <= (NUP-upcount);
			// Verilator lint_on  WIDTH
			running <= (upcount != 0);
		end
	end

	initial	didx = 0;
	always @(posedge i_clk)
	if (!running)
		// Waiting here for the first sample to come through
		didx <= wraddr + 1 + (i_valid ? 1:0);
	else if (last_coeff)
		didx <= wraddr + ((upcount == 0) ? 1:0);
	else
		// Always read from oldest first, that way we can rewrite
		// the data as new data comes in--since we've already used it.
		didx <= didx + 1'b1;

`ifdef	FORMAL
	always @(*)
		assert(last_coeff == (tidx + NUP >= NCOEFFS-1));
`endif
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
		dval_i <= dmem_i[didx];
		dval_q <= dmem_q[didx];
		cval <= cmem[tidx];
	end


	initial	d_ce  = 0;
	initial	d_run = 0;
	initial	p_run = 0;
	initial	p_ce  = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		p_run <= 0;
		d_run <= 0;
		p_ce  <= 0;
		d_ce  <= 0;
	end else begin
		// d_ce is true when the first memory read of data is valid
		d_ce  <= (tidx < NUP)&&(running || i_valid);
		d_run <= (tidx >= NUP);
		//
		//
		// p_ce is true when the first product is valid
		p_run <= d_run;
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

`ifdef	FORMAL
	(* anyseq *)	reg	signed [IW+CW-1:0]	f_abstract_product_i;
	(* anyseq *)	reg	signed [IW+CW-1:0]	f_abstract_product_q;

	always @(*)
	begin
		assume(f_abstract_product_i[IW+CW-1]== (dval_i[IW-1] ^ cval[CW-1]));
		assume(f_abstract_product_q[IW+CW-1]== (dval_q[IW-1] ^ cval[CW-1]));


		if ((dval_i == 0)||(cval == 0))
			assume(f_abstract_product_i == 0);
		else if (cval == 1)
			assume(f_abstract_product_i == dval_i);
		else if (dval_i == 1)
			assume(f_abstract_product_i == cval);


		if ((dval_q == 0)||(cval == 0))
			assume(f_abstract_product_q == 0);
		else if (cval == 1)
			assume(f_abstract_product_q == dval_q);
		else if (dval_q == 1)
			assume(f_abstract_product_q == cval);
	end

	always @(posedge i_clk)
		product_i <= f_abstract_product_i;

	always @(posedge i_clk)
		product_q <= f_abstract_product_q;
`else
	(* mul2dsp *)
	always @(posedge i_clk)
		product_i <= dval_i * cval;

	(* mul2dsp *)
	always @(posedge i_clk)
		product_q <= dval_q * cval;
`endif
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Accumulator
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	accumulator_i = 0;
	initial	accumulator_q = 0;
	always @(posedge i_clk)
	if (i_reset)
	begin
		accumulator_i <= 0;
		accumulator_q <= 0;
	end else if (p_ce)
	begin
		// If p_ce is true, this is the first valid product of the set
		accumulator_i <= { {(LGNCOEFFS){product_i[IW+CW-1]}}, product_i };
		accumulator_q <= { {(LGNCOEFFS){product_q[IW+CW-1]}}, product_q };
	end else if (p_run)
	begin
		accumulator_i <= accumulator_i
			+ { {(LGNCOEFFS){product_i[IW+CW-1]}}, product_i };
		accumulator_q <= accumulator_q
			+ { {(LGNCOEFFS){product_q[IW+CW-1]}}, product_q };
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Round the result to the right number of bits
	// {{{
	///////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////
	//
	//
	generate if (OW == AW-SHIFT)
	begin : NO_SHIFT
		assign	rounded_result_i= accumulator_i[AW-SHIFT-1:AW-SHIFT-OW];
		assign	rounded_result_q= accumulator_q[AW-SHIFT-1:AW-SHIFT-OW];

		assign	sign_i = accumulator_i[AW-1];
		assign	sign_q = accumulator_q[AW-1];

		assign	overflow_i=accumulator_i[AW-1]!= rounded_result_i[AW-1];
		assign	overflow_q=accumulator_q[AW-1]!= rounded_result_q[AW-1];
	end else if (AW-SHIFT > OW)
	begin : SHIFT_OUTPUT
		wire	[AW-1:0]	prerounded_i;
		wire	[AW-1:0]	prerounded_q;

		assign	prerounded_i =
				{accumulator_i[AW-SHIFT-1:0],{(SHIFT){1'b0}} };
		assign	prerounded_q =
				{accumulator_q[AW-SHIFT-1:0],{(SHIFT){1'b0}} };

		assign	rounded_result_i = (&prerounded_i[AW-1:AW-OW]) ? -1
			: prerounded_i + { {(OW){1'b0}}, prerounded_i[AW-OW-1],
					{(AW-OW-1){!prerounded_i[AW-OW-1]}} };
		assign	rounded_result_q = (&prerounded_i[AW-1:AW-OW]) ? -1
			: prerounded_q + { {(OW){1'b0}}, prerounded_q[AW-OW-1],
					{(AW-OW-1){!prerounded_q[AW-OW-1]}} };

		assign	sign_i = accumulator_i[AW-1];
		assign	sign_q = accumulator_q[AW-1];

		assign	overflow_i= (sign_i && !accumulator_i[AW-1])
				|| (!sign_i && rounded_result_i[AW-1]);
		assign	overflow_q= (sign_q && !accumulator_q[AW-1])
				|| (!sign_q && rounded_result_q[AW-1]);
	end else begin : UNIMPLEMENTED_SHIFT
	end endgenerate

	initial	o_ce = 1'b0;
	always @(posedge i_clk)
	if (p_ce)
	begin
		o_ce <= 1;
		if (overflow_i)
			o_result_i <= (sign_i) ? { 1'b1, {(OW-1){1'b0}} }
					: { 1'b0, {(OW-1){1'b1}} };
		else
			o_result_i <= rounded_result_i[AW-1:AW-OW];

		if (overflow_q)
			o_result_q <= (sign_q) ? { 1'b1, {(OW-1){1'b0}} }
					: { 1'b0, {(OW-1){1'b1}} };
		else
			o_result_q <= rounded_result_q[AW-1:AW-OW];
	end else
		o_ce <= 1'b0;

	//
	// If we were to use a ready signal in addition to our
	// i_valid && o_ready (i.e. valid) signal, it would look something like:
	//
	//	assign	o_ready = (!running || !i_ce || !first_sample);
	//	assign	i_ce    = i_valid && o_ready
	//
	//
	// }}}

	// Make Verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, rounded_result_i[AW-OW-1:0],
					rounded_result_q[AW-OW-1:0] };
	// verilator lint_on  UNUSED
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	//
	// These formal properties constitute only *part* of the proof that
	// this core works.  While they are complete, as in I'm not keeping
	// other properties elsewhere, they are simply not sufficient.  Why not?
	// Simply because it's hard to verify something through a multiply.
	//
	reg	f_past_valid;

	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1;

	////////////////////////////////////////////////////////////////////////
	//
	// Input assumptions
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(*)
	if (i_valid || !o_ready)
		assume(!i_wr_coeff);

	always @(posedge i_clk)
	if ($past(i_valid && !o_ready))
		assume(i_valid && $stable({i_sample_i, i_sample_q}));
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Assertions
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// Constrain the decimator
	//
	always @(*)
		assert(upcount <= NUP);
	always @(*)
		assert(o_ready == !running);

//	// Constrain the output
//	always @(posedge i_clk)
//	if (f_past_valid && !$past(p_ce))
//		assert($stable(o_result));

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Cover check(s)
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	reg	[LGNUP:0]	cvr_ce_count;
	reg	[3:0]		cvr_idle;

	initial	cvr_ce_count = 0;
	always @(posedge i_clk)
	if (i_reset)
		cvr_ce_count <= 0;
	else if (o_ce && !(&cvr_ce_count))
		cvr_ce_count <= cvr_ce_count + 1;

	initial	cvr_idle = 0;
	always @(posedge i_clk)
	if (i_reset || running)
		cvr_idle <= 0;
	else if (!(&cvr_idle))
		cvr_idle <= cvr_idle + 1;

	always @(*)
		cover(i_valid && o_ready);

	always @(*)
		cover(o_ready);

	always @(*)
		cover(p_ce);

	always @(*)
		cover(p_run);

	always @(*)
		cover(o_ce);

	always @(*)
		cover(cvr_ce_count == 1);

	always @(*)
		cover(cvr_ce_count == 2);

	always @(*)
		cover(cvr_ce_count == NUP);

	always @(*)
		cover((cvr_ce_count >= NUP)&&(cvr_idle == 7));
	// }}}
`endif // FORMAL
// }}}
endmodule
