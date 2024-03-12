////////////////////////////////////////////////////////////////////////////////
//
// Filename:	cicfil.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	Perform some number of CIC integrate and dump stages, followed
//		by a downsample the number of averages given.
//
//	Further, we need to shift by the log_2 of our downsample rate times
//	the number of stages, since any CIC filter of this type will have a
//	gain of (Downsample factor)^(number of stages).
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2020-2024, Gisselquist Technology, LLC
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
`default_nettype none
// }}}
module	cicfil #(
		// {{{
		parameter	IW=16,	// Input bit-width
				OW=32,  // Output bit width
				// LGMEM is the number of bits used for internal
				// accumulation.  It should be larger than
				// $clog2(i_navg^STAGES)
				LGMEM=28,
				// SHIFT is what we use to recover from the
				// gain.  It controls a final pass where we
				// downshift by SHIFT before returning the
				// result
				SHIFT=0,
				STAGES=4, // Number of stages of int & dump
		localparam	AVG_BITS=(LGMEM+STAGES-1)/STAGES
		// }}}
	) (
	// {{{
	input	wire			i_clk, i_reset,
	//
	// Watch the gain here: the gain of STAGES CICs is i_navg ^ STAGES
	// Easiest way to handle it is to set i_navg to 2^n, and STAGES to 2^m
	// then the gain can be removed with a simple shift
	input wire [AVG_BITS-1:0]	i_navg,
	input	wire			i_ce,
	input	wire	[(IW-1):0]	i_val,
	output	reg			o_ce,
	output	reg	[(OW-1):0]	o_val
	// }}}
	);

	// Declare signals and registers
	// {{{
	genvar	k;
	reg	[(IW+LGMEM-1):0]	acc[0:STAGES];
	reg	[AVG_BITS-1:0]		ctr;
	// Decimation memory
	reg	[(IW+LGMEM-1):0]	r_dmem[0:STAGES];
	reg	[(IW+LGMEM-1):0]	dec[0:STAGES];
	reg	[(IW+LGMEM-1):0]	pre_rounded_result;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Cascaded intgration section
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Start by adding bits to ACC
	//
	initial	acc[0] = 0;
	always @(posedge i_clk)
	if (i_reset)
		acc[0] <= { {(LGMEM){i_val[IW-1]}}, i_val };
	else if (i_ce)
		acc[0] <= { {(LGMEM){i_val[IW-1]}}, i_val };

	// The integration section
	generate for(k=1; k<STAGES+1; k=k+1)
	begin : CIC_INTEGRATION_GEN_LOOP

		initial	acc[k] = 0;
		always @(posedge i_clk)
		if (i_reset)
			acc[k] <= 0;
		else if (i_ce)
			//
			// Apply a filter, H_k(z) = z^{-1} / [ 1 -  z^{-1} ]
			//
			acc[k] <= acc[k] + acc[k-1];

	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Calculate our decimated clock enable signal
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Calculate our new CE signal, o_ce
	//
	initial	{ o_ce, ctr } = 0;
	always @(posedge i_clk)
	if (i_reset)
		{ o_ce, ctr } <= 0;
	else if (i_ce)
	begin
		if (ctr < i_navg -1)
		begin
			ctr  <= ctr + 1;
			o_ce <= 1'b0;
		end else begin
			ctr  <= 0;
			o_ce <= 1'b1;
		end
	end else
		o_ce <= 1'b0;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Cascaded dump section
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Start with the result of the last stage of the accumulator
	//
	always @(*)
		dec[0] = acc[STAGES];

	//
	// Apply k stages of H_k(z) below, achieving a transform of
	//
	// H_dec(z) = [ H_k(z) ]^(STAGES)
	//
	generate for(k=1; k<STAGES+1; k=k+1)
	begin : CIC_DECIMATION_GEN_LOOP

		initial	r_dmem[k] = 0;
		always @(posedge i_clk)
		if (i_reset)
		begin
			dec[k]    <= 0;
			r_dmem[k] <= 0;
		end else if (o_ce)
		begin
			//
			// Filter H_k(z) = 1 - z^{-1}
			// Takes place *after* decimation, so it acts like
			// a filter of 1 - z^{-N} in the Z-transform space of
			// before decimation
			//
			dec[k]    <= dec[k-1] - r_dmem[k];
			r_dmem[k] <= dec[k-1];
		end

	end endgenerate
	// }}}

	// Rename the final answer
	// {{{
	always @(*)
		pre_rounded_result = dec[STAGES];
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Report the result(s)
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial	o_val = 0;
	always @(posedge i_clk)
	if (i_reset)
		o_val <= 0;
	else if (o_ce)
		o_val <= pre_rounded_result[IW+LGMEM-SHIFT-1:IW+LGMEM-SHIFT-OW];

	// }}}
	////////////////////////////////////////////////////////////////////////
	//

	// Make Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_navg[0], pre_rounded_result };
	// Verilator lint_on  UNUSED
	// }}}
endmodule
