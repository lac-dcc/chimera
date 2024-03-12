////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	fmxmit.v
// {{{
// Project:	SDR, a basic Soft(Gate)ware Defined Radio architecture
//
// Purpose:	A basic FM transmitter.  It works in stages.  1) Get audio
//		from the microphone, 2) (optionally) filter that audio with
//	a CIC filter, 3) multiply it by a user configurable gain, 4) use the
//	gain data to increment a phase counter, 5) create two phase counters
//	from that each offset by 90 degrees for I+Q, 6) do a table lookup of
//	the phases, 7) sigma-delta (or optionally PWM) modulate the result.
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
module	fmxmit #(
		// {{{
		parameter [31:0]	CLOCK_FREQUENCY_HZ = 36_000_000,
		parameter [31:0]	MICROPHONE_SAMPLE_RATE_HZ = 1_000_000,
		parameter		HIST_BITS = 10,
		localparam		MIC_BITS=12,
		parameter [0:0]		OPT_CIC_FILTER = 1'b0,
		//
		// Verilator lint_off REALCVT
		localparam [31:0]	MIC_STEP = 4.0 * (1<<30)
			* MICROPHONE_SAMPLE_RATE_HZ * 1.0 / CLOCK_FREQUENCY_HZ
		// Verilator lint_on  REALCVT
		// }}}
	) (
		// {{{
		input	wire	i_clk, i_reset,
		input	wire	i_audio_en, i_rf_en,
		// Wishbone interface
		// {{{
		input	wire		i_wb_cyc, i_wb_stb, i_wb_we,
		input	wire [1:0]	i_wb_addr,
		input	wire [31:0]	i_wb_data,
		input	wire	[3:0]	i_wb_sel,
		output	reg		o_wb_stall,
		output	reg		o_wb_ack,
		output	reg	[31:0]	o_wb_data,
		// }}}
		//
		// Microphone (SPI) interface
		// {{{
		output	wire		o_mic_csn, o_mic_sck,
		input	wire		i_mic_miso,
		// }}}
		// Transmit interface
		output	reg	[1:0]	o_rf_data,
		//
		// Debug interface
		// {{{
		input	wire	[1:0]	i_dbg_sel,
		output	reg		o_dbg_ce,
		output	reg	[31:0]	o_dbg_data,
		output	reg	[HIST_BITS-1:0]	o_dbg_hist
		// }}}
		// }}}
	);

	// Local parameters
	// {{{
	localparam	CIC_BITS = 16;
	localparam	CIC_STAGES = 4;
	localparam	CIC_LGMEM  = 28;
	localparam	CIC_DOWN   = 7'd64;

	localparam [0:0]	OPT_SIGMA_DELTA = 1'b1;
	localparam	PHASE_BITS = 24;
	localparam	GAIN_BITS = 16;
	localparam	SIN_BITS = 12; // Change only w/ changing cordic
	localparam	SIN_PHASE_BITS = 8; // Change only w/ changing cordic
	localparam	PWM_BITS = 12;
	// }}}

	// Signal declarations
	// {{{
	reg				mic_ce;
	reg	[31:0]			mic_ce_counter;
	wire				mic_ignore, mic_valid;
	wire signed [MIC_BITS-1:0]	mic_data;

	reg				reset_filter;
	wire				cic_ce;
	wire signed [CIC_BITS-1:0]	cic_sample;

	reg	[GAIN_BITS+CIC_BITS-1:0] gain_data;
	reg signed [GAIN_BITS-1:0]	r_gain;
	reg	[PHASE_BITS-1:0]	gain_data_wide, phase_counter;
	reg				direct_rf;
	//
	reg	[SIN_PHASE_BITS-1:0]	i_counter, q_counter;
	wire	[SIN_BITS-1:0]		cos_value, sin_value;
	wire				cos_ignored, sin_ignored;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Bus interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	direct_rf = 0;
	initial	reset_filter = 1;
	always @(posedge i_clk)
	if (i_reset)
	begin
		direct_rf    <= 0;
		reset_filter <= 1;
	end else if (i_wb_stb && i_wb_we && i_wb_addr == 0)
	begin
		reset_filter <= i_wb_data[31];
		direct_rf    <= i_wb_data[30];
	end else
		reset_filter <= 1'b0;

	initial	r_gain = 16'h0040;
	always @(posedge i_clk)
	if (i_wb_stb && i_wb_we && i_wb_addr == 0)
		r_gain <= i_wb_data[15:0];

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Audio capture
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Generate a AUDIO_RATE CE signal
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
	// Optional CIC filter
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	generate if (OPT_CIC_FILTER)
	begin : FM_CIC_FILTER

		cicfil #(.IW(MIC_BITS), .OW(CIC_BITS), .SHIFT(4),
				.STAGES(CIC_STAGES), .LGMEM(CIC_LGMEM))
		cic(i_clk, reset_filter, CIC_DOWN,
				mic_ce, mic_data,
				// mic_ce, 12'h7ff,
				cic_ce, cic_sample);

	end else begin : NO_FM_CIC_FILTER

		assign	cic_ce = mic_ce;
		assign	cic_sample = { mic_data, {(CIC_BITS-MIC_BITS){1'b0}} };

	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Gain stage
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	(* mul2dsp *)
	always @(posedge i_clk)
	if (cic_ce)
		gain_data <= cic_sample * r_gain;

	always @(*)
	begin
		gain_data_wide = gain_data[CIC_BITS+GAIN_BITS-1:CIC_BITS+GAIN_BITS-PHASE_BITS];
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// FM Modulation
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	//
	// Actual frequency is given by ...
	//
	//	clocks_per_revolution = 2^(PHASE_BITS) * gain_data_wide
	//	clocks_per_second = CLOCK_FREQUENCY_HZ = 36 MHz
	//	revolutions_per_second = 2^(PHASE_BITS)/CLOCK_FREQUENCY_HZ
	//.					* gain_data_wide
	//
	initial	phase_counter = 0;
	always @(posedge i_clk)
		phase_counter <= phase_counter + gain_data_wide;

	initial	i_counter = 0;
	initial	q_counter = 8'h40;
	always @(posedge i_clk)
	begin
		i_counter <= phase_counter[PHASE_BITS-1:PHASE_BITS-8] + 8'h40;
		q_counter <= phase_counter[PHASE_BITS-1:PHASE_BITS-8];
	end

	// Map our new phase value(s) to sine and cosine values
	// Both because we are working in quadrature
	sintable
	costbl(i_clk, 1'b0, 1'b1, i_counter, cos_value, 1'b0, cos_ignored);

	sintable
	sintbl(i_clk, 1'b0, 1'b1, q_counter, sin_value, 1'b0, sin_ignored);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Sigma delta output generation
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	generate if (OPT_SIGMA_DELTA)
	begin : GENERATE_SIGMA_DELTA
		// {{{
		reg	[PWM_BITS-1:0]	sigma_delta_i, sigma_delta_q;

		//
		// Convert to Sigma Delta modulation
		//

		always @(posedge i_clk)
		if (direct_rf)
		begin
			sigma_delta_i <= 0;
			case(phase_counter[PHASE_BITS-1:PHASE_BITS-2])
			2'b00: { sigma_delta_i[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_i[PWM_BITS-1:PWM_BITS-2] + 2'b0;
			2'b01: { sigma_delta_i[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_i[PWM_BITS-1:PWM_BITS-2] + 2'b1;
			2'b10: { sigma_delta_i[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_i[PWM_BITS-1:PWM_BITS-2] + 2'b1;
			2'b11: { sigma_delta_i[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_i[PWM_BITS-1:PWM_BITS-2] + 2'b0;
			endcase
		end else
			sigma_delta_i <= sigma_delta_i[PWM_BITS-2:0] + { {(1){!cos_value[11]}}, cos_value[10:1] };

		always @(posedge i_clk)
		if (direct_rf)
		begin
			sigma_delta_q <= 0;
			case(phase_counter[PHASE_BITS-1:PHASE_BITS-2])
			2'b00: { sigma_delta_q[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_q[PWM_BITS-1:PWM_BITS-2] + 2'b0;
			2'b01: { sigma_delta_q[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_q[PWM_BITS-1:PWM_BITS-2] + 2'b0;
			2'b10: { sigma_delta_q[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_q[PWM_BITS-1:PWM_BITS-2] + 2'b1;
			2'b11: { sigma_delta_q[PWM_BITS-1:PWM_BITS-2] }
				<= sigma_delta_q[PWM_BITS-1:PWM_BITS-2] + 2'b1;
			endcase
		end else
			sigma_delta_q <= sigma_delta_q[PWM_BITS-2:0] + { {(1){!sin_value[11]}}, sin_value[10:1] };

		always @(posedge i_clk)
		if (!i_rf_en)
			o_rf_data <= ~o_rf_data;
		else
			o_rf_data <= { sigma_delta_i[PWM_BITS-1],
					sigma_delta_q[PWM_BITS-1] };
		// }}}
	end else begin : GENERATE_PWM
		//
		// Convert to a PWM (PDM) signal
		// {{{
		//
		integer	k;
		reg	[PWM_BITS-1:0]	pwm_counter, brev_pwm;
		reg	[PWM_BITS-1:0]	sin_value_off;
		reg	[PWM_BITS-1:0]	cos_value_off;


		// The PWM modulator below needs signed offset values, not
		// two's complement ones.  Convert them here.
		always @(*)
		begin
			cos_value_off = cos_value;
			sin_value_off = sin_value;

			cos_value_off[PWM_BITS-1] = !cos_value[PWM_BITS-1];
			sin_value_off[PWM_BITS-1] = !sin_value[PWM_BITS-1];
		end


		always @(posedge i_clk)
			pwm_counter <= pwm_counter + 1;

		always @(*)
		for(k=0; k<PWM_BITS; k=k+1)
			brev_pwm[k] = pwm_counter[PWM_BITS-1-k];

		always @(posedge  i_clk)
		if (!i_rf_en)
			o_rf_data[1:0] <= ~o_rf_data[1:0];
		else if (direct_rf)
		begin
			case(phase_counter[PHASE_BITS-1:PHASE_BITS-2])
			2'b00: o_rf_data <= 2'b00;
			2'b01: o_rf_data <= 2'b10;
			2'b10: o_rf_data <= 2'b11;
			2'b11: o_rf_data <= 2'b01;
			endcase	
		end else begin
			o_rf_data[0] <= (sin_value_off <= brev_pwm);
			o_rf_data[1] <= (cos_value_off <= brev_pwm);
		end
		// }}}
	end endgenerate
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Debug signals
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(posedge i_clk)
	casez(i_dbg_sel)
	2'b00: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { mic_ce,
			{(32-MIC_BITS){1'b0}}, mic_data,
			mic_data[MIC_BITS-1:MIC_BITS-HIST_BITS] };
	2'b01: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { cic_ce,
			{(32-GAIN_BITS-CIC_BITS){1'b0}},
					gain_data[GAIN_BITS+CIC_BITS-1:0],
			gain_data[GAIN_BITS+CIC_BITS-1:GAIN_BITS+CIC_BITS-HIST_BITS] };
	2'b10: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { 1'b1,
			{(32-PHASE_BITS){1'b0}}, 
			phase_counter[PHASE_BITS-1:0],
			phase_counter[PHASE_BITS-1:PHASE_BITS-HIST_BITS] };
	2'b11: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { 1'b1,
			{(16-SIN_BITS){cos_value[SIN_BITS-1]}}, cos_value,
			{(16-SIN_BITS){sin_value[SIN_BITS-1]}}, sin_value,
			cos_value[SIN_BITS-1:SIN_BITS-(HIST_BITS/2)],
			sin_value[SIN_BITS-1:SIN_BITS-(HIST_BITS/2)] };
	endcase
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Bus read interface
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	always @(*)
		o_wb_stall = 1'b0;

	initial	o_wb_ack = 1'b0;
	always @(posedge i_clk)
		o_wb_ack <= i_wb_stb;

	always @(posedge i_clk)
	begin
		o_wb_data <= 0;
		casez(i_wb_addr)
		// FMGAIN
		2'b00: o_wb_data <= { 1'b0, direct_rf,
			{(32-2-GAIN_BITS){1'b0}}, r_gain[GAIN_BITS-1:0] };
		// MICDATA
		2'b01: begin
			o_wb_data[31:16] <= cic_sample;
			o_wb_data[15: 0] <= { {(16-MIC_BITS){1'b0}}, mic_data };
			end
		// GAINDATA
		2'b10: begin
			o_wb_data <= {(32){gain_data[GAIN_BITS+CIC_BITS-1]}};
			o_wb_data[GAIN_BITS+CIC_BITS-1:0]
				<= { gain_data[GAIN_BITS+CIC_BITS-1:0] };
			end
		// RFPHASE
		2'b11: o_wb_data <= { phase_counter[PHASE_BITS-1:0],
					{(32-PHASE_BITS){1'b0}} };
		endcase
	end
	// }}}

	// Make Verilator -Wall happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_wb_cyc, i_wb_sel, i_wb_data[31:16],
			mic_ignore, mic_valid, cos_ignored, sin_ignored,
			reset_filter };
	// Verilator lint_on  UNUSED
	// }}}
endmodule
