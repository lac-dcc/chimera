// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	ICACHE.v
//	Project:	M32632
//	Version:	3.1 bug fix of 25 February 2019
//	History:	3.0 Cache Interface reworked
//				2.0 50 MHz release of 14 August 2016
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
//	ICACHE		the instruction cache of M32632
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module ICACHE( BCLK, DRAMSZ, MDONE, BRESET, READ_I, IO_READY, PSR_USER, DATA_HOLD, PTB_WR, PTB_SEL, DRAM_WR,
			   KDET, HOLD, CFG, DRAM_Q, CINVAL, IC_SIGS, IO_Q, IVAR, IVAR_MUX, VADR_D, KOLLI_A, MCR_FLAGS, MMU_DIN, VADR_I,
			   INHIBIT, IO_RD, DRAM_ACC, INIT_RUN, PROT_ERROR, ACC_OK, IC_PREQ, KOLLISION, ENA_HK, STOP_CINV,
			   DRAM_A, IC_DQ, IC_VA, ICTODC, IO_A, ENDRAM );

input			BCLK;
input	 [2:0]	DRAMSZ;
input			MDONE;
input			BRESET;
input			READ_I;
input			IO_READY;
input			PSR_USER;
input			DATA_HOLD;
input			PTB_WR;
input			PTB_SEL;
input			DRAM_WR;
input			KDET;
input			HOLD;
input	 [1:0]	CFG;
input  [127:0]	DRAM_Q;
input	 [1:0]	CINVAL;
input	 [1:0]	IC_SIGS;
input	[31:0]	IO_Q;
input	 [1:0]	IVAR;
input			IVAR_MUX;
input  [31:12]	VADR_D;
input	[28:4]	KOLLI_A;
input	 [3:0]	MCR_FLAGS;
input	[23:0]	MMU_DIN;
input	[31:0]	VADR_I;
input	 		INHIBIT;
input			ENA_HK;
input			ENDRAM;

output			IO_RD;
output			DRAM_ACC;
output			INIT_RUN;
output			PROT_ERROR;
output			ACC_OK;
output			IC_PREQ;
output			KOLLISION;
output			STOP_CINV;
output	[31:0]	IC_DQ;
output [31:12]	IC_VA;
output	 [3:0]	ICTODC;
output reg	[28:0]	DRAM_A;
output reg	[31:0]	IO_A;

reg		[31:0]	VADR_R;
reg		[31:0]	CAPDAT;
reg		[31:0]	DFFE_IOR;
reg				HOLD_ON;
reg				DFF_HDFF1;
reg				DFF_IRD_REG;

wire	[31:0]	VADR;
wire	 [4:0]	A_CV;
wire			ACOK;
wire	 [4:0]	ACV;
wire			AUX_DAT;
wire			CA_HIT;
wire			CA_SET;
wire			CUPDATE;
wire	[23:0]	D_CV;
wire			HIT_ALL;
wire			INIT_CA_RUN;
wire			IO_ACC;
wire			KILL;
wire			NEW_PTB;
wire			PTB_ONE;
wire   [31:12]	RADR;
wire			READ;
wire			RUN_ICRD;
wire			STOP_ICRD;
wire	[23:0]	UPCD;
wire	[23:0]	UPDATE_C;
wire	[31:0]	UPDATE_M;
wire			USE_CA;
wire			USER;
wire	[11:7]	V_ADR;
wire			WE_CV;
wire			WEMV;
wire			WRCRAM0;
wire			WRCRAM1;
wire			WRSET0;
wire			WRSET1;
wire			WRITE;
wire	[11:7]	KILLADR;
wire			AUX_ALT;
wire			VIRT_A;
wire			CI;
wire			MMU_HIT;
wire			LD_DRAM_A;
wire			IO_SPACE;
wire			LAST_MUX;
wire			VIRTUELL;
wire			NEW_PTB_RUN;
wire	[31:0]	SET_DAT;
wire	[31:0]	ALT_DAT;
wire	[31:0]	DAT_MV;
wire	 [3:0]	RADR_MV;
wire	 [3:0]	WADR_MV;
wire	[23:0]	NEWCVAL;
wire			KILL_C,KILL_K;
wire			RMW;
wire	[31:0]	CAP_Q;
wire   [28:12]	TAGDAT;

// +++++++++++++++++++ Memories ++++++++++++++++++++

reg	   [127:0]	DATA0 [0:255];		// Data Set 0 : 4 kBytes
reg	   [127:0]	RDDATA0;
reg		[31:0]	SET_DAT0;

