// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	ICACHE_SM.v
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
//	1. KOLDETECT 	Collision Detection Unit
//	2. DMUX 		Data Multiplexor
//	3. ICACHE_SM 	Instruction Cache State Machine
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. KOLDETECT 	Collision Detection Unit
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module KOLDETECT ( BCLK, BRESET, DRAM_WR, CVALID, ADDR, TAG0, TAG1 , CFG , C_VALID, READ_I, ACC_OK, HOLD, KDET, INVAL_A, ENA_HK,
				   NEWCVAL, KOLLISION, STOP_ICRD, RUN_ICRD, KILL, KILLADR, ICTODC, STOP_CINV );

	input			BCLK;
	input			BRESET;
	input			DRAM_WR;
	input	[23:0]	CVALID;		// Data from master Valid RAM
	input	[28:4]	ADDR;
	input  [28:12]	TAG0,TAG1;
	input	 [1:0]	CFG;
	input	[23:0]	C_VALID;	// Data from secondary Valid RAM
	input			READ_I;
	input			ACC_OK;
	input			HOLD;		// active low
	input			KDET;
	input			INVAL_A;	// Cache Invalidate All
	input			ENA_HK;		// Enable HOLD and Kohaerenz
	
	output	[23:0]	NEWCVAL;
	output			KOLLISION;
	output			STOP_ICRD;
	output			RUN_ICRD;
	output			KILL;
	output	[11:7]	KILLADR;
	output	 [2:0]	ICTODC;
	output			STOP_CINV;
	
	reg		[28:4]	addr_r;
	reg		 [7:0]	clear;
	reg				do_koll;
	reg		 [2:0]	counter;
	reg		 [1:0]	wpointer,rpointer;
	reg		[35:0]	adrfifo;
	reg		 [8:0]	fifo_q,fifo_c;
	reg		 [1:0]	state;
	reg				pipe;
	reg				do_kill;
	reg				dma;

	wire	[7:0]	set_0,set_1;
	wire			match_0,match_1;
	wire			valid_0,valid_1;
	wire			found_0,found_1;
	wire			kolli,dma_kolli;
	wire			last_match;
	wire			wr_entry;
	wire	[23:0]	cdaten;
	wire	 [8:0]	kaddr;
	wire	 [7:0]	new_0,new_1;
	wire			dma_mode,ic_dma;
	wire			free,ende;
	wire			init_b;

	always @(posedge BCLK) do_koll <= DRAM_WR & CFG[0];	// one cycle pulse, without Cache Enable no collision
	always @(posedge BCLK) addr_r <= ADDR;
	
	// similar logic like in CA_MATCH
	
	assign set_0 = C_VALID[7:0];
	assign set_1 = C_VALID[15:8];
		
	assign valid_0 = set_0[addr_r[6:4]];
	assign valid_1 = set_1[addr_r[6:4]];
	
	assign match_0 = ( TAG0 == addr_r[28:12] );	// 4KB
	assign match_1 = ( TAG1 == addr_r[28:12] );	// 4KB
	
	assign found_0 = valid_0 & match_0;
	assign found_1 = valid_1 & match_1;
	
	assign kolli = (found_0 | found_1) & ~CFG[1] & do_koll;	// Action only if ICACHE is not locked

	assign KOLLISION = (found_0 | found_1) & do_koll;	// to Statistik Modul, Register there

	assign dma_kolli = (found_0 | found_1) & ~CFG[1] & CFG[0];
	
	// the FIFO with 4 entries :
	assign init_b = CFG[0] & ~INVAL_A;	// initialise if CINV A too
	
	always @(posedge BCLK)
		if (!init_b) wpointer <= 2'b00;
			else
				wpointer <= wpointer + {1'b0,wr_entry};
				
	always @(posedge BCLK)
		if (!init_b) rpointer <= 2'b00;
			else
				rpointer <= rpointer + {1'b0,do_kill};
	
	always @(posedge BCLK)
	  begin
		if (wr_entry && (wpointer == 2'b00)) adrfifo[8:0]   <= {addr_r[11:4],found_1};
		if (wr_entry && (wpointer == 2'b01)) adrfifo[17:9]  <= {addr_r[11:4],found_1};
		if (wr_entry && (wpointer == 2'b10)) adrfifo[26:18] <= {addr_r[11:4],found_1};
		if (wr_entry && (wpointer == 2'b11)) adrfifo[35:27] <= {addr_r[11:4],found_1};
	  end
		
	always @(adrfifo or rpointer)
		case (rpointer)
		  2'b00 : fifo_q = adrfifo[8:0];
		  2'b01 : fifo_q = adrfifo[17:9];
		  2'b10 : fifo_q = adrfifo[26:18];
		  2'b11 : fifo_q = adrfifo[35:27];
		endcase
		
	always @(adrfifo or wpointer)	// for Match of last entry use wpointer
		case (wpointer)
		  2'b01 : fifo_c = adrfifo[8:0];
		  2'b10 : fifo_c = adrfifo[17:9];
		  2'b11 : fifo_c = adrfifo[26:18];
		  2'b00 : fifo_c = adrfifo[35:27];
		endcase
		
	// Control
	
	assign last_match = counter[2] & (fifo_c == {addr_r[11:4],found_1});	// if Match with last Entry no new Entry

	assign wr_entry = kolli & ~last_match;
	
	always @(posedge BCLK)
		casex ({init_b,wr_entry,do_kill,counter})
		  6'b0_xx_xxx : counter <= 3'b000;
		  6'b1_00_xxx : counter <= counter;
		  6'b1_11_xxx : counter <= counter;
		  6'b1_10_000 : counter <= 3'b100;
		  6'b1_10_1xx : counter <= (counter[1:0] == 2'b11) ? 3'b111 : {counter[2],(counter[1:0] + 2'b01)};	// Overflow avoid
		  6'b1_01_1xx : counter <= (counter[1:0] == 2'b00) ? 3'b000 : {counter[2],(counter[1:0] + 2'b11)};
		  default	  : counter <= counter;
		endcase

	// DMA Access
	always @(posedge BCLK) dma <= ~HOLD;	// there is only one FF for this , from here to DCACHE
	
	// Controlling of ICACHE
	
	assign free = (~READ_I | ACC_OK) & ENA_HK;	// switch off if CINV
	
	always @(posedge BCLK)					//  state[1]  state[0]
		casex ({BRESET,dma,counter[2],free,ende,STOP_ICRD,dma_mode})
		  7'b0_xx_xx_xx : state <= 2'b00;
		  7'b1_00_xx_00 : state <= 2'b00;
		  7'b1_01_1x_00 : state <= 2'b10;	// Start of DCACHE Kohaerenz
		  7'b1_1x_1x_00 : state <= 2'b11;	// Start of DMA
	//
		  7'b1_xx_x0_10 : state <= 2'b10;	// without "ende" it stays as is
		  7'b1_0x_x1_10 : state <= 2'b00;	// DMA is not active
		  7'b1_1x_x1_10 : state <= 2'b11;	// to DMA !
	//
		  7'b1_00_xx_11 : state <= 2'b00;
		  7'b1_01_xx_11 : state <= 2'b10;
		  7'b1_1x_xx_11 : state <= 2'b11;
		  default		: state <= 2'b00;
		endcase
	
	assign STOP_ICRD = state[1];	// used for Multiplexer
	assign dma_mode  = state[0];	// internal Multiplexer

	assign STOP_CINV = state[1] & ~ENA_HK;	// stops CINV if DMA access or Kohaerenz access
	
	assign ende = (counter[1:0] == 2'b00) & do_kill;
	
	assign ic_dma = STOP_ICRD & dma_mode;	// Signal to DCACHE that ICACHE has stoped
	
	always @(posedge BCLK) pipe <= STOP_ICRD;
		
	assign RUN_ICRD = ~(STOP_ICRD | pipe);	// Release for IC_READ
	
	always @(posedge BCLK) do_kill <= STOP_ICRD & ~dma_mode & ~do_kill;	// Write pulse in Cache Valid RAM, 1 cycle on, 1 cycle off
	
	assign KILL = do_kill | (KDET & dma_kolli);
	
	// Valid Daten prepare : different sources for DMA and DCACHE Kohaerenz
	
	assign cdaten = dma_mode ? C_VALID : CVALID;
	assign kaddr  = dma_mode ? {addr_r[11:4],found_1} : fifo_q;
	
	assign KILLADR = kaddr[8:4];
	
	always @(kaddr)
		case (kaddr[3:1])
		  3'h0 : clear = 8'hFE;
		  3'h1 : clear = 8'hFD;
		  3'h2 : clear = 8'hFB;
		  3'h3 : clear = 8'hF7;
		  3'h4 : clear = 8'hEF;
		  3'h5 : clear = 8'hDF;
		  3'h6 : clear = 8'hBF;
		  3'h7 : clear = 8'h7F;
		endcase
	
	assign new_0 = kaddr[0] ? cdaten[7:0] : (cdaten[7:0] & clear);
	assign new_1 = kaddr[0] ? (cdaten[15:8] & clear) : cdaten[15:8];

	assign NEWCVAL = {cdaten[23:16],new_1,new_0};
	
	// multiple signals are needed in DCACHE :
	assign ICTODC = {dma,ic_dma,~(counter[2:1] == 2'b11)};
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. DMUX 	Data Multiplexor
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DMUX ( DRAM_Q, ADDR, CAP_Q );

	input  [127:0]	DRAM_Q;
	input	 [3:2]	ADDR;
	
	output	reg	[31:0]	CAP_Q;
	
	always @(ADDR or DRAM_Q)
	  case (ADDR)
	    2'b00 : CAP_Q = DRAM_Q[31:0];
		2'b01 : CAP_Q = DRAM_Q[63:32];
		2'b10 : CAP_Q = DRAM_Q[95:64];
		2'b11 : CAP_Q = DRAM_Q[127:96];
	  endcase
	  
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. ICACHE_SM 	Instruction Cache State Machine
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module ICACHE_SM ( BCLK, BRESET, IO_SPACE, MDONE, IO_READY, MMU_HIT, CA_HIT, READ, PTE_ACC,
				   USE_CA, PTB_WR, PTB_SEL, USER, PROT_ERROR,
				   DRAM_ACC, IO_RD, IO_ACC, IC_PREQ, ACC_OK, HIT_ALL, CUPDATE, AUX_DAT, NEW_PTB, PTB_ONE );

	input			BCLK;
	input			BRESET;
	input			IO_SPACE;
	input			MDONE;		// Memory Done : Feedback from DRAM Controller, BCLK aligned
	input			IO_READY;
	input			MMU_HIT,CA_HIT;
	input			READ;
	input			PTE_ACC;
	input			USE_CA;
	input			PTB_WR,PTB_SEL;
	input			USER;
	input			PROT_ERROR;
	
	output	reg		DRAM_ACC,IO_RD;
	output			IO_ACC;
	output			IC_PREQ;
	output			ACC_OK;
	output			HIT_ALL;
	output			CUPDATE;
	output			AUX_DAT;
	output	reg		NEW_PTB,PTB_ONE;
	
	reg		 [3:0]	new_state;
	reg				rd_done;
	reg				card_flag;
	reg				rd_rdy;

	wire			io_busy;
	wire			dram_go;
	wire			rd_ende;
	wire			do_ca_rd;
	
// Cycle :			/-\_/-\_/-\_/-\_/-\_/-\_/-\_/-\_/-\_/-\_
// Access :			_/-----------------------------------\__
// State Machine :  ____/----------------------------\______
//							Busy status ...

	assign rd_ende = CA_HIT | rd_rdy;	// CA_HIT only if Cache activ !

	always @(	 READ	 	// only READ , global control
			  or PROT_ERROR	// is not allowed !
			//
			  or IO_SPACE	// indicates access in the IO_WELT
			  or io_busy	// is already active ?
			//
			  or MMU_HIT	// Hit in the MMU , now only a READ can be active
			  or rd_ende	// Cache Hit
			  or DRAM_ACC	// DRAM Access running
			//
			  or PTE_ACC )	// PTE Access running
			//				  #_#			   #_#						#_#
		casex ({READ,PROT_ERROR,IO_SPACE,io_busy,MMU_HIT,rd_ende,DRAM_ACC,PTE_ACC})
		// MMU Miss : PTE load from memory 
		  8'b10_xx_0xx_0 : new_state = 4'b0100;	// start PTE access
	  	// IO-Address selected : external access starts if not already BUSY
		  8'b10_10_1xx_x : new_state = 4'b0001;
		// DRAM Access : Cache Miss at READ
		  8'b10_0x_100_x : new_state = 4'b1010;	// can start directly
		  default 		 : new_state = 4'b0;
		endcase
		
	assign IO_ACC   = new_state[0];	// to load the Register for Data and Addr
	assign dram_go  = new_state[1];
	assign IC_PREQ  = new_state[2];	// MMU to DCACHE !
	assign do_ca_rd = new_state[3];
	
	assign HIT_ALL = MMU_HIT & CA_HIT;	// for Update "Last-Set" , MMU_HIT contains ZUGRIFF
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) card_flag <= 1'b0;
			else card_flag <= (do_ca_rd & ~rd_rdy) | (card_flag & ~MDONE);
	
	assign CUPDATE = card_flag & USE_CA & MDONE;	// USE_CA = ~CI & ~LDC;
	
	always @(posedge BCLK) rd_rdy <= card_flag & MDONE;	
	
	// The cache RAM can not provide fast enough the data after an Update. In this case a secondary data path is activated
	assign AUX_DAT = rd_rdy;
	
	// DRAM Interface :

	always @(posedge BCLK) if (dram_go) DRAM_ACC <= 1'b1;
							 else
								DRAM_ACC <= DRAM_ACC & ~MDONE & BRESET;
	// IO Interface :
	
	always @(posedge BCLK)
	  begin
		if (IO_ACC) IO_RD <= READ;  else IO_RD <= IO_RD & ~IO_READY & BRESET;
	  end
	  
	assign io_busy = IO_RD | rd_done;	// access is gone in next clock cycle, therefore blocked with "rd_done"
	
	always @(posedge BCLK) rd_done <= READ & IO_READY;	// For READ one clock later for data to come through
	
	// global feedback to opcode fetch unit : you can continue
	
	assign ACC_OK = IO_SPACE ? rd_done : (READ & MMU_HIT & rd_ende);
	
	// PTB1 und PTB0
	
	always @(posedge BCLK) NEW_PTB <= PTB_WR;			// to MMU Update Block
	always @(posedge BCLK) if (PTB_WR) PTB_ONE <= PTB_SEL;
	
endmodule
