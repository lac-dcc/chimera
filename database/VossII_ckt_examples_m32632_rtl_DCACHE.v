// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	DCACHE.v
//  Version:	3.0 Cache Interface reworked
//	History:	2.1 bug fix of November 2016
//				2.0 50 MHz release of 14 August 2016
//				1.1 bug fix of 7 October 2015
//				1.0 first release of 30 Mai 2015
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
//	DCACHE		the data cache of M32632
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module DCACHE( 	BCLK, DRAMSZ, MDONE, BRESET, PTB_WR, PTB_SEL, IO_READY, CTRL_QW, PSR_USER, WRITE, READ, RMW,
				QWATWO, ENWR, IC_PREQ, DMA_CHK, CFG, CINVAL, DMA_AA, DP_Q, DRAM_Q, IC_VA, ICTODC, IO_Q, IVAR, 
				MCR_FLAGS, PACKET, SIZE, VADR, INHIBIT, IO_RD, IO_WR, DRAM_ACC, DRAM_WR, INIT_RUN, PTE_STAT, KDET,
				HLDA, ACC_STAT, DP_DI, DRAM_A, DRAM_DI, IACC_STAT, IC_SIGS, IO_A, IO_BE, IO_DI, KOLLI_A, MMU_DIN, ZTEST, 
				RWVAL, RWVFLAG, DBG_IN, DBG_HIT, ENDRAM );

input			BCLK;
input	 [2:0]	DRAMSZ;
input			MDONE;
input			BRESET;
input			PTB_WR;
input			PTB_SEL;
input			IO_READY;
input	 [1:0]	CTRL_QW;
input			PSR_USER;
input			WRITE;
input			READ;
input			ZTEST;
input			RMW;
input			QWATWO;
input			ENWR;
input			IC_PREQ;
input			DMA_CHK;
input	 [1:0]	CFG;
input	 [1:0]	CINVAL;
input	[28:4]	DMA_AA;
input	[63:0]	DP_Q;
input  [127:0]	DRAM_Q;
input  [31:12]	IC_VA;
input	 [3:0]	ICTODC;
input	[31:0]	IO_Q;
input	 [1:0]	IVAR;
input	 [3:0]	MCR_FLAGS;
input	 [3:0]	PACKET;
input	 [1:0]	SIZE;
input	[31:0]	VADR;
input			INHIBIT;
input	 [2:0]	RWVAL;
input	[40:2]	DBG_IN;
input			ENDRAM;

output			IO_RD;
output			IO_WR;
output			DRAM_ACC;
output			DRAM_WR;
output			INIT_RUN;
output	 [1:0]	PTE_STAT;
output			KDET;
output			HLDA;
output			RWVFLAG;
output	 [5:0]	ACC_STAT;
output	[31:0]	DP_DI;
output	 [3:1]	IACC_STAT;
output	 [1:0]	IC_SIGS;
output	[28:4]	KOLLI_A;
output	[23:0]	MMU_DIN;
output reg	[28:0]	DRAM_A;
output reg	[35:0]	DRAM_DI;
output reg	[31:0]	IO_A;
output reg	 [3:0]	IO_BE;
output reg	[31:0]	IO_DI;
output			DBG_HIT;

reg		[31:0]	DFFE_IOR;
reg		[31:0]	CAPDAT;
reg		[31:0]	VADR_R;
reg				AUX_ALT;
reg				DFF_QWEXT;
reg		[11:4]	KOLLI_AR;

