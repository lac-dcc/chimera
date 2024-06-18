// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	REGISTERS.v
//	Project:	M32632
//  Version:	3.1 bug fix of 25 February 2019
//	History:	1.0 first release of 30 Mai 2015
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
//	1. CONFIG_REGS	Configuration and Debug Registers
//	2. FP_STAT_REG	Floating Point Status Register
//	3. REGISTER		General Purpose Registers
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. CONFIG_REGS	Configuration and Debug Registers
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module CONFIG_REGS ( BCLK, BRESET, WREN, LD_OUT, OPCODE, SRC1, WRADR, PC_ARCHI, USER, PCMATCH, DBG_HIT, READ,
					 CFG, MCR, PTB_WR, PTB_SEL, IVAR, IVAR_MUX, CINV, Y_INIT, DSR, DBG_TRAPS, DBG_IN );

	input			BCLK,BRESET;
	input			WREN,LD_OUT;
	input	 [7:0]	OPCODE;
	input	[31:0]	SRC1;
	input	 [5:0]	WRADR;
	input	[31:0]	PC_ARCHI;
	input			USER;
	input			PCMATCH;
	input			DBG_HIT;
	input			READ;
	
	output	[12:0]	CFG;
	output	 [3:0]	MCR;
	output			PTB_WR;
	output			PTB_SEL;
	output	 [1:0]	IVAR;
	output			IVAR_MUX;
	output	 [3:0]	CINV;
	output			Y_INIT;
	output	 [3:0]	DSR;
	output	 [2:0]	DBG_TRAPS;
	output	[40:2]	DBG_IN;
	
	reg		 [3:0]	MCR;
	reg		[12:0]	CFG;
	reg		 [1:0]	old_cfg;
	reg				PTB_WR,PTB_SEL;
	reg				ivarreg;
	reg		 [1:0]	ci_all,ci_line;
	reg				check_y;

	wire			ld_cfg,ld_mcr,do_cinv;
	wire			init_ic,init_dc;
	wire			op_ok;

	assign op_ok = (OPCODE == 8'h6A);	// Special Opcode - for security reason
	
	assign ld_cfg  = op_ok & (WRADR == 6'h1C)	   & WREN;
	assign ld_mcr  = op_ok & (WRADR == 6'd9)	   & WREN;
	assign do_cinv = op_ok & (WRADR[5:4] == 2'b11) & WREN;
	
	// PF is not implemented
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) CFG <= 13'h0;
			else if (ld_cfg) CFG <= SRC1[12:0];
			
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) MCR <= 4'h0;
			else if (ld_mcr) MCR <= SRC1[3:0];

	assign IVAR_MUX = op_ok & (WRADR[5:1] == 5'd7) & WREN;	// IVAR0/1 = Reg. Nr. 14/15
	always @(posedge BCLK) ivarreg <= IVAR_MUX;
	assign IVAR = {ivarreg,PTB_SEL};
	
	always @(posedge BCLK) PTB_WR  <= op_ok & (WRADR[5:1] == 5'd6) & WREN;	// PTB0/1 = Reg. Nr. 12/13
	always @(posedge BCLK) PTB_SEL <= WRADR[0];
	
	// The Cache content will be invalid if the Enable-Bit is set to 0
	always @(posedge BCLK) old_cfg <= {CFG[11],CFG[9]};
	
	// Cache Invalidate : the Flags are coming out of the Short-field which is otherwise used for Register selection
	always @(posedge BCLK) ci_all  <= do_cinv &  WRADR[2] ? WRADR[1:0] : 2'b0;	// clear all
	always @(posedge BCLK) ci_line <= do_cinv & ~WRADR[2] ? WRADR[1:0] : 2'b0;	// clear cache line
	
	assign init_ic = old_cfg[1] & (~CFG[11] | ci_all[1]);
	assign init_dc = old_cfg[0] & (~CFG[9]  | ci_all[0]);
	
	assign CINV = {init_ic,ci_line[1],init_dc,ci_line[0]};
	
	// Y_INIT is neccessary if nothing has changed and therefore no DC/IC_INIT is generated
	always @(posedge BCLK) check_y <= ld_cfg | do_cinv;
	assign Y_INIT = check_y & ~init_ic & ~init_dc;	// goes to register "old_init"
	
	// +++++++++++++  DEBUG Unit  +++++++++++++++

	reg		 [3:0]	DSR;
	reg		[12:0]	dcr;
	reg		[31:0]	bpc;
	reg		[31:2]	car;
	
	wire			op_dbg,ld_dcr,ld_bpc,ld_dsr,ld_car;
	wire			enable;
	
	assign op_dbg = (OPCODE == 8'h76);
	
	assign ld_dcr = op_dbg & (WRADR == 6'h11) & WREN;
	assign ld_bpc = op_dbg & (WRADR == 6'h12) & WREN;
	assign ld_dsr = op_dbg & (WRADR == 6'h13) & WREN;
	assign ld_car = op_dbg & (WRADR == 6'h14) & WREN;

	assign enable = dcr[12] & (USER ? dcr[10] : dcr[11]);	// DEN & (USER ? UD : SD)
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) dcr <= 13'd0;
			else if (ld_dcr) dcr <= {SRC1[23:19],SRC1[7:0]};
			
	always @(posedge BCLK) if (ld_bpc) bpc <= SRC1;
	always @(posedge BCLK) if (ld_car) car <= SRC1[31:2];
	
	//					DEN		  SD        DEN       UD       CAE      CRD      CAE      CWR    VNP/CBE  CAR
	assign DBG_IN = {(dcr[12] & dcr[11]),(dcr[12] & dcr[10]),(dcr[7] & dcr[6]),(dcr[7] & dcr[5]),dcr[4:0],car};
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) DSR <= 4'd0;
		  else
			if (ld_dsr) DSR <= SRC1[31:28];
			  else
				begin
				  DSR[3] <= DBG_HIT ? READ : DSR[3];
				  DSR[2] <= DSR[2] | PCMATCH;
				  DSR[1] <= DSR[1];
				  DSR[0] <= DSR[0] | DBG_HIT;
				end

	assign DBG_TRAPS[0] = enable & dcr[9] & (PC_ARCHI == bpc);	// dcr[9]=PCE
	assign DBG_TRAPS[1] = DBG_HIT;	// Compare Adress Hit
	assign DBG_TRAPS[2] = dcr[8];	// TR, Trap enable

endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. FP_STAT_REG	Floating Point Status Register
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module FP_STAT_REG ( BCLK, BRESET, LFSR, UP_SP, UP_DP, TT_SP, TT_DP, WREN, WRADR, DIN, FSR, TWREN, FPU_TRAP, SAVE_PC);
	
	input			BCLK;
	input			BRESET;
	input			LFSR;	// Load by LFSR opcode
	input			UP_SP,UP_DP;	// update if calculation operation
	input 	 [4:0]	TT_SP,TT_DP;
	input			WREN;	// for RMB and LFSR
	input	 [5:4]	WRADR;
	input 	[16:0] 	DIN;	// Data for LFSR opcode
	
	output	[31:0] 	FSR;
	output			TWREN;
	output	reg		FPU_TRAP;
	output			SAVE_PC;
	
	reg		 [4:3]	trap_d;
	reg				update_d;
	reg				set_rm_d;
	reg		[10:0]	set_bits;
	reg		 [4:0]	flags;
	reg				rm_bit;
	
	wire			load_fsr;
	wire			update,update_i;
	wire	 [4:0]	trap;
	wire			uflag,iflag,rmflag;

	assign load_fsr = LFSR & WREN;
	
	assign trap = UP_SP ? TT_SP : TT_DP;
	
	// This signal suppresses write into registers if FPU Trap, timing critical signal !
	assign TWREN = ~((UP_SP & (TT_SP[2:0] != 3'b0)) | (UP_DP & (TT_DP[2:0] != 3'b0)));
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) FPU_TRAP <= 1'b0;
		  else FPU_TRAP <= ~FPU_TRAP & ~TWREN;	// one pulse of one cycle informs the Opcode Decoder
				
	assign update_i = (UP_SP | UP_DP) & ~FPU_TRAP;	// unfortunately one FPU opcode may follow !
	always @(posedge BCLK) update_d	<= update_i;
	always @(posedge BCLK) trap_d	<= trap[4:3];
	always @(posedge BCLK) set_rm_d	<= WREN & (WRADR == 2'b10);
	assign update = update_d & ~FPU_TRAP;
	
	// The Flags are set and stay "1" 
	assign iflag  = (update & trap_d[4]) | flags[4];	// Inexact Result
	assign uflag  = (update & trap_d[3]) | flags[3];	// Underflow
	assign rmflag = (set_rm_d & ~FPU_TRAP) | rm_bit;	// Register Modify

	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) flags[4:3] <= 2'b0;	// Inexact = Bit6, Underflow = Bit4
		  else
		  begin
			if (load_fsr) flags[4:3] <= {DIN[6],DIN[4]};
			  else
				if (update) flags[4:3] <= {iflag,uflag};
		  end
		  
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) flags[2:0] <= 3'b0;	// TT Field = Bit2-0
		  else
		  begin
			if (load_fsr) flags[2:0] <= DIN[2:0];
			  else
				if (update_i) flags[2:0] <= trap[2:0];
		  end
		  
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) rm_bit <= 1'b0;	// Register Modify Bit
		  else
		  begin
			if (load_fsr) rm_bit <= DIN[16];
			  else
				if (set_rm_d & ~FPU_TRAP) rm_bit <= 1'b1;	// in case of TRAP there is no writing to Register
		  end
		
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) set_bits <= 11'b0;	// all other Bits
		  else
			if (load_fsr) set_bits <= {DIN[15:7],DIN[5],DIN[3]};

	assign FSR = {15'h0,rmflag,set_bits[10:2],iflag,set_bits[1],uflag,set_bits[0],flags[2:0]};
	
	assign SAVE_PC = (UP_SP | UP_DP) & ~FPU_TRAP;	// Store the correct PC for FPU Trap
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. REGISTER		General Purpose Registers
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module REGISTER( BCLK, ENWR, DOWR, BYDIN, DIN, RADR, WADR, WMASKE, DOUT, SELI );

input			BCLK;
input			DOWR,ENWR;
input	[31:0]	BYDIN,DIN;
input	 [7:0]	RADR;
input	 [5:0]	WADR;
input	 [1:0]	WMASKE;

output	[31:0]	DOUT;
output reg 		SELI;

reg	 	 [2:0] 	mx;

wire	 [2:0]	be;
wire			eq_rw;

// +++++++++++++++++++ Memories ++++++++++++++++++++

reg	 	[15:0]	REGFILE_C [0:63];	// Byte 3 and 2 , Verilog allows no "Byte Write" in wider memories !!!
reg	 	 [7:0]	REGFILE_B [0:63];	// Byte 1
reg	 	 [7:0]	REGFILE_A [0:63];	// Byte 0
reg		[31:0]	RF;

assign	be = {WMASKE[1],(WMASKE[1] | WMASKE[0]),1'b1};

assign	eq_rw = ENWR & (RADR[5:0] == WADR);

always @(posedge BCLK) if (RADR[7]) mx[2:0] <= be[2:0] & {{3{eq_rw}}};

always @(posedge BCLK) if (RADR[7]) SELI <= RADR[6];

assign DOUT[31:16] = mx[2] ? BYDIN[31:16] : RF[31:16];
assign DOUT[15:8]  = mx[1] ? BYDIN[15:8]  : RF[15:8];
assign DOUT[7:0]   = mx[0] ? BYDIN[7:0]   : RF[7:0];
	
// ++++++++++++++++ Register File 64 * 32 Bits ++++++++++++

always @(posedge BCLK)
	if (RADR[7])
		begin
			RF[31:16] <= REGFILE_C[RADR[5:0]];
			RF[15:8]  <= REGFILE_B[RADR[5:0]];
			RF[7:0]   <= REGFILE_A[RADR[5:0]];
		end

always @(posedge BCLK)
	if (DOWR)
		begin
			if (be[2]) REGFILE_C[WADR] <= DIN[31:16];
			if (be[1]) REGFILE_B[WADR] <= DIN[15:8];
			if (be[0]) REGFILE_A[WADR] <= DIN[7:0];
		end

endmodule