reg	   [127:0]	DATA1 [0:255];		// Data Set 1 : 4 kBytes
reg	   [127:0]	RDDATA1;
reg		[31:0]	SET_DAT1;

reg		[16:0]	TAGSET_0 [0:255];	// Tag Set for Data Set 0 : 256 entries of 17 bits
reg		[16:0]	TAG0;

reg		[16:0]	TAGSET_1 [0:255];	// Tag Set for Data Set 1 : 256 entries of 17 bits
reg		[16:0]	TAG1;

wire	[23:0]	CVALID;

reg		[35:0]	MMU_TAGS [0:255];	// Tag Set for MMU : 256 entries of 36 bits
reg		[35:0]	MMU_Q;

reg		[31:0]	MMU_VALID [0:15];	// Valid bits for MMU Tag Set : 16 entries of 32 bits
reg		[31:0]	MVALID;

reg		[16:0]	KTAGSET_0 [0:255];	// Kollision Tag Set for Data Set 0 : 256 entries of 17 bits
reg		[16:0]	KTAG0;

reg		[16:0]	KTAGSET_1 [0:255];	// Kollision Tag Set for Data Set 1 : 256 entries of 17 bits
reg		[16:0]	KTAG1;

wire	[23:0]	KCVALID;

assign	READ	= READ_I & ~HOLD_ON & RUN_ICRD;
assign	WRITE	= 1'b0;
assign	RMW		= 1'b0;

assign	ALT_DAT	= AUX_ALT ? DFFE_IOR : CAPDAT ;

assign	RADR	= VIRT_A ? MMU_Q[19:0] : VADR_R[31:12] ;

assign	V_ADR	= STOP_ICRD ? KILLADR : VADR[11:7] ;
assign	ACV		= STOP_ICRD ? KILLADR : A_CV ;
assign	UPCD	= STOP_ICRD ? NEWCVAL : UPDATE_C ;

assign	IC_DQ	= LAST_MUX ? ALT_DAT : SET_DAT ;

assign	SET_DAT = CA_SET ? SET_DAT1 : SET_DAT0 ;

assign	KILL	= KILL_C | KILL_K;

assign	IC_VA	= VADR_R[31:12];

assign	VIRT_A	= ~CINVAL[0] & VIRTUELL;

assign	ACC_OK	= HOLD_ON | ACOK;

assign	USER	= ~MCR_FLAGS[3] & PSR_USER;

assign	AUX_ALT = HOLD_ON | DFF_IRD_REG;

assign	LAST_MUX = AUX_ALT | AUX_DAT;

assign	INIT_RUN = NEW_PTB_RUN | INIT_CA_RUN;

assign	LD_DRAM_A = ~DRAM_ACC | MDONE;

assign	ICTODC[3] = USER;

assign	VADR[31:12] = IVAR_MUX ? VADR_D : VADR_I[31:12];
assign	VADR[11:0]  = VADR_I[11:0];

always @(posedge BCLK) VADR_R <= VADR;

always @(posedge BCLK) DFF_IRD_REG <= IO_RD;

always @(posedge BCLK) DFF_HDFF1 <= IO_READY;

always @(posedge BCLK) if (LD_DRAM_A) DRAM_A <= {RADR[28:12],VADR_R[11:2],USE_CA,CA_SET};

always @(posedge BCLK) if (IO_ACC) IO_A <= {RADR[31:12],VADR_R[11:0]};

always @(posedge BCLK) if (IO_RD) DFFE_IOR <= IO_Q;

always @(posedge BCLK or negedge BRESET)
	if (!BRESET) HOLD_ON <= 1'b0;
		else HOLD_ON <= (DATA_HOLD & DFF_HDFF1) | (HOLD_ON & DATA_HOLD);

DMUX  DMUX_4TO1 (
	.DRAM_Q(DRAM_Q),
	.ADDR(VADR_R[3:2]),
	.CAP_Q(CAP_Q) );
	
always @(posedge BCLK) if (MDONE) CAPDAT <= CAP_Q;