wire	[28:4]	ADDR;
wire			ADR_EQU;
wire			AUX_DAT;
wire			CA_HIT;
wire			CA_SET;
wire			CUPDATE;
wire			DMA_MUX;
wire	 [3:0]	ENBYTE;
wire			HIT_ALL;
wire			INIT_CA_RUN;
wire			IO_ACC;
wire			IO_SPACE;
wire			KOMUX;
wire			MMU_HIT;
wire			NEW_PTB;
wire			PTB_ONE;
wire	[28:0]	PTE_ADR;
wire   [31:12]	RADR;
wire	[11:4]	TAGA;
wire	[23:0]	UPDATE_C;
wire	[31:0]	UPDATE_M;
wire			USE_CA;
wire			USER;
wire			WB_ACC;
wire			WEMV;
wire			WR_MRAM;
wire	[31:0]	WRDATA;
wire			VIRT_A;
wire			PTE_MUX;
wire			WE_CV;
wire	[23:0]	DAT_CV;
wire	 [4:0]	WADR_CV;
wire			WRSET0;
wire	[15:0]	BE_SET;
wire   [127:0]	DAT_SET;
wire	[31:0]	CAP_Q;
wire			WRSET1;
wire			SEL_PTB1;
wire			CI;
wire	[28:0]	ADR_MX;
wire			LD_DRAM_A;
wire			VIRTUELL;
wire			NEW_PTB_RUN;
wire			KILL;
wire			LAST_MUX;
wire	[31:0]	SET_DAT;
wire	[31:0]	ALT_DAT;
wire	[31:0]	DAT_MV;
wire	 [3:0]	RADR_MV;
wire	 [3:0]	WADR_MV;
wire	[31:0]	LAST_DAT;
wire			WRCRAM0;
wire			WRCRAM1;
wire			PROT_ERROR;
wire			AUX_QW;
wire			PD_MUX;
wire	[19:0]	PTE_DAT;
wire			PKEEP;
wire			XADDR2;
wire   [28:12]	TAGDAT;

// +++++++++++++++++++ Memories ++++++++++++++++++++

reg	 	 [7:0]	DATA0_P [0:255];	// Data Set 0 : 4 kBytes
reg	 	 [7:0]	DATA0_O [0:255];
reg	 	 [7:0]	DATA0_N [0:255];
reg	 	 [7:0]	DATA0_M [0:255];
reg	 	 [7:0]	DATA0_L [0:255];	// Data Set 0 : 4 kBytes
reg	 	 [7:0]	DATA0_K [0:255];
reg	 	 [7:0]	DATA0_J [0:255];
reg	 	 [7:0]	DATA0_I [0:255];
reg	 	 [7:0]	DATA0_H [0:255];	// Data Set 0 : 4 kBytes
reg	 	 [7:0]	DATA0_G [0:255];
reg	 	 [7:0]	DATA0_F [0:255];
reg	 	 [7:0]	DATA0_E [0:255];
reg	 	 [7:0]	DATA0_D [0:255];	// Data Set 0 : 4 kBytes
reg	 	 [7:0]	DATA0_C [0:255];
reg	 	 [7:0]	DATA0_B [0:255];
reg	 	 [7:0]	DATA0_A [0:255];
reg	   [127:0]	RDDATA0;
reg		[31:0]	SET_DAT0;

reg	 	 [7:0]	DATA1_P [0:255];	// Data Set 1 : 4 kBytes
reg	 	 [7:0]	DATA1_O [0:255];
reg	 	 [7:0]	DATA1_N [0:255];
reg	 	 [7:0]	DATA1_M [0:255];
reg	 	 [7:0]	DATA1_L [0:255];	// Data Set 1 : 4 kBytes
reg	 	 [7:0]	DATA1_K [0:255];
reg	 	 [7:0]	DATA1_J [0:255];
reg	 	 [7:0]	DATA1_I [0:255];
reg	 	 [7:0]	DATA1_H [0:255];	// Data Set 1 : 4 kBytes
reg	 	 [7:0]	DATA1_G [0:255];
reg	 	 [7:0]	DATA1_F [0:255];
reg	 	 [7:0]	DATA1_E [0:255];
reg	 	 [7:0]	DATA1_D [0:255];	// Data Set 1 : 4 kBytes
reg	 	 [7:0]	DATA1_C [0:255];
reg	 	 [7:0]	DATA1_B [0:255];
reg	 	 [7:0]	DATA1_A [0:255];
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

assign	ALT_DAT	= AUX_ALT ? DFFE_IOR : CAPDAT ;

assign	RADR	= VIRT_A ? MMU_Q[19:0] : VADR_R[31:12] ;

assign	ADR_MX	= PTE_MUX ? PTE_ADR : {RADR[28:12],VADR_R[11:2],USE_CA,CA_SET} ;

assign	KOLLI_A	= DMA_MUX ? DMA_AA : DRAM_A[28:4] ;

assign	SET_DAT	= CA_SET ? SET_DAT1 : SET_DAT0 ;

assign	VIRT_A	= ~CINVAL[0] & VIRTUELL;

