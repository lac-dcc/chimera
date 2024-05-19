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
// `default_nettype none

// SNK NeoGeo FPGA hardware definitions (for simulation only)
// furrtek, Charles MacDonald, Kyuusaku, freem and neogeodev contributors ~ 2016
// https://github.com/neogeodev/NeoGeoFPGA-sim

// Todo: VPA for interrupt ACK (NEO-C1)

module neogeo(
	input nRESET_BTN,		// VCCON on MVS
	
	// Player inputs
	input [9:0] P1_IN,
	input [9:0] P2_IN,
	
	input [7:0] DIPSW,
	
	// 68K CPU
	inout [15:0] M68K_DATA,
	output [23:1] M68K_ADDR,	// Should only expose [19:1] to cartridge
	output M68K_RW, nAS, nLDS, nUDS,
	output [2:0] LED_LATCH,
	output [7:0] LED_DATA,

	// Cartridge clocks
	output CLK_68KCLKB, CLK_8M, CLK_4MB,
	
	// Cartridge 68K ROMs
	output nROMOE, nSLOTCS,
	input nROMWAIT, nPWAIT0, nPWAIT1, PDTACK,
	output nPORTOEL, nPORTOEU,
	output nPORTWEL, nPORTWEU,
	output nPORTADRS,
	
	// Cartridge PCM ROMs
	input [7:0] SDRAD,
	output [9:8] SDRA_L,
	output [23:20] SDRA_U,
	output SDRMPX, nSDROE,
	input [7:0] SDPAD,
	output [11:8] SDPA,
	output SDPMPX, nSDPOE,
	
	// Cartridge Z80 ROMs
	output nSDROM, nSDMRD,
	output [15:0] SDA,
	inout [7:0] SDD,
	
	// Cartridge/onboard gfx ROMs
	inout [23:0] PBUS,
	output nVCS,
	output S2H1, CA4,
	output PCK1B, PCK2B,
	
	// Gfx
	output CLK_12M, EVEN, LOAD, H,
	input [3:0] GAD, GBD,
	input [7:0] FIXD_CART,
	
	// Memcard
	output [4:0] CDA_U,			// Memcard upper address lines
	output nCRDC, nCRDO, CARD_PIN_nWE, CARD_PIN_nREG,
	input nCD1, nCD2, nWP,
	
	output [6:0] VIDEO_R,
	output [6:0] VIDEO_G,
	output [6:0] VIDEO_B,
	output VIDEO_SYNC
	
	// Serial video output
	//output VIDEO_R_SER, VIDEO_G_SER, VIDEO_B_SER, VIDEO_CLK_SER, VIDEO_LAT_SER,
	
	// I2S audio output
	//output I2S_MCLK, I2S_BICK, I2S_SDTI, I2S_LRCK
);

	parameter SYSTEM_MODE = 1'b1;		// MVS
	
	
	wire [7:0] FIXD;
	wire [7:0] FIXD_SFIX;
	wire [15:0] G;				// SFIX address bus
	
	wire [23:0] CDA;
	wire [2:0] BNK;
	
	wire [11:0] PA;			// Palette RAM address
	wire [15:0] PC;			// Palette RAM data
	
	wire [3:0] WE;				// LSPC/B1
	wire [3:0] CK;				// LSPC/B1
	
	wire [5:0] nSLOT;
	
	wire [2:0] P1_OUT;
	wire [2:0] P2_OUT;
	
	wire [5:0] ANA;			// SSG audio level
