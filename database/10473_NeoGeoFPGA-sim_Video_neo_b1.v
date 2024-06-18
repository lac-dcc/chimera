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

// All pins listed OK

module neo_b1(
	input CLK_6MB,				// 1px
	input CLK_1MB,				// 3MHz 2px Even/odd pixel selection
	
	input [23:0] PBUS,		// Used to retrieve LB addresses loads, SPR palette # and FIX palette # from LSPC
	input [7:0] FIXD,			// 2 fix pixels
	input PCK1,
	input PCK2,
	input CHBL,					// Force PA to zeros
	input BNKB,					// For Watchdog and PA
	input [3:0] GAD, GBD,	// 2 sprite pixels
	input WE1,					// LB writes
	input WE2,
	input WE3,
	input WE4,
	input CK1,					// LB address counter clocks
	input CK2,
	input CK3,
	input CK4,
	input TMS0,					// LB flip
	input LD1, LD2,			// Load LB addresses
	input SS1, SS2,			// Clearing enable for each LB
	input S1H1,					// 3MHz offset from CLK_1MB
	
	input A23I, A22I,
	output [11:0] PA,			// Palette address bus
	
	input nLDS,					// For watchdog kick
	input RW,
	input nAS,
	input [21:17] M68K_ADDR_U,
	input [12:1] M68K_ADDR_L,
	output nHALT,
	output nRESET,
	input nRST
);

	reg nCPU_ACCESS;
	reg [7:0] FIXD_REG;
	reg [3:0] FIX_PAL_REG;
	wire [3:0] FIX_COLOR;
	wire [3:0] SPR_COLOR;
	wire [11:0] RAMBL_OUT;
	wire [11:0] RAMBR_OUT;
	wire [11:0] RAMTL_OUT;
	wire [11:0] RAMTR_OUT;
	wire [7:0] SPR_PAL;
	wire [1:0] MUX_BA;
	wire [11:0] PA_MUX_A;
	wire [11:0] PA_MUX_B;
	wire [11:0] RAM_MUX_OUT;
	reg [11:0] PA_VIDEO;
	
	//parameter TEST_MODE = 0;	// "XMM" pin
	
	initial
		nCPU_ACCESS <= 1'b1;		// Only useful when the 68k is disabled
	
	assign nHALT = nRESET;		// Yup (also those are open-collector)

	// 2px fix data reg
	// BEKU AKUR...
	always @(posedge CLK_1MB)
		FIXD_REG <= FIXD;
	
	// Switch between odd/even fix pixel
	// BEVU AWEQ...
	assign FIX_COLOR = S1H1 ? FIXD_REG[7:4] : FIXD_REG[3:0];

	// IDUF
	assign FIX_OPAQUE = |{FIX_COLOR};

	// GETU FUCA...
	always @(posedge PCK1)
		FIX_PAL_REG <= PBUS[19:16];

	assign SPR_PAL = PBUS[23:16];
	
	linebuffer RAMBL(CK1, WE1, LD1, SS1, GAD, PCK2, SPR_PAL, PBUS[7:0], RAMBL_OUT);
	linebuffer RAMBR(CK2, WE2, LD1, SS1, GBD, PCK2, SPR_PAL, PBUS[15:8], RAMBR_OUT);
	linebuffer RAMTL(CK3, WE3, LD2, SS2, GAD, PCK2, SPR_PAL, PBUS[7:0], RAMTL_OUT);
	linebuffer RAMTR(CK4, WE4, LD2, SS2, GBD, PCK2, SPR_PAL, PBUS[15:8], RAMTR_OUT);
	
	assign MUX_BA = {TMS0, S1H1};
	
	/*
	assign VORU = S1H1 & TMS0;
	assign VOTO = S1H1 & ~TMS0;
	assign VEZA = ~S1H1 & TMS0;
	assign VOKE = ~S1H1 & ~TMS0;
	*/
	
	// Output buffer select
	// MEGA MAKA MEJU ORUG...
	assign RAM_MUX_OUT = 
							(MUX_BA == 2'b00) ? RAMBR_OUT :
							(MUX_BA == 2'b01) ? RAMBL_OUT :
							(MUX_BA == 2'b10) ? RAMTR_OUT :
							RAMTL_OUT;
	
	// Priority for palette address bus (PA):
	// -CPU over everything else
	// -CHBL (h-blank)
	// -Fix pixel if opaque
	// -Line buffers (sprites) ouput
	
	// CPU palette RAM access decode
	// JAGU JURA...
	always @(negedge nAS)
		nCPU_ACCESS <= A23I | ~A22I;
	
	// Fix/Sprite/Blanking select
	// KUQA KUTU JARA...
	assign PA_MUX_A = FIX_OPAQUE ? {4'b0000, FIX_PAL_REG, FIX_COLOR} : RAM_MUX_OUT;
	assign PA_MUX_B = CHBL ? 12'h000 : PA_MUX_A;

	// KAWE KESE...
	always @(posedge CLK_6MB)
		PA_VIDEO <= PA_MUX_B;
	
	// KUTE KENU...
	assign PA = nCPU_ACCESS ? PA_VIDEO : M68K_ADDR_L;


	// Note: nRESET is sync'd to frame start
	watchdog WD(nLDS, RW, A23I, A22I, M68K_ADDR_U, BNKB, nHALT, nRESET, nRST);
	
endmodule
