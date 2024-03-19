// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	CACHE_LOGIK.v
//  Version:	3.0
//	History:	2.0 of 11 August 2016
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
//	1. WRPORT		Write Port
//	2. NEU_VALID	Cache Valid RAM
//	3. DEBUG_AE  	Debug unit for address compare in data cache
//	4. MMU_UP		MMU memory update and initalization controller
//	5. DCA_CONTROL	Data cache valid memory update and initalization controller
//	6. MMU_MATCH	MMU virtual address match detector
//	7. CA_MATCH		Cache tag match detector
//	8. FILTCMP		Address Filter and Comparator
//	9. DCACHE_SM	Data cache state machine
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. WRPORT 	Write Port
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module WRPORT ( WRITE, DRAM_Q, WRDATA, ENBYTE, VADDR, DADDR, WDAT, CAP_Q, ENB );

	input			WRITE;
	input  [127:0]	DRAM_Q;
	input	[31:0]	WRDATA;
	input	 [3:0]	ENBYTE;
	input	 [3:2]	VADDR;
	input	 [3:2]	DADDR;
	
	output [127:0]	WDAT;
	
	output	reg	[31:0]	CAP_Q;
	output	reg	[15:0]	ENB;
	
	assign WDAT = WRITE ? {WRDATA,WRDATA,WRDATA,WRDATA} : DRAM_Q;
	
	always @(DADDR or DRAM_Q)
	  case (DADDR)
	    2'b00 : CAP_Q = DRAM_Q[31:0];
		2'b01 : CAP_Q = DRAM_Q[63:32];
		2'b10 : CAP_Q = DRAM_Q[95:64];
		2'b11 : CAP_Q = DRAM_Q[127:96];
	  endcase
	  
	always @(WRITE or VADDR or ENBYTE)
	  case ({WRITE,VADDR})
	     3'b100 : ENB = {4'd0  ,4'd0  ,4'd0  ,ENBYTE};
	     3'b101 : ENB = {4'd0  ,4'd0  ,ENBYTE,4'd0  };
	     3'b110 : ENB = {4'd0  ,ENBYTE,4'd0  ,4'd0  };
	     3'b111 : ENB = {ENBYTE,4'd0  ,4'd0  ,4'd0  };
		default : ENB = 16'hFFFF;
	  endcase
	  
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. NEU_VALID 	Cache Valid RAM
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module NEU_VALID ( BCLK, VALIN, WADR, WREN, RADR, VALOUT );

	input			BCLK;
	input	[23:0]	VALIN;
	input	 [4:0]	WADR;
	input			WREN;
	input	 [4:0]	RADR;
	
	output	[23:0]	VALOUT;
	
	reg		[23:0]	cvalid [0:31];	// Valid bits for Data Set 0 and 1 : 32 entries of 24 bits
	reg		[23:0]	ramout;
	reg		[23:0]	valhold;
	reg				gleich;

	always @(posedge BCLK) ramout <= cvalid[RADR];
	always @(posedge BCLK) if (WREN) cvalid[WADR] <= VALIN;
	
	always @(posedge BCLK) valhold <= VALIN;
	always @(posedge BCLK) gleich  <= WREN & (RADR == WADR);
	
	assign VALOUT = gleich ? valhold : ramout;
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. DEBUG_AE  	Debug unit for address compare in data cache
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DEBUG_AE ( DBG_IN, READ, WRITE, USER, VIRTUELL, ACC_OK, VADR_R, MMU_Q, ENBYTE, DBG_HIT );

	input	[40:2]	DBG_IN;
	
	input			READ,WRITE;
	input			USER;
	input			VIRTUELL;
	input			ACC_OK;
	input	[31:2]	VADR_R;
	input	[19:0]	MMU_Q;
	input	 [3:0]	ENBYTE;
	
	output	 		DBG_HIT;
	
	wire			sd,ud,crd,cwr,vnp;
	wire			make;
	wire			virt_adr,real_adr,page_adr;
	wire			byte_en;
	
	assign sd  = DBG_IN[40];
	assign ud  = DBG_IN[39];
	assign crd = DBG_IN[38];
	assign cwr = DBG_IN[37];
	assign vnp = DBG_IN[36];
	
	assign make =  ((ud & USER) | (sd & ~USER))		// compare USER or SUPERVISOR
				 & (VIRTUELL == vnp)				// compare real or virtual address
				 & ((cwr & WRITE) | (crd & READ));	// compare READ or WRITE
	
	assign virt_adr = (MMU_Q 		 == DBG_IN[31:12]);
	assign real_adr = (VADR_R[31:12] == DBG_IN[31:12]);
	assign page_adr = (VADR_R[11:2]	 == DBG_IN[11:2]);
	
	assign byte_en  = |(ENBYTE & DBG_IN[35:32]);
	
	assign DBG_HIT  =  ACC_OK		// all valid
					 & make			// selection is valid
					 & (VIRTUELL ? virt_adr : real_adr)	& page_adr	// address
					 & byte_en;		// Byte Enable
					 
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	4. MMU_UP		MMU memory update and initalization controller
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module MMU_UP ( BCLK, BRESET, NEW_PTB, PTB1, IVAR, WR_MRAM, VADR, VADR_R, MVALID, UPDATE,
				WE_MV, WADR_MV, RADR_MV, DAT_MV, NEW_PTB_RUN );

	input			BCLK;
	input			BRESET;	
	input			NEW_PTB;	// the MMU memory is cleared. Pulse of one BCLK cycle, Op-Dec is waiting
	input			PTB1;		// which one
	input			IVAR;
	input			WR_MRAM;	// BCLK : update MRAM and MMU_VAL
	input  [19:16]	VADR,VADR_R;	// For update
	input	[31:0]	MVALID,UPDATE;
	
	output			WE_MV;		// Write Enable MMU Valid
	output	 [3:0]	WADR_MV,RADR_MV;
	output	[31:0]	DAT_MV;
	output			NEW_PTB_RUN;
	
	reg				neue_ptb,wr_flag,old_rst,run_over;
	reg		 [3:0]	count;
	
	wire	[15:0]	new_val;
	
	assign WE_MV   = wr_flag | WR_MRAM | IVAR;	// write on falling edge BCLK
	assign RADR_MV = run_over ? count : VADR;
	assign WADR_MV = wr_flag ? (count - 4'b0001) : VADR_R;
	assign DAT_MV  = wr_flag ? {MVALID[31:16],new_val} : UPDATE;	// Only the matching entries are cleared : PTB0/PTB1

	// [31:16] Address-Space memory, [15:0] Valid memory
	assign new_val = neue_ptb ? (PTB1 ? (MVALID[15:0] & ~MVALID[31:16]) : (MVALID[15:0] & MVALID[31:16])) : 16'h0;
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) neue_ptb <= 1'b0;
			else neue_ptb <= NEW_PTB | (neue_ptb & run_over);
			
	always @(posedge BCLK) old_rst <= BRESET;	// after Reset all will be set to 0 
	
	always @(posedge BCLK) run_over <= ((~old_rst | NEW_PTB) | (run_over & (count != 4'hF))) & BRESET;
	
	always @(posedge BCLK) count <= run_over ? count + 4'h1 : 4'h0;
	
	always @(posedge BCLK) wr_flag <= run_over;

	assign NEW_PTB_RUN = wr_flag;	// Info to Op-Dec
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	5. DCA_CONTROL	Data cache valid memory update and initalization controller
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DCA_CONTROL ( BCLK, BRESET, CUPDATE, DRAM_ACC, CA_SET, HIT_ALL, VADR_R, UPDATE, INVAL_A, WRITE, MDONE, USE_CA,
					 INHIBIT, KILL, WRCRAM0, WRCRAM1, WE_CV, WADR_CV, DAT_CV, INIT_CA_RUN, WRSET0, WRSET1 );

	input			BCLK;
	input			BRESET;
	input			CUPDATE;	// State CUPDATE : Cache is filled from DRAM
	input			DRAM_ACC;
	input			CA_SET;
	input			HIT_ALL;	// a complete cache hit !
	input	[11:7]	VADR_R;
	input	[23:0]	UPDATE;
	input			INVAL_A;
	input			WRITE;
	input			MDONE;		// Signal from DRAM : Access Done
	input			USE_CA;		// Signal use cache
	input	 		INHIBIT;	// Signal cache inhibit  - no write in cache
	input			KILL;		// valid Ram must be updated because of collision ... or CINV
	
	output			WRCRAM0,WRCRAM1;
	output			WE_CV;
	output	 [4:0]	WADR_CV;
	output	[23:0]	DAT_CV;
	output			INIT_CA_RUN;
	output			WRSET0,WRSET1;
	
	reg		 [1:0]	state;
	reg		 [4:0]	acount;
	reg				ca_set_d;

	wire			countf;
	
	always @(posedge BCLK) if (DRAM_ACC) ca_set_d <= CA_SET;	// Store for whole access

	// physical address is stored in TAG-RAM

	assign WRCRAM0 = (CUPDATE & ~INHIBIT) & ~ca_set_d;
	assign WRCRAM1 = (CUPDATE & ~INHIBIT) &  ca_set_d;
	
	// Load Valid RAM :
	
	assign WE_CV   = state[1] | HIT_ALL | (CUPDATE & ~INHIBIT) | KILL; // Hit All for "Last" Update
	assign WADR_CV = state[1] ? acount : VADR_R;
	assign DAT_CV  = state[1] ? 24'h0 : UPDATE;	

	// Clear of Cache-Valid RAMs : 32 clocks of BCLK
	
	assign countf = (acount == 5'h1F);
	
	always @(posedge BCLK)
		casex ({BRESET,INVAL_A,countf,state[1:0]})
		  5'b0xx_xx : state <= 2'b01;
		  5'b1xx_01 : state <= 2'b10;		// start counter
		  5'b10x_00 : state <= 2'b00;		// wait ...
		  5'b11x_00 : state <= 2'b10;
		  5'b1x0_10 : state <= 2'b10;
		  5'b1x1_10 : state <= 2'b00;
		  default   : state <= 2'b0;
		endcase
	
	always @(posedge BCLK) if (!state[1]) acount <= 5'h0; else acount <= acount + 5'h01;

	assign INIT_CA_RUN = state[1];
	
	// WRITE Control in data RAMs
	assign WRSET0 = ( ~CA_SET & WRITE & HIT_ALL) | (MDONE & USE_CA & ~ca_set_d);
	assign WRSET1 = (  CA_SET & WRITE & HIT_ALL) | (MDONE & USE_CA &  ca_set_d);
	
endmodule
								
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	6. MMU_MATCH	MMU virtual address match detector
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module MMU_MATCH ( USER, READ, WRITE, RMW, MCR_FLAGS, MVALID, VADR_R, MMU_VA, IVAR,
				   VIRTUELL, MMU_HIT , UPDATE, PROT_ERROR, CI, SEL_PTB1 );

	input			USER;
	input			READ;
	input			WRITE;
	input			RMW;
	input	 [2:0]	MCR_FLAGS;
	input	[31:0]	MVALID;
	input  [31:12]	VADR_R;
	input  [31:16]	MMU_VA;
	input	 [1:0]	IVAR;	// Invalidate Entry
	
	output			VIRTUELL;	// only for Adress-Mux
	output			MMU_HIT;
	output	[31:0]	UPDATE;
	output	reg		PROT_ERROR;	// if valid must suppress write in Write Buffer and cache
	output			CI,SEL_PTB1;
	
	reg		[15:0]	maske;

	wire			adr_space,as_sorte,match,alles_ok;
	wire	[15:0]	val_bits,as_bits;
	wire			ena_prot;
	wire			zugriff;
	
	assign zugriff = READ | WRITE;
	
	always @(VADR_R)
		case (VADR_R[15:12])
		  4'h0 : maske = 16'h0001;
		  4'h1 : maske = 16'h0002;
		  4'h2 : maske = 16'h0004;
		  4'h3 : maske = 16'h0008;
		  4'h4 : maske = 16'h0010;
		  4'h5 : maske = 16'h0020;
		  4'h6 : maske = 16'h0040;
		  4'h7 : maske = 16'h0080;
		  4'h8 : maske = 16'h0100;
		  4'h9 : maske = 16'h0200;
		  4'hA : maske = 16'h0400;
		  4'hB : maske = 16'h0800;
		  4'hC : maske = 16'h1000;
		  4'hD : maske = 16'h2000;
		  4'hE : maske = 16'h4000;
		  4'hF : maske = 16'h8000;
		endcase
		
	assign VIRTUELL = USER ? MCR_FLAGS[0] : MCR_FLAGS[1];
	
	assign adr_space = IVAR[1] ? IVAR[0] : (MCR_FLAGS[2] & USER);	// adr_space = IVARx ? 1 or 0 : DualSpace & TU
	
	assign as_sorte = ((MVALID[31:16] & maske) != 16'h0);
		  
	assign match = (VADR_R[31:20] == MMU_VA[31:20]) & (adr_space == as_sorte) & ((MVALID[15:0] & maske) != 16'h0000);
	
	assign alles_ok = match & ( ~WRITE | MMU_VA[17] ) & ~PROT_ERROR;	// Modified - Flag : reload the PTE
	
	// if MMU_HIT = 0 then there is no Write-Buffer access and no update of cache !
	assign MMU_HIT = zugriff ? ( VIRTUELL ? alles_ok : 1'b1 ) : 1'b0 ;	// MMU off : then always HIT

	assign val_bits = IVAR[1] ? (MVALID[15:0] & (match ? ~maske : 16'hFFFF)) : (MVALID[15:0] | maske);
	assign as_bits  = IVAR[1] ? MVALID[31:16] : (adr_space ? (MVALID[31:16] | maske) : (MVALID[31:16] & ~maske));
	
	assign UPDATE = {as_bits,val_bits};

	assign ena_prot = zugriff & VIRTUELL & match;
	
	// A Protection error must suppress write in WB and cache
	always @(ena_prot or MMU_VA or USER or WRITE or RMW)
		case ({ena_prot,MMU_VA[19:18]})
		   3'b100 : PROT_ERROR = USER | WRITE | RMW;	// Only Supervisor READ
		   3'b101 : PROT_ERROR = USER;					// no USER access
		   3'b110 : PROT_ERROR = USER & (WRITE | RMW);	// USER only READ
		  default : PROT_ERROR = 1'b0;
		endcase
		
	assign CI = VIRTUELL & MMU_VA[16];
	assign SEL_PTB1 = adr_space;		// For PTE update
		
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	7. CA_MATCH		Cache tag match detector
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module CA_MATCH ( CVALID, DRAMSZ, ADDR, TAG0, TAG1, CFG, WRITE, MMU_HIT, CI, INVAL_L, KDET, ENDRAM, DC_ILO,
				  CA_HIT, CA_SET, UPDATE, IO_SPACE, USE_CA, WB_ACC, KILL );

	input	[23:0]	CVALID;
	input	 [2:0]	DRAMSZ;
	input	[31:4]	ADDR;
	input  [28:12]	TAG0,TAG1;
	input	 [1:0]	CFG;	// LDC , DC
	input			WRITE;
	input			MMU_HIT;
	input			CI;
	input			INVAL_L;	// invalid cache line
	input			KDET;
	input			ENDRAM;
	input			DC_ILO;		// CBITI/SBITI special case
	
	output			CA_HIT;
	output			CA_SET;	// if no Hit then says SET where to store
	output	[23:0]	UPDATE;	// Update Information for CVALID memory 
	output			IO_SPACE;
	output			USE_CA;
	output			WB_ACC;
	output			KILL;
	
	reg		 [7:0]	maske;
	reg				acc_dram;
	
	wire			match_0,match_1;
	wire			valid_0,valid_1;
	wire			select;
	wire			clear;
	wire	 [7:0]	update_0,update_1,lastinfo;
	wire			sel_dram;
	
	always @(ADDR)
		case (ADDR[6:4])
		  3'h0 : maske = 8'h01;
		  3'h1 : maske = 8'h02;
		  3'h2 : maske = 8'h04;
		  3'h3 : maske = 8'h08;
		  3'h4 : maske = 8'h10;
		  3'h5 : maske = 8'h20;
		  3'h6 : maske = 8'h40;
		  3'h7 : maske = 8'h80;
		endcase
		
	assign valid_0 = (( CVALID[7:0] & maske) != 8'h00);
	assign valid_1 = ((CVALID[15:8] & maske) != 8'h00);
	
	assign match_0 = ( TAG0 == ADDR[28:12] );	// 4KB
	assign match_1 = ( TAG1 == ADDR[28:12] );	// 4KB

	assign CA_HIT = ((valid_0 & match_0) | (valid_1 & match_1)) & ~DC_ILO & CFG[0] & (sel_dram | KDET);
	
	// which SET is written in cache miss ? If both are valid the last used is not taken
	assign select = (valid_1 & valid_0) ? ~((CVALID[23:16] & maske) != 8'h00) : valid_0;	// Last-used field = CVALID[23:16]
	
	assign CA_SET = CA_HIT ? (valid_1 & match_1) : select;
	
	assign clear = INVAL_L | KDET;	// INVAL_L is from CINV
 
	assign update_0 = CA_SET ? CVALID[7:0] : (clear ? (CVALID[7:0] & ~maske) : (CVALID[7:0] | maske));
	assign update_1 = CA_SET ? (clear ? (CVALID[15:8] & ~maske) : (CVALID[15:8] | maske)) : CVALID[15:8];
	
	assign lastinfo = CA_HIT ? (CA_SET ? (CVALID[23:16] | maske) : (CVALID[23:16] & ~maske)) : CVALID[23:16];
	
	assign UPDATE = {lastinfo,update_1,update_0};
	
	assign KILL = clear & CA_HIT & ~CFG[1];		// only if cache is not locked
	
	always @(DRAMSZ or ADDR)	// Size of DRAM
		case (DRAMSZ)
		  3'b000 : acc_dram = (ADDR[28:23] == 6'd0);	//   8 MB 32016 Second Processor
		  3'b001 : acc_dram = (ADDR[28:24] == 5'd0);	//  16 MB
		  3'b010 : acc_dram = (ADDR[28:25] == 4'd0);	//  32 MB
		  3'b011 : acc_dram = (ADDR[28:26] == 3'd0);	//  64 MB
		  3'b100 : acc_dram = (ADDR[28:27] == 2'd0);	// 128 MB
		  3'b101 : acc_dram = ~ADDR[28];				// 256 MB
		  3'b110 : acc_dram =   1'b1;					// 512 MB
		  3'b111 : acc_dram = ~(ADDR[28:27] == 2'b10);	// 256 MB NetBSD + 128 MB
		endcase
	
	assign sel_dram =  (ADDR[31:29] == 3'd0) & acc_dram & ENDRAM;
	assign IO_SPACE = ~sel_dram;					// not DRAM or DRAM ist off
	
	assign USE_CA   = ~CI & ~DC_ILO & CFG[0] & ~CFG[1];	// CI ? ILO ? Cache on ? Locked Cache ? 
	assign WB_ACC   = WRITE & MMU_HIT & sel_dram;
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	8. FILTCMP		Address Filter and Comparator
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module FILTCMP ( DRAMSZ, RADR, DRAM_A, ADR_EQU, TAGDAT );

	input	 [2:0]	DRAMSZ;
	input	[28:4]	RADR,DRAM_A;
	
	output			ADR_EQU;
	output reg	[28:12]	TAGDAT;

	reg	   [28:23]	adram;
	
	always @(DRAMSZ or RADR)
		casex (DRAMSZ)
		  3'b000 : TAGDAT = {6'd0,RADR[22:12]};	//   8 MB
		  3'b001 : TAGDAT = {5'd0,RADR[23:12]};	//  16 MB
		  3'b010 : TAGDAT = {4'd0,RADR[24:12]};	//  32 MB
		  3'b011 : TAGDAT = {3'd0,RADR[25:12]};	//  64 MB
		  3'b100 : TAGDAT = {2'd0,RADR[26:12]};	// 128 MB
		  3'b101 : TAGDAT = {1'b0,RADR[27:12]};	// 256 MB
		  3'b11x : TAGDAT =       RADR[28:12] ;	// 512 MB
		endcase
		
	always @(DRAMSZ or DRAM_A)	// The address comparator is only used in the data cache.
		casex (DRAMSZ)
		  3'b000 : adram =  6'd0;					//   8 MB
		  3'b001 : adram = {5'd0,DRAM_A[23]};   	//  16 MB
		  3'b010 : adram = {4'd0,DRAM_A[24:23]};	//  32 MB
		  3'b011 : adram = {3'd0,DRAM_A[25:23]};	//  64 MB
		  3'b100 : adram = {2'd0,DRAM_A[26:23]};	// 128 MB
		  3'b101 : adram = {1'd0,DRAM_A[27:23]};	// 256 MB
		  3'b11x : adram =       DRAM_A[28:23] ;	// 512 MB
		endcase

	assign ADR_EQU = {TAGDAT,RADR[11:4]} == {adram,DRAM_A[22:4]};

endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	9. DCACHE_SM	Data cache state machine
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DCACHE_SM ( BCLK, BRESET, IO_SPACE, MDONE, IO_READY, MMU_HIT, CA_HIT, READ, WRITE, ZTEST, RMW, CAPDAT, VADR_R, IC_VA, 
				   USE_CA, PTB_WR, PTB_SEL, SEL_PTB1, CPU_OUT, USER, PROT_ERROR, WB_ACC, ENWR, ADR_EQU, IC_PREQ, DMA_CHK, ICTODC,
				   RWVAL, VIRTUELL, QWATWO,
				   DRAM_ACC, DRAM_WR, IO_ACC, IO_RD, IO_WR, PTE_MUX, PD_MUX, PKEEP, PTE_ADR, PTE_DAT, HIT_ALL, ACC_OK,
				   ABORT, PROTECT, IACC_STAT, ABO_LEVEL1, WR_MRAM, CUPDATE, AUX_DAT, NEW_PTB, PTB_ONE, MMU_DIN, IC_SIGS, KOMUX,
				   KDET, DMA_MUX, HLDA, RWVFLAG, PTE_STAT );

	input			BCLK;
	input			BRESET;
	input			IO_SPACE;
	input			MDONE;		// Memory Done : feedback from DRAM Controller, BCLK aligned !
	input			IO_READY;
	input			MMU_HIT,CA_HIT;
	input			READ,WRITE,ZTEST,RMW;
	input	[31:0]	CAPDAT;
	input  [31:12]	VADR_R,IC_VA;
	input			USE_CA;
	input			PTB_WR,PTB_SEL;
	input			SEL_PTB1;
	input  [28:12]	CPU_OUT;	// used for PTB0/1
	input			USER;
	input			PROT_ERROR;
	input			WB_ACC;
	input			ENWR;		// Enable WRITE from DRAM
	input			ADR_EQU;
	input			IC_PREQ;
	input			DMA_CHK;
	input	 [3:0]	ICTODC;		// multiple signals from ICACHE, especially DMA
	input	 [1:0]	RWVAL;		// RDVAL+WRVAL Operation
	input			VIRTUELL;	// for RDVAL/WRVAL
	input			QWATWO;
	
	output	reg		DRAM_ACC,DRAM_WR;
	output			IO_ACC,IO_RD,IO_WR;
	output			PTE_MUX,PD_MUX,PKEEP;
	output	[28:0]	PTE_ADR;
	output	[19:0]	PTE_DAT;
	output			HIT_ALL;
	output			ACC_OK;
	output			ABORT,PROTECT;
	output	 [3:1]	IACC_STAT;
	output			ABO_LEVEL1;
	output			WR_MRAM;
	output			CUPDATE;
	output			AUX_DAT;
	output	reg		NEW_PTB;
	output	reg		PTB_ONE;
	output	[23:0]	MMU_DIN;
	output	 [1:0]	IC_SIGS;
	output			KOMUX;
	output			KDET;		// Signal for detection of collision
	output			DMA_MUX;
	output			HLDA;		// active low
	output			RWVFLAG;	// RDVAL/WRVAL result
	output	 [1:0]	PTE_STAT;
	
	reg				IO_WR,IO_RD;
	reg		 [1:0]	pl_dat;
	reg		 [6:0]	new_state;
	reg				mem_done;
	reg				rd_done;
	reg		 [2:0]	pstate;
	reg				pte_run_wr;
	reg		 [1:0]	prot_level1;
	reg				card_flag;
	reg	   [28:12]	ptb0,ptb1;
	reg				write_ok;
	reg				icp_acc;
	reg		 [2:0]	ko_state;
	reg				dma_run;
	reg				dma_kdet;
	reg				rwv_bit;
	reg				prot_i;
	reg				rd_rdy;
	
	wire   [28:12]	ptb10;
	wire   [31:12]	virtual_adr;
	wire			io_busy;
	wire			dram_go;
	wire			pte_sel;
	wire			pte_acc;
	wire			do_ca_rd,pte_go,do_ic_p;
	wire			valid,valid_a,refer,modi;
	wire			level1,level2;
	wire			rd_level2;
	wire			wr_req;
	wire			wr_dram;
	wire			wr_icmram;
	wire			rd_ende;
	wire			pte_dat_8;
	wire			pte_wr_sig;
	wire			run_dc;
	wire			kostart;
	wire			dma;
	wire			dma_go;
	wire			zugriff;
	wire			mmu_hit_i;
	wire			do_zt;
	wire			zt_ok;
	wire	 [1:0]	acc_level;
	wire			user_ptw,wr_ptw;
	wire			pte_puls;
	
	// if USER not virtual then ZTEST is quickly done
	assign zugriff = READ | WRITE | (ZTEST & VIRTUELL);
	assign mmu_hit_i = MMU_HIT & ~ZTEST;
	
	// WB_ACC is a successful WRITE access, ICTODC[0] is coherent Logik release : >=3 entries in FIFO
	assign wr_req = WB_ACC & ((ENWR & ICTODC[0]) | (DRAM_WR & ADR_EQU));	// release done by DRAM signal ENWR

	assign rd_ende = CA_HIT | rd_rdy;	// CA_HIT only when Cache activ !
	
	always @(	 zugriff 	// READ or WRITE or ZTEST , global control
			  or PROT_ERROR	// must not be
			//
			  or IO_SPACE	// access of IO world
			  or io_busy	// is access already running ?
			//
			  or mmu_hit_i	// Hit in MMU , now only a READ can happen
			  or READ
			  or wr_req
			  or rd_ende	// Cache Hit
			//
			  or DRAM_ACC 	// DRAM Access : shows an active state
			  or pte_acc 	// PTE access is running
			//
			  or IC_PREQ 	// PTE Request from ICACHE
			//
			  or dma		// DMA Request
			  or dma_run )	// DMA running
			//					 #_#			  #_#						    #_#					    #_#
		casex ({zugriff,PROT_ERROR,IO_SPACE,io_busy,mmu_hit_i,READ,wr_req,rd_ende,DRAM_ACC,pte_acc,IC_PREQ,dma,dma_run})
		// MMU Miss : PTE load from memory , valid too if WRITE and M=0
		  13'b10_xx_0xxx_x0_x_x0 : new_state = 7'b0001010;	// start PTE access
	  	// IO-Address selected : external access starts if not busy because of WRITE
		  13'b10_10_1xxx_x0_x_x0 : new_state = 7'b0000001;
		// DRAM access : Cache Miss at READ : 
		  13'b10_0x_1100_00_x_x0 : new_state = 7'b0010010;
		// DRAM access : WRITE
		  13'b10_0x_101x_x0_x_x0 : new_state = 7'b0000100;
		// PTE Request ICACHE , IO access with WRITE is stored - parallel DRAM access possible
		  13'b0x_xx_xxxx_x0_1_x0 : new_state = 7'b0101010;	// no access
		  13'b10_0x_1101_x0_1_x0 : new_state = 7'b0101010;	// if successful READ a PTE access can happen in parallel
		// DMA access. Attention : no IO-Write access in background and no ICACHE PTE access !
		  13'b0x_x0_xxxx_x0_0_10 : new_state = 7'b1000000;	// DMA access is started
		  default 				 : new_state = 7'b0;
		endcase
		
	assign IO_ACC   = new_state[0];	// to load registers for data, addr und BE, signal one pulse
	assign dram_go  = new_state[1] | rd_level2 ;
	assign wr_dram  = new_state[2];	// pulse only
	assign pte_go   = new_state[3];
	assign do_ca_rd = new_state[4];
	assign do_ic_p	= new_state[5];
	assign dma_go	= new_state[6];

	// ZTEST logic is for the special case when a write access is crossing page boundaries
	
	assign do_zt = ZTEST & ~icp_acc;
	
	// 0 is pass , 1 is blocked. RWVAL[0] is 1 if WRVAL. Level 1 can only be blocked, otherwise ABORT or Level 2 is following.
	always @(posedge BCLK) if (mem_done) rwv_bit <= level2 ? ~(CAPDAT[2] & (~RWVAL[0] | CAPDAT[1])) : 1'b1;
	
	assign RWVFLAG = VIRTUELL & rwv_bit;
	
	assign zt_ok = mem_done & (RWVAL[1] ? (~CAPDAT[2] | (RWVAL[0] & ~CAPDAT[1]) | level2)	// Level 2 always ok
										: (CAPDAT[0] & ~prot_i & level2) );	// "normal" access

	// PTE access logic, normal state machine
	// Updates to the PTEs are normal WRITE request to DRAM, therefore no MDONE at Write
	
	assign modi  = ~CAPDAT[8] & WRITE & write_ok & ~icp_acc;	// is "1" if the Modified Bit must be set
	assign refer = CAPDAT[7] | do_zt;	// Assumption "R" Bit is set if RDVAL/WRVAL and page border test
	assign valid = (do_zt & RWVAL[1]) ? (CAPDAT[2] & (CAPDAT[1] | ~RWVAL[0]) & CAPDAT[0] & level1)
									  : (CAPDAT[0] & ~prot_i);
	
	always @(posedge BCLK) mem_done <= MDONE & pte_acc;
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) pstate <= 3'h0;
		  else
			casex ({pte_go,mem_done,valid,refer,modi,pte_run_wr,pstate})
			  9'b0x_xxxx_000 : pstate <= 3'd0;	// nothing to do
			  9'b1x_xxxx_000 : pstate <= 3'd4;	// start
			  9'bx0_xxxx_100 : pstate <= 3'd4;	// wait for Level 1
			  9'bx1_0xxx_100 : pstate <= 3'd0;	// THAT'S ABORT ! 
			  9'bx1_11xx_100 : pstate <= 3'd6;	// PTE Level 1 was referenced , next is Level 2
			  9'bx1_10xx_100 : pstate <= 3'd5;	// for writing of modified Level 1 : R=1
			  9'bxx_xxx0_101 : pstate <= 3'd5;	// write must wait
			  9'bxx_xxx1_101 : pstate <= 3'd6;	// one wait cycle
			  9'bx0_xxxx_110 : pstate <= 3'd6;	// wait for Level 2
			  9'bx1_0xxx_110 : pstate <= 3'd0;	// THAT'S ABORT !
			  9'bx1_10xx_110 : pstate <= 3'd7;	// Update neccesary : R=0
			  9'bx1_110x_110 : pstate <= 3'd0;	// all ok - end
			  9'bx1_111x_110 : pstate <= 3'd7;	// Update neccesary : M=0
			  9'bxx_xxx0_111 : pstate <= 3'd7;	// write must wait
			  9'bxx_xxx1_111 : pstate <= 3'd0;	// continues to end of DRAM write
			  default	     : pstate <= 3'd0;
			endcase
			
	assign pte_acc =  pstate[2];
	assign level1  = ~pstate[1];
	assign level2  =  pstate[1];
	
	assign valid_a = (ZTEST & RWVAL[1]) ? (CAPDAT[2] & (CAPDAT[1] | ~RWVAL[0]) & ~CAPDAT[0] & level1)
										: ~CAPDAT[0];	// not do_zt because of icp_acc in ABORT

	assign ABORT   =   mem_done & valid_a & ~icp_acc;
	assign PROTECT = ((mem_done & prot_i  & ~icp_acc) | PROT_ERROR) & ~(ZTEST & RWVAL[1]);	// no Protection-Error at RDVAL/WRVAL

	assign IACC_STAT[1] = mem_done & ~CAPDAT[0] & icp_acc;
	assign IACC_STAT[2] = level1;
	assign IACC_STAT[3] = mem_done & prot_i & icp_acc;

	assign ABO_LEVEL1 = level1;	// is stored in case of ABORT in ADDR_UNIT
	
	assign rd_level2 = (pstate == 3'd5) | (mem_done & (pstate == 3'd4) & refer & valid);

	assign WR_MRAM   = mem_done &  (pstate == 3'd6) & valid & ~icp_acc & ~ZTEST;
	assign wr_icmram = mem_done &  (pstate == 3'd6) & valid &  icp_acc;
	
	// Signals to the Instruction Cache
	// pte_acc combined with icp_acc for STATISTIK.
	assign IC_SIGS = {(pte_acc & icp_acc),wr_icmram};
	
	assign PTE_MUX = pte_go | (pte_acc & ~pstate[1]);

	assign pte_puls = mem_done & pte_acc & ~pstate[1];
	assign PTE_STAT = {(pte_puls & icp_acc),(pte_puls & ~icp_acc)};	// only for statistic
	
	assign PD_MUX =  ((pstate == 3'd4) & mem_done & valid & ~refer)		// switch data-MUX, write level 1 too
				   | ((pstate == 3'd6) & mem_done & valid & (~refer | modi))	// write level 2
				   | (((pstate == 3'd5) | (pstate == 3'd7)) & ~pte_run_wr);

	assign pte_wr_sig = ENWR & PD_MUX;
	
	always @(posedge BCLK) pte_run_wr <= pte_wr_sig;	// Ok-Signal for pstate State-machine
	
	assign PKEEP = (pstate == 3'd6) | ((pstate == 3'd7) & ~pte_run_wr);	// keep the DRAM address
	
	// If there is a PTE still in the data cache it must be deleted. If MMU Bits are set by the pte engine a following
	// READ would deliver wrong data if cache hit. Therefore access of the Tags.
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) ko_state <= 3'b000;
		  else
			casex ({kostart,ko_state})
			  4'b0_000 : ko_state <= 3'b000;
			  4'b1_000 : ko_state <= 3'b110;
			  4'bx_110 : ko_state <= 3'b111;
			  4'bx_111 : ko_state <= 3'b100;
			  4'bx_100 : ko_state <= 3'b000;
			  default  : ko_state <= 3'b000;
			endcase
			
	assign kostart = pte_go | rd_level2;
	
	// ko_state[2] suppresses ACC_OK at READ
	assign run_dc = (~ko_state[2] | QWATWO) & ~dma_run;	// Bugfix of 7.10.2015
	assign KOMUX  =   ko_state[1] 			|  DMA_MUX;
	assign KDET   =   ko_state[0] 			|  dma_kdet;
	  
	assign HIT_ALL = MMU_HIT & CA_HIT & run_dc & ~pte_acc;	// for Update "Last-Set" , MMU_HIT contains ZUGRIFF
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) card_flag <= 1'b0;
			else card_flag <= (do_ca_rd & ~rd_rdy) | (card_flag & ~MDONE);
	
	assign CUPDATE = card_flag & USE_CA & MDONE;

	always @(posedge BCLK) rd_rdy <= card_flag & MDONE;
	
	// The cache RAM can not provide fast enough the data after an Update. In this case a secondary data path is activated
	assign AUX_DAT = rd_rdy;
	
	// DRAM interface :

	always @(posedge BCLK)				DRAM_WR  <= wr_dram | pte_wr_sig; // pulse
	always @(posedge BCLK) if (dram_go) DRAM_ACC <= 1'b1;
							 else
								DRAM_ACC <= DRAM_ACC & ~MDONE & BRESET;
	// IO interface :
	
	always @(posedge BCLK)
	  begin
		if (IO_ACC) IO_RD <= READ;  else IO_RD <= IO_RD & ~IO_READY & BRESET;
		if (IO_ACC) IO_WR <= WRITE; else IO_WR <= IO_WR & ~IO_READY & BRESET;
	  end
	  
	assign io_busy = IO_RD | IO_WR | rd_done;	// access is gone in next clock cycle, therefore blocked with "rd_done"
	
	always @(posedge BCLK) rd_done <= IO_RD & IO_READY;	// For READ one clock later for data to come through
	
	assign dma = ICTODC[2];	// external request HOLD after FF in ICACHE
	
	always @(posedge BCLK) dma_run <= (dma_go | (dma_run & dma)) & BRESET;	// stops the data access until HOLD becomes inactive
	
	assign HLDA = ~(ICTODC[1] & dma_run);	// Signal for system that the CPU has stopped accesses
	
	always @(posedge BCLK) dma_kdet <= DMA_CHK;
	assign DMA_MUX = DMA_CHK | dma_kdet;
	
	// global feedback to ADDR_UNIT, early feedback to Op-Dec : you can continue
	
	assign ACC_OK = ZTEST ? (~VIRTUELL | zt_ok)
						  : (IO_SPACE ? ((IO_ACC & WRITE) | rd_done) : (wr_dram | (READ & MMU_HIT & rd_ende & run_dc)) );
						  
	// PTB1 and PTB0
	
	always @(posedge BCLK) if (PTB_WR && !PTB_SEL) ptb0 <= CPU_OUT;
	always @(posedge BCLK) if (PTB_WR &&  PTB_SEL) ptb1 <= CPU_OUT;
	
	always @(posedge BCLK) NEW_PTB <= PTB_WR;			// to MMU Update Block
	always @(posedge BCLK) if (PTB_WR) PTB_ONE <= PTB_SEL;
	
	assign ptb10 = SEL_PTB1 ? ptb1 : ptb0;
	
	// Address multiplex between ICACHE=1 and DCACHE=0 :
	always @(posedge BCLK) if (pte_go) icp_acc <= do_ic_p;
				
	assign pte_sel = pte_go ? do_ic_p : icp_acc;
	
	assign virtual_adr = pte_sel ? IC_VA : VADR_R;
	
	// The 2 Address-LSB's : no full access : USE_CA = 0	
	assign PTE_ADR = rd_level2 ? {CAPDAT[28:12],virtual_adr[21:12],2'b00} : {ptb10,virtual_adr[31:22],2'b00};
	
	// PTE_DAT[8] is used for update of MMU_RAM.
	assign pte_dat_8 = (level2 & WRITE & write_ok & ~icp_acc) | CAPDAT[8];
	assign PTE_DAT = {4'h3,CAPDAT[15:9],pte_dat_8,1'b1,CAPDAT[6:0]};	// the top 4 bits are Byte-Enable
	
	// The data for the MMU-RAM : 24 Bits , [6]=Cache Inhibit
	assign MMU_DIN = {pl_dat,pte_dat_8,CAPDAT[6],CAPDAT[31:12]};
	
	// Protection field
	
	always @(posedge BCLK) if (mem_done && (pstate[2:0] == 3'd4)) prot_level1 <= CAPDAT[2:1];

	always @(prot_level1 or CAPDAT)	
		casex ({prot_level1,CAPDAT[2]})
		  3'b11_x : pl_dat = CAPDAT[2:1];
		  3'b10_1 : pl_dat = 2'b10;
		  3'b10_0 : pl_dat = CAPDAT[2:1];
		  3'b01_1 : pl_dat = 2'b01;
		  3'b01_0 : pl_dat = CAPDAT[2:1];
		  3'b00_x : pl_dat = 2'b00;
		endcase
		
	always @(USER or pl_dat)	// is used if no PTE update is neccesary for M-Bit if writing is not allowed
		casex ({USER,pl_dat})
		  3'b1_11 : write_ok = 1'b1;
		  3'b0_1x : write_ok = 1'b1;
		  3'b0_01 : write_ok = 1'b1;
		  default : write_ok = 1'b0;
		endcase
		
	assign acc_level = level2 ? pl_dat : CAPDAT[2:1];
	assign user_ptw = icp_acc ? ICTODC[3] : USER;
	assign wr_ptw = ~icp_acc & (WRITE | RMW | (ZTEST & ~RWVAL[1]));	// only data cache can write
	
	always @(acc_level or user_ptw or wr_ptw)
		case (acc_level)
			2'b00 : prot_i = user_ptw | wr_ptw;
			2'b01 : prot_i = user_ptw;
			2'b10 : prot_i = user_ptw & wr_ptw;
			2'b11 : prot_i = 1'b0;
		endcase
		
endmodule