/*	wire [6:0] VIDEO_R;
	wire [6:0] VIDEO_G;
	wire [6:0] VIDEO_B;*/
	
	// Implementation specific (unique slot)
	assign nSLOTCS = nSLOT[0];
	
	// Are these good ?
	assign nBITWD0 = |{nBITW0, M68K_ADDR[6:5]};
	assign nCOUNTOUT = |{nBITW0, ~M68K_ADDR[6:5]};
	
	// DEBUG: Disabled 68k
	cpu_68k M68KCPU(CLK_68KCLK, nRESET, IPL1, IPL0, nDTACK, M68K_ADDR, M68K_DATA, nLDS, nUDS, nAS, M68K_RW);
	/*assign M68K_ADDR = 24'h000000;
	assign M68K_DATA = 16'hzzzz;
	assign nLDS = 1'b1;
	assign nUDS = 1'b1;
	assign nAS = 1'b1;
	assign M68K_RW = 1'b1;*/
	
	cpu_z80 Z80CPU(CLK_4M, nRESET, SDD, SDA, nIORQ, nMREQ, nSDRD, nSDWR, nZ80INT, nZ80NMI);
	
	neo_c1 C1(M68K_ADDR[21:17], M68K_DATA[15:8], A22Z, A23Z, nLDS, nUDS, M68K_RW, nAS, nROMOEL, nROMOEU,
				nPORTOEL, nPORTOEU, nPORTWEL, nPORTWEU, nPORTADRS, nWRL, nWRU, nWWL, nWWU, nSROMOEL, nSROMOEU, 
				nSRAMOEL, nSRAMOEU, nSRAMWEL, nSRAMWEU, nLSPOE, nLSPWE, nCRDO, nCRDW, nCRDC, nSDW, P1_IN, P2_IN,
				nCD1, nCD2, nWP, nROMWAIT, nPWAIT0, nPWAIT1, PDTACK, SDD, nSDZ80R, nSDZ80W, nSDZ80CLR, CLK_68KCLK,
				nDTACK, nBITW0, nBITW1, nDIPRD0, nDIPRD1, nPAL, SYSTEM_MODE);
	
	neo_d0 D0(CLK_24M, nRESET, nRESETP, CLK_12M, CLK_68KCLK, CLK_68KCLKB, CLK_6MB, CLK_1MB, M68K_ADDR[4],
				nBITWD0, M68K_DATA[5:0], SDA[15:11], SDA[4:2], nSDRD, nSDWR, nMREQ, nIORQ, nZ80NMI, nSDW, nSDZ80R,
				nSDZ80W, nSDZ80CLR, nSDROM, nSDMRD, nSDMWR, SDRD0, SDRD1, n2610CS, n2610RD, n2610WR, nZRAMCS,
				BNK, P1_OUT, P2_OUT);
	
	// Fix to prevent TV80 from going nuts because the data bus is open on port reads for NEO-ZMC
	assign SDD = (SDRD0 & SDRD1) ? 8'bzzzzzzzz : 8'b00000000;
	
	neo_e0 E0(M68K_ADDR[23:1], BNK[2:0], nSROMOEU, nSROMOEL, nSROMOE,
				nVEC, A23Z, A22Z, CDA);
	
	neo_f0 F0(nRESET, nDIPRD0, nDIPRD1, nBITWD0, DIPSW, M68K_ADDR[7:4], M68K_DATA[7:0], SYSTEMB, nSLOT, SLOTA,
				SLOTB, SLOTC, LED_LATCH, LED_DATA, RTC_DOUT, RTC_TP, RTC_DIN, RTC_CLK, RTC_STROBE);
	
	neo_i0 I0(nRESET, nCOUNTOUT, M68K_ADDR[3:1], M68K_ADDR[7], COUNTER1, COUNTER2, LOCKOUT1, LOCKOUT2,
				PBUS[15:0], PCK2B, G);
	
	syslatch SL(M68K_ADDR[4:1], nBITW1, nRESET,
				SHADOW, nVEC, nCARDWEN, CARDWENB, nREGEN, nSYSTEM, nSRAMWEN, PALBNK);

	// Normally in ZMC2, saves 2 FPGA inputs
	assign {DOTA, DOTB} = {|GAD, |GBD};
	
	assign CDA_U = CDA[23:19];
	
	lspc2_a2 LSPC2(CLK_24M, nRESET, PBUS[15:0], PBUS[23:16], M68K_ADDR[3:1], M68K_DATA, nLSPOE, nLSPWE, DOTA, DOTB, CA4, S2H1,
				S1H1, LOAD, H, EVEN1, EVEN2, IPL0, IPL1, TMS0, LD1, LD2, PCK1, PCK2, WE[3:0], CK[3:0], SS1,
				SS2, nRESETP, VIDEO_SYNC, CHBL, nBNKB, nVCS, CLK_8M, CLK_4M);
	
	assign EVEN = EVEN1;
	
	neo_b1 B1(CLK_6MB, CLK_1MB, PBUS, FIXD, PCK1, PCK2, CHBL, nBNKB, GAD, GBD, WE[0], WE[1], WE[2], WE[3],
				CK[0], CK[1], CK[2], CK[3], TMS0, LD1, LD2, SS1, SS2, S1H1, A23Z, A22Z, PA, nLDS, M68K_RW, nAS,
				M68K_ADDR[21:17], M68K_ADDR[12:1], nHALT, nRESET, nRESET_BTN);
	
	ram_68k M68KRAM(M68K_ADDR[15:1], M68K_DATA, nWWL, nWWU, nWRL, nWRU);
	z80ram ZRAM(SDA[10:0], SDD, nZRAMCS, nSDMRD, nSDMWR);
	palram PALRAM({PALBNK, PA}, PC, nPALWE);
	
	// Embedded ROMs (flash)
	rom_sps2 SP(M68K_ADDR[16:1], {M68K_DATA[7:0], M68K_DATA[15:8]}, nSROMOE);
	rom_l0 L0(PBUS[15:0], PBUS[23:16], nVCS);
	rom_sfix SFIX({G[15:3], S2H1, G[2:0]}, FIXD_SFIX, nSYSTEM);

	// SFIX / Cart FIX switch
	assign FIXD = nSYSTEM ? FIXD_CART : FIXD_SFIX;
	
	ym2610 YM(CLK_8M, nRESET, SDD, SDA[1:0], nZ80INT, n2610CS, n2610WR, n2610RD, SDRAD, {SDRA_U, SDRA_L}, SDRMPX,
				nSDROE, SDPAD, SDPA, SDPMPX, nSDPOE, ANA, SH1, SH2, OP0, PHI_S);
	
	ym2i2s YM2I2S(nRESET, CLK_I2S, ANA, SH1, SH2, OP0, PHI_S, I2S_MCLK, I2S_BICK, I2S_SDTI, I2S_LRCK);
	
	// MVS only
	upd4990 RTC(CLK_RTC, 1'b1, 1'b1, RTC_CLK, RTC_DIN, RTC_STROBE, RTC_TP, RTC_DOUT);

	videout VOUT(CLK_6MB, nBNKB, SHADOW, PC, VIDEO_R, VIDEO_G, VIDEO_B);
	/*ser_video SERVID(nRESET, CLK_SERVID, CLK_6MB, VIDEO_R, VIDEO_G, VIDEO_B,
						VIDEO_R_SER, VIDEO_G_SER, VIDEO_B_SER, VIDEO_CLK_SER, VIDEO_LAT_SER);*/
						
	// Sim only
	logger LOGGER(CLK_6MB, nBNKB, SHADOW, COUNTER1, COUNTER2, LOCKOUT1, LOCKOUT2);
	
	// nSRAMCS comes from analog battery backup circuit
	assign nSRAMCS = 1'b0;
	sram SRAM(M68K_DATA, M68K_ADDR[15:1], nBWL, nBWU, nSRAMOEL, nSRAMOEU, nSRAMCS);
	assign nSWE = nSRAMWEN | nSRAMCS;
	assign nBWL = nSRAMWEL | nSWE;
	assign nBWU = nSRAMWEU | nSWE;
	
	// Unique gates
	assign PCK1B = ~PCK1;
	assign PCK2B = ~PCK2;
	assign nPALWE = M68K_RW | nPAL;
	assign SYSTEMB = ~nSYSTEM;
	assign nROMOE = nROMOEU & nROMOEL;
	
	// Memcard stuff
	assign CARD_PIN_nWE = |{nCARDWEN, ~CARDWENB, nCRDW};
	assign CARD_PIN_nREG = nREGEN | nCRDO;

	// Palette data bidir buffer from/to 68k
	assign M68K_DATA = (nPAL | ~M68K_RW) ? 16'bzzzzzzzzzzzzzzzz : PC;
	assign PC = nPALWE ? 16'bzzzzzzzzzzzzzzzz : M68K_DATA;

endmodule
