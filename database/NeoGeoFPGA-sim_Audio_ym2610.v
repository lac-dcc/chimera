// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

module ym2610(
	input PHI_M,
	input nRESET,
	
	inout [7:0] SDD,
	input [1:0] SDA,
	output nIRQ,
	input nCS,
	input nWR_RAW,
	input nRD_RAW,
	
	inout [7:0] SDRAD,
	output [5:0] SDRA,
	output SDRMPX, nSDROE,
	
	inout [7:0] SDPAD,
	output [3:0] SDPA,
	output SDPMPX, nSDPOE,
	
	output [5:0] ANA,					// How many levels ?
	
	output SH1, SH2, OP0, PHI_S	// YM3016 output
);

	wire nRD, nWR;
	wire BUSY_MMR;
	wire clr_run_A, set_run_A, clr_run_B, set_run_B;

	// nCS gating - Not sure if it's that simple
	assign nWR = nCS | nWR_RAW;
	assign nRD = nCS | nRD_RAW;
	
	// Internal
	reg P1;						// Internal clock
	reg BUSY;
	reg [1:0] BUSY_MMR_SR;	// For edge detection
	reg nWR_COPY;
	reg [1:0] ADDR_COPY;
	reg [7:0] DATA_COPY;
	reg nWRITE_S;
	reg [1:0] ADDR_S;
	reg [7:0] DATA_S;
	wire [15:0] ADPCM_OUT;
	wire FLAG_A, FLAG_B;
	reg [7:0] CLK_144_DIV;
	wire TICK_144;
	
	// Timer
	wire [9:0] YMTIMER_TA_LOAD;
	wire [7:0] YMTIMER_TB_LOAD;
	wire [5:0] YMTIMER_CONFIG;
	reg FLAG_A_S, FLAG_B_S;

	// SSG
	wire [11:0] SSG_FREQ_A;
	wire [11:0] SSG_FREQ_B;
	wire [11:0] SSG_FREQ_C;
	wire [4:0] SSG_NOISE;
	wire [5:0] SSG_EN;
	wire [4:0] SSG_VOL_A;
	wire [4:0] SSG_VOL_B;
	wire [4:0] SSG_VOL_C;
	wire [15:0] SSG_ENV_FREQ;
	wire [3:0] SSG_ENV;
	
	// FM
	wire [3:0] FM_LFO;
	wire [7:0] FM_KEYON;
	wire [6:0] FM_DTMUL[3:0];
	wire [6:0] FM_TL[3:0];
	wire [7:0] FM_KSAR[3:0];
	wire [7:0] FM_AMDR[3:0];
	wire [4:0] FM_SR[3:0];
	wire [7:0] FM_SLRR[3:0];
	wire [3:0] FM_SSGEG[3:0];
	wire [13:0] FM_FNUM13;
	wire [13:0] FM_FNUM24;
	wire [13:0] FM_2FNUM13;
	wire [13:0] FM_2FNUM24;
	wire [5:0] FM_FBALGO13;
	wire [5:0] FM_FBALGO24;
	wire [7:0] FM_PAN13;
	wire [7:0] FM_PAN24;
	
	// ADPCM-A
	wire [7:0] PCMA_KEYON;
	wire [7:0] PCMA_KEYOFF;
	wire [5:0] PCMA_MVOL;
	wire [7:0] PCMA_VOLPAN_A, PCMA_VOLPAN_B, PCMA_VOLPAN_C, PCMA_VOLPAN_D, PCMA_VOLPAN_E, PCMA_VOLPAN_F;
	wire [15:0] PCMA_START_A, PCMA_START_B, PCMA_START_C, PCMA_START_D, PCMA_START_E, PCMA_START_F;
	wire [15:0] PCMA_STOP_A, PCMA_STOP_B, PCMA_STOP_C, PCMA_STOP_D, PCMA_STOP_E, PCMA_STOP_F;
	
	// ADPCM-B
	wire [1:0] PCMB_PAN;
	wire [15:0] PCMB_START_ADDR;
	wire [15:0] PCMB_STOP_ADDR;
	wire [15:0] PCMB_DELTA;
	wire [7:0] PCMB_TL;
	wire PCMB_RESET, PCMB_REPEAT, PCMB_START;
	
	wire [7:0] ADPCM_FLAGS;
	wire [5:0] PCMA_FLAGMASK;
	wire PCMA_FLAGMASK_PCMB;
	
	// Internal clock generation
	always @(posedge PHI_M or negedge nRESET)
	begin
		if (!nRESET)
			P1 <= 1'b0;
		else
			P1 <= ~P1;
	end
	
	assign TICK_144 = (CLK_144_DIV == 143) ? 1'b1 : 1'b0;		// 143, not 0. Otherwise timers are goofy
	
	// TICK_144 gen (CLK/144)
	always @(posedge PHI_M)
	begin
		if (!nRESET)
			CLK_144_DIV <= 0;
		else
		begin
			if (CLK_144_DIV < 143)	// / 12 / 12 = / 144
				CLK_144_DIV <= CLK_144_DIV + 1'b1;
			else
				CLK_144_DIV <= 0;
		end
	end
	
	// CPU interface
	always @(posedge PHI_S)
	begin
		if (!nRESET)
		begin
			BUSY <= 1'b0;
		end
		else
		begin
			BUSY_MMR_SR <= {BUSY_MMR_SR[0], BUSY_MMR};
			if (!nWR && !BUSY)
			begin
				// Do write
				BUSY <= 1'b1;
				nWR_COPY <= 1'b0;
				ADDR_COPY <= SDA;
				DATA_COPY <= SDD;
			end
			else
			begin
				if (BUSY_MMR) nWR_COPY <= 1'b1;
				if (BUSY && BUSY_MMR_SR == 2'b10) BUSY <= 1'b0;
			end
		end
	end
	

	// Read registers
	assign SDD = nRD ? 8'bzzzzzzzz : (SDA == 0) ? { BUSY, 5'h0, FLAG_B_S, FLAG_A_S } :	// 4: Timer status
												(SDA == 1) ? 8'h0 :				// 5: SSG register data
												(SDA == 2) ? ADPCM_FLAGS :		// 6: ADPCM flags
												8'h0;		// 7: Nothing
	
	always @(posedge PHI_M) 
		{ FLAG_B_S, FLAG_A_S } <= { FLAG_B, FLAG_A };
	
	always @(posedge P1)
		{nWRITE_S, ADDR_S, DATA_S} <= {nWR_COPY, ADDR_COPY, DATA_COPY};
						
	ym_regs 		YMREGS(PHI_M, nRESET, nWRITE_S, ADDR_S, DATA_S, BUSY_MMR,
						SSG_FREQ_A, SSG_FREQ_B, SSG_FREQ_C, SSG_NOISE, SSG_EN, SSG_VOL_A, SSG_VOL_B, SSG_VOL_C,
						SSG_ENV_FREQ, SSG_ENV,
						YMTIMER_TA_LOAD, YMTIMER_TB_LOAD, YMTIMER_CONFIG,
						clr_run_A, set_run_A, clr_run_B, set_run_B,
						PCMA_KEYON, PCMA_KEYOFF, PCMA_MVOL,
						PCMA_VOLPAN_A, PCMA_VOLPAN_B, PCMA_VOLPAN_C, PCMA_VOLPAN_D, PCMA_VOLPAN_E, PCMA_VOLPAN_F,
						PCMA_START_A, PCMA_START_B, PCMA_START_C, PCMA_START_D, PCMA_START_E, PCMA_START_F,
						PCMA_STOP_A, PCMA_STOP_B, PCMA_STOP_C, PCMA_STOP_D, PCMA_STOP_E, PCMA_STOP_F,
						PCMA_FLAGMASK, PCMA_FLAGMASK_PCMB,
						PCMB_RESET, PCMB_REPEAT, PCMB_START,
						PCMB_PAN, PCMB_START_ADDR, PCMB_STOP_ADDR, PCMB_DELTA, PCMB_TL
						);

	ym_timers 	YMTIMER(PHI_M, TICK_144, nRESET, YMTIMER_TA_LOAD, YMTIMER_TB_LOAD, YMTIMER_CONFIG,
						clr_run_A, set_run_A, clr_run_B, set_run_B, FLAG_A, FLAG_B, nIRQ);
	
	ym_ssg 		YMSSG(PHI_M, ANA, SSG_FREQ_A, SSG_FREQ_B, SSG_FREQ_C, SSG_NOISE, SSG_EN, SSG_VOL_A, SSG_VOL_B, SSG_VOL_C,
						SSG_ENV_FREQ, SSG_ENV);
	ym_fm 		YMFM(PHI_M);

	ym_pcm 		YMPCM(PHI_M, TICK_144, nRESET,
						PCMA_FLAGMASK, PCMA_FLAGMASK_PCMB,
						ADPCM_FLAGS,
						PCMA_KEYON, PCMA_KEYOFF,
						PCMA_MVOL,
						PCMA_VOLPAN_A, PCMA_VOLPAN_B, PCMA_VOLPAN_C, PCMA_VOLPAN_D, PCMA_VOLPAN_E, PCMA_VOLPAN_F,
						PCMA_START_A, PCMA_STOP_A, PCMA_START_B, PCMA_STOP_B, PCMA_START_C, PCMA_STOP_C,
						PCMA_START_D, PCMA_STOP_D, PCMA_START_E, PCMA_STOP_E, PCMA_START_F, PCMA_STOP_F,
						SDRAD, SDRA, SDRMPX, nSDROE,
						SDPAD, SDPA, SDPMPX, nSDPOE,
						ADPCM_OUT,
						PCMB_RESET, PCMB_REPEAT, PCMB_START,
						PCMB_PAN, PCMB_START_ADDR, PCMB_STOP_ADDR, PCMB_DELTA, PCMB_TL);

endmodule
