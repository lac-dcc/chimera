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

module videosync(
	input CLK_24MB,
	input LSPC_3M,
	input LSPC_1_5M,
	input Q53_CO,
	input RESETP,
	input VMODE,
	output [8:0] PIXELC,
	output [8:0] RASTERC,
	output SYNC,
	output BNK,
	output BNKB,
	output CHBL,
	output R15_QD,
	output FLIP,
	output nFLIP,
	output P50_CO
);
	
	wire [3:0] S122_REG;
	wire [3:0] R15_REG;
	wire [3:0] T116_REG;
	
	assign R15_QD = R15_REG[3];
	
	FDPCell H287(J22_OUT, H287_nQ, 1'b1, RESETP, H287_Q, H287_nQ);
	assign nFLIP = ~H287_Q;
	assign FLIP = ~H287_nQ;
	
	// Pixel counter
	
	// Used for test mode
	assign P40A_OUT = P50_CO | 1'b0;
	
	assign PIXELC = {P15_QC, P15_QB, P15_QA, P50_QD, P50_QC, P50_QB, P50_QA, LSPC_1_5M, LSPC_3M};
	
	C43 P50(CLK_24MB, 4'b1110, RESETP, Q53_CO, 1'b1, 1'b1, {P50_QD, P50_QC, P50_QB, P50_QA}, P50_CO);
	C43 P15(CLK_24MB, {3'b101, ~RESETP}, P13B_OUT, Q53_CO, P40A_OUT, 1'b1, {P15_QD, P15_QC, P15_QB, P15_QA}, P15_CO);

	assign P39B_OUT = P15_CO & Q53_CO;
	assign P13B_OUT = ~|{P39B_OUT, ~RESETP};
	
	
	
	// Raster counter
	
	// Used for test mode
	assign J22_OUT = P15_QC ^ 1'b0;
	assign H284A_OUT = I269_CO | 1'b0;
	
	C43 I269(J22_OUT, {~VMODE, 3'b100}, ~J268_CO, FLIP, FLIP, RESETP, RASTERC[4:1], I269_CO);
	C43 J268(J22_OUT, {3'b011, ~VMODE}, ~J268_CO, H284A_OUT, H284A_OUT, RESETP, RASTERC[8:5], J268_CO);
	assign RASTERC[0] = FLIP;
	
	
	
	// H277B H269B H275A
	assign MATCH_PAL = ~&{RASTERC[4:3]} | RASTERC[5] | RASTERC[8];
	
	FDM H272(RASTERC[2], MATCH_PAL, H272_Q, );
	FDM I238(FLIP, H272_Q, BLANK_PAL, );
	
	// J259A
	assign MATCH_NTSC = ~&{RASTERC[7:5]};
	
	// J251
	FD4 J251(~RASTERC[4], MATCH_NTSC, 1'b1, RESETP, BLANK_NTSC, );
	
	// J240A: T2E
	assign VSYNC = VMODE ? BLANK_PAL : RASTERC[8];
	assign BNK = ~(VMODE ? RASTERC[8] : BLANK_NTSC);
	
	// K15B
	assign BNKB = ~BNK;
	
	assign #1 S136A_OUT = ~LSPC_1_5M;
	
	// P13A
	assign #1 nPIXEL_H256 = ~P15_QC;
	assign P13A_OUT = P15_QA & nPIXEL_H256;
	
	FS1 R15(S136A_OUT, P13A_OUT, R15_REG);
	BD3 S51(R15_REG[3], S51_OUT);
	FS1 T116(S136A_OUT, ~S51_OUT, T116_REG);
	BD3 U127(T116_REG[3], U127_OUT);
	FS1 S122(S136A_OUT, ~U127_OUT, S122_REG);
	BD3 S119A(S122_REG[3], S119_OUT);
	FD2 S116(S136A_OUT, S119_OUT, S116_Q, );
	
	// S131A
	assign HSYNC = ~&{S116_Q, ~T116_REG[1]};
	
	// M149
	assign SYNC = ~^{HSYNC, VSYNC};
	
	// L40A
	assign CHBL = ~&{BNKB, R15_REG[3]};

endmodule
