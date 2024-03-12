////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	amdemod.v
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
module	amdemod #(
		parameter [31:0]	CLOCK_FREQUENCY_HZ = 36_000_000,
		// parameter [31:0]	RAW_DATA_RATE_HZ = 960_000,
		parameter [31:0]	AUDIO_SAMPLE_RATE_HZ = 48_000,
		parameter		NUM_AUDIO_COEFFS = 666,
		parameter		HIST_BITS = 10,
		//
		//
		// Verilator lint_off REALCVT
		// localparam real 	MIC_STEP_R = (4.0 * (1<<30)) * RAW_DATA_RATE_HZ
		//				* 1.0 / CLOCK_FREQUENCY_HZ,
		// localparam [31:0]	MIC_STEP = MIC_STEP_R,
		// Verilator lint_on REALCVT
		localparam [31:0]	RAW_AUDIO_DOWNSAMPLE_RATIO
			= CLOCK_FREQUENCY_HZ / AUDIO_SAMPLE_RATE_HZ, // == 750
		localparam 	CIC_DOWN = 50,
		localparam		SUBFIL_DOWN
				= RAW_AUDIO_DOWNSAMPLE_RATIO / CIC_DOWN
	) (
		input	wire		i_clk, i_reset,
		input	wire		i_audio_en, i_rf_en,
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
		// Receive interface
		input	wire	[1:0]	i_rf_data,
		//
		// Outgoing PWM interface
		output	reg		o_pwm_audio,
		//
		// Debug interface
		input	wire	[1:0]	i_dbg_sel,
		output	reg		o_dbg_ce,
		output	reg	[31:0]	o_dbg_data,
		output reg [HIST_BITS-1:0] o_dbg_hist
	);
	//

	// Declare signals  and registers
	// {{{
	integer	k;

	localparam	CIC_BITS = 10;
	localparam	BB_BITS  = 12;	// DO NOT CHANGE w/o adjusting CORDIC
	localparam	PWM_BITS = 16;
	localparam	CORDIC_BITS=8;
	localparam	CORDIC_PHASE=16;
	localparam	PLL_PHASE=20;

	wire			cic_ce, cic_ign, baseband_ce;
	reg	[CIC_BITS-1:0]	cic_sample_i, cic_sample_q;
	wire	[BB_BITS-1:0]	baseband_i, baseband_q;
	reg	[PWM_BITS-1:0]	pwm_counter, brev_counter;
	reg [CORDIC_BITS+16-1:0] amplified_sample;
	reg	[15:0]		audio_sample_off;
	wire			splr_busy, splr_done;
	wire signed [CORDIC_BITS-1:0] audio_i, audio_q,
				w_carrier;
	reg signed [CORDIC_BITS-1:0] minus_carrier;
	//
	wire	[PLL_PHASE-1:0]	pll_phase;
	reg	[PLL_PHASE-1:0]	negative_phase;
	reg	[4:0]		pll_lgcoeff;
	reg	[15:0]		r_gain;
	reg			load_pll;
	reg	[PLL_PHASE-2:0]	new_pll_step;
	//
	reg			write_audio_filter, reset_filter;
	reg	[15:0]		write_coeff;
	wire	[1:0]		pll_err;
	wire			pll_locked;
	// }}}

	////////////////////////////////////////////////////////////////////////
	//
	// Bus inputs
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	initial	pll_lgcoeff  = 5'h2;
	initial	new_pll_step = 19'h040_00;
	initial	load_pll     = 1;
	initial	r_gain       = 16'h4000;
	always @(posedge i_clk)
	if (i_wb_stb && i_wb_we)
	begin
		{ reset_filter, load_pll, write_coeff } <= 0;

		case(i_wb_addr)
		2'b00: r_gain <= i_wb_data[15:0];
		2'b01: { load_pll, new_pll_step } <= { 1'b1,
					 i_wb_data[30:32-PLL_PHASE] };
		2'b10: { reset_filter, write_audio_filter, write_coeff }
				<= { i_wb_data[31], !i_wb_data[31],
						i_wb_data[15:0] };
		2'b11: pll_lgcoeff <= i_wb_data[4:0];
		default: begin end
		endcase
	end else
		{ reset_filter, load_pll, write_coeff } <= 0;

	always @(*)
		o_wb_stall = 1'b0;

	always @(posedge i_clk)
		o_wb_ack <= !i_reset && i_wb_stb;

	always @(posedge i_clk)
	begin
		o_wb_data <= 0;
		case(i_wb_addr)
		2'b00:o_wb_data<={ {(16-CORDIC_BITS){w_carrier[CORDIC_BITS-1]}},
				w_carrier, r_gain };
		2'b01: o_wb_data[30:32-PLL_PHASE] <= new_pll_step;
		// No feedback on filter taps
		2'b11: o_wb_data[4:0] <= pll_lgcoeff;
		default: o_wb_data <= 0;
		endcase
	end
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// CIC Filters
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	cicfil #(.IW(2), .OW(CIC_BITS), .STAGES(4), .LGMEM(28), .SHIFT(6))
	cici(i_clk, reset_filter, CIC_DOWN[6:0], 1'b1,
				i_rf_data[1] ? 2'b01 : 2'b11,
				cic_ce, cic_sample_i);

	cicfil #(.IW(2), .OW(CIC_BITS), .STAGES(4), .LGMEM(28), .SHIFT(6))
	cicq(i_clk, reset_filter, CIC_DOWN[6:0], 1'b1,
				i_rf_data[0] ? 2'b01 : 2'b11,
				cic_ign, cic_sample_q);
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Downsampling (CIC cleanup)
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	subfildowniq #(.IW(CIC_BITS), .OW(BB_BITS), .CW(12), .SHIFT(10),
		.INITIAL_COEFFS("amdemod.hex"),
		.NDOWN(SUBFIL_DOWN),
		.FIXED_COEFFS(1'b0), .NCOEFFS(NUM_AUDIO_COEFFS))
	resample(i_clk, reset_filter, write_audio_filter, write_coeff[15:4],
		cic_ce, cic_sample_i, cic_sample_q,
		baseband_ce, baseband_i, baseband_q);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Remove the AM carrier
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	quadpll #(.PHASE_BITS(PLL_PHASE), .OPT_TRACK_FREQUENCY(1'b1),
		.INITIAL_PHASE_STEP(0)) // i.e. TRACKING FREQUENCY
	carrier_track(i_clk, load_pll, new_pll_step,
		baseband_ce, { baseband_i[BB_BITS-1], baseband_q[BB_BITS-1] },
			pll_lgcoeff, pll_phase, pll_err, pll_locked);

	always @(posedge i_clk)
		negative_phase <= -pll_phase;

	seqcordic // CORDIC parameters cannot be updated here
	remove_carrier(i_clk, i_reset,
			baseband_ce, baseband_i[BB_BITS-1:BB_BITS-CORDIC_BITS],
				baseband_q[BB_BITS-1:BB_BITS-CORDIC_BITS],
				negative_phase[PLL_PHASE-1:PLL_PHASE-CORDIC_PHASE],
			splr_busy, splr_done, audio_i, audio_q);

	iiravg #(.IW(CORDIC_BITS), .OW(CORDIC_BITS), .LGALPHA(10))
	avgcarrier(i_clk, i_reset, baseband_ce, audio_i, w_carrier);

	always @(posedge i_clk)
		minus_carrier <= audio_i - w_carrier;
	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Amplify the result
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	(* mul2dsp *)
	always @(posedge  i_clk)
	// if (splr_done)
		amplified_sample <= minus_carrier * r_gain;

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Convert to PWM
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge  i_clk)
	if (splr_done)
	begin
		audio_sample_off[14:0] <=  amplified_sample[16+CORDIC_BITS-2:CORDIC_BITS];
		audio_sample_off[15]   <= !amplified_sample[16+CORDIC_BITS-1];
	end

	always @(posedge i_clk)
		pwm_counter <= pwm_counter + 1;

	always @(*)
	for(k=0; k<PWM_BITS; k=k+1)
		brev_counter[k] = pwm_counter[PWM_BITS-1-k];

	always @(posedge i_clk)
	if (!i_audio_en)
		o_pwm_audio <= !o_pwm_audio;
	else
		o_pwm_audio <= (brev_counter < audio_sample_off);

	// }}}
	////////////////////////////////////////////////////////////////////////
	//
	// Create the debugging outputs
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//

	always @(posedge i_clk)
	case(i_dbg_sel)
	2'b00: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { cic_ce,
			{(16-CIC_BITS){cic_sample_i[CIC_BITS-1]}},
				cic_sample_i[CIC_BITS-1:0],
			{(16-CIC_BITS){cic_sample_q[CIC_BITS-1]}},
				cic_sample_q[CIC_BITS-1:0],
			cic_sample_i[CIC_BITS-1:CIC_BITS-(HIST_BITS/2)],
			cic_sample_q[CIC_BITS-1:CIC_BITS-(HIST_BITS/2)] };
	2'b01: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { baseband_ce,
			{(16-BB_BITS){baseband_i[BB_BITS-1]}},
				baseband_i[BB_BITS-1:0],
			{(16-BB_BITS){baseband_q[BB_BITS-1]}},
				baseband_q[BB_BITS-1:0],
			baseband_i[BB_BITS-1:BB_BITS-(HIST_BITS/2)],
			baseband_q[BB_BITS-1:BB_BITS-(HIST_BITS/2)] };
	2'b10: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { splr_done,
			{(16-CORDIC_BITS){1'b0}}, audio_i,
			{(16-CORDIC_BITS){1'b0}}, audio_q,
			//
			audio_i[CORDIC_BITS-1:CORDIC_BITS-(HIST_BITS/2)],
			audio_q[CORDIC_BITS-1:CORDIC_BITS-(HIST_BITS/2)] };
	2'b11: { o_dbg_ce, o_dbg_data, o_dbg_hist } <= { splr_done,
			16'h0, audio_sample_off[15:0],
			audio_sample_off[15:16-HIST_BITS] };
	endcase
	// }}}

	// Make Verilator happy
	// {{{
	// Verilator lint_off UNUSED
	wire	unused;
	assign	unused = &{ 1'b0, i_wb_cyc, i_wb_sel,
			cic_ign, splr_busy, negative_phase[3:0],
			i_rf_en, audio_q, write_coeff[3:0], pll_err, pll_locked,
			amplified_sample[15:0] };
	// Verilator lint_on  UNUSED
endmodule
