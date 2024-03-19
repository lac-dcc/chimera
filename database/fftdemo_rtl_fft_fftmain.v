////////////////////////////////////////////////////////////////////////////////
//
// Filename:	fftmain.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	This is the main module in the General Purpose FPGA FFT
//		implementation.  As such, all other modules are subordinate
//	to this one.  This module accomplish a fixed size Complex FFT on
//	1024 data points.
//	The FFT is fully pipelined, and accepts as inputs one complex two's
//	complement sample per clock.
//
// Parameters:
//	i_clk	The clock.  All operations are synchronous with this clock.
//	i_reset	Synchronous reset, active high.  Setting this line will
//			force the reset of all of the internals to this routine.
//			Further, following a reset, the o_sync line will go
//			high the same time the first output sample is valid.
//	i_ce	A clock enable line.  If this line is set, this module
//			will accept one complex input value, and produce
//			one (possibly empty) complex output value.
//	i_sample	The complex input sample.  This value is split
//			into two two's complement numbers, 12 bits each, with
//			the real portion in the high order bits, and the
//			imaginary portion taking the bottom 12 bits.
//	o_result	The output result, of the same format as i_sample,
//			only having 16 bits for each of the real and imaginary
//			components, leading to 32 bits total.
//	o_sync	A one bit output indicating the first sample of the FFT frame.
//			It also indicates the first valid sample out of the FFT
//			on the first frame.
//
// Arguments:	This file was computer generated using the following command
//		line:
//
//		% fftgen -k 3 -f 1024 -c 2 -x 2 -n 12 -d . -m 16 -p 10
//
//	This core will use hardware accelerated multiplies (DSPs)
//	for 8 of the 10 stages
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2015-2024, Gisselquist Technology, LLC
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
module fftmain(i_clk, i_reset, i_ce,
		i_sample, o_result, o_sync);
	// The bit-width of the input, IWIDTH, output, OWIDTH, and the log
	// of the FFT size.  These are localparams, rather than parameters,
	// because once the core has been generated, they can no longer be
	// changed.  (These values can be adjusted by running the core
	// generator again.)  The reason is simply that these values have
	// been hardwired into the core at several places.
	localparam	IWIDTH=12, OWIDTH=16; // LGWIDTH=10;
	//
	input	wire				i_clk, i_reset, i_ce;
	//
	input	wire	[(2*IWIDTH-1):0]	i_sample;
	output	reg	[(2*OWIDTH-1):0]	o_result;
	output	reg				o_sync;


	// Outputs of the FFT, ready for bit reversal.
	wire				br_sync;
	wire	[(2*OWIDTH-1):0]	br_result;


	// A hardware optimized FFT stage
	wire		w_s1024;
	wire	[33:0]	w_d1024;
	fftstage	#(
		// {{{
		.IWIDTH(IWIDTH),
		.CWIDTH(IWIDTH+2),
		.OWIDTH(17),
		.LGSPAN(9),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_1024.hex")
		// }}}
	) stage_1024(i_clk, i_reset, i_ce,
			(!i_reset), i_sample, w_d1024, w_s1024);


	// A hardware optimized FFT stage
	wire		w_s512;
	wire	[35:0]	w_d512;
	fftstage	#(
		// {{{
		.IWIDTH(17),
		.CWIDTH(19),
		.OWIDTH(18),
		.LGSPAN(8),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_512.hex")
		// }}}
	) stage_512(i_clk, i_reset, i_ce,
			w_s1024, w_d1024, w_d512, w_s512);

	// A hardware optimized FFT stage
	wire		w_s256;
	wire	[35:0]	w_d256;
	fftstage	#(
		// {{{
		.IWIDTH(18),
		.CWIDTH(20),
		.OWIDTH(18),
		.LGSPAN(7),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_256.hex")
		// }}}
	) stage_256(i_clk, i_reset, i_ce,
			w_s512, w_d512, w_d256, w_s256);

	// A hardware optimized FFT stage
	wire		w_s128;
	wire	[35:0]	w_d128;
	fftstage	#(
		// {{{
		.IWIDTH(18),
		.CWIDTH(20),
		.OWIDTH(18),
		.LGSPAN(6),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_128.hex")
		// }}}
	) stage_128(i_clk, i_reset, i_ce,
			w_s256, w_d256, w_d128, w_s128);

	// A hardware optimized FFT stage
	wire		w_s64;
	wire	[35:0]	w_d64;
	fftstage	#(
		// {{{
		.IWIDTH(18),
		.CWIDTH(20),
		.OWIDTH(18),
		.LGSPAN(5),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_64.hex")
		// }}}
	) stage_64(i_clk, i_reset, i_ce,
			w_s128, w_d128, w_d64, w_s64);

	// A hardware optimized FFT stage
	wire		w_s32;
	wire	[35:0]	w_d32;
	fftstage	#(
		// {{{
		.IWIDTH(18),
		.CWIDTH(20),
		.OWIDTH(18),
		.LGSPAN(4),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_32.hex")
		// }}}
	) stage_32(i_clk, i_reset, i_ce,
			w_s64, w_d64, w_d32, w_s32);

	// A hardware optimized FFT stage
	wire		w_s16;
	wire	[35:0]	w_d16;
	fftstage	#(
		// {{{
		.IWIDTH(18),
		.CWIDTH(20),
		.OWIDTH(18),
		.LGSPAN(3),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_16.hex")
		// }}}
	) stage_16(i_clk, i_reset, i_ce,
			w_s32, w_d32, w_d16, w_s16);

	// A hardware optimized FFT stage
	wire		w_s8;
	wire	[35:0]	w_d8;
	fftstage	#(
		// {{{
		.IWIDTH(18),
		.CWIDTH(20),
		.OWIDTH(18),
		.LGSPAN(2),
		.BFLYSHIFT(0),
		.OPT_HWMPY(1),
		.CKPCE(3),
		.COEFFILE("cmem_8.hex")
		// }}}
	) stage_8(i_clk, i_reset, i_ce,
			w_s16, w_d16, w_d8, w_s8);

	wire		w_s4;
	wire	[35:0]	w_d4;
	qtrstage	#(18,18,10,0,0)	stage_4(i_clk, i_reset, i_ce,
						w_s8, w_d8, w_d4, w_s4);
	wire		w_s2;
	wire	[31:0]	w_d2;
	laststage	#(18,16,1)	stage_2(i_clk, i_reset, i_ce,
					w_s4, w_d4, w_d2, w_s2);


	wire	br_start;
	reg	r_br_started;
	initial	r_br_started = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		r_br_started <= 1'b0;
	else if (i_ce)
		r_br_started <= r_br_started || w_s2;
	assign	br_start = r_br_started || w_s2;

	// Now for the bit-reversal stage.
	bitreverse	#(10,16)
	revstage(
		// {{{
		.i_clk(i_clk),
		.i_reset(i_reset),
		.i_ce(i_ce & br_start),
		.i_in(w_d2),
		.o_out(br_result),
		.o_sync(br_sync)
		// }}}
	);


	// Last clock: Register our outputs, we're done.
	initial	o_sync  = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		o_sync  <= 1'b0;
	else if (i_ce)
		o_sync  <= br_sync;

	always @(posedge i_clk)
	if (i_ce)
		o_result  <= br_result;


endmodule
