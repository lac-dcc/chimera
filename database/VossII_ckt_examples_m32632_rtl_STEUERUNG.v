// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	STEUERUNG.v
//	Version:	3.0
//	Date:		2 December 2018
//
// Copyright (C) 2018 Udo Moeller
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
//	STEUERUNG	The control logic of M32632
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module STEUERUNG( BCLK, BRESET, DC_ACC_DONE, ACB_ZERO, DONE, INT_N, NMI_N, DC_ABORT, IC_INIT, DC_INIT, SAVE_PC, CFG,
				  IACC_STAT, PROT_ERROR, IC_DIN, PC_NEW, PSR, STRING, TRAPS, IC_READ, DATA_HOLD, LD_DIN, LD_IMME,
				  WREN, WR_REG, GENSTAT, ILO, COP_OP, IC_USER, ACC_FELD, DISP, IC_TEX, IMME_Q, INFO_AU, LD_OUT,
				  DETOIP, MMU_UPDATE, OPER, PC_ARCHI, PC_ICACHE, RDAA, RDAB, START, WMASKE, WRADR, RWVAL, Y_INIT,
				  ENA_HK, STOP_CINV );

input			BCLK;
input			BRESET;
input			DC_ACC_DONE;
input			ACB_ZERO;
input			DONE;
input			INT_N;
input			NMI_N;
input			DC_ABORT;
input			IC_INIT;
input			DC_INIT;
input			SAVE_PC;
input			Y_INIT;
input	 [8:0]	CFG;
input	 [3:0]	IACC_STAT;
input			PROT_ERROR;
input	[31:0]	IC_DIN;
input	[31:0]	PC_NEW;
input	[11:0]	PSR;
input	 [4:0]	STRING;
input	 [5:0]	TRAPS;
input			STOP_CINV;

output			IC_READ;
output			DATA_HOLD;
output			LD_DIN;
output			LD_IMME;
output			WREN;
output			WR_REG;
output	 [2:0]	GENSTAT;
output			IC_USER;
output	[14:0]	ACC_FELD;
output	[31:0]	DISP;
output	 [2:0]	IC_TEX;
output	[31:0]	IMME_Q;
output	 [6:0]	INFO_AU;
output	 [1:0]	LD_OUT;
output	[12:0]	DETOIP;
output	 [1:0]	MMU_UPDATE;
output	[10:0]	OPER;
output	[31:0]	PC_ARCHI;
output	[31:0]	PC_ICACHE;
output	 [7:0]	RDAA;
output	 [7:0]	RDAB;
output	 [1:0]	START;
output	 [1:0]	WMASKE;
output	 [5:0]	WRADR;
output	 [2:0]	RWVAL;
output			ENA_HK;
output			ILO;
output	[23:0]	COP_OP;

wire	[55:0]	OPREG;
wire			IC_ABORT;
wire			INIT_DONE;
wire			UNDEF;
wire			ILLEGAL;
wire	 [2:0]	ANZ_VAL;
wire	[31:0]	PC_SAVE;
wire			NEW;
wire			RESTART;
wire			STOP_IC;
wire	 [1:0]	ALSB;
wire	 [2:0]	USED;
wire			NEXT_ADR;
wire			NEW_PC;
wire			NEXT_PCA;
wire			LOAD_PC;
wire	[31:0]	DISP_BR;

DECODER	BEFEHLS_DEC(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.ACC_DONE(DC_ACC_DONE),
	.ACB_ZERO(ACB_ZERO),
	.DONE(DONE),
	.NMI_N(NMI_N),
	.INT_N(INT_N),
	.DC_ABORT(DC_ABORT),
	.IC_ABORT(IC_ABORT),
	.INIT_DONE(INIT_DONE),
	.UNDEF(UNDEF),
	.ILL(ILLEGAL),
	.IC_READ(IC_READ),
	.ANZ_VAL(ANZ_VAL),
	.CFG(CFG),
	.OPREG(OPREG),
	.PC_SAVE(PC_SAVE),
	.PSR(PSR),
	.STRING(STRING),
	.TRAPS(TRAPS),
	.NEW(NEW),
	.WREN(WREN),
	.LD_DIN(LD_DIN),
	.LD_IMME(LD_IMME),
	.NEXT_PCA(NEXT_PCA),
	.WR_REG(WR_REG),
	.LOAD_PC(LOAD_PC),
	.GENSTAT(GENSTAT),
	.RESTART(RESTART),
	.STOP_IC(STOP_IC),
	.ACC_FELD(ACC_FELD),
	.DISP(DISP),
	.DISP_BR(DISP_BR),
	.IMME_Q(IMME_Q),
	.INFO_AU(INFO_AU),
	.LD_OUT(LD_OUT),
	.DETOIP(DETOIP),
	.MMU_UPDATE(MMU_UPDATE),
	.OPER(OPER),
	.RDAA(RDAA),
	.RDAB(RDAB),
	.START(START),
	.USED(USED),
	.WMASKE(WMASKE),
	.WRADR(WRADR),
	.RWVAL(RWVAL),
	.ENA_HK(ENA_HK),
	.ILO(ILO),
	.COP_OP(COP_OP),
	.STOP_CINV(STOP_CINV),
	.PHOUT());

ILL_UNDEF	CHECKER(
	.USER(PSR[8]),
	.ANZ_VAL(ANZ_VAL),
	.CFG(CFG[3:1]),
	.OPREG(OPREG[23:0]),
	.ILL(ILLEGAL),
	.UNDEF(UNDEF));

OPDEC_REG	OPC_REG(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.NEW(NEW),
	.DC_INIT(DC_INIT),
	.IC_INIT(IC_INIT),
	.Y_INIT(Y_INIT),
	.RESTART(RESTART),
	.STOP_IC(STOP_IC),
	.ACC_STAT(IACC_STAT),
	.PROT_ERROR(PROT_ERROR),
	.ALSB(ALSB),
	.IC_DIN(IC_DIN),
	.USED(USED),
	.IC_READ(IC_READ),
	.NEXT_ADR(NEXT_ADR),
	.DATA_HOLD(DATA_HOLD),
	.NEW_PC(NEW_PC),
	.ABORT(IC_ABORT),
	.INIT_DONE(INIT_DONE),
	.ANZ_VAL(ANZ_VAL),
	.IC_TEX(IC_TEX),
	.OPREG(OPREG));

PROG_COUNTER	PCS(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.NEXT_ADR(NEXT_ADR),
	.NEW_PC(NEW_PC),
	.NEXT_PCA(NEXT_PCA),
	.NEW(NEW),
	.LOAD_PC(LOAD_PC),
	.USER(PSR[8]),
	.SAVE_PC(SAVE_PC),
	.FPU_TRAP(TRAPS[0]),
	.ADIVAR(INFO_AU[3]),
	.DISP(DISP_BR),
	.PC_NEW(PC_NEW),
	.USED(USED),
	.IC_USER(IC_USER),
	.ALSB(ALSB),
	.PC_ARCHI(PC_ARCHI),
	.PC_ICACHE(PC_ICACHE),
	.PC_SAVE(PC_SAVE));

endmodule