FILTCMP  FILT_CMP(
	.RADR({RADR[28:12],VADR_R[11:4]}),
	.DRAMSZ(DRAMSZ),
	.DRAM_A(25'd0),
	.TAGDAT(TAGDAT),
	.ADR_EQU());

// +++++++++++++++++++++++++  Cache Valid  +++++++++++++++++++

NEU_VALID	VALID_RAM(
	.BCLK(BCLK),
	.VALIN(D_CV),
	.WADR(ACV),
	.WREN(WE_CV),
	.RADR(V_ADR[11:7]),
	.VALOUT(CVALID) );

// +++++++++++++++++++++++++  Tag Set 0  +++++++++++++++++++++

always @(posedge BCLK) TAG0 <= TAGSET_0[VADR[11:4]];

always @(negedge BCLK) if (WRCRAM0) TAGSET_0[VADR_R[11:4]] <= TAGDAT;

// +++++++++++++++++++++++++  Tag Set 1  +++++++++++++++++++++

always @(posedge BCLK) TAG1 <= TAGSET_1[VADR[11:4]];

always @(negedge BCLK) if (WRCRAM1) TAGSET_1[VADR_R[11:4]] <= TAGDAT;

// +++++++++++++++++++++++++  Data Set 0  ++++++++++++++++++++

always @(posedge BCLK) RDDATA0 <= DATA0[VADR[11:4]];
	
always @(RDDATA0 or VADR_R)
	case (VADR_R[3:2])
	  2'b00 : SET_DAT0 <= RDDATA0[31:0];
	  2'b01 : SET_DAT0 <= RDDATA0[63:32];
	  2'b10 : SET_DAT0 <= RDDATA0[95:64];
	  2'b11 : SET_DAT0 <= RDDATA0[127:96];
	endcase
	
always @(posedge BCLK) if (WRSET0) DATA0[VADR_R[11:4]] <= DRAM_Q;
	  
// +++++++++++++++++++++++++  Data Set 1  ++++++++++++++++++++

always @(posedge BCLK) RDDATA1 <= DATA1[VADR[11:4]];
	
always @(RDDATA1 or VADR_R)
	case (VADR_R[3:2])
	  2'b00 : SET_DAT1 <= RDDATA1[31:0];
	  2'b01 : SET_DAT1 <= RDDATA1[63:32];
	  2'b10 : SET_DAT1 <= RDDATA1[95:64];
	  2'b11 : SET_DAT1 <= RDDATA1[127:96];
	endcase
	
always @(posedge BCLK) if (WRSET1) DATA1[VADR_R[11:4]] <= DRAM_Q;
	  
CA_MATCH	DCA_COMPARE(
	.INVAL_L(CINVAL[0]),
	.CI(CI),
	.MMU_HIT(MMU_HIT),
	.WRITE(WRITE),
	.KDET(1'b0),
	.ADDR({RADR[31:12],VADR_R[11:4]}),
	.CFG(CFG),
	.ENDRAM(ENDRAM),
	.CVALID(CVALID),
	.TAG0(TAG0),
	.TAG1(TAG1),
	.CA_HIT(CA_HIT),
	.CA_SET(CA_SET),
	.WB_ACC(),
	.USE_CA(USE_CA),
	.DRAMSZ(DRAMSZ),
	.IO_SPACE(IO_SPACE),
	.DC_ILO(1'b0),
	.KILL(KILL_C),
	.UPDATE(UPDATE_C));
	
DCA_CONTROL	DCA_CTRL(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.CA_SET(CA_SET),
	.HIT_ALL(HIT_ALL),
	.UPDATE(UPCD),
	.VADR_R(VADR_R[11:7]),
	.DRAM_ACC(DRAM_ACC),
	.CUPDATE(CUPDATE),
	.KILL(KILL),
	.WRITE(WRITE),
	.USE_CA(DRAM_A[1]),
	.INHIBIT(INHIBIT),
	.INVAL_A(CINVAL[1]),
	.MDONE(MDONE),
	.DAT_CV(D_CV),
	.WADR_CV(A_CV),
	.WE_CV(WE_CV),
	.INIT_CA_RUN(INIT_CA_RUN),
	.WRCRAM0(WRCRAM0),
	.WRCRAM1(WRCRAM1),
	.WRSET0(WRSET0),
	.WRSET1(WRSET1));

ICACHE_SM	IC_SM(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.IO_SPACE(IO_SPACE),
	.READ(READ),
	.MDONE(MDONE),
	.IO_READY(IO_READY),
	.MMU_HIT(MMU_HIT),
	.CA_HIT(CA_HIT),
	.USE_CA(USE_CA),
	.PTB_WR(PTB_WR),
	.PTB_SEL(PTB_SEL),
	.USER(USER),
	.PROT_ERROR(PROT_ERROR),
	.PTE_ACC(IC_SIGS[1]),
	.ACC_OK(ACOK),
	.PTB_ONE(PTB_ONE),
	.NEW_PTB(NEW_PTB),
	.AUX_DAT(AUX_DAT),
	.CUPDATE(CUPDATE),
	.IO_RD(IO_RD),
	.IO_ACC(IO_ACC),
	.DRAM_ACC(DRAM_ACC),
	.IC_PREQ(IC_PREQ),
	.HIT_ALL(HIT_ALL));

// +++++++++++++++++++++++++  Kollision Valid  +++++++++++++++

NEU_VALID	KOL_VAL(
	.BCLK(BCLK),
	.VALIN(D_CV),
	.WADR(ACV),
	.WREN(WE_CV),
	.RADR(KOLLI_A[11:7]),
	.VALOUT(KCVALID) );

// +++++++++++++++++++++++++  Kollision Tag Set 0  +++++++++++

always @(posedge BCLK) KTAG0 <= KTAGSET_0[KOLLI_A[11:4]];

always @(negedge BCLK) if (WRCRAM0) KTAGSET_0[VADR_R[11:4]] <= TAGDAT;

// +++++++++++++++++++++++++  Kollision Tag Set 1  +++++++++++

always @(posedge BCLK) KTAG1 <= KTAGSET_1[KOLLI_A[11:4]];

always @(negedge BCLK) if (WRCRAM1) KTAGSET_1[VADR_R[11:4]] <= TAGDAT;

KOLDETECT	KOLLOGIK(
	.DRAM_WR(DRAM_WR),
	.BCLK(BCLK),
	.READ_I(READ_I),
	.ACC_OK(ACC_OK),
	.BRESET(BRESET),
	.INVAL_A(CINVAL[1]),
	.KDET(KDET),
	.HOLD(HOLD),
	.ENA_HK(ENA_HK),
	.STOP_CINV(STOP_CINV),
	.ADDR(KOLLI_A),
	.C_VALID(KCVALID),
	.CFG(CFG),
	.CVALID(CVALID),
	.TAG0(KTAG0),
	.TAG1(KTAG1),
	.KOLLISION(KOLLISION),
	.STOP_ICRD(STOP_ICRD),
	.RUN_ICRD(RUN_ICRD),
	.KILL(KILL_K),
	.ICTODC(ICTODC[2:0]),
	.KILLADR(KILLADR),
	.NEWCVAL(NEWCVAL));

MMU_MATCH	MMU_COMPARE(
	.USER(USER),
	.READ(READ),
	.WRITE(WRITE),
	.RMW(RMW),
	.IVAR(IVAR),
	.MCR_FLAGS(MCR_FLAGS[2:0]),
	.MMU_VA(MMU_Q[35:20]),
	.MVALID(MVALID),
	.VADR_R(VADR_R[31:12]),
	.MMU_HIT(MMU_HIT),
	.PROT_ERROR(PROT_ERROR),
	.VIRTUELL(VIRTUELL),
	.CI(CI),
	.SEL_PTB1(),
	.UPDATE(UPDATE_M));

MMU_UP	MMU_CTRL(
	.NEW_PTB(NEW_PTB),
	.IVAR(IVAR[1]),
	.BRESET(BRESET),
	.PTB1(PTB_ONE),
	.BCLK(BCLK),
	.WR_MRAM(IC_SIGS[0]),
	.MVALID(MVALID),
	.UPDATE(UPDATE_M),
	.VADR(VADR[19:16]),
	.VADR_R(VADR_R[19:16]),
	.WE_MV(WEMV),
	.NEW_PTB_RUN(NEW_PTB_RUN),
	.DAT_MV(DAT_MV),
	.RADR_MV(RADR_MV),
	.WADR_MV(WADR_MV));

// +++++++++++++++++++++++++  MMU Valid  +++++++++++++++++++++

always @(posedge BCLK) MVALID <= MMU_VALID[RADR_MV];

always @(negedge BCLK) if (WEMV) MMU_VALID[WADR_MV] <= DAT_MV;

// +++++++++++++++++++++++++  MMU Tags  ++++++++++++++++++++++

always @(posedge BCLK) MMU_Q <= MMU_TAGS[VADR[19:12]];

always @(negedge BCLK) if (IC_SIGS[0]) MMU_TAGS[VADR_R[19:12]] <= {VADR_R[31:20],MMU_DIN[23:0]};

endmodule
