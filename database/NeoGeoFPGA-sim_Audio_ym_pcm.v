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

module ym_pcm(
	input PHI_M,
	input TICK_144,
	input nRESET,
	
	input [5:0] PCMA_FLAGMASK,
	input PCMA_FLAGMASK_PCMB,
	output [7:0] ADPCM_FLAGS,
	input [7:0] PCMA_KEYON,
	input [7:0] PCMA_KEYOFF,
	
	input [5:0] PCMA_MVOL,			// Todo: use !
	
	input [7:0] PCMA_VOLPAN_A, PCMA_VOLPAN_B, PCMA_VOLPAN_C,
	input [7:0] PCMA_VOLPAN_D, PCMA_VOLPAN_E, PCMA_VOLPAN_F,
	
	input [15:0] PCMA_START_A, PCMA_STOP_A,
	input [15:0] PCMA_START_B, PCMA_STOP_B,
	input [15:0] PCMA_START_C, PCMA_STOP_C,
	input [15:0] PCMA_START_D, PCMA_STOP_D,
	input [15:0] PCMA_START_E, PCMA_STOP_E,
	input [15:0] PCMA_START_F, PCMA_STOP_F,
	
	inout [7:0] RAD,
	output [5:0] RA,
	output RMPX,
	output nROE,
	
	inout [7:0] PAD,
	output [3:0] PA,
	output PMPX,
	output nPOE,
	
	output reg [15:0] SAMPLE_OUT,
	
	input PCMB_RESET, PCMB_REPEAT, PCMB_START,
	input [1:0] PCMB_PAN,
	input [15:0] PCMB_START_ADDR,
	input [15:0] PCMB_STOP_ADDR,
	input [15:0] PCMB_DELTA,
	input [7:0] PCMB_TL
);

	wire FLAG_END_PCMB;

	reg CLK_SAMP_TEST;
	reg CLK_SAMP_PCMB;
	wire CLK_SAMP_A;
	wire CLK_SAMP_B;
	wire CLK_SAMP_C;
	wire CLK_SAMP_D;
	wire CLK_SAMP_E;
	wire CLK_SAMP_F;
	
	wire [5:0] FLAGS_END;
	wire [21:0] ADDR_A;
	wire [21:0] ADDR_B;
	wire [21:0] ADDR_C;
	wire [21:0] ADDR_D;
	wire [21:0] ADDR_E;
	wire [21:0] ADDR_F;
	wire [21:0] ADDR_PCMB;
	wire [7:0] RAD_DOUT;
	wire [7:0] PAD_DOUT;
	
	wire [13:0] JEDI_ADDR;
	wire [15:0] JEDI_DOUT;
	
	wire [9:0] ADPCM_STEP_MUX;
	wire [9:0] ADPCM_STEP_A;
	wire [9:0] ADPCM_STEP_B;
	wire [9:0] ADPCM_STEP_C;
	wire [9:0] ADPCM_STEP_D;
	wire [9:0] ADPCM_STEP_E;
	wire [9:0] ADPCM_STEP_F;
	wire [9:0] ADPCM_STEP_PCMB;
	
	wire [3:0] DATA_MUX;
	wire [3:0] DATA_A;
	wire [3:0] DATA_B;
	wire [3:0] DATA_C;
	wire [3:0] DATA_D;
	wire [3:0] DATA_E;
	wire [3:0] DATA_F;
	wire [3:0] DATA_PCMB;
	
	wire [15:0] SAMPLE_OUT_A;
	wire [15:0] SAMPLE_OUT_B;
	wire [15:0] SAMPLE_OUT_C;
	wire [15:0] SAMPLE_OUT_D;
	wire [15:0] SAMPLE_OUT_E;
	wire [15:0] SAMPLE_OUT_F;
	wire [15:0] SAMPLE_OUT_PCMB;
	
	reg [3:0] CLK_PCMA;
	reg CLK_PCMB;
	reg [2:0] SEQ_ACCESS;
	reg [5:0] SEQ_ACCESS_B;	// Probably simpler
	reg [2:0] SEQ_CHANNEL;
	
	wire [21:0] PCMA_ADDR;
	wire [21:0] PCMB_ADDR;
	wire ACCESS;
	

	
	assign ADPCM_FLAGS = { FLAG_END_PCMB, 1'b0, FLAGS_END };

	assign RAD = nROE ? RAD_DOUT : 8'bzzzzzzzz;
	assign PAD = nPOE ? PAD_DOUT : 8'bzzzzzzzz;
	
	assign JEDI_ADDR = ADPCM_STEP_MUX + DATA_MUX;
	
	jedi_lut u1(JEDI_DOUT, JEDI_ADDR);
	
	// ADPCM-A sampling clock selector
	assign CLK_SAMP_A = CLK_SAMP_TEST & (SEQ_CHANNEL == 0);
	assign CLK_SAMP_B = CLK_SAMP_TEST & (SEQ_CHANNEL == 1);
	assign CLK_SAMP_C = CLK_SAMP_TEST & (SEQ_CHANNEL == 2);
	assign CLK_SAMP_D = CLK_SAMP_TEST & (SEQ_CHANNEL == 3);
	assign CLK_SAMP_E = CLK_SAMP_TEST & (SEQ_CHANNEL == 4);
	assign CLK_SAMP_F = CLK_SAMP_TEST & (SEQ_CHANNEL == 5);
	
	assign PCMA_ADDR = (SEQ_CHANNEL == 0) ? ADDR_A : 			// Mux
								(SEQ_CHANNEL == 1) ? ADDR_B :
								(SEQ_CHANNEL == 2) ? ADDR_C :
								(SEQ_CHANNEL == 3) ? ADDR_D :
								(SEQ_CHANNEL == 4) ? ADDR_E :
								(SEQ_CHANNEL == 5) ? ADDR_F : 22'd0;
	assign DATA_MUX = (SEQ_CHANNEL == 0) ? DATA_A : 			// Mux
								(SEQ_CHANNEL == 1) ? DATA_B :
								(SEQ_CHANNEL == 2) ? DATA_C :
								(SEQ_CHANNEL == 3) ? DATA_D :
								(SEQ_CHANNEL == 4) ? DATA_E :
								(SEQ_CHANNEL == 5) ? DATA_F : 4'd0;
	assign ADPCM_STEP_MUX = (SEQ_CHANNEL == 0) ? ADPCM_STEP_A : 	// Mux
								(SEQ_CHANNEL == 1) ? ADPCM_STEP_B :
								(SEQ_CHANNEL == 2) ? ADPCM_STEP_C :
								(SEQ_CHANNEL == 3) ? ADPCM_STEP_D :
								(SEQ_CHANNEL == 4) ? ADPCM_STEP_E :
								(SEQ_CHANNEL == 5) ? ADPCM_STEP_F : 10'd0;
	
	assign RAD_DOUT = (SEQ_ACCESS[2:1] == 0) ? PCMA_ADDR[7:0] :	// 0~1
								PCMA_ADDR[17:10];		// 2~3 (4~5, don't care)
	assign RA = (SEQ_ACCESS[2:1] == 0) ? { 4'h0, PCMA_ADDR[9:8] } :	// 0~1
								{ 2'h0, PCMA_ADDR[21:18] };		// 2~3
	assign RMPX = ((SEQ_ACCESS == 1) || (SEQ_ACCESS == 2)) ? 1'b1 : 1'b0;
	assign nROE = (SEQ_ACCESS[2] == 1) ? 1'b0 : 1'b1;	// 4~5
	
	// This should be ok:
	assign PAD_DOUT = (SEQ_ACCESS_B[5:1] == 5'b01010) ? PCMB_ADDR[7:0] :	// 20~21
								PCMB_ADDR[19:12];		// All the others (don't care)
	assign PA = (SEQ_ACCESS_B[5:1] == 5'b010100) ? PCMB_ADDR[11:8] :	// 20~21
								{ 2'h0, PCMB_ADDR[21:20] };		// All the others (don't care)
	assign PMPX = ACCESS ? ((SEQ_ACCESS_B == 21) || (SEQ_ACCESS_B == 22)) ? 1'b1 : 1'b0 : 1'b0;
	assign nPOE = ACCESS ? (SEQ_ACCESS_B[5:1] == 5'b01100) ? 1'b0 : 1'b1 : 1'b1;	// 24~25
	
	always @(posedge PHI_M)
	begin
		if (!nRESET)
		begin
			CLK_PCMA <= 0;
			CLK_PCMB <= 0;
			SEQ_ACCESS <= 0;
			SEQ_ACCESS_B <= 0;
			SEQ_CHANNEL <= 0;
		end
		else
		begin
		
			// 4M
			CLK_PCMB <= ~CLK_PCMB;
			
			if (CLK_PCMB)
			begin
				if ((SEQ_ACCESS_B == 24) && (ACCESS)) CLK_SAMP_PCMB <= 1'b1;	// Probably simpler
				
				if (SEQ_ACCESS_B < 35)	// Probably simpler
					SEQ_ACCESS_B <= SEQ_ACCESS_B + 1'b1;
				else
					SEQ_ACCESS_B <= 0;
			end
			else
				CLK_SAMP_PCMB <= 1'b0;
			
			
			// Access slot: 8M / 12
			// Channel slot: 8M / 12 / 6 (6 channels)
			// Complete cycle: 8M / 12 / 6 / 6 (6 channels, 6 access slot per channel)
			
			if (CLK_PCMA < 11)
			begin
				CLK_PCMA <= CLK_PCMA + 1'b1;
				CLK_SAMP_TEST <= 1'b0;
			end
			else
			begin
				// Access cycle here
				CLK_PCMA <= 0;
				
				if (SEQ_ACCESS == 4) CLK_SAMP_TEST <= 1'b1;
				
				if (SEQ_ACCESS < 5)
					SEQ_ACCESS <= SEQ_ACCESS + 1'b1;
				else
				begin
					SEQ_ACCESS <= 0;
					// Channel done, next
					
					// Mix
					SAMPLE_OUT <= SAMPLE_OUT_A + SAMPLE_OUT_B + SAMPLE_OUT_C +
										SAMPLE_OUT_D + SAMPLE_OUT_E + SAMPLE_OUT_F + SAMPLE_OUT_PCMB;
					
					if (SEQ_CHANNEL < 5)
						SEQ_CHANNEL <= SEQ_CHANNEL + 1'b1;
					else
					begin
						// Cycle done, repeat :)
						SEQ_CHANNEL <= 0;
					end
					
				end
			end
		end
	end
	
	ch_pcma	CH_1(PHI_M, CLK_SAMP_A, nRESET,
						PCMA_FLAGMASK[0], FLAGS_END[0], PCMA_KEYON[0], PCMA_KEYOFF[0], JEDI_DOUT[11:0],
						PCMA_START_A, PCMA_STOP_A, PCMA_VOLPAN_A,
						ADDR_A, DATA_A, ADPCM_STEP_A, RAD, SAMPLE_OUT_A);

	ch_pcma	CH_2(PHI_M, CLK_SAMP_B, nRESET,
						PCMA_FLAGMASK[1], FLAGS_END[1], PCMA_KEYON[1], PCMA_KEYOFF[1], JEDI_DOUT[11:0],
						PCMA_START_B, PCMA_STOP_B, PCMA_VOLPAN_B,
						ADDR_B, DATA_B, ADPCM_STEP_B, RAD, SAMPLE_OUT_B);
						
	ch_pcma	CH_3(PHI_M, CLK_SAMP_C, nRESET,
						PCMA_FLAGMASK[2], FLAGS_END[2], PCMA_KEYON[2], PCMA_KEYOFF[2], JEDI_DOUT[11:0],
						PCMA_START_C, PCMA_STOP_C, PCMA_VOLPAN_C,
						ADDR_C, DATA_C, ADPCM_STEP_C, RAD, SAMPLE_OUT_C);

	ch_pcma	CH_4(PHI_M, CLK_SAMP_D, nRESET,
						PCMA_FLAGMASK[3], FLAGS_END[3], PCMA_KEYON[3], PCMA_KEYOFF[3], JEDI_DOUT[11:0],
						PCMA_START_D, PCMA_STOP_D, PCMA_VOLPAN_D,
						ADDR_D, DATA_D, ADPCM_STEP_D, RAD, SAMPLE_OUT_D);

	ch_pcma	CH_5(PHI_M, CLK_SAMP_E, nRESET,
						PCMA_FLAGMASK[4], FLAGS_END[4], PCMA_KEYON[4], PCMA_KEYOFF[4], JEDI_DOUT[11:0],
						PCMA_START_E, PCMA_STOP_E, PCMA_VOLPAN_E,
						ADDR_E, DATA_E, ADPCM_STEP_E, RAD, SAMPLE_OUT_E);
						
	ch_pcma	CH_6(PHI_M, CLK_SAMP_F, nRESET,
						PCMA_FLAGMASK[5], FLAGS_END[5], PCMA_KEYON[5], PCMA_KEYOFF[5], JEDI_DOUT[11:0],
						PCMA_START_F, PCMA_STOP_F, PCMA_VOLPAN_F,
						ADDR_F, DATA_F, ADPCM_STEP_F, RAD, SAMPLE_OUT_F);
						
	ch_pcmb	CH_7(PHI_M, TICK_144, CLK_SAMP_PCMB, nRESET,
						PCMA_FLAGMASK_PCMB, FLAG_END_PCMB, PCMB_START, PCMB_RESET, PCMB_REPEAT,
						PCMB_TL, PCMB_PAN, PCMB_DELTA, PCMB_START_ADDR, PCMB_STOP_ADDR,
						PCMB_ADDR, PAD, SAMPLE_OUT_PCMB, ACCESS);
	
endmodule
