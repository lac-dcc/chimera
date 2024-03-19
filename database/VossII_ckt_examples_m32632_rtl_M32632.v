// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	M32632.v
//	Project:	M32632
//  Version:	3.1 bug fix of 25 February 2019
//  History:	3.0 Cache Interface reworked
//				2.1 bug fix of 26 November 2016
//				2.0 50 MHz release of 14 August 2016
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
//	M32632		The top level of M32632
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module M32632( BCLK, DRAMSZ, BRESET, NMI_N, INT_N, STATUS, ILO, STATSIGS,
			   IO_WR, IO_RD, IO_A, IO_BE, IO_DI, IO_Q, IO_READY,
			   ENDRAM, IC_MDONE, DC_MDONE, ENWR, DRAM_Q, DC_INHIBIT, IC_INHIBIT,
			   IC_ACC, IDRAM_ADR, DC_ACC, DC_WR, DRAM_ADR, DRAM_DI,
			   HOLD, HLDA, DMA_CHK, DMA_AA,
			   COP_GO, COP_OP, COP_OUT, COP_DONE, COP_IN );

// ++++++++++ Basic Signals
input			BCLK;	// Basic Clock for everything
input	 [2:0]	DRAMSZ;
input			BRESET;
input			NMI_N;
input			INT_N;
output	 [3:0]	STATUS;
output			ILO;
output	 [7:0]	STATSIGS;
// +++++++++ General Purpose Interface
output			IO_WR;
output			IO_RD;
output	[31:0]	IO_A;
output	 [3:0]	IO_BE;
output	[31:0]	IO_DI;
input	[31:0]	IO_Q;
input			IO_READY;
// +++++++++ DRAM Interface In
input			ENDRAM;
input			IC_MDONE;
input			DC_MDONE;
input			ENWR;
input  [127:0]	DRAM_Q;
input	 		DC_INHIBIT;
input			IC_INHIBIT;
// +++++++++ DRAM Interface Out
output			IC_ACC;
output	[28:0]	IDRAM_ADR;
output			DC_ACC;
output			DC_WR;
output	[28:0]	DRAM_ADR;
output	[35:0]	DRAM_DI;
// ++++++++++ DMA Interface
input			HOLD;
output			HLDA;
input			DMA_CHK;
input	[28:4]	DMA_AA;
// ++++++++++ Coprocessor Interface
output			COP_GO;
output	[23:0]	COP_OP;
output [127:0]	COP_OUT;
input			COP_DONE;
input	[63:0]	COP_IN;

