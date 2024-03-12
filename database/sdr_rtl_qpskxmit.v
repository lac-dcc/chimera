////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	qpskxmit.txt
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	QPSK Audio transmitter
//
// Registers:
//	0:	Audio downsampling filter control
//	1:	Pulseshaping filter control
//	2:	(Reserved)
//	3:	(Reserved)
//
// Signal parameters:
//
//	Modulation:		QPSK
//	Audio Sample Rate:	16 kHz
//	Bandwidth:		72 kHz
//	Symbol Rate:		64 kHz
//	First stage audio filter:
//		Running on 960kHz sampled stream
//		Generating a (SYSCLK/17/128) samples/s audio sample stream
//		1999 Coefficients
//		Passband 7.2kHz, Stopband 8.8 kHz
//		% genfil -r -s 960 1999 lowpass 7.2 8.8	 # 61 dB stop band (audio8k.fl)
//	LFSR: 7-data bits per clock, Feedthrough, coefficients 31, 13, 0
//	Data Frame Length:	 8 bits = 1 5-bit sample plus 1 bit framing
//		Sync bit prevents 180 degree transition once every 4 symbols
//	Pulse shaping filter:	(pshape.fl)
//		Running at 256ksps, TMIC, Null at 80kHz, 32 taps
//		% genfil -r 32 tmic 2
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
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
// }}}
module	qpskxmit #(
		// {{{
		//
		// parameter [31:0]	CLOCK_FREQUENCY_HZ = 36_000_000,
		// parameter [31:0]	BASEBAND_SAMPLE_RATE_HZ
		//			    = CLOCK_FREQUENCY_HZ / (17 * 4 * 4),
		// parameter [31:0]	SYMBOL_RATE_HZ= CLOCK_FREQUENCY_HZ
		//					/ ( 17 * 4 * 8),
		// parameter [31:0]	AUDIO_RATE_HZ
		//			    = CLOCK_FREQUENCY_HZ / (17 * 128),
		// parameter [31:0]	MICROPHONE_SAMPLE_RATE_HZ
		//			    = CLOCK_FREQUENCY_HZ / (17 * 4),
		parameter		NUM_AUDIO_COEFFS = 1999,
		parameter		HIST_BITS = 10,
		localparam		PWM_BITS  = 16,
		//
		localparam [6:0]	MICROPHONE_CLOCK_DIVIDER = 17 * 4,
		localparam [31:0]	RAW_AUDIO_DOWNSAMPLE_RATIO = 32
		// }}}
	) (
		// {{{
		input	wire	i_clk, i_reset,
		input	wire	i_audio_en, i_rf_en,
		//
		// Wishbone interface
		input	wire	i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire [1:0]	i_wb_addr,
		input	wire [31:0]	i_wb_data,
		input	wire	[3:0]	i_wb_sel,
		output	reg		o_wb_stall,
		output	reg		o_wb_ack,
		output	reg	[31:0]	o_wb_data,
		//
		//
		output	wire		o_mic_csn, o_mic_sck,
		input	wire		i_mic_miso,
		//
		// Transmit interface
		output	reg	[1:0]	o_rf_data,
		//
		// Debug interface
		input	wire	[1:0]	i_dbg_sel,
		output	reg		o_dbg_ce,
		output	reg	[31:0]	o_dbg_data,
		output	reg	[HIST_BITS-1:0]	o_dbg_hist
		// }}}
	);

	// localparams, register and signal declarations
	// {{{
	localparam	MIC_BITS  = 12;
	localparam	AUDIO_BITS= 7;
	localparam	BB_BITS   = 12;
	// localparam	XMIT_AUDIO_BITS= 12;
	// localparam	LGFLEN = 3;
	localparam	LGFIFO = 4;
	localparam	CLOCKS_PER_BB_SAMPLE = 17 * 8;
			// = (CLOCK_FREQUENCY_HZ / BASEBAND_SAMPLE_RATE_HZ);
	localparam	PULSE_SHAPE_FILTER = "pshape4x.hex";
	localparam	AUDIO_FILTER = "audio8k.hex";

	reg			mic_ce;
	reg	[6:0]		mic_ce_counter;
	wire			mic_ignore, mic_valid;
	wire	[MIC_BITS-1:0]	mic_sample;

	wire				audio_ce;
	wire	[AUDIO_BITS-1:0]	audio_sample;

	// reg		symbol_ce;
	// reg	[31:0]	symbol_ce_counter;

	reg			reset_audio, reset_pulse,
				write_audio, write_pulse;
	reg [15:0]		write_coeff;

	wire	[6:0]	scrambled_sample;
	reg		qpsk_ce, qpsk_valid;
	reg	[1:0]	qpsk_bits, qpsk_symbol, qpsk_count;
	reg	[5:0]	qpsk_sreg;
	wire	[LGFIFO:0]	bbfifo_fill;
	wire			bbfifo_full, bbfifo_empty;
	reg			baseband_ce;
	reg	[$clog2(CLOCKS_PER_BB_SAMPLE):0]
				baseband_counter;
	wire	[BB_BITS-1:0]	pulse_i, pulse_q, bbfifo_i, bbfifo_q;
	reg	[BB_BITS-1:0]	baseband_i, baseband_q;
	wire			pulse_ready, pulse_ce;

	reg	[PWM_BITS-1:0]	sdi_integrator, sdq_integrator;

	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Incoming wishbone interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Our current bus write interface only allows adjusting our filter
	// coefficients.  We still have two addresses left for us to do
	// something more if we would rather.  Sadly, while you can write
	// these coefficients, you can't read them back currently.
	//
	always @(posedge i_clk)
		reset_audio <= i_wb_stb && i_wb_we
					&& i_wb_addr == 0 && i_wb_data[31]
					&& i_wb_sel[3];
	always @(posedge i_clk)
		reset_pulse <= i_wb_stb && i_wb_we
					&& i_wb_addr == 1 && i_wb_data[31]
					&& i_wb_sel[3];

	always @(posedge i_clk)
	begin
		write_audio <= (i_wb_stb && i_wb_we && i_wb_addr == 0);
		write_pulse <= (i_wb_stb && i_wb_we && i_wb_addr == 1);
		write_coeff <= 0;
		if(i_wb_stb && i_wb_we && i_wb_sel[1])
			write_coeff[15:8] <= i_wb_data[15:8];
		if(i_wb_stb && i_wb_we && i_wb_sel[0])
			write_coeff[7:0] <= i_wb_data[7:0];
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sample from the microphone
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial	mic_ce = 0;
	initial	mic_ce_counter = MICROPHONE_CLOCK_DIVIDER-1;
	always @(posedge i_clk)
	if (!i_audio_en || mic_ce)
	begin
		mic_ce <= 1'b0;
		mic_ce_counter <= MICROPHONE_CLOCK_DIVIDER-1;
	end else begin
		mic_ce <= (mic_ce_counter <= 1);
		mic_ce_counter <= mic_ce_counter - 1;
	end

	//
	// A/D to get audio in
	//
	smpladc #(.CKPCK(2))
	audio_adc(i_clk, mic_ce, mic_ce, i_audio_en,
		o_mic_csn, o_mic_sck, i_mic_miso,
		{ mic_ignore, mic_valid, mic_sample });

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Downsampler -- to go from RAW_DATA_RATE_HZ to our internal data rate
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	subfildown #(.IW(MIC_BITS), .OW(AUDIO_BITS), .CW(12),
		.SHIFT(7),	// Applies a 2^SHIFT gain to the incoming signal
		.NDOWN(RAW_AUDIO_DOWNSAMPLE_RATIO),
		.FIXED_COEFFS(1'b0),
		.NCOEFFS(NUM_AUDIO_COEFFS),
		.INITIAL_COEFFS(AUDIO_FILTER)
	) resample_audio(i_clk, reset_audio, write_audio, write_coeff[15:4],
		mic_ce, mic_sample, audio_ce, audio_sample);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// LFSR Scrambler
	// {{{
	////////////////////////////////////////////////////////////////////////
	//

	//
	// Apply a feedthrough randomizer to guarantee some amount of
	// transitions to later lock onto.
	//
	scrambler #(.WS(7), .LN(31), .TAPS(31'h00_00_20_01))
	randomizer(i_clk, i_reset, audio_ce, audio_sample, scrambled_sample);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Radio framing
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// This particular radio has an 8-bit frame, equal to one 7-bit sample
	// plus a frame synchronization bit.  Here, we set the 8-th
	// synchronization bit to guarantee a 90 degree transition on the first
	// symbol of every frame.  As compared to other framing schemes,
	// this one will keep us from leaking carrier into our signal, and so
	// keep us balanced.
	//

	always @(posedge i_clk)
	if (audio_ce)
	begin
		qpsk_bits <= { !scrambled_sample[6], scrambled_sample[6] };
		qpsk_sreg <= scrambled_sample[5:0];
		qpsk_valid <= 1'b1;
		qpsk_count <= 2'b11;
	end else if (qpsk_ce)
	begin
		qpsk_bits <= qpsk_sreg[5:4];
		qpsk_sreg <= { qpsk_sreg[3:0], 2'b00 };
		qpsk_valid <= (qpsk_count != 2'b00);
		qpsk_count <= qpsk_count - 1'b1;
	end

	always @(*)
		qpsk_ce = qpsk_valid && pulse_ready;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Symbol to bitmap
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	// Our new bits specify how to rotate our position from the last
	// constellation point.
	//
	//	01	|	00
	//	------------------
	//	11	|	10
	//
	// Remember, this is a *differential* encoding.  Hence, we need to know
	// the last symbol in order to know what the next symbol will be.
	//
	always @(posedge i_clk)
	if (qpsk_ce)
	begin
		casez({ qpsk_symbol, qpsk_bits })
		// No rotation
		4'b??00: qpsk_symbol <= qpsk_symbol;
		// Rotate 90 degrees clockwise
		4'b0001: qpsk_symbol <= 2'b01;
		4'b0101: qpsk_symbol <= 2'b11;
		4'b1101: qpsk_symbol <= 2'b10;
		4'b1001: qpsk_symbol <= 2'b00;
		// Rotate 180 degrees clockwise
		4'b??11: qpsk_symbol <= ~qpsk_symbol;
		// Rotate 270 degrees clockwise
		4'b0010: qpsk_symbol <= 2'b10;
		4'b0110: qpsk_symbol <= 2'b00;
		4'b1110: qpsk_symbol <= 2'b01;
		4'b1010: qpsk_symbol <= 2'b11;
		endcase
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Pulse shaping, baseband waveform generation
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// This uses a quick filter to upsamples our signal by a factor of 4.
	// That should be enough to run a decent antialiasing filter (here).
	//

	pulseshaperiq #(.NUP(4), .NCOEFFS(64),
		.IW(2), .SHIFT(7), .OW(BB_BITS), .CW(12),
		.FIXED_COEFFS(1'b0),
		.INITIAL_COEFFS(PULSE_SHAPE_FILTER)
	) genpulseiq(i_clk, reset_pulse, write_pulse, write_coeff[15:4],
			qpsk_valid, pulse_ready,
					{ qpsk_symbol[1], 1'b1 },
					{ qpsk_symbol[0], 1'b1 },
				pulse_ce, pulse_i, pulse_q);

	//
	// The problem is that the filter produces results as fast as it can.
	// We need to slow those back down to what we are expecting here.
	// Hence, we'll stuff the extras into a FIFO which we'll read from
	// at our proper data rate.
	//
	sfifo #(.BW(2*BB_BITS), .LGFLEN(LGFIFO),
		.OPT_ASYNC_READ(1'b0)
		// .OPT_WRITE_ON_FULL(1'b0),
		// .OPT_READ_ON_EMPTY(1'b0)
	) stretch( i_clk, i_reset, pulse_ce, { pulse_i, pulse_q }, bbfifo_full,
			bbfifo_fill,
			baseband_ce, { bbfifo_i, bbfifo_q }, bbfifo_empty);

	initial	baseband_ce = 1'b0;
	always @(posedge i_clk)
	if (baseband_counter <= 1 && !bbfifo_empty)
		baseband_ce <= !baseband_ce;
	else
		baseband_ce <= 0;

	initial baseband_counter = 0;
	always @(posedge i_clk)
	if (baseband_ce)
		baseband_counter <= CLOCKS_PER_BB_SAMPLE[$clog2(CLOCKS_PER_BB_SAMPLE):0]-1;
	else if (baseband_counter > 0)
		baseband_counter <= baseband_counter - 1;

`ifdef	FORMAL
	always @(*)
	if (baseband_ce)
		assert(!bbfifo_empty);
`endif

	initial	baseband_i = 0;	
	initial	baseband_q = 0;	
	always @(posedge i_clk)
	if (baseband_ce)
	begin
		baseband_i <= bbfifo_i;
		baseband_q <= bbfifo_q;
	end

	// Verilator lint_on UNUSED
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Module the radio framing signals up to bandpass
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// No baseband to bandpass translation necessary--this radio chip
	// accepts baseband I+Q waveforms as is
	//
	// assign	bandpass_ce = baseband_ce;
	// assign	bandpass_i  = baseband_i;
	// assign	bandpass_q  = baseband_q;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sigma delta conversion
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Just a basic single-integrator sigma-delta implementation.  We could
	// get fancier if we wanted to, but I personally seem to keep getting
	// bitten by overflow when I do so.
	//

	always @(posedge i_clk)
		sdi_integrator <= { 1'b0, sdi_integrator[PWM_BITS-2:0] }
			+ { 1'b0, !baseband_i[BB_BITS-1],
				baseband_i[BB_BITS-2:0],
				{(PWM_BITS-BB_BITS-1){1'b0} }};

	always @(posedge i_clk)
		sdq_integrator <= { 1'b0, sdq_integrator[PWM_BITS-2:0] }
			+ { 1'b0, !baseband_q[BB_BITS-1],
				baseband_q[BB_BITS-2:0],
				{(PWM_BITS-BB_BITS-1){1'b0} }};

	//
	// The outgoing data is the overflow from the sigma-delta integrator(s).
	//
	always @(posedge i_clk)
	if (i_rf_en)
		o_rf_data <= { sdi_integrator[PWM_BITS-1],
				sdq_integrator[PWM_BITS-1] };
	else
		o_rf_data <= ~o_rf_data;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Debug signal choices
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// We support four separate debugging channels.  The can be used
	// in a sample-for-sample recording, or histogram, or constellation
	// plot (special case of the histogram).
	//
	always @(posedge i_clk)
	case(i_dbg_sel)
	// Microphone
	2'b00: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { mic_ce,
			{(32-MIC_BITS){mic_sample[MIC_BITS-1]}}, mic_sample,
			mic_sample[MIC_BITS-1:MIC_BITS-HIST_BITS] };
	// Downsampled Audio
	2'b01: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { audio_ce,
			{(32-AUDIO_BITS){audio_sample[AUDIO_BITS-1]}},  
			audio_sample,
			{(HIST_BITS-AUDIO_BITS){audio_sample[AUDIO_BITS-1]}},
			audio_sample };
	// QPSK Bitstream
	2'b10: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { qpsk_ce,
			14'h0, qpsk_symbol, 14'h0, qpsk_bits,
			qpsk_symbol[1], {(HIST_BITS/2-1){1'b0}},
			qpsk_symbol[0], {(HIST_BITS/2-1){1'b0}} };
	// Baseband sample stream
	2'b11: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { baseband_ce,
			{(16-BB_BITS){baseband_i[BB_BITS-1]}},
				baseband_i[BB_BITS-1:0],
			{(16-BB_BITS){baseband_q[BB_BITS-1]}},
				baseband_q[BB_BITS-1:0],
			baseband_i[BB_BITS-1:BB_BITS-HIST_BITS/2],
			baseband_q[BB_BITS-1:BB_BITS-HIST_BITS/2] };
	endcase
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Wishbone return
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(*)
		o_wb_stall = 1'b0;

	initial	o_wb_ack = 0;
	always @(posedge i_clk)
		o_wb_ack <= i_wb_stb && !i_reset;

	always @(*)
		o_wb_data = o_dbg_data;
	// }}}

	// Make Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_wb_cyc, i_wb_data[30:16], i_wb_sel[2],
			mic_ignore, mic_valid, write_coeff[3:0],
			bbfifo_full, bbfifo_empty, bbfifo_fill };
	// Verilator lint_on  UNUSED
	// }}}
endmodule
