// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	DATENPFAD.v
//	Project:	M32632
//  Version:	3.1 bug fix of 25 February 2019	
//	History:	3.0 Cache Interface reworked
//				2.1 bug fix of 26 November 2016
//				1.1 bug fix of 7 October 2015
//				1.0 first release of 30 Mai 2015
//	Author:		Udo Moeller
//	Date:		8 July 2017
//
// Copyright (C) 2019 Udo Moeller
// 
// This source file may be used and distributed without 
// restriction provided that this copyright statement is not 
// removed from the file and that any derivative work contains 
// the original copyright notice and the associated disclaimer.
// 
// This source file is free software; you can redistribute it 
// and/or modify it under the terms of the GNU Lesser General 
// Public License as published by the Free Software Foundation;
// either version 2.1 of the License, or (at your option) any 
// later version. 
// 
// This source is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied 
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
// PURPOSE. See the GNU Lesser General Public License for more 
// details. 
// 
// You should have received a copy of the GNU Lesser General 
// Public License along with this source; if not, download it 
// from http://www.opencores.org/lgpl.shtml 
// 
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	Modules contained in this file:
//	DATENPFAD	the data path of M32632
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module DATENPFAD( BCLK, BRESET, WREN, IO_READY, LD_DIN, LD_IMME, WR_REG, IC_USER, ACC_FELD, ACC_STAT, DIN, DISP, IC_TEX,
				  IMME_Q, INFO_AU, LD_OUT, DETOIP, MMU_UPDATE, OPER, PC_ARCHI, PC_ICACHE, RDAA, RDAB, START, WMASKE, 
				  WRADR, DONE, Y_INIT, WRITE_OUT, READ_OUT, ZTEST, RMW, QWATWO, ACC_DONE, CTRL_QW, PTB_SEL, PTB_WR, ACB_ZERO, 
				  ABORT, SAVE_PC, CFG, CINV, DP_Q, IVAR, IVAR_MUX, MCR, PACKET, PC_NEW, PSR, SIZE, STRING, TRAPS, VADR, RWVFLAG, 
				  DBG_HIT, DBG_IN, COP_GO, COP_OP, COP_IN, COP_DONE, COP_OUT);

input			BCLK;
input			BRESET;
input			WREN;		// write enable of the register file
input			IO_READY;
input			LD_DIN;
input			LD_IMME;
input			WR_REG;		// write signal for the DP_FPU
input			IC_USER;
input			RWVFLAG;
input	[14:0]	ACC_FELD;
input	 [5:0] 	ACC_STAT;
input	[31:0] 	DIN;
input	[31:0] 	DISP;
input	 [2:0] 	IC_TEX;
input	[31:0] 	IMME_Q;
input	 [6:0] 	INFO_AU;
input	 [1:0] 	LD_OUT;
input	[12:0] 	DETOIP;
input	 [1:0] 	MMU_UPDATE;
input	[10:0] 	OPER;
input	[31:0] 	PC_ARCHI;
input	[31:0] 	PC_ICACHE;
input	 [7:0] 	RDAA;
input	 [7:0] 	RDAB;
input	 [1:0] 	START;
input	 [1:0] 	WMASKE;
input	 [5:0] 	WRADR;
input			DBG_HIT;
input			COP_DONE;
input	[23:0]	COP_OP;
input	[63:0]	COP_IN;

output			DONE;
output 			Y_INIT;
output			WRITE_OUT;
output			READ_OUT;
output			ZTEST;
output 			RMW;
output			QWATWO;
output			ACC_DONE;
output	 [1:0]	CTRL_QW;
output			PTB_SEL;
output			PTB_WR;
output reg		ACB_ZERO;
output			ABORT;
output 			SAVE_PC;
output	[12:0]	CFG;
output	 [3:0]	CINV;
output	[63:0]	DP_Q;
output	 [1:0]	IVAR;
output			IVAR_MUX;
output	 [3:0]	MCR;
output	 [3:0]	PACKET;
output  [31:0]	PC_NEW;
output  [11:0]	PSR;
output	 [1:0]	SIZE;
output	 [4:0]	STRING;
output	 [5:0]	TRAPS;
output	[31:0]	VADR;
output	[40:2]	DBG_IN;
output			COP_GO;
output [127:0]	COP_OUT;

reg  	[31:0]	high_dq;
reg		[31:0]	IMMREG,MEMREG;
reg		[31:0]	BYDIN;		// the bypass register
reg				LDIMR;