assign	USER	= ~MCR_FLAGS[3] & PSR_USER;

assign	ADDR	= KDET ? {KOLLI_A[28:12],KOLLI_AR} : {RADR[28:12],VADR_R[11:4]} ;

assign	TAGA	= KOMUX ? KOLLI_A[11:4] : VADR[11:4] ;

assign	INIT_RUN = NEW_PTB_RUN | INIT_CA_RUN;

assign	LAST_MUX = AUX_ALT | AUX_DAT | AUX_QW;

assign	LAST_DAT = LAST_MUX ? ALT_DAT : SET_DAT ;

assign	LD_DRAM_A = ~(DRAM_ACC | PKEEP);

assign	ACC_STAT[4] = IO_ACC;
assign	ACC_STAT[5] = CA_HIT;

assign	XADDR2 = VADR_R[2] ^ CTRL_QW[1];

always @(posedge BCLK) KOLLI_AR <= KOLLI_A[11:4];

always @(posedge BCLK)
	if (IO_ACC)
		begin
			IO_BE <= ENBYTE;
			IO_DI <= WRDATA;
			IO_A  <= {RADR[31:12],VADR_R[11:3],XADDR2,VADR_R[1:0]};
		end

always @(posedge BCLK) if (LD_DRAM_A) DRAM_A[28:0] <= ADR_MX[28:0];

always @(posedge BCLK) if (IO_RD) DFFE_IOR <= IO_Q;

always @(posedge BCLK)
	begin
		DRAM_DI	  <= {(PD_MUX ? PTE_DAT[19:16] : ENBYTE),WRDATA[31:16],
					  (PD_MUX ? PTE_DAT[15:0]  : WRDATA[15:0])};
		AUX_ALT	  <= DFF_QWEXT | IO_RD;
		DFF_QWEXT <= IO_RD & SIZE[0] & SIZE[1];
		VADR_R	  <= VADR;
	end

always @(posedge BCLK) if (MDONE) CAPDAT <= CAP_Q;

// +++++++++++++++++++++++++  Cache Valid  +++++++++++++++++++

NEU_VALID	VALID_RAM(
	.BCLK(BCLK),
	.VALIN(DAT_CV),
	.WADR(WADR_CV),
	.WREN(WE_CV),
	.RADR(TAGA[11:7]),
	.VALOUT(CVALID) );

// +++++++++++++++++++++++++  Tag Set 0  +++++++++++++++++++++

always @(posedge BCLK) TAG0 <= TAGSET_0[TAGA];

always @(negedge BCLK) if (WRCRAM0) TAGSET_0[VADR_R[11:4]] <= TAGDAT;

// +++++++++++++++++++++++++  Tag Set 1  +++++++++++++++++++++

always @(posedge BCLK) TAG1 <= TAGSET_1[TAGA];

always @(negedge BCLK) if (WRCRAM1) TAGSET_1[VADR_R[11:4]] <= TAGDAT;

// +++++++++++++++++++++++++  DIN MUX  +++++++++++++++++++++++

WRPORT  DINMUX(
	.WRITE(WRITE),
	.DRAM_Q(DRAM_Q),
	.DADDR(DRAM_A[3:2]),
	.VADDR(VADR_R[3:2]),
	.WRDATA(WRDATA),
	.ENBYTE(ENBYTE),
	.CAP_Q(CAP_Q),
	.WDAT(DAT_SET),
	.ENB(BE_SET) );
	
// +++++++++++++++++++++++++  Data Set 0  ++++++++++++++++++++

always @(posedge BCLK)
	begin
		RDDATA0[127:120]	<= DATA0_P[VADR[11:4]];
		RDDATA0[119:112]	<= DATA0_O[VADR[11:4]];
		RDDATA0[111:104]	<= DATA0_N[VADR[11:4]];
		RDDATA0[103:96]		<= DATA0_M[VADR[11:4]];
		RDDATA0[95:88]		<= DATA0_L[VADR[11:4]];
		RDDATA0[87:80]		<= DATA0_K[VADR[11:4]];
		RDDATA0[79:72]		<= DATA0_J[VADR[11:4]];
		RDDATA0[71:64]		<= DATA0_I[VADR[11:4]];
		RDDATA0[63:56]		<= DATA0_H[VADR[11:4]];
		RDDATA0[55:48]		<= DATA0_G[VADR[11:4]];
		RDDATA0[47:40]		<= DATA0_F[VADR[11:4]];
		RDDATA0[39:32]		<= DATA0_E[VADR[11:4]];
		RDDATA0[31:24]		<= DATA0_D[VADR[11:4]];
		RDDATA0[23:16]		<= DATA0_C[VADR[11:4]];
		RDDATA0[15:8]		<= DATA0_B[VADR[11:4]];
		RDDATA0[7:0]		<= DATA0_A[VADR[11:4]];
	end
	
