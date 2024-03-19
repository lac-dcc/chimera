// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	STEUER_MISC.v
//	Version:	3.0
//	History:	1.0 first release of 30 Mai 2015
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
//	1. OPDEC_REG 	Central Instruction Register
//	2. PROG_COUNTER	Program Counters
//	3. REG_LIST		Register List Evaluation
//	4. ILL_UNDEF	Illegal and Undefined Opcodes Detection
//	5. GRUPPE_2		Decoder and State Machine for GRUPPE_2 Opcodes
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. OPDEC_REG 	Central Instruction Register
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module OPDEC_REG ( BCLK, BRESET, NEW, ACC_STAT, PROT_ERROR, ALSB, USED, IC_DIN, IC_INIT, DC_INIT, Y_INIT, RESTART, STOP_IC,
				   OPREG, ANZ_VAL, IC_READ, NEW_PC, NEXT_ADR, DATA_HOLD, ABORT, IC_TEX, INIT_DONE);

	input			BCLK,BRESET;
	input			NEW;		// a program jump took place
	input	 [3:0]	ACC_STAT;	// ICACHE signals data is available or Abort
	input			PROT_ERROR;	// comes direct from ICACHE
	input	 [1:0]	ALSB;		// lower addressbits of access address to ICACHE
	input	 [2:0]	USED;		// Message from DECODER how many bytes were used
	input	[31:0]	IC_DIN;		// ICACHE Data
	input			IC_INIT,DC_INIT,Y_INIT;	// Initialising or new setting is running
	input			RESTART;	// "Break" of Instruction Pipeline - set up new i.e. after load of PSR
	input			STOP_IC;	// For LMR and CINV
	
	output	[55:0]	OPREG;		// this is the Central Opcode Decode Register, length = 7 bytes
	output	 [2:0]	ANZ_VAL;
	output			IC_READ;
	output			NEW_PC;
	output			NEXT_ADR;
	output			DATA_HOLD;
	output			ABORT;
	output	 [2:0]	IC_TEX;
	output			INIT_DONE;
	
	reg		[55:0]	OPREG;
	reg		 [2:0]	ANZ_VAL;
	reg				IC_READ;
	reg				ABORT;
	reg				abort_flag;
	reg		 [2:0]	IC_TEX;
	reg		[55:0]	data_to_ri;
	reg				old_init;
	reg				pre_new;
	reg				new_reg;
	reg				nseq_flag;
	reg				stop_init;
	
	wire	 [2:0]	new_anz;
	wire			new_restart;
	wire			acc_err,acc_ok,acc_ende;
	
	// ++++++++++++++++++++  Evaluation of ACC_STAT from Instructioncache  ++++++++++++++++++++++++++++
	
	// ACC_STAT[3:0] : PROT_ERROR , ABO_LEVEL1 , ABORT , ACC_OK
	
	assign acc_err = ACC_STAT[3] | ACC_STAT[1] | PROT_ERROR;
	assign acc_ok  = ACC_STAT[0];
	
	always @(posedge BCLK or negedge BRESET)	// is kept until DECODER really needs the data !
		if (!BRESET) ABORT <= 1'b0;
		  else ABORT <=  (acc_err & ~(new_restart | pre_new)) | (ABORT & ~NEW_PC);
		  
	always @(posedge BCLK) if (acc_err) IC_TEX <= (ACC_STAT[3] | PROT_ERROR) ? {nseq_flag,2'b11} : {nseq_flag,~ACC_STAT[2],ACC_STAT[2]};
	
	always @(posedge BCLK) nseq_flag <= NEW_PC | (nseq_flag & ~acc_ok);	// for MMU Status Register

	always @(posedge BCLK) abort_flag <= acc_err;
	assign acc_ende = ~IC_READ | acc_ok | abort_flag;	// abort_flag one cycle later is ok ! If no ICache access always end
	
	assign new_restart = NEW | RESTART;	// They are pulses
	
	// Branch work out : NEW/RESTART notice if access still not ended
	always @(posedge BCLK) pre_new <= (new_restart & ~acc_ende) | (pre_new & ~acc_ende & BRESET);
	
	assign NEW_PC = (new_restart | pre_new) & acc_ende;	// At the end of access geenerate new address !
	
	// There are 2 "NEW/RESTART" : "new_restart" combinatorical out of DECODER, "pre_new" out of Register
	always @(posedge BCLK) new_reg <= new_restart | pre_new | (new_reg & ~acc_ende & BRESET);
	
	always @(USED or OPREG)	// Data first shift to the right
		case (USED)
		  3'b000 : data_to_ri = OPREG;
		  3'b001 : data_to_ri =               { 8'hxx, OPREG[55:8]};
		  3'b010 : data_to_ri =             {16'hxxxx,OPREG[55:16]};
		  3'b011 : data_to_ri =          {24'hxx_xxxx,OPREG[55:24]};
		  3'b100 : data_to_ri =        {32'hxxxx_xxxx,OPREG[55:32]};
		  3'b101 : data_to_ri =     {40'hxx_xxxx_xxxx,OPREG[55:40]};
		  3'b110 : data_to_ri =   {48'hxxxx_xxxx_xxxx,OPREG[55:48]};
		  3'b111 : data_to_ri = 56'hxx_xxxx_xxxx_xxxx;
		endcase

	assign new_anz = ANZ_VAL - USED;

	always @(posedge BCLK)
		casex ({new_reg,acc_ok,ALSB,new_anz})	
		  7'b1_100_xxx : OPREG <=        {24'hxx_xxxx,IC_DIN};
		  7'b1_101_xxx : OPREG <=      {32'hxxxx_xxxx,IC_DIN[31:8]};
		  7'b1_110_xxx : OPREG <=   {40'hxx_xxxx_xxxx,IC_DIN[31:16]};
		  7'b1_111_xxx : OPREG <= {48'hxxxx_xxxx_xxxx,IC_DIN[31:24]};
		  7'b0_0xx_xxx : OPREG <= data_to_ri;
		  7'b0_1xx_000 : OPREG <= {24'hxx_xxxx,IC_DIN};
		  7'b0_1xx_001 : OPREG <= {   16'hxxxx,IC_DIN, data_to_ri[7:0]};
		  7'b0_1xx_010 : OPREG <= {      8'hxx,IC_DIN,data_to_ri[15:0]};
		  7'b0_1xx_011 : OPREG <= {            IC_DIN,data_to_ri[23:0]};
		  7'b0_1xx_1xx : OPREG <= data_to_ri;
		endcase
		
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) ANZ_VAL <= 3'b000;
		  else
			casex ({new_restart,new_reg,acc_ok,new_anz[2]})
			  4'b1x_x_x : ANZ_VAL <= 3'b000;	// hard setting to 0
			  4'b01_0_x : ANZ_VAL <= 3'b000;
			  4'b01_1_x : ANZ_VAL <= pre_new ? 3'b000 : 3'b100 - {1'b0,ALSB};
			  4'b00_0_x : ANZ_VAL <= new_anz;
			  4'b00_1_0 : ANZ_VAL <= new_anz + 3'b100;
			  4'b00_1_1 : ANZ_VAL <= new_anz;
			endcase
		
	assign NEXT_ADR = new_reg ? (acc_ok & ~pre_new) : (acc_ok & ~new_anz[2]);	// switches MUX at PC resp. ICACHE

	// Instruction CACHE Control : READ is coming after all INITs are done
	
	always @(posedge BCLK) old_init <= IC_INIT | DC_INIT | Y_INIT;
	
	assign INIT_DONE = old_init & ~IC_INIT & ~DC_INIT;

	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) stop_init <= 1'b0;
			else stop_init <= stop_init | IC_READ;
			
	// The INIT_DONE should come after Reset. But it comes too at LMR PTB therefore extra enable after Reset !
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) IC_READ <= 1'b0;
			else IC_READ <= (IC_READ & ~acc_err & ~(STOP_IC & acc_ok)) | NEW_PC | (INIT_DONE & ~stop_init);
	
	// The Opcode-Register can not store the data : keep them in ICACHE at IO-access
	assign DATA_HOLD = ~new_restart & ~new_reg & acc_ok & new_anz[2];
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. PROG_COUNTER	Program Counters
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module PROG_COUNTER ( BCLK, BRESET, NEW, LOAD_PC, NEW_PC, NEXT_ADR, NEXT_PCA, DISP, PC_NEW, USED, USER, SAVE_PC, FPU_TRAP,
					  ADIVAR, PC_ARCHI, PC_ICACHE, PC_SAVE, ALSB, IC_USER);

	input			BCLK,BRESET;
	input			NEW;
	input			LOAD_PC;
	input			NEW_PC;
	input			NEXT_ADR;
	input			NEXT_PCA;
	input	[31:0]	DISP;
	input	[31:0]	PC_NEW;
	input	 [2:0]	USED;
	input			USER;
	input			SAVE_PC;
	input			FPU_TRAP;
	input			ADIVAR;
	
	output	[31:0]	PC_ARCHI;	// goes to Datapath
	output	[31:0]	PC_ICACHE;
	output	[31:0]	PC_SAVE;	// is the return address
	output	 [1:0]	ALSB;
	output			IC_USER;
	
	reg		[31:0]	PC_ARCHI;
	reg		[31:0]	pc_adduse;
	reg		[31:0]	pc_ic_reg;
	reg		[31:0]	fpu_trap_pc;
	reg				IC_USER;
	
	wire	[31:0]	branch,pc_jump,pc_icache_i;
	
	assign PC_SAVE = pc_adduse + {29'h0,USED};
	assign branch  = PC_ARCHI + DISP;
	
	assign pc_jump = LOAD_PC ? PC_NEW : branch;
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) pc_adduse <= 32'h0;
		  else
			pc_adduse <= NEW ? pc_jump : PC_SAVE;	// Only at NEW is the DISP correct !
			
	// The Architectur - PC : Address mode "Programm Memory"-relativ
	// no BRESET because NEXT_PCA is immediately valid
	always @(posedge BCLK)
		if (FPU_TRAP) PC_ARCHI <= fpu_trap_pc;	// go back !
		  else
			if (NEXT_PCA) PC_ARCHI <= pc_adduse;
	
	always @(posedge BCLK) if (SAVE_PC) fpu_trap_pc <= PC_ARCHI;	// Special storage for PC for FPU Trap
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) pc_ic_reg <= 32'h0;
		  else
			pc_ic_reg <= pc_icache_i;
		
	// NEW is only one cycle long - but in pc_adduse is the PC stored when ACC_OK is not there and therefore NEW_PC
	// is used to initiate a new access in ICACHE
	assign pc_icache_i = NEW_PC ? (NEW ? pc_jump : pc_adduse) : (NEXT_ADR ? ({pc_ic_reg[31:2],2'b00} + 32'h0000_0004) : pc_ic_reg);
	
	// This MUX is extra for LMR IVAR,... and CINV build in
	assign PC_ICACHE = {(ADIVAR ? PC_NEW[31:4] : pc_icache_i[31:4]),pc_icache_i[3:0]};
	
	assign ALSB = pc_ic_reg[1:0];	// for OPDEC_REG
	
	// The IC_USER flag is allowed to switch synchronously with one cycle delay to PC_ICACHE
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) IC_USER <= 1'b0;
		  else
			if (NEW_PC) IC_USER <= USER;
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. REG_LIST		Register List Evaluation
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module REG_LIST ( DIN, IPOS, INIT, OPOS, VALID);

	// Detects set bits in register list for SAVE/RESTORE & ENTER/EXIT

	input	 [7:0]	DIN;
	input	 [2:0]	IPOS;
	input			INIT;
	output	 [2:0]	OPOS;
	output			VALID;
	
	reg		 [7:1]	filter;
	wire	 [7:0]	mdat_0;
	wire	 [3:0]	mdat_1;

	always @(IPOS or DIN)
		case (IPOS)
		  3'd0 : filter =  DIN[7:1];
		  3'd1 : filter = {DIN[7:2],1'b0};
		  3'd2 : filter = {DIN[7:3],2'b0};
		  3'd3 : filter = {DIN[7:4],3'b0};
		  3'd4 : filter = {DIN[7:5],4'b0};
		  3'd5 : filter = {DIN[7:6],5'b0};
		  3'd6 : filter = {DIN[7]  ,6'b0};
		  3'd7 : filter =           7'b0;
		endcase
		
	assign mdat_0  = INIT ? DIN : {filter,1'b0};
	assign OPOS[2] = (mdat_0[3:0] == 4'h0);
	assign mdat_1  = OPOS[2] ? mdat_0[7:4] : mdat_0[3:0];
	assign OPOS[1] =   (mdat_1[1:0] == 2'b00);
	assign OPOS[0] = ~((mdat_1[2:1] == 2'b10) | mdat_1[0]);
	assign VALID   =   (mdat_1 != 4'b0000);
	
endmodule
		  
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	4. ILL_UNDEF	Illegal and Undefined Opcodes Detection
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module ILL_UNDEF (OPREG, ANZ_VAL, USER, CFG, ILL, UNDEF );

	input	[23:0]	OPREG;
	input	 [2:0]	ANZ_VAL;
	input	 [3:1]	CFG;		// 3=CUSTOM,2=MMU,1=FPU
	input			USER;
	
	output	reg		ILL;
	output			UNDEF;

	reg				undef_opc;
	reg				undef_am;
	reg				undef_im;
	
	wire	 [2:0]	valid;
	wire			gen12,gen22,gen13,gen23;
	wire			igen12,igen22,igen13,igen23;
	wire			lsbes;
	
	parameter udef_amode = 5'b10011;	// Undefined Addressing Mode
	parameter imode		 = 5'b10100;	// Immediate Addressing Mode 
	
	// [2]= minimum 3, [1]= minimum 2, [0]=minimum 1
	assign valid = {(ANZ_VAL[2] | (ANZ_VAL[1:0] == 2'b11)),(ANZ_VAL[2:1] != 2'b00),(ANZ_VAL != 3'b000)};
	assign lsbes = (OPREG[1:0] == 2'b10);	// Tag of all 3 Byte opcodes
	
	// +++++++++++++++++++++++++  Detect illegale opcodes  +++++++++++++++++++
	
	always @(OPREG or lsbes or valid or USER)
		casex ({valid[2:1],OPREG[13:2],lsbes})
		  15'bx1_xx_x000_1x10_11_0 : ILL = USER;	// SPRi/LPRi DCR
		  15'bx1_xx_x001_xx10_11_0 : ILL = USER;	// SPRi/LPRi BPC/DSR
		  15'bx1_xx_xx10_xx10_11_0 : ILL = USER;	// SPRi/LPRi CAR/CFG/PSR
		  15'bx1_xx_x101_1x10_11_0 : ILL = USER;	// SPRi/LPRi USP
		  15'bx1_xx_x111_0x10_11_0 : ILL = USER;	// SPRi/LPRi INTBASE
		  15'bx1_xx_x0x1_0111_11_x : ILL = USER & OPREG[0];	// BICPSRW,BISPSRW
		  15'bx1_00_10xx_0000_11_1 : ILL = USER;	// SETCFG - Achtung : is coded as 2 Byte Opcode 
		  15'b1x_00_xxxx_0001_11_1 : ILL = USER;	// LMR/SMR/RDVAL/WRVAL
		  15'b1x_10_01xx_0001_11_1 : ILL = USER;	// CINV
		  default				   : ILL = 1'b0;
		endcase

	// ++++++++++++++++++++++++ Detect Undefined opcodes  +++++++++++++++
	
	always @(OPREG or lsbes or valid or CFG)
		casex ({valid,OPREG[13:2],lsbes})
		  16'bx1x_xx_xxxx_1111_110 : undef_opc = 1'b1;		// Format 3 : xxx1
		  16'bx1x_xx_x100_0111_110 : undef_opc = 1'b1;		// Format 3 : 1000
		  16'b1xx_1x_xxxx_0000_111 : undef_opc = 1'b1;		// Format 5 : 1xxx
		  16'b1xx_01_xxxx_0000_111 : undef_opc = 1'b1;		// Format 5 : 01xx
		  16'b1xx_01_00xx_0100_111 : undef_opc = 1'b1;		// Format 6 : 0100
		  16'b1xx_10_10xx_x100_111 : undef_opc = 1'b1;		// Format 6/7 : 1010
		  16'b1xx_xx_xxxx_x011_111 : undef_opc = ~CFG[1];	// Format 9/11 : FPU Befehle wie MOVif etc. und ADDf etc.
		  16'b1xx_xx_xxxx_1111_111 : undef_opc = ~CFG[1];	// Format 12 : FPU Befehle wie POLYf etc.
		  16'b1xx_x1_xxxx_0001_111 : undef_opc = 1'b1;		// Format 14 : x1xx 
		  16'b1xx_10_00xx_0001_111 : undef_opc = 1'b1;		// Format 14 : 1000
		  16'b1xx_10_1xxx_0001_111 : undef_opc = 1'b1;		// Format 14 : 101x
		  16'b1xx_00_1xxx_0001_111 : undef_opc = ~CFG[2] | ~OPREG[18];	// Format 14 : LMR/SMR
		  16'b1xx_xx_xxxx_x011_011 : undef_opc = ~CFG[3];	// Format 15.1/15.5 : CUSTOM CCV0, CCAL0 etc.
		  16'b1xx_xx_xxxx_0001_011 : undef_opc = 1'b1;		// Format 15.0 - not yet in, requires HW change
		  16'b1xx_xx_xxxx_x1x1_011 : undef_opc = 1'b1;		// Format 15 : rest
		  16'b1xx_xx_xxxx_1001_011 : undef_opc = 1'b1;		// Format 15.4
		// completely undefined :
		  16'bxx1_xx_xxxx_0111_111 : undef_opc = 1'b1;		// Format 10
		  16'bxx1_xx_xxxx_100x_111 : undef_opc = 1'b1;		// Format 13/18
		  16'bxx1_xx_xxxx_x101_111 : undef_opc = 1'b1;		// Format 16/17
		  16'bxx1_xx_xxxx_xxx0_011 : undef_opc = 1'b1;		// Format 19
		  default				   : undef_opc = 1'b0;
		endcase

	// 2. Undefined Addressing mode 5'b10011
	
	assign gen12 = (OPREG[15:11] == udef_amode);
	assign gen22 = (OPREG[10:6]  == udef_amode);
	assign gen13 = (OPREG[23:19] == udef_amode);
	assign gen23 = (OPREG[18:14] == udef_amode);
	
	always @(OPREG or valid or gen12 or gen22 or gen13 or gen23)
		if (valid[2] && (OPREG[7:5] != 3'b000) && (OPREG[3:0] == 4'b1110)) undef_am = gen13 | gen23;	// nearly all 3 Byte opcodes
		  else
		    undef_am = valid[1] & gen12 & (OPREG[1:0] != 2'b10) & ((OPREG[3:2] != 2'b11) & gen22);	// all 2 Byte opcodes
		
	// 3. When is Immediate not allowed ?
	
	assign igen12 = (OPREG[15:11] == imode);
	assign igen22 = (OPREG[10:6]  == imode);
	assign igen13 = (OPREG[23:19] == imode);
	assign igen23 = (OPREG[18:14] == imode);
	
	always @(*)
		casex ({valid[2:1],OPREG[13:2],lsbes})
		  15'bx1_xxxxxx_x0xx11_0 : undef_im =  igen12 & (OPREG[5:4] != 2'b01);	// Format 2 : ADDQD,SPR,Scond
		  15'bx1_xxxxxx_x10111_0 : undef_im =  igen12;		// Format 2 : ACB,MOVQ
		  15'bx1_xxxxx0_011111_0 : undef_im =  igen12;		// Format 3 : CXPD,JUMP,JSR
		  15'bx1_xxxxxx_xxxxx0_0 : undef_im =  igen22;		// Format 4
		  15'bx1_xxxxxx_xxxx01_0 : undef_im = (igen12 & (OPREG[5:4] == 2'b10))	// Format 4 : SRC1 - not ADDR
											 |(igen22 & (OPREG[5:4] != 2'b00)); // Format 4 : SRC2 - CMP
		  15'b1x_xxxxxx_x10011_1 : undef_im =  igen23;		// Format 6+7
		  15'b1x_xxx0xx_0x1011_1 : undef_im =  igen13 | igen23;	// Format 8 EXT,CVTP
		  15'b1x_xxx0xx_101011_1 : undef_im =  igen23;		// Format 8 : INS
		  15'b1x_xxx0xx_111011_1 : undef_im =  igen13;		// Format 8 : CHECK
		  15'b1x_xxx1xx_101011_1 : undef_im =  igen13 | igen23;	// Format 8 MOVUS,MOVSU
		  15'b1x_xxx1xx_011011_1 : undef_im =  igen23;		// Format 8 : FFS
		  15'b1x_xxxxxx_001111_1 : undef_im =  igen23;		// Format 9
		  15'b1x_xxxxxx_101111_1 : undef_im =  igen23 & (OPREG[13:10] != 4'h2);	// Format 10 without CMPf
		  15'b1x_010xxx_111111_1 : undef_im =  igen23;		// Format 12 SCALB+LOGB
		  15'b1x_000xxx_000111_1 : undef_im =  igen13;		// Format 14 RDVAL+WRVAL
		  15'b1x_0011xx_000111_1 : undef_im =  igen13;		// Format 14 SMR
		  default				 : undef_im = 1'b0;
		endcase
		
	// Final Message :
	
	assign UNDEF = undef_opc | undef_am | undef_im;
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	5. GRUPPE_2		Decoder and State Machine for GRUPPE_2 Opcodes
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module GRUPPE_2 ( BCLK, PHASE_0, OPREG, PHASE, SRC_1, SRC_2, REGA1, REGA2, IRRW1, IRRW2, ADRD1, ADRD2, EXR12, EXR22,
				  PHRD1, PHRD2, NXRD1, NXRW2, ACCA, OPERA,
				  STATE_0, STATE_GROUP_50, STATE_GROUP_60 );


	input			BCLK,PHASE_0;
	input	[18:0]	OPREG;
	input	 [3:0]	PHASE;	// nur die 4 LSBs
	// Source 1 & 2 Inputs
	input	 [6:0]	SRC_1,SRC_2,REGA1,REGA2,IRRW1,IRRW2;
	input	[18:0]	ADRD1,ADRD2,EXR12,EXR22;
	input	 [3:0]	PHRD1,PHRD2;
	input	 [3:0]	NXRD1,NXRW2;
	input	 [3:0]	ACCA;	// ACCA = Access type :	0x Register
							//	[3:2] or [1:0]		10 Memory
							//						11 Memory + Index
	input	[10:0]	OPERA;

	output	[66:0]	STATE_0;
	output	[66:0]	STATE_GROUP_50,STATE_GROUP_60;
	
	reg		[66:0]	STATE_GROUP_50,STATE_GROUP_60;
	reg		[66:0]	STATE_0,state_50,state_53,state_54,state_55,state_58,state_59,state_5A;
	reg		 [4:0]	op_code,op_reg_reg;
	reg		 [7:0]	phsrc1,phsrc2;
	reg		 [5:0]	chkreg;
	reg		 [1:0]	bwdreg;
	reg				tbit_flag,size_dw;
	reg				inss_flag;
	reg				ext_tos;
	
	wire	[18:0]	exoffset,re_wr,rexwr;
	wire	[10:0]	op_kust,op_bwd;
	wire	 [7:0]	phchk;
	wire	 [4:0]	op_reg;
	wire	 [6:0]	src_1l,src_2l;
	wire	 [5:0]	dest_2;
	wire	 [3:0]	get8b_s,get8b_d;
	wire	 [6:0]	rd_reg;
	wire	[10:0]	op_zext;
	wire	 [3:0]	imdi;
	
	parameter dont_care	= 67'hx_xxxx_xxxx_xxxx_xxxx;
	// Address-Field : Size:2 RD WR LDEA FULLACC INDEX:4 SPUPD disp_val:4 POST CLRMSW SRC2SEL:2
	parameter addr_nop	= 19'h0;	// alle Parameter auf 0
	parameter disp2ea	= 19'bxx_0010_0000_0_0000_0010;	// pass DISP
	parameter case_op	= 19'bxx_0010_1000_0_0000_0001;	// SRC1 add to PC_ARCHI
	parameter read_byb	= 19'b00_1011_11xx_0_0000_0011;	// read of SRC2 for Bit opcodes
	parameter exr11		= {2'b10  ,4'b1011,4'h0 ,9'h080};	// 2. access External with Mem.-Pointer + 4* Disp
	parameter adrcvtp	= 19'bxx_0010_0111_0_0000_0000;	// for CVTP
	parameter addone	= 19'bxx_0010_0100_0_0000_0000;	// for INDEX : SRC1 + SRC2 , simple Add without Flags
	parameter addind	= 19'bxx_0010_0100_0_0000_0011;	// for INDEX : SRC1 + EA
	parameter src_x		= 7'hxx;
	parameter dest_x	= 6'hxx;
	parameter imme		= {1'b1,6'hxx};
	parameter F0		= 7'h20;
	parameter F0_h		= 7'h21;
	parameter w_F0		= 6'h20;
	parameter w_F0_h	= 6'h21;
	parameter temp_l	= 6'h3C;
	parameter temp_h	= 6'h3D;	// Second last place for 8B TEMP Register
	parameter temp_1	= 6'h3E;
	parameter rtmpl		= 7'h3C;
	parameter rtmph		= 7'h3D;
	parameter rtmp1		= 7'h3E;
	parameter op_mov	= {3'bx1x,8'h45};
	parameter op_adr	= {3'bx1x,8'h49};
	parameter op_addl	= {3'b01x,8'hB0};
	parameter op_addf	= {3'b11x,8'hB0};
	parameter op_mull	= {3'b01x,8'hBC};
	parameter op_mulf	= {3'b11x,8'hBC};
	parameter op_stpr	= {3'b11x,8'h54};	// Special-Op for String opcodes
	parameter op_lsh	= {3'b011,8'h65};	// EXT : shift to right : DOUBLE !
	parameter op_msk	= {3'b011,8'h80};	// reuse of EXT Opcode at INS !
	parameter op_mul	= {3'b011,8'h78};	// INDEX
	parameter op_rwv	= {3'bx1x,8'hE0};	// RDVAL+WRVAL

	always @(OPREG)	// whether the Opcode is valid is decided in DECODER !
	  casex (OPREG[13:0])
		14'bxx_xxxx_1111_1110 : op_code = {3'b011,OPREG[10],OPREG[8]};	// DOT/POLY
		14'b00_0xxx_0000_1110 : op_code = 5'b1_0000;	// MOVS/CMPS
		14'b00_11xx_0000_1110 : op_code = 5'b1_0000;	// SKPS
		14'b00_0xxx_1100_1110 : op_code = 5'b1_0001;	// MOVM/CMPM
		14'bxx_xx10_0111_11xx : op_code = 5'b1_0010;	// JUMP/JSR
		14'bxx_x111_0111_11xx : op_code = 5'b1_0011;	// CASE
		14'bxx_xxxx_xx11_010x : op_code = 5'b1_0100;	// TBIT
		14'bxx_xxxx_xx11_0111 : op_code = 5'b1_0100;	// TBIT
		14'b0x_1xxx_0100_1110 : op_code = 5'b1_0100;	// CBIT/SBIT
		14'b11_10xx_0100_1110 : op_code = 5'b1_0100;	// IBIT
		14'b00_11xx_1100_1110 : op_code = 5'b1_0101;	// EXTS
		14'b10_x1xx_1100_1110 : op_code = 5'b1_0111;	// DEI/MEI
		14'bxx_x0xx_1110_1110 : op_code = 5'b1_1000;	// CHECK
		14'bxx_x0xx_0010_1110 : op_code = 5'b1_1010;	// EXT
		14'bxx_x0xx_1010_1110 : op_code = 5'b1_1011;	// INS
		14'b00_10xx_1100_1110 : op_code = 5'b1_1011;	// INSS, the same like INS !
		14'bxx_x0xx_0110_1110 : op_code = 5'b1_1100;	// CVTP
		14'bxx_x1xx_0010_1110 : op_code = 5'b1_1101;	// INDEX
		14'bxx_x000_0111_11xx : op_code = 5'b1_1110;	// CXPD
		14'b00_0xxx_0001_1110 : op_code = 5'b1_1111;	// RDVAL+WRVAL
		default				  : op_code = 5'b00_xxx;
	  endcase
	
	always @(posedge BCLK) if (PHASE_0) op_reg_reg <= op_code;
	assign op_reg = PHASE_0 ? op_code : op_reg_reg;
	
	always @(PHRD1)	// recode of States
	  casex (PHRD1)
		 4'h5 : phsrc1 = 8'h51;
		 4'h6 : phsrc1 = 8'h52;
		 4'hB : phsrc1 = 8'h53;	// ok, is in default ...
	  default : phsrc1 = 8'h53;
	  endcase
	  
	assign get8b_s = (PHRD1 == 4'hB) ? 4'hC : 4'h0;	// Special case 8B Immeadiate, is used in State 53
	
	always @(PHRD2)	// recode of States
	  casex (PHRD2)
		 4'h5 : phsrc2 = 8'h56;
		 4'h6 : phsrc2 = 8'h57;
		 4'hB : phsrc2 = 8'h58;	// ok, is in default ...
	  default : phsrc2 = 8'h58;
	  endcase
	  
	assign get8b_d = (PHRD2 == 4'hB) ? 4'hC : 4'h0;	// Special case 8B Immeadiate, is used in State 58
	
	assign src_1l = {SRC_1[6:1],1'b0};
	assign src_2l = {SRC_2[6:1],~SRC_2[0]};	// used only for DEI and MEI 
	assign dest_2 =  SRC_2[5:0];
	
	assign phchk = {7'b0101_010,size_dw};	// Phase 54 or 55
	
	assign op_kust = {1'bx,OPERA[9:8],8'h7A};	// Special-Opcode for MOVM/CMPM
	assign op_bwd  = {1'bx,OPERA[9:8],8'h45};	// for CASE and Bit opcodes
	
	assign re_wr   = {EXR22[18:17],4'b0101,4'h0, 9'h003};	// REUSE Address : Write of rmw , top 2 Bits contain size

	always @(posedge BCLK) if (PHASE_0) ext_tos <= (OPREG[18:14] == 5'h17);	// TOS Address mode
	assign rexwr   = {EXR22[18:17],4'b0101,4'h0, ext_tos, 8'h03};	// REUSE Address : Write of rmw , only for EXT and EXTS
	
	always @(posedge BCLK) tbit_flag <= ~OPERA[1];	// due to Timing ...
	always @(posedge BCLK) size_dw	 <=  OPERA[9];

	always @(posedge BCLK) if (PHASE_0) chkreg <= {3'b000,OPREG[13:11]};	// for CHECK
	assign rd_reg = (PHASE_0) ? {4'b0,OPREG[13:11]} : {1'b0,chkreg};	// for read operation at EXT/INS
	
	always @(posedge BCLK) if (PHASE_0) bwdreg <= OPREG[9:8];		// only for INS/INSS !
	assign op_zext = {1'bx,(PHASE_0 ? OPREG[9:8] : bwdreg),8'h76};
	
	always @(posedge BCLK) if (PHASE_0) inss_flag <= OPREG[6];	// Difference INSS to INS
	assign imdi = inss_flag ? 4'h8 : 4'hE;	// read Immediate or Displacement
	assign exoffset = inss_flag ? 19'b10_1011_0000_0_0000_0011 	// Read of SRC2 at INSS
								: 19'b10_1011_1100_0_0000_0011;	// Read of SRC1+Offset at EXT, SRC2+Offset at INS 
	
	always @(*)
	  casex (op_reg) 
		5'b1_0000 :	// MOVS Phase 0 : Entry 1. Pointer "in Page"-test prepare, 2. test for R0=0 , then jump to x'C0
			begin
			  STATE_0  = {	 addr_nop,8'h67, 7'h01, 7'h02, 1'b0,dest_x,op_stpr,	2'b00,2'b00,4'h0  };	// String-Pointer prepare
			  state_50 = dont_care;
			  state_53 = dont_care;
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_0001 :	// MOVM Phase 0 : Entry with test for R0=0 , then jump to x'C0
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   ADRD2,   phsrc2,IRRW2, REGA2, 1'b1,temp_h,op_adr,  2'b00,2'b00,NXRW2 };
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = {	 disp2ea, 8'h65, src_x, src_x, 1'b1,temp_1,op_adr,  2'b00,2'b00,4'b1110 };	// Read of DISP for count
			  state_59 = {	 addr_nop,8'h67, rtmph, rtmp1, 1'b0,dest_x,op_stpr,	2'b00,2'b00,4'h0  };	// String-Pointer prepare
			  state_5A = dont_care;
			end
		5'b1_0010 :	// JUMP/JSR
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h66, src_x, src_x, 1'b1,temp_h,op_adr,  2'b00,2'b00,4'h0  };
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_1110 :	// CXPD
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h6B, imme,  src_x, 1'b1,temp_h,op_mov,  2'b00,2'b00,4'h0  };
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_1111 :	// RDVAL+WRVAL
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h00, src_x, src_x, 1'b0,dest_x,op_rwv,  2'b00,2'b10,4'h0  };	// LD_OUT set because of "F"
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_0011 :	// CASE
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 case_op, 8'h54, SRC_1, src_x, 1'b0,dest_x,op_bwd,	2'b00,2'b00,4'h0  };
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };	// only one operand in mem.
			  state_53 = {   case_op, 8'h54, imme,  src_x, 1'b0,dest_x,op_bwd,	2'b00,2'b00,4'h0  };
			  state_54 = {   addr_nop,8'h66, src_x, src_x, 1'b1,temp_h,op_adr,  2'b00,2'b00,4'h0  };
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b1_0100 : // all Bit opcodes with Bit in memory. RMW Test in Phase x'59 = Special case, otherwise x'58
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_54 = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };	// here SRC1 => TEMP_H
			  state_55 = dont_care;
			  state_58 = {	 read_byb,8'h59, rtmph, src_x, 1'b0,dest_x,op_bwd,	2'b00,2'b00,4'h1  };	// next read of Byte
			  state_59 = tbit_flag ?
						 {	 addr_nop,8'h00, src_x, imme,  1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  }		// TBIT end
					   : {	 re_wr,   8'h27, src_x, imme,  1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  };	// CBIT/SBIT/IBIT end
			  state_5A = dont_care;
			end
		5'b1_0101 : // EXTS : BASE Operand => TEMP, calculate address of Destination
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }		// here Adr(DEST) => EA
					   : {	 addr_nop,8'h59, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h8  };	// 1 Byte Immediate read
			  state_55 = dont_care;
			  state_58 = {	 addr_nop,8'h59, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h8  };	// 1 Byte Immediate read
			  state_59 = ACCA[1] ?		// _..M.
						 {	 rexwr,   8'h27, imme,  rtmph, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  }		// result in memory
					   : {	 addr_nop,8'h00, imme,  rtmph, 1'b1,dest_2,OPERA,	2'b00,2'b00,4'h0  };	// result in Register
			  state_5A = dont_care;
			end
		5'b1_1010 : // EXT : BASE Operand => TEMP, calculate address of Destination
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h55, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// Addr => EA Reg
			  state_54 = ACCA[1] ?
						  ( ACCA[3] ?
						    {addr_nop,8'h5A, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  }
						   :{ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 }	)	// here Adr(DEST) => EA
					   : {	 addr_nop,8'h59, rd_reg,(ACCA[3] ? imme : rtmph), 
														   1'b1,temp_h,op_lsh,	2'b00,2'b00,4'hE  };	// Displacement read
			  state_55 = {   exoffset,8'h54, rd_reg,src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h1  };	// Read Source, EA reuse
			  state_58 = {	 addr_nop,8'h59, rd_reg,rtmph, 1'b1,temp_h,op_lsh,	2'b00,2'b00,4'hE  };	// Displacement read
			  state_59 = ACCA[1] ?		// _..M.
						 {	 rexwr,   8'h27, src_x, rtmph, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  }		// result in memory
					   : {	 addr_nop,8'h00, src_x, rtmph, 1'b1,dest_2,OPERA,	2'b00,2'b00,4'h0  };	// result in Register
			  state_5A = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 };	// special case Mem-Mem
			end
		5'b1_1011 : // INS/INSS : BASE Operand => TEMP, SRC2 read as Double ! RMW not tested (Phase x'6A) but uncritical
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };	// zext(SRC1) => TEMP
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 }		// here Adr(DEST) => EA
					   : {	 addr_nop,8'h5A, SRC_2, src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,imdi  };	// Imme./Disp. read
			  state_55 = {   exoffset,8'h6A, rd_reg,src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h1  };	// Read Source, EA reuse
			  state_58 = {	 addr_nop,8'h55, src_x, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// 
			  state_59 = ACCA[1] ?		// _..M.
						 {	 re_wr,   8'h27, rtmph, rtmpl, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h1  }		// result in memory
					   : {	 addr_nop,8'h00, rtmph, rtmpl, 1'b1,dest_2,OPERA,	2'b00,2'b00,4'h0  };	// result in Register
			  state_5A = {	 addr_nop,8'h68, imme,  src_x, 1'b1,temp_1,op_msk,	2'b00,2'b00,4'h0  };	// Mask generate
			end
		5'b1_1101 : // INDEX : 
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_zext, 2'b00,2'b00,4'h0  };	// zext(SRC1) => TEMP_H
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,	2'b00,2'b00,NXRW2 }		// zext(SRC2) => TEMP_L
					   : {	 addr_nop,8'h55, SRC_2, src_x, 1'b1,temp_l,op_zext, 2'b00,2'b00,4'h0  };
			  state_55 = {   addr_nop,8'h5A, rd_reg,rtmph, 1'b1,temp_h,op_mul,	2'b00,2'b00,4'h0  };	// Multiplication
			  state_58 = {	 addr_nop,8'h55, imme,  src_x, 1'b1,temp_l,op_zext, 2'b00,2'b00,4'h0  };	// 
			  state_59 = {	 addind,  8'h60, rtmpl, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// Add of Index in EA
			  state_5A = {	 addone,  8'h59, rd_reg,rtmph, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// Add of EA (=+1)
			end
		5'b1_0111 :	// DEI + MEI , both read 8B from DEST ! RMW critical !
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }		// here SRC1 => TEMP_H
					   : {	 addr_nop,8'h59, rtmph, SRC_2, 1'b0,dest_x,OPERA,	2'b01,2'b00,4'h0  };	// 1. part of Register
			  state_55 = dont_care;
			  state_58 = size_dw ?
						 {	 addr_nop,8'h59, rtmph, imme,  1'b0,dest_x,OPERA,	2'b01,2'b00,4'h0  }		// D needs 2 accesses
					   : {	 addr_nop,8'h1F, rtmph, imme,  1'b0,dest_x,OPERA,	2'b11,2'b00,4'h0  };	// B+W start at once
			  state_59 = {	 addr_nop,8'h1F, src_x, (ACCA[1] ? imme : src_2l),							// SRC2 = memory or Reg
													   ~ACCA[1],dest_2,OPERA,	2'b10,2'b00,4'h0  };
			  state_5A = dont_care;
			end
		5'b1_1000 :	// CHECK
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };	// No Register !
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,phchk, imme,  src_x, 1'b1,temp_h,op_mov,	2'b00,2'b00,4'h0  };	// No Immediate !
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }	
					   : (  size_dw ?
							{addr_nop,8'h5A, SRC_2, rtmpl, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  }		// Upper Bound - pointer
						  : {addr_nop,8'h00, rtmph, SRC_2, 1'b1,chkreg,OPERA,	2'b00,2'b10,4'h0  } );
			  state_55 = {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,4'h0  };
			  state_58 = size_dw ?
						 {	 addr_nop,8'h59, imme,  src_x, 1'b1,temp_1,op_mov,	2'b00,2'b00,4'h0  }		// here SRC2 => TEMP_1
					   : {	 addr_nop,8'h00, rtmph, imme,  1'b1,chkreg,OPERA,	2'b00,2'b10,4'h0  };
			  state_59 = {	 addr_nop,8'h5A, rtmp1, rtmpl, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  };	// Upper Bound - pointer
			  state_5A = {	 addr_nop,8'h00, rtmph, (ACCA[1] ? rtmp1 : SRC_2),
														   1'b1,chkreg,OPERA,	2'b00,2'b10,4'h0  };	// pointer - Lower Bound
			end
		5'b1_1100 :	// CVTP
			begin
			  STATE_0  = {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };	// Address
			  state_50 = {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 };
			  state_53 = {   addr_nop,8'h54, src_x, src_x, 1'b1,temp_h,op_adr,	2'b00,2'b00,4'h0  };	
			  state_54 = {	 adrcvtp, 8'h73, rtmph, rd_reg,1'b0,dest_x,op_mov,  2'b00,2'b00,4'h0  };	// 8*TEMP+Offset
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		5'b01_100 :	// POLYL
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h54, SRC_1, F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h54, imme,  F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,get8b_s };
			  state_54 = {	 addr_nop,8'h64, (ACCA[3] ? imme : src_1l),
													F0,    1'b1,temp_h,op_mull, 2'b10,2'b00,4'h0  };
			  state_55 = dont_care;
			  state_58 = {	 addr_nop,8'h59, imme,  rtmph, 1'b0,dest_x,op_addl, 2'b01,2'b00,get8b_d };
			  state_59 = {	 addr_nop,8'h62, (ACCA[1] ? imme : src_2l),
													rtmpl, 1'b1,w_F0_h,op_addl, 2'b10,2'b00,4'h0  };
			  state_5A = dont_care;
			end			  
		5'b01_101 :	// POLYF
			begin
			  STATE_0  = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h55, SRC_1, F0,    1'b0,dest_x,op_mulf, 2'b11,2'b00,4'h0  };
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {	 addr_nop,8'h55, SRC_1, F0,    1'b0,dest_x,op_mulf, 2'b11,2'b00,4'h0  };
			  state_53 = {   addr_nop,8'h55, imme,  F0,    1'b0,dest_x,op_mulf, 2'b11,2'b00,4'h0  };
			  state_54 = ACCA[1] ?
						 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 }
					   : {	 addr_nop,8'h6E, rtmph, SRC_2, 1'b0,dest_x,op_addf, 2'b11,2'b00,4'h0  };
			  state_55 = {	 addr_nop,8'h54, src_x, src_x, 1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };
			  state_58 = {	 addr_nop,8'h6E, rtmph, imme,  1'b0,dest_x,op_addf, 2'b11,2'b00,4'h0  };
			  state_59 = dont_care;
			  state_5A = dont_care;
			end			  
		5'b01_110 :	// DOTL
			begin
			  STATE_0  = (~ACCA[3] & ~ACCA[1]) ?		// _R.R.
						 {	 addr_nop,8'h59, SRC_1, SRC_2, 1'b0,dest_x,op_mull, 2'b01,2'b00,4'h0  }
					   : (  ACCA[3] ?		// _M...
						    {ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
						  : {ADRD2,   phsrc2,src_x, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 } );
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {   ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
			  state_53 = ACCA[1] ?		// _..M.
						 {   addr_nop,8'h54, imme,  src_x, 1'b1,temp_h,op_mov,  2'b00,2'b00,get8b_s }
					   : {	 addr_nop,8'h59, imme,  SRC_2, 1'b0,dest_x,op_mull, 2'b01,2'b00,get8b_s };
			  state_54 = {	 addr_nop,8'h55, imme,  src_x, 1'b1,temp_l,op_mov,  2'b00,2'b00,4'h0  };
			  state_55 = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
			  state_58 = {	 addr_nop,8'h59, (ACCA[3] ? rtmph : SRC_1),		//_M...
													imme,  1'b0,dest_x,op_mull, 2'b01,2'b00,get8b_d };
			  state_59 = {	 addr_nop,8'h5A, (ACCA[3] ? (ACCA[1] ? rtmpl : imme) : src_1l), (ACCA[1] ? imme : src_2l),
														   1'b1,temp_h,op_mull, 2'b10,2'b00,4'h0  };
			  state_5A = {	 addr_nop,8'h61, rtmph, F0_h,  1'b0,temp_h,op_mull, 2'b01,2'b00,4'h0  };
			end			  
		5'b01_111 :	// DOTF
			begin
			  STATE_0  = (~ACCA[3] & ~ACCA[1]) ?		// _R.R.
						 {	 addr_nop,8'h63, SRC_1 ,SRC_2 ,1'b0,dest_x,op_mulf, 2'b11,2'b00,4'h0  }		// opera = MULF
					   : (  ACCA[3] ?		// _M...
						    {ADRD1,   phsrc1,src_x, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
						  : {ADRD2,   phsrc2,src_x, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 } );
			  state_50 = ACCA[3] ?		// _M...
						 {   ADRD1,   phsrc1,IRRW1, REGA1, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRD1 }
					   : {   ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
			  state_53 = ACCA[1] ?		// _..M.
						 {   addr_nop,8'h55, imme,  src_x, 1'b1,temp_h,op_mov,  2'b00,2'b00,4'h0  }
					   : {	 addr_nop,8'h63, imme,  SRC_2 ,1'b0,dest_x,op_mulf, 2'b11,2'b00,4'h0  };
			  state_54 = dont_care;
			  state_55 = {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,dest_x,op_mov,  2'b00,2'b00,NXRW2 };
			  state_58 = {	 addr_nop,8'h63, (ACCA[3] ? rtmph : SRC_1),		//_M...
													imme,  1'b0,dest_x,op_mulf, 2'b11,2'b00,4'h0  };
			  state_59 = dont_care;
			  state_5A = dont_care;
			end			  
		default
			begin
			  STATE_0  = dont_care;
			  state_50 = dont_care;
			  state_53 = dont_care;
			  state_54 = dont_care;
			  state_55 = dont_care;
			  state_58 = dont_care;
			  state_59 = dont_care;
			  state_5A = dont_care;
			end
		endcase
		
	always @(*)
	  casex (PHASE)
		 4'h0 : STATE_GROUP_50 = state_50;
		// Phase 51 : wait for data and Disp2 for External Address mode : part 2 EA = (MOD+4)+4*DISP1
		 4'h1 : STATE_GROUP_50 = {exr11,   8'h52, src_x,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};
		// Phase 52 : Memory-Pointer for Memory Relative and last access External
		 4'h2 : STATE_GROUP_50 = {EXR12,   8'h53, IRRW1,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};  // atys[0] !
		 4'h3 : STATE_GROUP_50 = state_53;
		 4'h4 : STATE_GROUP_50 = state_54;
		 4'h5 : STATE_GROUP_50 = state_55;
		// Phase 56 : wait for data and Disp2 for External Address mode : part 2 EA = (MOD+4)+4*DISP1
		 4'h6 : STATE_GROUP_50 = {exr11,   8'h57, src_x,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};
		// Phase 57 : Memory-Pointer for Memory Relative and last access External
		 4'h7 : STATE_GROUP_50 = {EXR22,   8'h58, IRRW2,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'b1111};  // atyd[0] !
		 4'h8 : STATE_GROUP_50 = state_58;
		 4'h9 : STATE_GROUP_50 = state_59;
		 4'hA : STATE_GROUP_50 = state_5A;
	  default : STATE_GROUP_50 = dont_care;
	  endcase
	  
	always @(*)
	  casex (PHASE)
		 4'h0 : STATE_GROUP_60 = {	 addr_nop,8'h00, src_x, src_x, 1'b1,chkreg,op_adr,  2'b00,2'b00,4'h0  };	// for INDEX
		 4'h1 : STATE_GROUP_60 = {	 addr_nop,8'h62, rtmpl, F0,    1'b1,w_F0_h,op_addl, 2'b10,2'b00,4'h0  };	// for DOTL
		 4'h2 : STATE_GROUP_60 = {	 addr_nop,8'h00, src_x, src_x, 1'b0,w_F0_h,op_addl, 2'b00,2'b00,4'h0  };	// for DOTL & POLYL !
		 4'h3 : STATE_GROUP_60 = {	 addr_nop,8'h6F, src_x, src_x, 1'b1,temp_h,op_mulf, 2'b00,2'b00,4'h0  };	// for DOTF
		 4'hF : STATE_GROUP_60 = {	 addr_nop,8'h6E, rtmph, F0,    1'b0,dest_x,op_addf, 2'b11,2'b00,4'h0  };
		 4'hE : STATE_GROUP_60 = {	 addr_nop,8'h00, src_x, src_x, 1'b1,w_F0,  op_addf, 2'b00,2'b00,4'h0  };	// for DOTF & POLYF
		 4'h4 : STATE_GROUP_60 = ACCA[1] ?	// ..M.
								 {	 ADRD2,   phsrc2,IRRW2, REGA2, 1'b0,temp_h,op_mull, 2'b00,2'b00,NXRW2 }
							   : {	 addr_nop,8'h59, SRC_2, rtmph, 1'b0,temp_h,op_addl, 2'b01,2'b00,4'h0  };	// for POLYL
		 4'h5 : STATE_GROUP_60 = {	 addr_nop,8'h59, src_x, src_x, 1'b1,temp_l,op_kust, 2'b00,2'b00,4'h0  };	// for MOVM/CMPM
		 4'h6 : STATE_GROUP_60 = {	 addr_nop,8'h01, rtmph, src_x, 1'b0,dest_x,op_mov,	2'b00,2'b00,4'h0  };	// for JUMP/JSR/CASE
		 4'h7 : STATE_GROUP_60 = {	 addr_nop,8'hC0, (op_reg_reg[0] ? rtmpl : 7'h00),							// Jump to String execution
															src_x, 1'b0,dest_x,OPERA,	2'b00,2'b10,4'h0  };	// LD_OUT set, CMPS F-Flag
		// for INS														
		 4'h8 : STATE_GROUP_60 = {	 addr_nop,8'h69, rd_reg,rtmph, 1'b1,temp_h,op_lsh,	2'b00,2'b00,4'h0  };	// SRC1 shift
		 4'h9 : STATE_GROUP_60 = {	 addr_nop,8'h59, rd_reg,rtmp1, 1'b0,dest_x,op_lsh,	2'b00,2'b00,4'h0  };	// Mask shift
		 4'hA : STATE_GROUP_60 = {	 addr_nop,8'h5A, imme,  src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,imdi  };	// Imme./Disp. read
		// for CXPD, this State is decoded explicitly in DECODER
		 4'hB : STATE_GROUP_60 = {	 addr_nop,8'h39, imme,  src_x, 1'b1,temp_l,op_mov,	2'b00,2'b00,4'h0  };	// pass PC
	  default : STATE_GROUP_60 = dont_care;
	  endcase
	  
endmodule