wire	 [2:0]	BITSEL;
wire	 [1:0]	BWD;
wire			CLR_LSB;
wire	[31:0]	ERGEBNIS;	// the result bus
wire			FL;
wire	[31:0]	FSR;
wire	[32:0]	MRESULT;
wire	 [7:0]	OPCODE;
wire			SELI_A;
wire			SELI_B;
wire	 [2:0]	SP_CMP;
wire	[31:0]	SRC1;		// the bus for the Source 1 operand
wire	[31:0]	SRC2;		// the bus for the Source 2 operand
wire	[31:0]	OUT_I;
wire	 [4:0]	TT_DP;
wire			TWREN;		// active if FPU Trap occurs
wire			UP_DP;
wire			WRADR_0;
wire			WREN_L,WREN_LX;
wire			LD_FSR;
wire			UP_SP;
wire	 [4:0]	TT_SP;
wire	[31:0]	addr_i;
wire	 [2:0]	DP_CMP;
wire	[31:0]	DP_OUT;
wire	[31:0]	SFP_DAT;
wire	 [6:0]	BMCODE;
wire	[31:0]	OUT_A,OUT_B;
wire			SP_MUX;
wire	[31:0]	I_OUT;
wire	[31:0]	FP_OUT;
wire			DOWR;
wire			ENWR;
wire	 [3:0]	OVF_BCD;
wire	 [3:0]	DSR;
wire			acb_zero_i;
wire  	[31:0] 	BMASKE;

assign	FL 	   = OPER[10];
assign	BWD	   = OPER[9:8];
assign	OPCODE = OPER[7:0];

assign	ERGEBNIS = SP_MUX ? FP_OUT : I_OUT;

assign	WRADR_0 = WRADR[0] ^ CLR_LSB;
assign	ENWR = WREN_L | WREN;
assign	DOWR = ENWR & TWREN;
	
assign	WREN_L = WREN_LX & ~TRAPS[0];

assign	DP_Q[63:32] = high_dq;

assign	PC_NEW = SRC1;

always @(posedge BCLK) if (LD_OUT[1] || WREN)	 ACB_ZERO <= acb_zero_i;

always @(posedge BCLK) if (LD_OUT[1]) high_dq <= ERGEBNIS;

always @(posedge BCLK)
	if (LD_DIN)
		begin
			IMMREG <= IMME_Q;
			MEMREG <= DIN;
			LDIMR  <= LD_IMME;
		end
		
assign OUT_I = LDIMR ? IMMREG : MEMREG;	// old solution had the multiplexor before the register

always @(posedge BCLK) if (RDAA[7]) BYDIN <= ERGEBNIS;

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Register Set 1 => SRC1
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REGISTER	REG_SET_A(
	.BCLK(BCLK),
	.ENWR(ENWR),
	.DOWR(DOWR),
	.DIN(ERGEBNIS),
	.BYDIN(BYDIN),
	.RADR(RDAA),
	.WADR({WRADR[5:1],WRADR_0}),
	.WMASKE(WMASKE),
	.SELI(SELI_A),
	.DOUT(OUT_A));

assign SRC1 = SELI_A ? OUT_I : OUT_A;
	
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Register Set 2 => SRC2
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REGISTER	REG_SET_B(
	.BCLK(BCLK),
	.ENWR(ENWR),
	.DOWR(DOWR),
	.DIN(ERGEBNIS),
	.BYDIN(BYDIN),
	.RADR(RDAB),
	.WADR({WRADR[5:1],WRADR_0}),
	.WMASKE(WMASKE),
	.SELI(SELI_B),
	.DOUT(OUT_B));

assign SRC2 = SELI_B ? OUT_I : OUT_B;

MULFILTER	M_FILTER(		// signed multiplier 32 * 32 bits = 64 bits
	.BWD(BWD),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.MRESULT(MRESULT));