always @(RDDATA0 or VADR_R)
	case (VADR_R[3:2])
	  2'b00 : SET_DAT0 <= RDDATA0[31:0];
	  2'b01 : SET_DAT0 <= RDDATA0[63:32];
	  2'b10 : SET_DAT0 <= RDDATA0[95:64];
	  2'b11 : SET_DAT0 <= RDDATA0[127:96];
	endcase
	
always @(posedge BCLK)
	if (WRSET0)
		begin
			if (BE_SET[15]) DATA0_P[VADR_R[11:4]] <= DAT_SET[127:120];
			if (BE_SET[14]) DATA0_O[VADR_R[11:4]] <= DAT_SET[119:112];
			if (BE_SET[13]) DATA0_N[VADR_R[11:4]] <= DAT_SET[111:104];
			if (BE_SET[12]) DATA0_M[VADR_R[11:4]] <= DAT_SET[103:96];
			if (BE_SET[11]) DATA0_L[VADR_R[11:4]] <= DAT_SET[95:88];
			if (BE_SET[10]) DATA0_K[VADR_R[11:4]] <= DAT_SET[87:80];
			if (BE_SET[9])  DATA0_J[VADR_R[11:4]] <= DAT_SET[79:72];
			if (BE_SET[8])  DATA0_I[VADR_R[11:4]] <= DAT_SET[71:64];
			if (BE_SET[7])  DATA0_H[VADR_R[11:4]] <= DAT_SET[63:56];
			if (BE_SET[6])  DATA0_G[VADR_R[11:4]] <= DAT_SET[55:48];
			if (BE_SET[5])  DATA0_F[VADR_R[11:4]] <= DAT_SET[47:40];
			if (BE_SET[4])  DATA0_E[VADR_R[11:4]] <= DAT_SET[39:32];
			if (BE_SET[3])  DATA0_D[VADR_R[11:4]] <= DAT_SET[31:24];
			if (BE_SET[2])  DATA0_C[VADR_R[11:4]] <= DAT_SET[23:16];
			if (BE_SET[1])  DATA0_B[VADR_R[11:4]] <= DAT_SET[15:8];
			if (BE_SET[0])  DATA0_A[VADR_R[11:4]] <= DAT_SET[7:0];
		end
		
// +++++++++++++++++++++++++  Data Set 1  ++++++++++++++++++++

always @(posedge BCLK)
	begin
		RDDATA1[127:120]	<= DATA1_P[VADR[11:4]];
		RDDATA1[119:112]	<= DATA1_O[VADR[11:4]];
		RDDATA1[111:104]	<= DATA1_N[VADR[11:4]];
		RDDATA1[103:96]		<= DATA1_M[VADR[11:4]];
		RDDATA1[95:88]		<= DATA1_L[VADR[11:4]];
		RDDATA1[87:80]		<= DATA1_K[VADR[11:4]];
		RDDATA1[79:72]		<= DATA1_J[VADR[11:4]];
		RDDATA1[71:64]		<= DATA1_I[VADR[11:4]];
		RDDATA1[63:56]		<= DATA1_H[VADR[11:4]];
		RDDATA1[55:48]		<= DATA1_G[VADR[11:4]];
		RDDATA1[47:40]		<= DATA1_F[VADR[11:4]];
		RDDATA1[39:32]		<= DATA1_E[VADR[11:4]];
		RDDATA1[31:24]		<= DATA1_D[VADR[11:4]];
		RDDATA1[23:16]		<= DATA1_C[VADR[11:4]];
		RDDATA1[15:8]		<= DATA1_B[VADR[11:4]];
		RDDATA1[7:0]		<= DATA1_A[VADR[11:4]];
	end
	
