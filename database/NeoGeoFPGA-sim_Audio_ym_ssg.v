// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

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

module ym_ssg(
	input PHI_S,
	output [5:0] ANA,
	
	input [11:0] SSG_FREQ_A, SSG_FREQ_B, SSG_FREQ_C,
	input [4:0] SSG_NOISE,
	input [5:0] SSG_EN,
	input [4:0] SSG_VOL_A, SSG_VOL_B, SSG_VOL_C,
	input [15:0] SSG_ENV_FREQ,
	input [3:0] SSG_ENV
);

	reg [4:0] CNT_NOISE;
	reg [17:0] LFSR;
	reg [15:0] CNT_ENV;
	
	reg ENV_RUN;
	reg [3:0] ENV_STEP;
	reg [3:0] ENV_ATTACK;
	reg NOISE;
	
	wire [3:0] OUT_A, OUT_B, OUT_C;
	wire [3:0] LEVEL_A, LEVEL_B, LEVEL_C;
	wire [3:0] ENV_VOL;
	
	assign ENV_VOL = ENV_STEP ^ ENV_ATTACK;
	
	assign LEVEL_A = SSG_VOL_A[4] ? ENV_VOL : SSG_VOL_A[3:0];
	assign LEVEL_B = SSG_VOL_B[4] ? ENV_VOL : SSG_VOL_B[3:0];
	assign LEVEL_C = SSG_VOL_C[4] ? ENV_VOL : SSG_VOL_C[3:0];
	
	// Gate: (OSC | nOSCEN) & (NOISE | nNOISEEN)
	assign OUT_A = ((OSC_A | SSG_EN[0]) & (NOISE | SSG_EN[3])) ? LEVEL_A : 4'b0000;
	assign OUT_B = ((OSC_B | SSG_EN[1]) & (NOISE | SSG_EN[4])) ? LEVEL_B : 4'b0000;
	assign OUT_C = ((OSC_C | SSG_EN[2]) & (NOISE | SSG_EN[5])) ? LEVEL_C : 4'b0000;
	
	assign ANA = OUT_A + OUT_B + OUT_C;
	
	ssg_ch SSG_A(PHI_S, SSG_FREQ_A, OSC_A);
	ssg_ch SSG_B(PHI_S, SSG_FREQ_B, OSC_B);
	ssg_ch SSG_C(PHI_S, SSG_FREQ_C, OSC_C);

	always @(posedge PHI_S)		// ?
	begin
		if (CNT_NOISE)
			CNT_NOISE <= CNT_NOISE - 1'b1;
		else
		begin		
			CNT_NOISE <= SSG_NOISE;
			if (LFSR[0] ^ LFSR[1]) NOISE <= ~NOISE;
			if (LFSR[0])
			begin
				LFSR[17] <= ~LFSR[17];
				LFSR[14] <= ~LFSR[14];
			end
			LFSR <= {1'b0, LFSR[17:1]};
		end
		
		// Todo: Set ENV_ATTACK to 0000 or 1111 according to SSG_ENV[2] when write
		if (ENV_RUN)
		begin
			if (CNT_ENV)
				CNT_ENV <= CNT_ENV - 1'b1;
			else
			begin
				CNT_ENV <= SSG_ENV_FREQ;
				if (ENV_STEP)
					ENV_STEP <= ENV_STEP - 1'b1;
				else
				begin
					if (SSG_ENV[0])	// Hold
					begin
						if (SSG_ENV[1]) ENV_ATTACK <= ~ENV_ATTACK;	// Alt
						ENV_RUN <= 0;
					end
					else
					begin
						if (SSG_ENV[1]) ENV_ATTACK <= ~ENV_ATTACK;	// Alt
						// Todo: wrong and missing things here
					end
				end
			end
		end
	end
	
endmodule
