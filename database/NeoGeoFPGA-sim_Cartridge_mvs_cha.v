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

module mvs_cha(
	input [15:0] SDA,
	
	input nSLOTCS,
	
	output [31:0] CR,
	input CA4, S2H1,
	input PCK2B, PCK1B,
	input [23:0] PBUS,
	
	input CLK_24M, CLK_12M, CLK_8M,
	input nRESET,
	
	output [7:0] FIXD,

	input SDRD0, SDRD1, nSDROM, nSDMRD,
	
	inout [7:0] SDD
);

	wire [19:0] C_LATCH;
	reg [1:0] C_LATCH_U;
	wire [15:0] S_LATCH;
	wire [20:0] C_ADDR;
	wire [16:0] S_ADDR;
	wire [15:0] C_ODD_DATA;
	wire [15:0] C_EVEN_DATA;
	wire [21:11] MA;
	
	assign C_ADDR = {C_LATCH[19:4], CA4, C_LATCH[3:0]};
	assign S_ADDR = {S_LATCH[15:3], S2H1, S_LATCH[2:0]};
	
	// Todo: Byteswap the C ROMs correctly
	// This should be {C_EVEN_DATA, C_ODD_DATA} :
	assign CR = {C_EVEN_DATA[7:0], C_EVEN_DATA[15:8], C_ODD_DATA[7:0], C_ODD_DATA[15:8]};
	
	rom_c1 C1(C_ADDR, C_ODD_DATA, nPAIR0_CE);
	rom_c2 C2(C_ADDR, C_EVEN_DATA, nPAIR0_CE);
	rom_c3 C3(C_ADDR, C_ODD_DATA, nPAIR1_CE);
	rom_c4 C4(C_ADDR, C_EVEN_DATA, nPAIR1_CE);
	
	rom_s1 S1(S_ADDR, FIXD);
	
	// Joyjoy doesn't use ZMC
	//rom_m1 M1(SDA, SDD, nSDROM, nSDMRD);
	// Metal Slug:
	rom_m1 M1({MA[16:11], SDA[10:0]}, SDD, nSDROM, nSDMRD);
	
	zmc ZMC(SDRD0, SDA[1:0], SDA[15:8], MA);
	
	neo_273 N273(PBUS[19:0], PCK1B, PCK2B, C_LATCH, S_LATCH);
	
	// Metal Slug: LS74 for the additionnal bit
	always @(posedge PCK1B)
	begin
		C_LATCH_U <= {1'bz, PBUS[21:20]};
	end
	
	// Metal Slug: LS139 to select pair of C ROMs
	assign nPAIR0_CE = (C_LATCH_U[0] == 1'b0) ? 1'b0 : 1'b1;
	assign nPAIR1_CE = (C_LATCH_U[0] == 1'b1) ? 1'b0 : 1'b1;

endmodule
