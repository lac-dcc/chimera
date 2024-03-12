////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	amxmit.txt
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
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
// }}}
module	amxmit #(
		// {{{
		parameter [31:0]	CLOCK_FREQUENCY_HZ = 36_000_000,
		parameter [31:0]	RAW_DATA_RATE_HZ = 500_000,
		parameter [0:0]		OPT_CIC_FILTER = 1'b1,
		parameter		HIST_BITS = 10,

		//
		localparam	CIC_LGMEM  = 28,	// Max down = 2^(LGMEM-STAGES)
		localparam			CIC_STAGES = 4,	// Was 15
		localparam  [CIC_LGMEM/CIC_STAGES-1:0]	CIC_DOWN   = 7'd64,
		// Internal gain will be CIC_DOWN ^ (CIC_STAGES)
		//	For 2^6 and 4 stages, that'd be 2^24
		//
		// Verilator lint_off REALCVT
		localparam [31:0] MIC_STEP = 4.0 * (1<<30) * RAW_DATA_RATE_HZ
					* 1.0 / CLOCK_FREQUENCY_HZ
		// Verilator lint_on  REALCVT
		//
		// }}}
	) (
		// {{{
		input	wire	i_clk, i_reset,
		input	wire	i_audio_en, i_rf_en,
		//
		// Wishbone interface
		input	wire		i_wb_cyc, i_wb_stb, i_wb_we,
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

	// Local parameter declarations
	// {{{
	localparam	MIC_BITS=12, CIC_BITS=16;

	// localparam	PHASE_BITS = 24;
	// localparam	AM_BITS = 24;
	localparam	GAIN_BITS = 16+12;
	localparam	CARRIER_GAIN = GAIN_BITS-14;
	localparam	PWM_BITS = GAIN_BITS + 1;
	localparam	OPT_SIGMA_DELTA = 1'b1;
	// }}}

	// Declare registers and nets
	// {{{
	reg				mic_ce;
	reg		[31:0]		mic_ce_counter;
	wire				mic_ignore, mic_valid;
	wire	signed	[MIC_BITS-1:0]	mic_data;
	wire				cic_ce;
	wire	signed	[CIC_BITS-1:0]	cic_sample;

	reg	[15+12:0]		gain_data;
	reg	[15:0]			r_gain;
	reg	[13:0]			r_carrier;
	reg	[PWM_BITS-1:0]		sample_data;
	reg	[GAIN_BITS:0]		wider_gain;
	reg				reset_filter;

	wire	signed	[11:0]	cic_signed;
	wire	signed	[15:0]	gain_signed;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Incoming bus handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial	reset_filter = 1;
	initial	r_gain    = 16'h8000;
	initial	r_carrier = 14'h0000;
	always @(posedge i_clk)
	if (i_wb_stb && i_wb_we && i_wb_addr == 0)
	begin
		r_gain <= i_wb_data[15:0];
		r_carrier <= i_wb_data[29:16];
		reset_filter <= i_wb_data[31];
	end else
		reset_filter <= 0;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sample incoming data
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(posedge i_clk)
	if (!i_audio_en)
		{ mic_ce, mic_ce_counter } <= 0;
	else
		{ mic_ce, mic_ce_counter } <= mic_ce_counter + MIC_STEP;

	//
	// A/D to get audio in
	//
	smpladc #(.CKPCK(2))
	audio_adc(i_clk, mic_ce, mic_ce, i_audio_en,
		o_mic_csn, o_mic_sck, i_mic_miso,
		{ mic_ignore, mic_valid, mic_data });
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// CIC filter--first half of downsampling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	generate if (OPT_CIC_FILTER)
	begin : AM_CIC_FILTER

		cicfil #(.IW(MIC_BITS), .OW(CIC_BITS), .SHIFT(4),
				.STAGES(CIC_STAGES))// .LGMEM(CIC_LGMEM))
		cic(i_clk, reset_filter, CIC_DOWN,
				mic_ce, mic_data,
				// mic_ce, 12'h7ff,
				cic_ce, cic_sample);

	end else begin : NO_AM_CIC_FILTER

		assign	cic_ce = mic_ce;
		assign	cic_sample = { mic_data, 4'h0 };

	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Apply a gain to the filtered data
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	assign	cic_signed  = cic_sample[15:4];
	assign	gain_signed = { r_gain[15], r_gain[15:1] };

	(* mul2dsp *)
	always @(posedge i_clk)
	if (cic_ce)
		// gain_data <= $signed(cic_sample[15:4]) * r_gain;
		gain_data <= cic_signed * gain_signed;

	always @(*)
	begin
		wider_gain[GAIN_BITS-1:0] = gain_data;
		wider_gain[GAIN_BITS] = gain_data[GAIN_BITS-1];
		wider_gain = wider_gain + { 2'b01, {(GAIN_BITS-1){1'b0}} };
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Add a carrier (bias)
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	if (cic_ce)
		sample_data <= wider_gain
			+ { r_carrier[13], r_carrier, {(CARRIER_GAIN){1'b0}} };
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sigma delta conversion to create the output sample
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	generate if (OPT_SIGMA_DELTA)
	begin : SIGMA_DELTA_CONVERSION
		// {{{
		reg	[PWM_BITS-1:0]		sd_integrator;

		always @(posedge i_clk)
			sd_integrator <=sd_integrator[PWM_BITS-2:0]
				+{ !sample_data[PWM_BITS-1], sample_data[PWM_BITS-2:1] };

		always @(posedge  i_clk)
		if (!i_rf_en)
			o_rf_data[1:0] <= ~o_rf_data[1:0];
		else
			o_rf_data[1:0] <= (sd_integrator[PWM_BITS-1]) ? 2'b11 : 2'b00;
		// }}}
	end else begin : GENERATE_PWM_OUTPUT
		// {{{
		reg	[PWM_BITS-1:0]		pwm_counter;
		integer	k;
		reg	[PWM_BITS-1:0]		brev_pwm;
		reg	[PWM_BITS-1:0]		sample_data_off;

		always @(*)
			sample_data_off = sample_data ^ { 1'b1, {(PWM_BITS-1){1'b0}} };

		always @(posedge i_clk)
			pwm_counter <= pwm_counter + 1;

		always @(*)
		for(k=0; k<PWM_BITS; k=k+1)
			brev_pwm[k] = pwm_counter[PWM_BITS-1-k];

		always @(posedge  i_clk)
		if (!i_rf_en)
			o_rf_data[1:0] <= ~o_rf_data[1:0];
		else
			o_rf_data[1:0] <= (sample_data_off < brev_pwm) ? 2'b11 : 2'b00;
		// }}}
	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Debugging data generation
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	casez(i_dbg_sel)
	// 2'b00: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { mic_ce, 4'h0, 16'h0,
	//		mic_data[MIC_BITS-1:0],
	//		mic_data[MIC_BITS-1:MIC_BITS-HIST_BITS] };
	2'b00: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { mic_ce,
		{(32-CIC_BITS){1'b0}}, cic_sample[CIC_BITS-1:0],
		cic_sample[CIC_BITS-1:CIC_BITS-HIST_BITS] };
	2'b01: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { 1'b1,
			o_rf_data, sample_data[PWM_BITS-1:PWM_BITS-HIST_BITS],
			1'b0, o_mic_csn, o_mic_sck, i_mic_miso,
			mic_ce, mic_valid, i_audio_en, i_rf_en, mic_data,
			{(HIST_BITS/2-1){1'b0}}, o_rf_data[1],
			{(HIST_BITS/2-1){1'b0}}, o_rf_data[0] };
	2'b10: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { cic_ce, 4'hf,
			gain_data[15+12:0], gain_data[15+12:16+12-HIST_BITS] };
	2'b11: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { 3'b100, o_rf_data,
			sample_data[PWM_BITS-1:PWM_BITS-28],
			sample_data[PWM_BITS-1:PWM_BITS-HIST_BITS] };
	endcase 
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Outgoing bus handling
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(*)
		o_wb_stall = 1'b0;

	initial	o_wb_ack = 1'b0;
	always @(posedge i_clk)
		o_wb_ack <= i_wb_stb;

	always @(posedge  i_clk)
	casez(i_wb_addr)
	// 2'b00:  o_wb_data <= { 4'ha, 16'h0, mic_data };
	2'b00:  o_wb_data <= { 16'h0, cic_sample[CIC_BITS-1:0] };
	2'b01:  o_wb_data <= { 4'hf, gain_data };
	2'b10:  o_wb_data <= { 1'b0, o_rf_data, sample_data[28:0] };
	2'b11:	o_wb_data <= { reset_filter, 1'b0, r_carrier, r_gain };
	endcase
	//	o_wb_data = o_dbg_data;
	// }}}

	// Make Verilator -Wall happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_reset, i_wb_cyc, i_wb_sel, i_wb_data[31:16],
			mic_ignore, mic_valid, cic_sample[3:0] };
	// Verilator lint_on  UNUSED
	// }}}
endmodule
