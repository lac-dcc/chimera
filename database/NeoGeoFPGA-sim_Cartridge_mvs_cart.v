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

module mvs_cart(
	input nRESET,
	input CLK_24M, CLK_12M, CLK_8M, CLK_68KCLKB, CLK_4MB,
	
	input nAS, M68K_RW,
	input [19:1] M68K_ADDR,
	inout [15:0] M68K_DATA,
	input nROMOE, nROMOEL, nROMOEU,
	input nPORTADRS, nPORTOEL, nPORTOEU, nPORTWEL, nPORTWEU, 
	output nROMWAIT, nPWAIT0, nPWAIT1, PDTACK,
	
	input nSLOTCS,
	
	input [23:0] PBUS,
	input CA4,
	input S2H1,
	input PCK1B,
	input PCK2B,
	output [31:0] CR,
	output [7:0] FIXD,
	
	inout [7:0] SDRAD,
	input [9:8] SDRA_L,
	input [23:20] SDRA_U,
	input SDRMPX, nSDROE,
	
	inout [7:0] SDPAD,
	input [11:8] SDPA,
	input SDPMPX, nSDPOE,
	
	input SDRD0, SDRD1, nSDROM, nSDMRD,
	input [15:0] SDA,
	inout [7:0] SDD
);
	
	mvs_prog PROG(nSDROE, SDRMPX, SDRA_U, SDRA_L, nSDPOE, SDPMPX, SDPA, nSLOTCS, nPORTADRS, nPORTWEL, nPORTWEU,
						nPORTOEL, nPORTOEU, nROMOEL, nROMOEU, nAS, M68K_RW, M68K_DATA, M68K_ADDR, CLK_68KCLKB, nROMWAIT,
						nPWAIT0, nPWAIT1, PDTACK, nROMOE, CLK_4MB, nRESET, SDPAD, SDRAD);
	
	mvs_cha CHA(SDA, nSLOTCS, CR, CA4, S2H1, PCK2B, PCK1B, PBUS, CLK_24M, CLK_12M, CLK_8M, nRESET, FIXD,
						SDRD0, SDRD1, nSDROM, nSDMRD, SDD);

endmodule
