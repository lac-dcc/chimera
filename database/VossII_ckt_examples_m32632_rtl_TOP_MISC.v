// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	TOP_MISC.v
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
//	1. IO_SWITCH	Switch between ICACHE and DCACHE to IO Path
//	2. MAKE_STAT	Generate Statistic Signals
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. IO_SWITCH	Switch between ICACHE and DCACHE to IO Path
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module IO_SWITCH ( BCLK, BRESET, I_IOA, D_IOA, I_IORD, D_IORD, D_IOWR, IO_READY, GENSTAT, D_IOBE, ILO_SIG, DCWACC,
				   IO_A, IO_RD, IO_WR, IO_BE, I_IORDY, D_IORDY, STATUS, ILO );

	input			BCLK,BRESET;
	input	[31:0]	I_IOA,D_IOA;
	input			I_IORD;
	input			D_IORD,D_IOWR;
	input	 [3:0]	D_IOBE;
	input			IO_READY;
	input	 [2:0]	GENSTAT;
	input			ILO_SIG;
	input	 [1:0]	DCWACC;
	
	output	[31:0]	IO_A;
	output			IO_RD,IO_WR;
	output	 [3:0]	IO_BE;
	output			I_IORDY;
	output			D_IORDY;
	output	 [3:0]	STATUS;
	output			ILO;
	
	reg		 [3:0]	STATUS;
	reg		 [1:0]	select;
	reg				ilo_flag;
	
	wire			daten;
	wire			sel_dp;
	wire			interrupt;
	wire			ilo_keep;
	
	assign daten = D_IORD | D_IOWR;

	// DCACHE has priority.
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) select <= 2'b0;
		  else
			casex ({I_IORD,D_IORD,D_IOWR,IO_READY,ilo_keep,select})
			  7'b000xx_00 : select <= 2'b00;
			  7'b1000x_00 : select <= 2'b11;
			  7'bx100x_00 : select <= 2'b10;
			  7'bxx10x_00 : select <= 2'b10;
			// the access has in the same cycle a READY !
			  7'b1001x_00 : select <= 2'b00;
			  7'bx101x_00 : select <= 2'b00;
			  7'bxx11x_00 : select <= 2'b00;
		 	// Datea Access
			  7'bxxx0x_10 : select <= 2'b10;
			  7'bxxx11_10 : select <= 2'b10;	// keep because of Interlocked
			  7'bxxx10_10 : select <= 2'b00;
			// Instruction Access	  
			  7'bxxx0x_11 : select <= 2'b11;	
			  7'bxxx1x_11 : select <= 2'b00;
			  default	  : select <= 2'b00;
			endcase
			
	assign sel_dp = (select == 2'b10) | ((select == 2'b00) & daten);
	
	assign IO_RD   =  sel_dp ? D_IORD : I_IORD;
	assign IO_WR   =  sel_dp ? D_IOWR : 1'b0;
	assign IO_A    =  sel_dp ? D_IOA  : I_IOA;
	assign IO_BE   =  sel_dp ? D_IOBE : 4'b1111;	// Instruction read always 32 Bit
	
	assign D_IORDY =  sel_dp & IO_READY;
	assign I_IORDY = ~sel_dp & IO_READY & I_IORD;

	assign interrupt = GENSTAT[1] | GENSTAT[0];
	
	always @(*)
		casex ({sel_dp,daten,interrupt,I_IORD})
		  4'b110x : STATUS = 4'hA;						// Daten
		  4'b111x : STATUS = GENSTAT[1] ? 4'h4 : 4'h6;	// Int Ack. : End of Int
		  4'b0xx1 : STATUS = 4'h8;						// Programm
		  default : STATUS = {3'd0,GENSTAT[2]};			// WAIT or Inactive
		endcase

	// +++++++++++  ILO Control  ++++++++++++++++++
	
	always @(posedge BCLK)
		if (!ILO_SIG) ilo_flag <= 1'b0; // Flag is set at read and cleared with write
		  else ilo_flag <= (D_IORD & sel_dp) | DCWACC[0] | ilo_keep;
		  
	assign ilo_keep = ilo_flag & ~D_IOWR & ~DCWACC[1];
		  
	assign ILO = ILO_SIG & ((D_IORD & sel_dp) | DCWACC[0] | ilo_flag | D_IOWR | DCWACC[1]);
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. MAKE_STAT	Generate Statistic Signals
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module MAKE_STAT ( BCLK, READ, DACC_OK, DC_ACC, DPTE_ACC, DC_MDONE, DRAM_WR, IC_READ, IACC_OK, DATA_HOLD,
				   IC_ACC, IPTE_ACC, IC_MDONE, KOLLISION, STATSIGS );

	input	BCLK;
	input	READ,DACC_OK;
	input	DC_ACC,DPTE_ACC,DC_MDONE;
	input	DRAM_WR;
	input	IC_READ,IACC_OK,DATA_HOLD;
	input	IC_ACC,IPTE_ACC,IC_MDONE;
	input	KOLLISION;
	
	output	reg [7:0]	STATSIGS;

	always @(posedge BCLK)
		begin
			STATSIGS[7] <= KOLLISION;						// 7 : from ICACHE : collisions
			STATSIGS[6] <= IPTE_ACC;						// 6 : Instruction PTE access
			STATSIGS[5] <= IC_ACC & IC_MDONE;				// 5 : Instruction Memory read
			STATSIGS[4] <= IC_READ & IACC_OK & ~DATA_HOLD;	// 4 : Instruction read , can be IO-Port too !
			STATSIGS[3] <= DRAM_WR;							// 3 : Data write
			STATSIGS[2] <= DPTE_ACC;						// 2 : Data PTE access
			STATSIGS[1] <= DC_ACC & DC_MDONE;				// 1 : Data Memory read
			STATSIGS[0] <= READ & DACC_OK;					// 0 : Data read , can be IO-Port too !
		end
		
endmodule