always @(RDDATA1 or VADR_R)
	case (VADR_R[3:2])
	  2'b00 : SET_DAT1 <= RDDATA1[31:0];
	  2'b01 : SET_DAT1 <= RDDATA1[63:32];
	  2'b10 : SET_DAT1 <= RDDATA1[95:64];
	  2'b11 : SET_DAT1 <= RDDATA1[127:96];
	endcase
	
always @(posedge BCLK)
	if (WRSET1)
		begin
			if (BE_SET[15]) DATA1_P[VADR_R[11:4]] <= DAT_SET[127:120];
			if (BE_SET[14]) DATA1_O[VADR_R[11:4]] <= DAT_SET[119:112];
			if (BE_SET[13]) DATA1_N[VADR_R[11:4]] <= DAT_SET[111:104];
			if (BE_SET[12]) DATA1_M[VADR_R[11:4]] <= DAT_SET[103:96];
			if (BE_SET[11]) DATA1_L[VADR_R[11:4]] <= DAT_SET[95:88];
			if (BE_SET[10]) DATA1_K[VADR_R[11:4]] <= DAT_SET[87:80];
			if (BE_SET[9])  DATA1_J[VADR_R[11:4]] <= DAT_SET[79:72];
			if (BE_SET[8])  DATA1_I[VADR_R[11:4]] <= DAT_SET[71:64];
			if (BE_SET[7])  DATA1_H[VADR_R[11:4]] <= DAT_SET[63:56];
			if (BE_SET[6])  DATA1_G[VADR_R[11:4]] <= DAT_SET[55:48];
			if (BE_SET[5])  DATA1_F[VADR_R[11:4]] <= DAT_SET[47:40];
			if (BE_SET[4])  DATA1_E[VADR_R[11:4]] <= DAT_SET[39:32];
			if (BE_SET[3])  DATA1_D[VADR_R[11:4]] <= DAT_SET[31:24];
			if (BE_SET[2])  DATA1_C[VADR_R[11:4]] <= DAT_SET[23:16];
			if (BE_SET[1])  DATA1_B[VADR_R[11:4]] <= DAT_SET[15:8];
			if (BE_SET[0])  DATA1_A[VADR_R[11:4]] <= DAT_SET[7:0];
		end

DCACHE_SM	DC_SM(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.VIRTUELL(VIRTUELL),
	.IO_SPACE(IO_SPACE),
	.MDONE(MDONE),
	.MMU_HIT(MMU_HIT),
	.CA_HIT(CA_HIT),
	.READ(READ),
	.WRITE(WRITE),
	.ZTEST(ZTEST),
	.RMW(RMW),
	.QWATWO(QWATWO),
	.USE_CA(USE_CA),
	.PTB_WR(PTB_WR),
	.PTB_SEL(PTB_SEL),
	.SEL_PTB1(SEL_PTB1),
	.IO_READY(IO_READY),
	.USER(USER),
	.PROTECT(ACC_STAT[3]),
	.PROT_ERROR(PROT_ERROR),
	.ENWR(ENWR),
	.WB_ACC(WB_ACC),
	.ADR_EQU(ADR_EQU),
	.IC_PREQ(IC_PREQ),
	.CAPDAT(CAPDAT[31:0]),
	.CPU_OUT(DP_Q[60:44]),
	.DMA_CHK(DMA_CHK),
	.IC_VA(IC_VA),
	.ICTODC(ICTODC),
	.VADR_R(VADR_R[31:12]),
	.NEW_PTB(NEW_PTB),
	.PTB_ONE(PTB_ONE),
	.DRAM_ACC(DRAM_ACC),
	.DRAM_WR(DRAM_WR),
	.IO_ACC(IO_ACC),
	.IO_RD(IO_RD),
	.IO_WR(IO_WR),
	.PTE_STAT(PTE_STAT),
	.ABORT(ACC_STAT[1]),
	.WR_MRAM(WR_MRAM),
	.CUPDATE(CUPDATE),
	.AUX_DAT(AUX_DAT),
	.PTE_MUX(PTE_MUX),
	.ACC_OK(ACC_STAT[0]),
	.ABO_LEVEL1(ACC_STAT[2]),
	.IACC_STAT(IACC_STAT),
	.KOMUX(KOMUX),
	.KDET(KDET),
	.HIT_ALL(HIT_ALL),
	.DMA_MUX(DMA_MUX),
	.HLDA(HLDA),
	.RWVAL(RWVAL[1:0]),
	.RWVFLAG(RWVFLAG),
	.IC_SIGS(IC_SIGS),
	.MMU_DIN(MMU_DIN),
	.PD_MUX(PD_MUX),
	.PKEEP(PKEEP),
	.PTE_ADR(PTE_ADR),
	.PTE_DAT(PTE_DAT));

