////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	qpskrcvr.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	
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
`default_nettype	none
// }}}
module	qpskrcvr #(
		// {{{
		// parameter	CLOCK_FREQUENCY_HZ = 36_000_000,
		//parameter	BASEBAND_SAMPLE_RATE_HZ
		//				= CLOCK_FREQUENCY_HZ / (17 * 4),
		//parameter	CIC_SAMPLE_RATE_HZ = BASEBAND_SAMPLE_RATE_HZ* 4,
		localparam	CIC_DOWN = 17,
		localparam	RESAMPLE_DOWN = 4,
		//
		localparam	CIC_BITS = 7
		// }}}
	) (
		// {{{
		input	wire		i_clk, i_reset,
		input	wire		i_audio_en, i_rf_en,
		//
		input	wire		i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire	[1:0]	i_wb_addr,
		input	wire	[31:0]	i_wb_data,
		input	wire	[3:0]	i_wb_sel,
		output	reg		o_wb_stall, o_wb_ack,
		output	reg	[31:0]	o_wb_data,
		//
		// Receive interface
		input	wire	[1:0]	i_rf_data,
		//
		// Outgoing PWM interface
		output	reg	o_pwm_audio,
		//
		// Debug interface
		input	wire	[1:0]	i_dbg_sel,
		output	reg		o_dbg_ce,
		output	reg	[31:0]	o_dbg_data,
		output	reg [HIST_BITS-1:0]	o_dbg_hist
		// }}}
	);
	//

	// Declarations
	// {{{
	localparam	PHASE_BITS=16;
	localparam [PHASE_BITS-1:0] SYMBOL_STEP
				= { 3'b001, {(PHASE_BITS-3){1'b0}} };
	localparam	HIST_BITS=10;
	localparam	BB_BITS=7;
	localparam	SOFT_BITS = 8;
	localparam	FC_BITS = 6;
	localparam	PWM_BITS = 8;
	// Have only enough time for 68 clock cycles
	localparam	NUM_DOWNSAMPLE_COEFFS = 63;
	localparam	PULSE_SHAPE_FILTER = "pshape8x.hex";

	reg	[2:0]			high_symbol_phase,
					past_high_symbol_phase;
	reg				track_frequency;
	reg				load_pll;
	reg	[PHASE_BITS-1:0]	new_pll_step;
	reg	[4:0]			pll_lgcoeff;
	reg				reset_downsampler, write_downsampler;
	reg	[15:0]			write_coeff;
	wire			cic_ce, cic_ign;
	wire	[CIC_BITS-1:0]	cic_sample_i, cic_sample_q;

	wire				baseband_ce;
	wire	signed	[BB_BITS-1:0]	baseband_i, baseband_q;

	reg	signed	[2*BB_BITS-1:0]	baseband_i_squared, baseband_q_squared;
	reg		[2*BB_BITS:0]	am_detect;
	reg				symbol_ce;
	reg	signed [BB_BITS-1:0]	symbol_i, symbol_q;
	wire				amfil_sample;
	wire	[PHASE_BITS-1:0]	sym_phase;
	reg	[2:0]			last_sym_phase, short_phase;
	wire	[1:0]			sym_err;

	reg	signed	[AMFIL_BITS-1:0]	am_sum	[0:4];
	reg	signed	[AMFIL_BITS-1:0]	filtered_detect;
	reg	[3:0]	fchain_ce;
	wire	[BB_BITS*2:0]	cyclic_result;
	reg				symbol_pipe, too_much_carrier;
	wire				rmc_busy, rmc_done;
	reg	[17:0]			carrier_phase, carrier_step,
					carrier_perr, carrier_ferr;
	reg	signed	[SOFT_BITS-1:0]		cons_i, cons_q;
	wire	[6:0]	audio_sample;
	reg	[1:0]	qpsk_bits;
	reg		last_cons_i, last_cons_q;
	reg	[1:0]	frame_count, frame_pos;
	reg	[3:0]	frame_match;
	reg	[FC_BITS-1:0]	frame_check	[0:3];
	reg	[7:0]	frame_sreg;
	reg		frame_ce;
	reg	[6:0]	scrambled_sample;
	reg	[PWM_BITS-1:0]	sigma_delta;

	genvar		gk;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Incoming bus processing
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Here's the place where the design can be configured while running.
	// You can currently adjust both filters as well as the symbol tracking
	// PLL coefficient.  In the future, it might be nice to be able to
	// control carrier tracking as well--for now, we'll just add that to our
	// TODO list.
	//

	always @(posedge i_clk)
	if (i_wb_stb && i_wb_we && i_wb_addr == 2'b00)
	begin
		reset_downsampler <= i_wb_sel[3] && i_wb_data[31];
		write_downsampler <= |i_wb_sel[1:0];
		write_coeff <= 0;
		if (i_wb_sel[1])
			write_coeff[15:8] <= i_wb_data[15:8];
		if (i_wb_sel[0])
			write_coeff[7:0] <= i_wb_data[7:0];
	end else begin
		reset_downsampler <= 0;
		write_downsampler <= 0;
	end

	initial	load_pll     = 0;
	initial	pll_lgcoeff  = 5'h5;
	initial	new_pll_step = { 3'h1, {(PHASE_BITS-3){1'b0}} };
	initial	high_symbol_phase = 3'h0;
	always @(posedge i_clk)
	if (i_wb_stb && i_wb_we && i_wb_addr == 2'b01)
	begin
		load_pll  <= |i_wb_sel[1:0];
		pll_lgcoeff  <= i_wb_data[20:16];
		new_pll_step <= i_wb_data[15: 0];
		high_symbol_phase <= i_wb_data[26:24];
	end else
		load_pll <= 1'b0;

	initial	track_frequency = 1'b1;
	always @(posedge i_clk)
	if (i_wb_stb && i_wb_we && i_wb_addr == 2'b10)
	begin
		track_frequency <= i_wb_data[24];
		// carrier_step <= i_wb_data[17:0];
	end


	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// CIC filtering
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// Come down from CLOCK_FREQUENCY_HZ down to 512ksps

	//
	// A "nice" slow filter requires several clock cycles to operate.
	// Sadly, our incoming data is coming in at one data value per clock.
	// To give us some head room for a nicer filter, we'll use a CIC
	// filter (below).  Once done, we should have about 17 clock cycles
	// per every outgoing sample which we can then use for our next stage
	// filter.
	//

	//
	// CIC gain = CIC_DOWN ^ 4 ~= 83,531
	//	Want IW+LGMEM-OW-SHIFT = 23 - SHIFT = 0 for no gain
	cicfil #(.IW(2), .OW(CIC_BITS), .STAGES(4),
		.LGMEM(28),
		// Anything more than a shift of 12 will overflow on a solid
		// 1 or -1 signa.
		.SHIFT(12)
	) cici(i_clk, 1'b0, CIC_DOWN[6:0], 1'b1,
			i_rf_data[1] ? 2'b11: 2'b01,
			cic_ce, cic_sample_i);

	cicfil #(.IW(2), .OW(CIC_BITS), .STAGES(4),
		.LGMEM(28), .SHIFT(12)
	) cicq(i_clk, 1'b0, CIC_DOWN[6:0], 1'b1,
			i_rf_data[0] ? 2'b11: 2'b01,
			cic_ign, cic_sample_q);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Downsampling, combined with Matched filtering
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	// Need to come down to 8x per symbol, or 512ksps total
	//

	// Our filter has a gain of nearly 2k/8 = 250
	// The result of this filter will have 12+CIC_BITS+log_2(LGNCOEFFS)
	// or 12+7+5+2 = 26 bits, before shifting.  If the input is full
	// scale (7 bits), then the output will have 15 bits and we can shift
	// out anything beyond that
	//
	// THE FILTER AS IT EXISTS ISN'T WELL DESIGNED.  IT WAS ORIGINALLY
	// DEFINED AS SOMETHING THAT WAS *WAY* TOO LONG.  I'VE TRUNCATED IT
	// TO A BASIC RECT (SYNC) FILTER, AND SO THE RESULT IS POOR HIGH
	// FREQUENCY RESPONSE AS ONE MIGHT EXPECT.
	//
	// The result is that this filter needs to be redesigned.
	//
	subfildowniq #(.IW(CIC_BITS), .OW(BB_BITS), .CW(12), .SHIFT(5),
		.INITIAL_COEFFS(PULSE_SHAPE_FILTER),
		.NDOWN(RESAMPLE_DOWN),
		.FIXED_COEFFS(1'b0), .NCOEFFS(NUM_DOWNSAMPLE_COEFFS)
	) resample(i_clk,
		reset_downsampler, write_downsampler, write_coeff[15:4],
		cic_ce, cic_sample_i, cic_sample_q,
		baseband_ce, baseband_i, baseband_q);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Symbol tracking
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	localparam	AMFIL_BITS = 2*BB_BITS+4;

	// Measure | demod_i^2  + demod_q^2 |
	//
	// Filter with (1 + sqrt(2)*z^-1 + z^-2) * (1 - z^-4)
	//	Sqrt(2) * 256 ~= 1_0110_1010, so sqrt(2) ~= 1.011....
	//	So we can try approximating 1.414 with 1.5
	always @(posedge i_clk)
	if (baseband_ce)
		baseband_i_squared <= baseband_i * baseband_i;

	always @(posedge i_clk)
	if (baseband_ce)
		baseband_q_squared <= baseband_q * baseband_q;

	always @(posedge i_clk)
	if (baseband_ce)
		fchain_ce <= 1;
	else
		fchain_ce <= fchain_ce << 1;

	always @(posedge i_clk)
	if (fchain_ce[0])
		am_detect <= baseband_i_squared + baseband_q_squared;

	cycliciir #(.IW(BB_BITS*2+1), .OW(BB_BITS*2+1), .LGALPHA(6),
			.NCYCLE(8)
	) symavg (.i_clk(i_clk), .i_reset(i_reset), .i_ce(fchain_ce[1]),
		.i_data(am_detect), .o_data(cyclic_result));

	always @(posedge i_clk)
	if (baseband_ce)
	begin
		am_sum[0] <= { {(AMFIL_BITS-(BB_BITS*2+1)){
				cyclic_result[BB_BITS*2]} }, cyclic_result };
		am_sum[1] <= am_sum[0];
		am_sum[2] <= am_sum[1];
		am_sum[3] <= am_sum[2];
		am_sum[4] <= am_sum[3];
		filtered_detect <= am_sum[0] - am_sum[4];
	end

	assign	amfil_sample = filtered_detect[AMFIL_BITS-1];

	// Apply a PLL
	sdpll	#(
		.PHASE_BITS(PHASE_BITS),
		.OPT_TRACK_FREQUENCY(1'b1),
		.INITIAL_PHASE_STEP(SYMBOL_STEP)
	) symbol_pll(i_clk, load_pll, new_pll_step[PHASE_BITS-2:0],
		fchain_ce[3], amfil_sample, pll_lgcoeff, sym_phase, sym_err);

	assign	short_phase = sym_phase[PHASE_BITS-1:PHASE_BITS-3];
	
	always @(posedge i_clk)
	if (baseband_ce)
		last_sym_phase <= short_phase;

	always @(posedge i_clk)
		past_high_symbol_phase <= high_symbol_phase+1;

	always @(posedge i_clk)
	if (baseband_ce)
	begin
		if (short_phase == high_symbol_phase)
			symbol_ce <= 1'b1;
		if (short_phase == past_high_symbol_phase)
			symbol_ce <= 1'b1;

		// Be careful not to repeat our sample
		if (last_sym_phase == high_symbol_phase)
			symbol_ce <= 1'b0;
		if (last_sym_phase == short_phase)
			symbol_ce <= 1'b0;
	end else
		symbol_ce <= 1'b0;

	always @(posedge i_clk)
	if (symbol_ce)
		{ symbol_i, symbol_q } <= { baseband_i, baseband_q };

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// (Residual carrier removal?)
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// While there shouldn't be any residual carrier offset on the signal,
	// the Lord knows that two independent oscillators will never be
	// synchronized.  Therefore, we'll strip off any remaining carrier
	// here, to include removing any remaining phase offsets.
	//

	// Step one, remove the carrier based upon a (yet to be determined)
	// carrier phase.  We can then use the results as part of a tracking
	// loop.
	//

	// Don't really need an 11 stage CORDIC here, but it's what's built
	// for other parts of the project, so let's just reuse it.
	seqcordic
	remove_carrier(i_clk, i_reset,
			symbol_ce, { symbol_i[BB_BITS-1], symbol_i },
				{ symbol_q[BB_BITS-1], symbol_q },
			carrier_phase[17:2],
			rmc_busy, rmc_done, cons_i, cons_q);


	//
	// This is a pretty rough feedback mechanism.  It works for QPSK
	// only.  Basically, we'll compare each constellation point to
	// +/- 45 degrees where |cons_i| should equal |cons_q|.  If the point
	// is too far clockwise, we'll slow the carrier down, likewise if it
	// is too far counterclockwise we'll move in the other direction.
	//
	// The method is crude since there's no measurement here for how much
	// farther than desired we've gone.  We're just making a binary choice:
	// too much carrier or not enough.  There's no inbetween, nor any
	// shades of gray.  So, it's cheap, and (mostly) works.  (It could work
	// better.)
	// 

	// Measure the phase to the nearest quadrant
	always @(posedge  i_clk)
	if (rmc_done)
	begin
		case ({cons_i[BB_BITS-1], cons_q[BB_BITS-1]})
		2'b00: too_much_carrier <= ( cons_i <  cons_q);
		2'b10: too_much_carrier <= (-cons_i >  cons_q);
		2'b11: too_much_carrier <= (-cons_i < -cons_q);
		2'b01: too_much_carrier <= ( cons_i > -cons_q);
		endcase
	end

	always @(posedge i_clk)
		symbol_pipe <= rmc_done;

	//
	// The key to the algorithm is in the amount of phase to adjust
	// in each direction on a phase error.  Here's our phase adjustment
	// control
	//
	always @(*)
		carrier_perr = 18'h0100;

	//
	// The frequency adjustment control
	//
	// For critical damping, you'll want this value to follow the following
	// formula:
	//
	// formula = perr ^2 / 4	(in radians)
	//     = ( (2*pi*carrier_perr/2^16)^2 / 4 ) * (2^16 / 2/pi) = 1.5
	always @(*)
		carrier_ferr = 18'h01;

	initial begin
		// Apply some initial stress to the loop--just to prove
		// we can handle it and recover
		carrier_phase = 0;
		carrier_step  = 60;
	end
	always @(posedge i_clk)
	begin
		if (symbol_pipe)
		begin
			if (too_much_carrier)
			begin
				carrier_phase <= carrier_phase - carrier_perr
						- carrier_step;
				if (track_frequency)
					carrier_step <= carrier_step + carrier_ferr;
			end else begin
				carrier_phase <= carrier_phase + carrier_perr
						- carrier_step;
				if (track_frequency)
					carrier_step <= carrier_step - carrier_ferr;
			end
		end
		if (i_wb_stb && i_wb_we && i_wb_addr == 2'b10)
			carrier_step <= i_wb_data[17:0];
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// FM Demod to get baseband symbols
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// We are encoding our symbols using phase difference encoding.
	// That's great for locking, since you don't need to know the absolute
	// phase of the symbols, and the encoding is a bit more resilient to
	// frequency offsets.  It will also propagate errors somewhat.  Here,
	// we strip that encoding back off.
	//
	always @(posedge i_clk)
	if (symbol_ce)
	begin
		last_cons_i <= cons_i[SOFT_BITS-1];
		last_cons_q <= cons_q[SOFT_BITS-1];

		case({ cons_i[SOFT_BITS-1], cons_q[SOFT_BITS-1],
			last_cons_i, last_cons_q })
		// No rotation: Demod == 2'b00
		4'b0000: qpsk_bits <= 2'b00;
		4'b0101: qpsk_bits <= 2'b00;
		4'b1111: qpsk_bits <= 2'b00;
		4'b1010: qpsk_bits <= 2'b00;
		// 180 rotation: Demod == 2'b11
		4'b0011: qpsk_bits <= 2'b11;
		4'b0110: qpsk_bits <= 2'b11;
		4'b1100: qpsk_bits <= 2'b11;
		4'b1001: qpsk_bits <= 2'b11;
		// 90 degree clockwise: Demod = 2'b01
		4'b0100: qpsk_bits <= 2'b01;
		4'b1101: qpsk_bits <= 2'b01;
		4'b1011: qpsk_bits <= 2'b01;
		4'b0010: qpsk_bits <= 2'b01;
		// 90 degree counter-clockwise: Demod = 2'b10
		4'b0001: qpsk_bits <= 2'b10;
		4'b0111: qpsk_bits <= 2'b10;
		4'b1110: qpsk_bits <= 2'b10;
		4'b1000: qpsk_bits <= 2'b10;
		endcase
	end

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Frame synchronization
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// In this scheme, of every 8-bits [7:0] bits 7 and 6 should differ.
	// Here, we'll go look for the cut that has this difference.  We'll
	// do this by examining all four possible cuts.  Whenever we see
	// a bit difference, we'll add one to a counter.  The correct counter
	// should max out and then overflow--that's how we'll know we've
	// achieved synchronization.
	//

	always @(posedge i_clk)
	if (symbol_ce)
		frame_count <= frame_count + 1;

	generate for(gk=0; gk<4; gk=gk+1)
	begin
		always @(posedge i_clk)
		if (symbol_ce && frame_count == gk)
		begin
			if (qpsk_bits[1] != qpsk_bits[0])
			begin
				if (&frame_check[gk])
					frame_match[gk] <= 1'b1;
				else
					frame_check[gk] <= frame_check[gk] + 1;
			end else begin
				frame_match[gk] <= 0;
				if (frame_check[gk] != 0)
					frame_check[gk] <= frame_check[gk] - 1;
			end
		end
	end endgenerate

	initial	frame_pos = 2'b11;
	always @(posedge i_clk)
	if (symbol_ce)
	begin
		case(frame_match)
		4'b0001: frame_pos <= 2'b00;
		4'b0010: frame_pos <= 2'b01;
		4'b0100: frame_pos <= 2'b10;
		4'b1000: frame_pos <= 2'b11;
		default: begin end ///  No lock, keep position
		endcase
	end


	always @(posedge i_clk)
	if (symbol_ce)
		frame_sreg <= { frame_sreg[5:0], qpsk_bits };

	always @(posedge i_clk)
	if (symbol_ce && frame_pos == frame_count)
	begin
		frame_ce <= 1'b1;
		scrambled_sample <= frame_sreg[6:0];
	end else
		frame_ce <= 1'b0;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Descrambling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Feed through descrambler
	//
	descrambler #(.WS(7), .LN(31), .TAPS(31'h00_00_20_01))
	recover(i_clk, 1'b0, frame_ce, scrambled_sample, audio_sample);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sigma Delta output
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(posedge i_clk)
	if (i_audio_en)
		sigma_delta <= sigma_delta
			+ { {(PWM_BITS-7){audio_sample[6]}}, audio_sample }
			+ { !sigma_delta[PWM_BITS-1], {(PWM_BITS-2){1'b0}} };
	else
		sigma_delta <= 0;

	always @(posedge i_clk)
	if (i_audio_en)
		o_pwm_audio <= sigma_delta[PWM_BITS-1];
	else
		o_pwm_audio <= !o_pwm_audio;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Debug symbol generation
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	case(i_dbg_sel)
	2'b00: // Downsampled results
		{ o_dbg_ce, o_dbg_data, o_dbg_hist } <= {
			baseband_ce,
			{(16-BB_BITS){baseband_i[BB_BITS-1]}}, baseband_i,
			{(16-BB_BITS){baseband_q[BB_BITS-1]}}, baseband_q,
			baseband_i[BB_BITS-1:BB_BITS-HIST_BITS/2],
			baseband_q[BB_BITS-1:BB_BITS-HIST_BITS/2] };
	2'b01: // Symbols pre-carrier removal
		{ o_dbg_ce, o_dbg_data, o_dbg_hist } <= {
			symbol_ce,
			{(16-BB_BITS){baseband_i[BB_BITS-1]}}, baseband_i,
			{(16-BB_BITS){baseband_q[BB_BITS-1]}}, baseband_q,
			baseband_i[BB_BITS-1:BB_BITS-HIST_BITS/2],
			baseband_q[BB_BITS-1:BB_BITS-HIST_BITS/2] };
	2'b10: // Symbols post-carrier removal
		{ o_dbg_ce, o_dbg_data, o_dbg_hist } <= {
			symbol_ce,
			{(16-BB_BITS){cons_i[SOFT_BITS-1] }},
				cons_i[SOFT_BITS-1:SOFT_BITS-BB_BITS],
			{(16-BB_BITS){cons_q[SOFT_BITS-1] }},
				cons_q[SOFT_BITS-1:SOFT_BITS-BB_BITS],
			cons_i[SOFT_BITS-1:SOFT_BITS-HIST_BITS/2],
			cons_q[SOFT_BITS-1:SOFT_BITS-HIST_BITS/2] };
			// [2*BB_BITS+1:0]
	2'b11: // Frame detect and sample output
		{ o_dbg_ce, o_dbg_data, o_dbg_hist } <= { frame_ce,
			frame_match,				// 4 bits
			frame_check[0][FC_BITS-1:FC_BITS-4],	// 4 bits
			frame_check[1][FC_BITS-1:FC_BITS-4],	// 4 bits
			frame_check[2][FC_BITS-1:FC_BITS-4],	// 4 bits
			frame_check[3][FC_BITS-1:FC_BITS-4],	// 4 bits
			{(32-20-7){ audio_sample[6] } },
				audio_sample,			// 7 bits
			{ (HIST_BITS-7){audio_sample[6]} }, audio_sample[6:0] };
	endcase

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Return Wishbone
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(*)
		o_wb_stall = 1'b0;

	always @(posedge i_clk)
		o_wb_ack <= i_wb_stb && !i_reset;

	always @(posedge i_clk)
		o_wb_data <= o_dbg_data;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Make Verilator happy
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_wb_cyc, i_rf_en, cic_ign, new_pll_step[15],
			i_wb_data[30:16], i_wb_sel[3:2],
			write_coeff[3:0], sym_phase[PHASE_BITS-4:0], sym_err,
			rmc_busy, rmc_done,
		// Unused pulse shaping filter signals
		reset_downsampler, write_downsampler, write_coeff,
			frame_sreg[7] };
	// Verilator lint_on  UNUSED
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties (if any)
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
`endif
// }}}
endmodule
