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

module mvs_prog(
	input nSDROE, RMPX,
	input [23:20] RA_U,
	input [9:8] RA_L,
	
	input nSDPOE, PMPX,
	input [11:8] PA,
	
	input nSLOTCS,
	input nPORTADRS, nPORTWEL, nPORTWEU, nPORTOEL, nPORTOEU,
	input nROMOEL, nROMOEU,
	
	input nAS, M68K_RW,
	inout [15:0] M68K_DATA,
	input [19:1] M68K_ADDR,
	input CLK_68KCLKB,
	output nROMWAIT, nPWAIT0, nPWAIT1, PDTACK,
	input nROMOE,
	
	input CLK_4MB, nRESET,

	inout [7:0] PAD,
	inout [7:0] RAD
);

	//wire nPORTOE;
	reg [23:0] V1_ADDR;
	reg [23:0] V2_ADDR;
	wire [23:0] V_ADDR;
	wire [7:0] V_DATA;
	
	//assign nPORTOE = nPORTOEL & nPORTOEU;
	
	// Waitstate configuration
	assign nROMWAIT = 1'b1;
	assign nPWAIT0 = 1'b1;
	assign nPWAIT1 = 1'b1;
	assign PDTACK = 1'b1;
	
	// Joy Joy Kid doesn't use PCM
	pcm PCM(CLK_68KCLKB, nSDROE, RMPX, nSDPOE, PMPX, RAD, RA_L, RA_U, PAD, PA, V_DATA, V_ADDR);
	
	// Joy Joy Kid:
	//rom_p1 P1(M68K_ADDR[18:1], M68K_DATA, M68K_ADDR[19], nROMOE);
	// Metal Slug:
	rom_p1 P1({nPORTADRS, M68K_ADDR[19:1]}, M68K_DATA, 1'b0, nP1OE);
	
	// Metal Slug: LS08s to enable P1
	assign nPORTOE = nPORTOEL & nPORTOEU;
	assign nP1OE = nROMOE & nPORTOE;
	
	// Joy Joy Kid doesn't have a P2
	//rom_p2 P2(M68K_ADDR[16:0], M68K_DATA, nPORTOE);
	
	// Joy Joy Kid:
	//rom_v1 V1(V1_ADDR[18:0], RAD, nROE);
	//rom_v2 V2(V2_ADDR[18:0], PAD, nPOE);
	// Metal Slug:
	rom_v1 V1(V_ADDR[21:0], V_DATA, nV1_OE);
	rom_v2 V2(V_ADDR[21:0], V_DATA, nV2_OE);
	
	// Metal Slug: LS139 to switch V ROMs
	assign nV1_OE = (V_ADDR[22:21] == 2'b00) ? 1'b0 : 1'b1;
	assign nV2_OE = (V_ADDR[22:21] == 2'b01) ? 1'b0 : 1'b1;
	
	// V ROMs address latches (discrete)
	/*always @(posedge RMPX)
		V1_ADDR[9:0] <= {RA_L[9:8], RAD};

	always @(negedge RMPX)
		V1_ADDR[23:10] <= {RA_U[23:20], RA_L[9:8], RAD};

	always @(posedge PMPX)
		V2_ADDR[11:0] <= {PA[11:8], PAD};
		
	always @(negedge PMPX)
		V2_ADDR[23:12] <= {PA[11:8], PAD};*/
	
endmodule