wire			ACC_DONE;
wire	 [5:0]	ACC_STAT;
wire	[12:0]	CFG;
wire	 [3:0]	CINV;
wire			DATA_HOLD;
wire			DC_INIT;
wire			Y_INIT;
wire			DONE;
wire	[63:0]	DP_Q;
wire	 [3:0]	IACC_STAT;
wire			PROT_ERROR;
wire	 [2:0]	GENSTAT;
wire			IC_INIT;
wire			IC_PREQ;
wire			IC_READ;
wire	 [1:0]	IC_SIGS;
wire			IC_USER;
wire   [31:12]	IC_VA;
wire	 [3:0]	ICTODC;
wire	 [6:0]	INFO_AU;
wire	 [1:0]	IVAR;
wire			IVAR_MUX;
wire			KDET;
wire	[28:4]	KOLLI_A;
wire	 [3:0]	MCR;
wire	[23:0]	MMU_DIN;
wire	[11:0]	PSR;
wire			PTB_SEL;
wire			PTB_WR;
wire			READ;
wire			WRITE;
wire			ZTEST;
wire			RMW;
wire			QWATWO;
wire	 [2:0]	RWVAL;
wire			RWVFLAG;
wire	 [3:0]	D_IOBE;
wire			D_IORDY;
wire	 [1:0]	CTRL_QW;
wire	 [3:0]	PACKET;
wire	 [1:0]	SIZE;
wire	[31:0]	VADR;
wire			WREN_REG;
wire			LD_DIN;
wire			LD_IMME;
wire			WR_REG;
wire	[14:0]	ACC_FELD;
wire	[31:0]	DIN;
wire	[31:0]	DISP;
wire	 [2:0]	IC_TEX;
wire	[31:0]	IMME_Q;
wire	 [1:0]	LD_OUT;
wire	[12:0]	DETOIP;
wire	 [1:0]	MMU_UPDATE;
wire	[10:0]	OPER;
wire	[31:0]	PC_ARCHI;
wire	[31:0]	PC_ICACHE;
wire	 [7:0]	RDAA;
wire	 [7:0]	RDAB;
wire	 [1:0]	START;
wire	 [1:0]	WMASKE;
wire	 [5:0]	WRADR;
wire			I_IORDY;
wire			ACB_ZERO;
wire			DC_ABORT;
wire			SAVE_PC;
wire	[31:0]	IC_DIN;
wire	[31:0]	PC_NEW;
wire	 [4:0]	STRING;
wire	 [5:0]	TRAPS;
wire			I_IORD;
wire			D_IOWR;
wire			D_IORD;
wire	[31:0]	D_IOA;
wire	[31:0]	I_IOA;
wire			ENA_HK;
wire			STOP_CINV;
wire			KOLLISION;
wire			ILO_SIG;
wire	 [1:0]	PTE_STAT;
wire			DBG_HIT;
wire	[40:2]	DBG_IN;

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//            The Data Cache
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DCACHE	ARMS(
	.BCLK(BCLK),
	.DRAMSZ(DRAMSZ),
	.BRESET(BRESET),
	.PTB_WR(PTB_WR),
	.PTB_SEL(PTB_SEL),
	.MDONE(DC_MDONE),
	.IO_READY(D_IORDY),
	.CTRL_QW(CTRL_QW),
	.PSR_USER(INFO_AU[1]),
	.WRITE(WRITE),
	.READ(READ),
	.ZTEST(ZTEST),
	.RMW(RMW),
	.QWATWO(QWATWO),
	.ENWR(ENWR),
	.IC_PREQ(IC_PREQ),
	.DMA_CHK(DMA_CHK),
	.CFG(CFG[10:9]),
	.ENDRAM(ENDRAM),
	.CINVAL(CINV[1:0]),
	.DMA_AA(DMA_AA),
	.DP_Q(DP_Q),
	.DRAM_Q(DRAM_Q),
	.IC_VA(IC_VA),
	.ICTODC(ICTODC),
	.IO_Q(IO_Q),
	.IVAR(IVAR),
	.MCR_FLAGS(MCR),
	.PACKET(PACKET),
	.SIZE(SIZE),
	.VADR(VADR),
	.INHIBIT(DC_INHIBIT),
	.DRAM_ACC(DC_ACC),
	.DRAM_WR(DC_WR),
	.IO_RD(D_IORD),
	.IO_WR(D_IOWR),
	.INIT_RUN(DC_INIT),
	.KDET(KDET),
	.HLDA(HLDA),
	.ACC_STAT(ACC_STAT),
	.DP_DI(DIN),
	.DRAM_A(DRAM_ADR),
	.DRAM_DI(DRAM_DI),
	.IACC_STAT(IACC_STAT[3:1]),
	.IC_SIGS(IC_SIGS),
	.IO_A(D_IOA),
	.IO_BE(D_IOBE),
	.IO_DI(IO_DI),
	.PTE_STAT(PTE_STAT),
	.DBG_HIT(DBG_HIT),
	.DBG_IN(DBG_IN),
	.KOLLI_A(KOLLI_A),
	.MMU_DIN(MMU_DIN),
	.RWVAL(RWVAL),
	.RWVFLAG(RWVFLAG));

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//            The Datapath
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DATENPFAD	STOMACH(
	.WREN(WREN_REG),
	.BRESET(BRESET),
	.BCLK(BCLK),
	.IO_READY(D_IORDY),
	.LD_DIN(LD_DIN),
	.LD_IMME(LD_IMME),
	.WR_REG(WR_REG),
	.IC_USER(IC_USER),
	.ACC_FELD(ACC_FELD),
	.ACC_STAT(ACC_STAT),
	.DIN(DIN),
	.DISP(DISP),
	.IC_TEX(IC_TEX),
	.IMME_Q(IMME_Q),
	.INFO_AU(INFO_AU),
	.LD_OUT(LD_OUT),
	.DETOIP(DETOIP),
	.MMU_UPDATE(MMU_UPDATE),
	.OPER(OPER),
	.PC_ARCHI(PC_ARCHI),
	.PC_ICACHE(PC_ICACHE),
	.RDAA(RDAA),
	.RDAB(RDAB),
	.START(START),
	.WMASKE(WMASKE),
	.WRADR(WRADR),
	.READ_OUT(READ),
	.WRITE_OUT(WRITE),
	.ZTEST(ZTEST),
	.RMW(RMW),
	.QWATWO(QWATWO),
	.ACC_DONE(ACC_DONE),
	.CTRL_QW(CTRL_QW),
	.Y_INIT(Y_INIT),
	.DONE(DONE),
	.PTB_WR(PTB_WR),
	.PTB_SEL(PTB_SEL),
	.ACB_ZERO(ACB_ZERO),
	.ABORT(DC_ABORT),
	.SAVE_PC(SAVE_PC),
	.CFG(CFG),
	.CINV(CINV),
	.DP_Q(DP_Q),
	.IVAR(IVAR),
	.IVAR_MUX(IVAR_MUX),
	.MCR(MCR),
	.PACKET(PACKET),
	.PC_NEW(PC_NEW),
	.PSR(PSR),
	.SIZE(SIZE),
	.STRING(STRING),
	.TRAPS(TRAPS),
	.VADR(VADR),
	.RWVFLAG(RWVFLAG),
	.DBG_HIT(DBG_HIT),
	.DBG_IN(DBG_IN),
	.COP_DONE(COP_DONE),
	.COP_OP(COP_OP),
	.COP_IN(COP_IN),
	.COP_GO(COP_GO),
	.COP_OUT(COP_OUT));

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//            The Instruction Cache
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ICACHE	LEGS(
	.BCLK(BCLK),
	.DRAMSZ(DRAMSZ),
	.BRESET(BRESET),
	.PTB_WR(PTB_WR),
	.PTB_SEL(PTB_SEL),
	.MDONE(IC_MDONE),
	.IO_READY(I_IORDY),
	.READ_I(IC_READ),
	.PSR_USER(IC_USER),
	.DATA_HOLD(DATA_HOLD),
	.DRAM_WR(DC_WR),
	.KDET(KDET),
	.HOLD(HOLD),
	.CFG(CFG[12:11]),
	.ENDRAM(ENDRAM),
	.DRAM_Q(DRAM_Q),
	.CINVAL(CINV[3:2]),
	.IC_SIGS(IC_SIGS),
	.IO_Q(IO_Q),
	.IVAR(IVAR),
	.IVAR_MUX(IVAR_MUX),
	.VADR_D(VADR[31:12]),
	.KOLLI_A(KOLLI_A),
	.MCR_FLAGS(MCR),
	.MMU_DIN(MMU_DIN),
	.VADR_I(PC_ICACHE),
	.INHIBIT(IC_INHIBIT),
	.DRAM_ACC(IC_ACC),
	.IO_RD(I_IORD),
	.INIT_RUN(IC_INIT),
	.PROT_ERROR(PROT_ERROR),
	.ACC_OK(IACC_STAT[0]),
	.IC_PREQ(IC_PREQ),
	.KOLLISION(KOLLISION),
	.DRAM_A(IDRAM_ADR),
	.IC_DQ(IC_DIN),
	.IC_VA(IC_VA),
	.ICTODC(ICTODC),
	.ENA_HK(ENA_HK),
	.STOP_CINV(STOP_CINV),
	.IO_A(I_IOA));

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//            The Control Unit
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
STEUERUNG	BRAIN(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.DC_ACC_DONE(ACC_DONE),
	.ACB_ZERO(ACB_ZERO),
	.DONE(DONE),
	.NMI_N(NMI_N),
	.INT_N(INT_N),
	.DC_ABORT(DC_ABORT),
	.IC_INIT(IC_INIT),
	.DC_INIT(DC_INIT),
	.Y_INIT(Y_INIT),
	.SAVE_PC(SAVE_PC),
	.CFG(CFG[8:0]),
	.IACC_STAT(IACC_STAT),
	.PROT_ERROR(PROT_ERROR),
	.IC_DIN(IC_DIN),
	.PC_NEW(PC_NEW),
	.PSR(PSR),
	.STRING(STRING),
	.TRAPS(TRAPS),
	.IC_READ(IC_READ),
	.DATA_HOLD(DATA_HOLD),
	.LD_DIN(LD_DIN),
	.LD_IMME(LD_IMME),
	.WREN(WREN_REG),
	.WR_REG(WR_REG),
	.GENSTAT(GENSTAT),
	.IC_USER(IC_USER),
	.ACC_FELD(ACC_FELD),
	.DISP(DISP),
	.IC_TEX(IC_TEX),
	.IMME_Q(IMME_Q),
	.INFO_AU(INFO_AU),
	.LD_OUT(LD_OUT),
	.DETOIP(DETOIP),
	.MMU_UPDATE(MMU_UPDATE),
	.OPER(OPER),
	.PC_ARCHI(PC_ARCHI),
	.PC_ICACHE(PC_ICACHE),
	.RDAA(RDAA),
	.RDAB(RDAB),
	.START(START),
	.WMASKE(WMASKE),
	.WRADR(WRADR),
	.ENA_HK(ENA_HK),
	.STOP_CINV(STOP_CINV),
	.COP_OP(COP_OP),
	.ILO(ILO_SIG),
	.RWVAL(RWVAL));

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//            The Input/Output Interface
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
IO_SWITCH	ISWITCH(
	.I_IORD(I_IORD),
	.D_IOWR(D_IOWR),
	.IO_READY(IO_READY),
	.D_IORD(D_IORD),
	.D_IOBE(D_IOBE),
	.BRESET(BRESET),
	.BCLK(BCLK),
	.GENSTAT(GENSTAT),
	.D_IOA(D_IOA),
	.I_IOA(I_IOA),
	.D_IORDY(D_IORDY),
	.I_IORDY(I_IORDY),
	.IO_RD(IO_RD),
	.IO_WR(IO_WR),
	.IO_BE(IO_BE),
	.ILO_SIG(ILO_SIG),
	.ILO(ILO),
	.IO_A(IO_A),
	.DCWACC({DC_WR,DC_ACC}),
	.STATUS(STATUS));

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//            The Statistic Signal Generator
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
MAKE_STAT	MKSTAT(
	.BCLK(BCLK),
	.READ(READ),
	.DACC_OK(ACC_STAT[0]),
	.KOLLISION(KOLLISION),
	.DC_ACC(DC_ACC),
	.DPTE_ACC(PTE_STAT[0]),
	.DC_MDONE(DC_MDONE),
	.DRAM_WR(DC_WR),
	.IC_READ(IC_READ),
	.IACC_OK(IACC_STAT[0]),
	.IC_ACC(IC_ACC),
	.IPTE_ACC(PTE_STAT[1]),
	.IC_MDONE(IC_MDONE),
	.DATA_HOLD(DATA_HOLD),
	.STATSIGS(STATSIGS));

endmodule
