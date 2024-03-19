// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	ADDR_UNIT.v
//	Version:	3.0
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
//	ADDR_UNIT	generates data access addresses and controls data cache operation
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module ADDR_UNIT ( BCLK, BRESET, READ, WRITE, LDEA, NEWACC, CLRMSW, POST, DISP_OK, FULLACC, SRC2SEL, INDEX, ASIZE, SRC1, SRC2, BWD,
				   DISP, PC_ARCHI, PC_ICACHE, IO_READY, ACC_STAT, MMU_UPDATE, IC_TEX, ABO_STAT, ADIVAR, RWVAL_1, OP_RMW, PHASE_17,
				   NO_TRAP, FPU_TRAP, READ_OUT, WRITE_OUT, ZTEST, RMW, VADR, ADDR, SIZE, PACKET, ACC_DONE, ABORT, CTRL_QW, BITSEL,
				   QWATWO );

	input			BCLK,BRESET;
	input			READ,WRITE,LDEA;
	input			NEWACC;
	input			CLRMSW,POST,FULLACC;
	input	 [1:0]	SRC2SEL;
	input	 [3:0]	INDEX;
	input	 [1:0]	ASIZE;
	input	[31:0]	SRC1,SRC2;
	input	 [1:0]	BWD;
	input	[31:0]	DISP;
	input	[31:0]	PC_ARCHI,PC_ICACHE;
	input			DISP_OK;
	input			IO_READY;
	input	 [5:0]	ACC_STAT;	// Feedback from data cache about the running access
	input	 [1:0]	MMU_UPDATE;
	input	 [2:0]	IC_TEX;
	input	 [1:0]	ABO_STAT;
	input			ADIVAR;
	input			RWVAL_1;	// special access for RDVAL + WRVAL
	input			OP_RMW;
	input			PHASE_17;
	input			NO_TRAP;
	input			FPU_TRAP;
	
	output			READ_OUT,WRITE_OUT,ZTEST,RMW;
	output	[31:0]	VADR;
	output	[31:0]	ADDR;
	output	 [1:0]	SIZE;
	output	 [3:0]	PACKET;
	output			ACC_DONE;
	output			ABORT;
	output	 [1:0]	CTRL_QW;
	output	 [2:0]	BITSEL;
	output	reg		QWATWO;
	
	reg		[31:0]	VADR;
	reg				READ_OUT,write_reg,ZTEST,RMW;
	reg		 [1:0]	SIZE;
	reg		 [3:0]	PACKET;
	reg		 [2:0]	BITSEL;
	reg		[31:0]	source2;
	reg		[31:0]	index_val;
	reg		[31:0]	vadr_reg;
	reg		[31:0]	ea_reg;
	reg		[31:0]	tos_offset;
	reg		[31:0]	icache_adr;
	reg		[31:0]	sign_ext_src1;
	reg	   [31:12]	pg_areg;
	reg				reg_out_i,next_reg;
	reg				ld_ea_reg;
	reg				acc_run,acc_ende,acc_step;
	reg				qwa_flag;
	reg				no_done;
	reg				frueh_ok;
	reg				io_rdy;
	reg				ABORT;
	reg		 [1:0]	tex_feld;
	reg		 [2:0]	u_ddt;
	reg				pg_op;
	reg				do_wr;
	reg				irdy_flag;
	
	wire			acc_ok,acc_err,io_acc;
	wire			acc_pass;
	wire			ca_hit;
	wire	[31:0]	reg_adder;
	wire	[31:0]	next_vadr;
	wire	[31:0]	final_addr;
	wire	[31:0]	pg_addr;
	wire	 [1:0]	inc_pack;
	wire	 [3:0]	index_sel;
	wire			ld_ea_i;
	wire			ea_ok;
	wire			qw_align;
	wire			init_acc;
	wire			in_page;
	wire			all_ok;
	wire			fa_out;
	wire			pg_test;

	// ++++++++++++++++++++  Decoding ACC_STAT from data cache  ++++++++++++++++++++++++++++
	
	// ACC_STAT[5:0] : CA_HIT, IO_ACC, PROT_ERROR , ABO_LEVEL1 , ABORT , ACC_OK
	
	assign ca_hit	= ACC_STAT[5];
	assign io_acc   = ACC_STAT[4];
	assign acc_err  = ACC_STAT[3] | ACC_STAT[1];	// Abort or Protection Error
	assign acc_ok   = ACC_STAT[0] & ~pg_op;
	assign acc_pass = ACC_STAT[0] & ZTEST;
	
	always @(posedge BCLK) ABORT <= acc_err;	// Signal to Steuerung - only a pulse
	
	always @(posedge BCLK) if (acc_err) tex_feld <= ACC_STAT[3] ? 2'b11 : {~ACC_STAT[2],ACC_STAT[2]};	// for MSR
	always @(posedge BCLK) if (acc_err) u_ddt 	 <= {RMW,ABO_STAT[1],(WRITE_OUT | ZTEST)};
	
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	always @(SRC2SEL or CLRMSW or SRC2 or PC_ARCHI or ea_reg)
		case (SRC2SEL)
		  2'b00 : source2 = {(CLRMSW ? 16'h0000 : SRC2[31:16]),SRC2[15:0]};	// base reg, External Addressing with MOD 
		  2'b01 : source2 = PC_ARCHI;		// PC relative
		  2'b10 : source2 = 32'h0;			// Absolute Addressing
		  2'b11 : source2 = ea_reg;			// REUSE : 2. TOS
		endcase
	
	assign index_sel = POST ? 4'h0 : INDEX;	// Alternative application of Index for POST Adder : POP from Stack
	
	always @(BWD or SRC1)
		casex (BWD)
			2'b00 : sign_ext_src1 = {{24{SRC1[7]}}, SRC1[7:0]};		// Byte
			2'b01 : sign_ext_src1 = {{16{SRC1[15]}},SRC1[15:0]};	// Word
		  default : sign_ext_src1 = SRC1;
		endcase
		
	always @(index_sel or sign_ext_src1 or SRC1)
		casex (index_sel)
		  4'b1_0xx : index_val = sign_ext_src1;	// f�r CASE
		  4'b1_1xx : index_val = {{ 3{sign_ext_src1[31]}},sign_ext_src1[31:3]};	// for Bit Opcodes
		  4'b0_100 : index_val = SRC1;
		  4'b0_101 : index_val = {SRC1[30:0],1'b0};
		  4'b0_110 : index_val = {SRC1[29:0],2'b00};
		  4'b0_111 : index_val = {SRC1[28:0],3'b000};
		  default  : index_val = 32'h0;
		endcase
		
	assign reg_adder = source2 + index_val;	// SRC2 allows simple MOV with SRC1
	
	assign final_addr = reg_adder + DISP;	// That's the final access address
	
	always @(posedge BCLK) if (LDEA && (index_sel[3:2] == 2'b11)) BITSEL <= SRC1[2:0];	// for Bit Opcodes in I_PFAD
		
	always @(INDEX)	// SP POP Operation & String Backward
		case (INDEX[2:0])
		  3'b000 : tos_offset = 32'h0000_0001;
		  3'b001 : tos_offset = 32'h0000_0002;
		  3'b010 : tos_offset = 32'h0000_0004;
		  3'b011 : tos_offset = 32'h0000_0008;
		  3'b100 : tos_offset = 32'hFFFF_FFFF;
		  3'b101 : tos_offset = 32'hFFFF_FFFE;
		  3'b110 : tos_offset = 32'hFFFF_FFFC;
		  3'b111 : tos_offset = 32'hFFFF_FFF8;
		endcase
		
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) ld_ea_reg <= 1'b0;
		  else ld_ea_reg <= (LDEA | ld_ea_reg) & ~DISP_OK;
				
	assign ld_ea_i = (LDEA | ld_ea_reg) & DISP_OK;
		
	assign ea_ok = (READ | WRITE | LDEA | ld_ea_reg) & ~FULLACC & DISP_OK;
	
	always @(posedge BCLK) icache_adr <= PC_ICACHE;
	
	// Memory for the calculated address for reuse and Register for POST modified addresses : 
	always @(posedge BCLK)
		if (ld_ea_i)
		  begin
			casex ({MMU_UPDATE[1],INDEX[0],POST})
			  3'b10x : ea_reg <= MMU_UPDATE[0] ? vadr_reg : icache_adr;		// TEAR
			  3'b11x : ea_reg <= MMU_UPDATE[0] ?
								  {24'h0000_00,3'b101,		u_ddt,			 tex_feld}		// MSR
								: {24'h0000_00,3'b100,IC_TEX[2],ABO_STAT[0],1'b0,IC_TEX[1:0]};	// only READ from ICACHE
			  3'b0x1 : ea_reg <= source2 + tos_offset ;
			  3'b0x0 : ea_reg <= final_addr;
			endcase
		  end
	
	assign ADDR = ea_reg;	// used for ADDR opcode and TOS Addressing
	
	// This pulse stores all parameters of access
	assign init_acc = ((FULLACC ? (NEWACC & acc_ende) : acc_ende) | ~acc_run) & DISP_OK & (READ | WRITE) & ~ABORT & NO_TRAP;

	assign fa_out = init_acc | ADIVAR;	// special case for LMR IVAR,...
	
	always @(fa_out or acc_ok or final_addr or qw_align or pg_op or pg_areg or vadr_reg or next_vadr)
		casex ({fa_out,acc_ok})		
		  2'b1x : VADR = {final_addr[31:3],(final_addr[2] | qw_align),final_addr[1:0]};
		  2'b00 : VADR = pg_op ? {pg_areg,12'h0} : vadr_reg;
		  2'b01 : VADR = next_vadr;
		endcase

	always @(posedge BCLK)
		if (init_acc) vadr_reg <= {final_addr[31:3],(final_addr[2] | qw_align),final_addr[1:0]};
		  else
			if (pg_op && ZTEST && acc_err) vadr_reg <= {pg_areg,12'h0};	// for TEAR !
			  else
				if (acc_ok) vadr_reg <= next_vadr;
			
	assign next_vadr = qwa_flag ? {vadr_reg[31:3],3'b000} : ({vadr_reg[31:2],2'b00} + 32'h0000_0004);
	
	// Logic for Page border WRITE Test
	assign pg_addr = final_addr + {29'h0,(ASIZE[1] & ASIZE[0]),ASIZE[1],(ASIZE[1] | ASIZE[0])};
	always @(posedge BCLK) if (init_acc) pg_areg <= pg_addr[31:12];
	assign pg_test = (final_addr[12] != pg_addr[12]) & ~OP_RMW;	// At RMW no Test necessary
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) pg_op <= 1'b0;
		  else
			pg_op <= init_acc ? (WRITE & ~RWVAL_1 & pg_test) : (pg_op & ~acc_pass & ~acc_err);
			
	always @(posedge BCLK) do_wr <= pg_op & ZTEST & acc_pass;	// All ok, Page exists => continue
				
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) READ_OUT <= 1'b0;
		  else
			READ_OUT  <= init_acc ? (READ & ~RWVAL_1) : (READ_OUT  & ~acc_ende & ~acc_err);	
			
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) write_reg <= 1'b0;
		  else														 
			write_reg <= (init_acc ? (WRITE & ~RWVAL_1 & ~pg_test) : (write_reg & ~acc_ende & ~acc_err & ~FPU_TRAP)) | do_wr;
						 
	assign WRITE_OUT = write_reg & ~FPU_TRAP;

	// Special case for RDVAL and WRVAL
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) ZTEST <= 1'b0;
		  else
			ZTEST <= pg_op ? (~ZTEST | (~acc_pass & ~acc_err)) : (init_acc ? RWVAL_1  : (ZTEST  & ~acc_ende & ~acc_err));
			
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) RMW <= 1'b0;
		  else
			RMW <= init_acc ? (OP_RMW & PHASE_17) : (RMW  & ~acc_ende & ~acc_err);
			
	// Special case : first MSD access by aligned QWORD READ
	assign qw_align = (final_addr[2:0] == 3'b000) & READ & (ASIZE == 2'b11);
	
	always @(posedge BCLK) if (init_acc) qwa_flag <= qw_align;
	
	always @(posedge BCLK or negedge BRESET)	// central flag that shows the ADDR_UNIT is busy
		if (!BRESET) acc_run <= 1'b0;
		  else
			acc_run <= init_acc | (acc_run & ~acc_ende & ~acc_err & ~FPU_TRAP);
	
	always @(posedge BCLK) if (init_acc) SIZE <= ASIZE;

	assign inc_pack = (PACKET[1:0] == 2'b00) ? 2'b10 : {(SIZE[1] ^ SIZE[0]),(SIZE[1] & SIZE[0])};
	
	// Counter for data packets 1 to 3 : special case aligned QWORD : only 2 packets. Additionally start address in bits 1 und 0.
	// special coding (00) -> [01] -> (10) , [01] optional by QWORD and (10) shows always the end
	always @(posedge BCLK)
		if (init_acc) PACKET <= {2'b00,final_addr[1:0]};
		  else
			if (acc_ok) PACKET <= PACKET + {inc_pack,2'b00};
	
	// This signal is the End signal for the ADDR_UNIT internally.
	always @(SIZE or PACKET or acc_ok)
		casex ({SIZE,PACKET[3],PACKET[1:0]})
		  5'b00_x_xx : acc_ende = acc_ok;	// Byte
		  5'b01_0_0x : acc_ende = acc_ok;	// Word		1 packet
		  5'b01_0_10 : acc_ende = acc_ok;	//			1 packet
		  5'b01_1_xx : acc_ende = acc_ok;	//			2 packets
		  5'b10_0_00 : acc_ende = acc_ok;	// DWord	1 packet
		  5'b10_1_xx : acc_ende = acc_ok;	//			2 packets
		  5'b11_1_xx : acc_ende = acc_ok;	// QWord	at least 2 packets
		  default    : acc_ende = 1'b0;
		endcase
		
	assign in_page = (vadr_reg[11:3] != 9'h1FF);	// Access inside a page ? During WRITE address is increasing : 1. LSD 2. MSD
	
	always @(SIZE or vadr_reg or in_page or PACKET)
		casex (SIZE)
		  2'b01 : frueh_ok = (vadr_reg[3:2] != 2'b11);	//Word
		  2'b10 : frueh_ok = (vadr_reg[3:2] != 2'b11);	//DWord
		  2'b11 : frueh_ok = (PACKET[1:0] == 2'b00) ? (~vadr_reg[3] | ~vadr_reg[2]) : ((PACKET[3:2] == 2'b01) & (vadr_reg[3:2] != 2'b11));
		default : frueh_ok = 1'b1;						// Byte don't case
		endcase
		  
	assign all_ok = SIZE[1] ? (PACKET[1:0] == 2'b00) : (PACKET[1:0] != 2'b11);	// for DWord : Word
	
	always @(SIZE or READ_OUT or frueh_ok or PACKET or all_ok or io_acc or acc_ok or qwa_flag or io_rdy or ca_hit)
		casex ({SIZE,READ_OUT,frueh_ok,PACKET[3],io_acc,all_ok})
		  7'b00_xxxx_x : acc_step = acc_ok;	// Byte, all ok
		//
		  7'b01_xxxx_1 : acc_step = acc_ok;	// Word : 	aligned access , only 1 packet
		  7'b01_1x1x_0 : acc_step = acc_ok;	//			READ must wait for all data
		  7'b01_0x1x_0 : acc_step = acc_ok;	//			WRITE Adr. ist not perfect and waits for last packet
		  7'b01_0100_0 : acc_step = acc_ok;	//			WRITE Adr. perfect - acc_step after 1. packet
		//
		  7'b10_xxxx_1 : acc_step = acc_ok;	// DWord : 	aligned access , only 1 packet
		  7'b10_1x1x_0 : acc_step = acc_ok;	//			READ must wait for all data
		  7'b10_0x1x_0 : acc_step = acc_ok;	//			WRITE Adr. ist not perfect and waits for last packet
		  7'b10_0100_0 : acc_step = acc_ok;	//			WRITE Adr. perfect - acc_step after 1. packet
		// fast QWord READ : there would be a 2. acc_step if not ~PACK... 
		  7'b11_1xxx_x : acc_step = acc_ok & ( (qwa_flag & ~io_rdy & ca_hit) ? ~PACKET[3] : PACKET[3] );
		  7'b11_0x1x_x : acc_step = acc_ok;
		  7'b11_0100_x : acc_step = acc_ok;	//			WRITE Adr. perfect - acc_step after 1. packet if not io_acc
		  default      : acc_step = 1'b0;
		endcase
	
	// There is a 2. acc_step if packet (10) - this must be suppressed
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) no_done <= 1'b0;
		  else no_done <= (~acc_ende & acc_step) | (no_done & ~(acc_run & acc_ende));
		  
	// The final DONE Multiplexer
	assign ACC_DONE = acc_run ? (acc_step & ~no_done) : ea_ok;

	// Bugfix of 7.October 2015
	always @(posedge BCLK) QWATWO <= acc_run & acc_ok & qwa_flag & ~io_rdy & ca_hit & ~PACKET[3] & (SIZE == 2'b11) & READ_OUT & ~no_done;

	always @(posedge BCLK) reg_out_i <= ~acc_step & BRESET & ((qwa_flag & ~io_rdy & ~ca_hit & acc_ok) | reg_out_i);
	
	always @(posedge BCLK) irdy_flag <= (READ_OUT & io_acc) | (irdy_flag & ~IO_READY);	// new 25.6.2018
	always @(posedge BCLK) io_rdy  <= IO_READY & irdy_flag;
	
	always @(posedge BCLK) next_reg <= acc_step & (qwa_flag ? io_rdy : 1'b1) & (SIZE == 2'b11);
	assign CTRL_QW = {qwa_flag,(reg_out_i | next_reg)};
	
endmodule