CA_MATCH	DCA_COMPARE(
	.INVAL_L(CINVAL[0]),
	.CI(CI),
	.MMU_HIT(MMU_HIT),
	.WRITE(WRITE),
	.KDET(KDET),
	.ADDR({RADR[31:29],ADDR}),
	.CFG(CFG),
	.ENDRAM(ENDRAM),
	.CVALID(CVALID),
	.TAG0(TAG0),
	.TAG1(TAG1),
	.CA_HIT(CA_HIT),
	.CA_SET(CA_SET),
	.WB_ACC(WB_ACC),
	.USE_CA(USE_CA),
	.DRAMSZ(DRAMSZ),
	.IO_SPACE(IO_SPACE),
	.KILL(KILL),
	.DC_ILO(RWVAL[2]),
	.UPDATE(UPDATE_C));

DCA_CONTROL	DCA_CTRL(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.CA_SET(CA_SET),
	.HIT_ALL(HIT_ALL),
	.UPDATE(UPDATE_C),
	.VADR_R(ADDR[11:7]),
	.DRAM_ACC(DRAM_ACC),
	.CUPDATE(CUPDATE),
	.KILL(KILL),
	.WRITE(WRITE),
	.USE_CA(DRAM_A[1]),
	.INHIBIT(INHIBIT),
	.INVAL_A(CINVAL[1]),
	.MDONE(MDONE),
	.DAT_CV(DAT_CV),
	.WADR_CV(WADR_CV),
	.WE_CV(WE_CV),
	.INIT_CA_RUN(INIT_CA_RUN),
	.WRCRAM0(WRCRAM0),
	.WRCRAM1(WRCRAM1),
	.WRSET0(WRSET0),
	.WRSET1(WRSET1));

MMU_MATCH	MMU_COMPARE(
	.USER(USER),
	.WRITE(WRITE),
	.READ(READ),
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
	.SEL_PTB1(SEL_PTB1),
	.UPDATE(UPDATE_M));

MMU_UP	MMU_CTRL(
	.BCLK(BCLK),
	.BRESET(BRESET),
	.NEW_PTB(NEW_PTB),
	.IVAR(IVAR[1]),
	.PTB1(PTB_ONE),
	.WR_MRAM(WR_MRAM),
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

always @(negedge BCLK) if (WR_MRAM) MMU_TAGS[VADR_R[19:12]] <= {VADR_R[31:20],MMU_DIN[23:0]};

RD_ALIGNER	RD_ALI(
	.BCLK(BCLK),
	.ACC_OK(ACC_STAT[0]),
	.REG_OUT(CTRL_QW[0]),
	.PACKET(PACKET),
	.RDDATA(LAST_DAT),
	.SIZE(SIZE),
	.CA_HIT(CA_HIT),
	.DP_DI(DP_DI),
	.AUX_QW(AUX_QW));

WR_ALIGNER	WR_ALI(
	.DP_Q(DP_Q),
	.PACKET(PACKET),
	.SIZE(SIZE),
	.ENBYTE(ENBYTE),
	.WRDATA(WRDATA));
	
DEBUG_AE  DBGAE(
	.DBG_IN(DBG_IN),
	.READ(READ),
	.WRITE(WRITE),
	.USER(USER),
	.VIRTUELL(VIRTUELL),
	.ACC_OK(ACC_STAT[0]),
	.VADR_R(VADR_R[31:2]),
	.MMU_Q(MMU_Q[19:0]),
	.ENBYTE(ENBYTE),
	.DBG_HIT(DBG_HIT));
	
FILTCMP  FILT_CMP(
	.RADR({RADR[28:12],VADR_R[11:4]}),
	.DRAMSZ(DRAMSZ),
	.DRAM_A(DRAM_A[28:4]),
	.TAGDAT(TAGDAT),
	.ADR_EQU(ADR_EQU));

endmodule