BITMASK  BITM_U(
	.AA(BMCODE),
	.DOUT(BMASKE));
	
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// The integer data path
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
I_PFAD	GANZ_U(
	.FL(FL),
	.BRESET(BRESET),
	.BCLK(BCLK),
	.WREN(WREN),
	.LD_OUT(LD_OUT[1]),
	.ADDR(addr_i),
	.BITSEL(BITSEL),
	.BMASKE(BMASKE),
	.BWD(BWD),
	.DP_CMP(DP_CMP),
	.DP_OUT(DP_OUT),
	.FSR(FSR),
	.DETOIP(DETOIP[11:0]),
	.MRESULT(MRESULT),
	.OPCODE(OPCODE),
	.RDAA(RDAA),
	.SFP_DAT(SFP_DAT),
	.SP_CMP(SP_CMP),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.WRADR(WRADR),
	.DSR(DSR),	
	.OV_FLAG(TRAPS[2]),
	.ACB_ZERO(acb_zero_i),
	.BMCODE(BMCODE),
	.I_OUT(I_OUT),
	.PSR(PSR),
	.STRING(STRING),
	.OVF_BCD(OVF_BCD),
	.DISP(DISP[4:0]),
	.RWVFLAG(RWVFLAG));

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// The address unit
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ADDR_UNIT	ADDR_U(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.IO_READY(IO_READY),
	.READ(ACC_FELD[11]),
	.WRITE(ACC_FELD[10]),
	.CLRMSW(ACC_FELD[2]),
	.FULLACC(ACC_FELD[8]),
	.POST(ACC_FELD[3]),
	.DISP_OK(INFO_AU[0]),
	.LDEA(ACC_FELD[9]),
	.NEWACC(ACC_FELD[14]),
	.FPU_TRAP(TRAPS[0]),
	.ADIVAR(INFO_AU[2]),
	.RWVAL_1(INFO_AU[3]),
	.ABO_STAT({INFO_AU[1],IC_USER}),
	.ACC_STAT(ACC_STAT),
	.ASIZE(ACC_FELD[13:12]),
	.BWD(BWD),
	.DISP(DISP),
	.IC_TEX(IC_TEX),
	.INDEX(ACC_FELD[7:4]),
	.MMU_UPDATE(MMU_UPDATE),
	.PC_ARCHI(PC_ARCHI),
	.PC_ICACHE(PC_ICACHE),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.SRC2SEL(ACC_FELD[1:0]),
	.CTRL_QW(CTRL_QW),
	.ACC_DONE(ACC_DONE),
	.READ_OUT(READ_OUT),
	.WRITE_OUT(WRITE_OUT),
	.ABORT(ABORT),
	.ADDR(addr_i),
	.BITSEL(BITSEL),
	.PACKET(PACKET),
	.SIZE(SIZE),
	.VADR(VADR),
	.ZTEST(ZTEST),
	.RMW(RMW),
	.QWATWO(QWATWO),
	.OP_RMW(INFO_AU[4]),
	.PHASE_17(INFO_AU[5]),
	.NO_TRAP(INFO_AU[6]) );
	
CONFIG_REGS	CFG_DBG(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.WREN(WREN),
	.LD_OUT(LD_OUT[1]),
	.OPCODE(OPCODE),
	.SRC1(SRC1),
	.WRADR(WRADR),
	.PTB_WR(PTB_WR),
	.PTB_SEL(PTB_SEL),
	.CFG(CFG),
	.CINV(CINV),
	.IVAR(IVAR),
	.IVAR_MUX(IVAR_MUX),
	.Y_INIT(Y_INIT),
	.MCR(MCR),
	.DBG_TRAPS(TRAPS[5:3]),
	.PC_ARCHI(PC_ARCHI),
	.DSR(DSR),
	.USER(PSR[8]),
	.PCMATCH(DETOIP[12]),
	.DBG_IN(DBG_IN),
	.DBG_HIT(DBG_HIT),
	.READ(READ_OUT) );
	
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// The long operation unit
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DP_FPU	DOUBLE_U(
	.BCLK(BCLK),
	.FL(FL),
	.BRESET(BRESET),
	.LD_OUT(LD_OUT),
	.WR_REG(WR_REG),
	.BWD(BWD),
	.FSR(FSR[8:3]),
	.OPCODE(OPCODE),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.START(START),
	.DONE(DONE),
	.UP_DP(UP_DP),
	.WREN_L(WREN_LX),
	.CLR_LSB(CLR_LSB),
	.DVZ_TRAP(TRAPS[1]),
	.DP_CMP(DP_CMP),
	.DP_OUT(DP_OUT),
	.DP_Q(DP_Q[31:0]),
	.TT_DP(TT_DP),
	.CY_IN(PSR[0]),
	.OVF_BCD(OVF_BCD),
	.COP_DONE(COP_DONE),
	.COP_OP(COP_OP),
	.COP_IN(COP_IN),
	.COP_GO(COP_GO),
	.COP_OUT(COP_OUT));
	
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// The single precision floating point unit
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SP_FPU	SINGLE_U(
	.FL(FL),
	.BCLK(BCLK),
	.BWD(BWD),
	.FSR(FSR[8:3]),
	.OPCODE(OPCODE),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.LD_FSR(LD_FSR),
	.SP_MUX(SP_MUX),
	.UP_SP(UP_SP),
	.FP_OUT(FP_OUT),
	.I_OUT(SFP_DAT),
	.SP_CMP(SP_CMP),
	.TT_SP(TT_SP),
	.START(START[1]) );		// Aenderung

FP_STAT_REG	FPS_REG(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.LFSR(LD_FSR),
	.WREN(ENWR),
	.WRADR(WRADR[5:4]),
	.UP_DP(UP_DP),
	.UP_SP(UP_SP),		// & LD_OUT[1]), Aenderung
	.DIN(SRC1[16:0]),
	.TT_DP(TT_DP),
	.TT_SP(TT_SP),
	.FPU_TRAP(TRAPS[0]),
	.TWREN(TWREN),
	.SAVE_PC(SAVE_PC),
	.FSR(FSR));

endmodule
