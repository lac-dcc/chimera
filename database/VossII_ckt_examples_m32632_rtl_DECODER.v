// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	DECODER.v
//  Version:	3.0
//	History:	2.0 of 11 August 2016
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
//	DECODER		Instruction Decoding and Flow Control
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module DECODER ( BCLK, BRESET, INT_N, NMI_N, ANZ_VAL, OPREG, CFG, PSR, ACC_DONE, DC_ABORT, IC_ABORT, ACB_ZERO, DONE,
				 PC_SAVE, STRING, INIT_DONE, ILL, UNDEF, TRAPS, IC_READ, STOP_CINV,
				 GENSTAT, DISP, IMME_Q, DISP_BR, USED, NEW, LOAD_PC, NEXT_PCA, RDAA, RDAB, OPER, START, LD_OUT, LD_DIN, LD_IMME,
				 INFO_AU, ACC_FELD, WREN, WRADR, WMASKE, WR_REG, DETOIP, MMU_UPDATE, RESTART, STOP_IC, RWVAL, ENA_HK, ILO, COP_OP,
				 PHOUT );

	input			BCLK,BRESET;
	input			INT_N,NMI_N;	// external inputs
	input	 [2:0]	ANZ_VAL;
	input	[55:0]	OPREG;			// the OPREG contains the bytes to decode, OPREG[55:32] are don't care
	input	 [8:0]	CFG;			// CONFIG : many bits are don't-care
	input	[11:0]	PSR;
	input			ACC_DONE;
	input			DC_ABORT,IC_ABORT;
	input			ACB_ZERO;
	input			DONE;
	input	[31:0]	PC_SAVE;
	input	 [4:0]	STRING;
	input			INIT_DONE;
	input			ILL,UNDEF;
	input	 [5:0]	TRAPS;
	input			IC_READ;
	input			STOP_CINV;		// not to mix it up with STOP_IC
	
	output	 [2:0]	GENSTAT;
	output	[31:0]	DISP,IMME_Q,DISP_BR;	// three main data busses : Displacement, Immediate and Displacement for Branch
	output	 [2:0]	USED;
	output			NEW;
	output			LOAD_PC;
	output			NEXT_PCA;
	output	 [7:0]	RDAA,RDAB;
	output	[10:0]	OPER;
	output	 [1:0]	START,LD_OUT;
	output			LD_DIN,LD_IMME;
	output	 [6:0]	INFO_AU;
	output	[14:0]	ACC_FELD;
	output			WREN;
	output	 [5:0]	WRADR;
	output	 [1:0]	WMASKE;
	output	reg		WR_REG;
	output	[12:0]	DETOIP;
	output	 [1:0]	MMU_UPDATE;
	output			RESTART;
	output			STOP_IC;
	output	 [2:0]	RWVAL;
	output			ENA_HK;
	output	reg		ILO;
	output	[23:0]	COP_OP;
	output	 [7:0]	PHOUT;		// for Debug purposes, phase_reg output
	
	reg		[31:0]	DISP,disp_val;
	reg		[10:0]	oper_i;
	reg		 [2:0]	USED;
	reg		[14:0]	ACC_FELD;
	reg		 [1:0]	ldoreg;
	reg				wren_i;
	reg		 [5:0]	wradr_i;
	reg		 [1:0]	wmaske_i;
	reg		 [1:0]	start_i;
	reg		[23:0]	COP_OP;
	reg				spupd_i;
	reg		 [3:0]	disp_sel;
	reg		[52:0]	op1_feld;
	reg		[47:0]	op2_feld;
	reg		[47:0]	op3_feld;
	reg		[47:0]	op_feld_reg;
	reg		[31:0]	imme_i;
	reg		 [2:0]	valid;
	reg		 [7:0]	phase_reg;
	reg		 [3:0]	di_stat;	// Displacement Status
	reg		 [3:0]	cc_feld;
	reg		 [1:0]	ex_br_op;
	reg				acb_reg;
	reg				jsr_flag;
	reg		 [8:0]	waitop,wait_reg;
	reg				branch;
	reg		 [3:0]	dim_feld;
	reg		[66:0]	new_op;
	reg				short_op_reg;
	reg		[15:0]	idx_reg;
	reg		[35:0]	gen_src1;
	reg		[33:0]	gen_src2;
	reg				qw_flag;
	reg				long_reg;
	reg				new_spsel;
	reg				s_user,old_su;
	reg		 [1:0]	stack_sel;	// Stack select for USER and SUPERVISOR
	reg		 [1:0]	s_mod;		// Modifier for Stack select
	reg				upd_info,dw_info;
	reg		 [2:0]	rpointer;
	reg		 [5:0]	resto;		// for RESTORE
	reg				init_rlist;
	reg				new_fp;
	reg				format1;
	reg				ldpc_phase;
	reg				reti_flag;
	reg				no_t2p;
	reg				iabort,ia_save;
	reg				mmu_sel;
	reg		 [1:0]	nmi_reg;
	reg				nmi_flag,int_flag;
	reg				type_nmi;
	reg		 [3:0]	exc_vector;
	reg				phase_exc;
	reg		 [3:0]	ovf_pipe;
	reg				dbg_s,dbg_trap,dbg_en,addr_cmp;
	reg				ssrc_flag,sdest_flag;
	reg				op_setcfg,setcfg_lsb;
	reg				inss_op;
	reg				exin_cmd,extract;	// EXT/INS
	reg				bit_reg;	// Flag for Bit opcodes : Source2 = Reg
	reg				kurz_st;	// Flag for MOVM/CMPM
	reg				kill_opt;	// Flag for optimized MOVS
	reg				cmps_flag;	// Flag for CMPS
	reg				skps_flag;	// Flag for SKPS
	reg				mt_flag;	// Flag for Match and Translate
	reg				spu_block;	// block of SP update at Long operation
	reg				dia_op,dia_flag;	// Flag for DIA
	reg				m_ussu,m_usel,dc_user;	// MOVUS/SU
	reg				rwval_flag,wrval_flag;	// RDVAL/WRVAL
	reg				cinv_flag;	// Flag for CINV
	reg		 [5:0]	lmrreg;
	reg				no_init,a_ivar;
	reg				index_cmd;
	reg				stop_d;
	reg				dc_ilo;
	
	wire			PHASE_0;
	wire	 [7:0]	phase_ein;	// Phase after ABORT has changed the content to 0
	wire			de_flag,ivec_flag;
	wire			next;
	wire	[18:0]	new_addr,pop_fp,save_pc;
	wire	[13:0]	new_regs;
	wire	 [7:0]	new_ph,ppfp;
	wire	 [7:0]	new_nx;
	wire			op_1byte,op_12byte,op_2byte,op_3byte;
	wire			jump;
	wire			short_op,short_def;
	wire			opt_imme;
	wire	 [7:0]	opti_byte;
	wire			acb_op,acb_flag;
	wire			zero,carry_psr,negativ,larger,flag;
	wire			valid_size;
	wire			op_ok;
	wire			stop;
	wire	[47:0]	opc_bits;
	wire	[47:0]	op_feld;
	wire	 [2:0]	atys,atyd;
	wire	 [3:0]	auop_s,auop_d;
	wire			long,src2_flag,dest_flag;
	wire	 [6:0]	src_1,src_2,src_1l,src_2l;
	wire	 [1:0]	src1_le,src2_le;
	wire			acc1,acc2;
	wire			spupd;
	wire	 [6:0]	saver;	// for SAVE
	wire	 [2:0]	reg_nr;
	wire			save_reg;
	wire			ld_disp,disp_ok;
	wire			store_pc;
	wire			do_xor;
	wire			do_long;
	wire	 [1:0]	idx_n,n_idx;
	wire			idx;
	wire	 [1:0]	otype;
	wire	[10:0]	opera,op_str,op_sho;
	wire	 [5:0]	dest_r,dest_rl;
	wire			phase_idx;
	wire	[15:0]	idx_bytes,idx_feld;
	wire	 [3:0]	idx_1,idx_2;
	wire	 [4:0]	src1_addr,src2_addr;
	wire	 [6:0]	usp_1,usp_2;
	wire	[33:0]	tos_oper;
	wire	[18:0]	adrd1,exr11,exr12,adrd2,adwr2,exr22,exw22,re_wr,st_src,st_src2,st_dest,st_len,st_trde,st_trs2;
	wire	 [7:0]	phrd1,phrd2,phwr2;
	wire	 [6:0]	rega1,irrw1,rega2,irrw2;
	wire	 [3:0]	nxrd1,nxrw2;
	wire			rmw;
	wire	 [6:0]	quei1,quet1;		// Registeradr
	wire	 [7:0]	endea,goacb,dowait;	// Phase
	wire	 [3:0]	diacb;				// DIMM access
	wire			qword;
	wire	 [6:0]	stack,no_modul,ttstak;
	wire	[12:0]	pop_1;
	wire			mpoi_1,mpoi_2;
	wire	 [1:0]	src1_tos;		// the code for REUSE is 2'b11
	wire			svc_flag,bpt_flag,flag_flag,trac_flag;
	wire	 [3:0]	misc_vectors;
	wire	 [2:0]	psr_code;
	wire			exception;
	wire			interrupt;
	wire			abort;		// DC_ABORT | iabort;
	wire			abo_int;
	wire			iabo_fall;
	wire			abbruch,fpu_trap,dvz_trap;
	wire			abbruch2;
	wire			dbg_flag;
	wire			ovf_op,ovf2_op,ovf_flag;
	wire			pc_match;
	wire			no_trap;
	wire	[10:0]	op_psr,op_scp;
	wire	[30:0]	ai_next;
	wire			set_src,set_dest,clr_sflag;
	wire	 [7:0]	rrepa;	// Repair Phase of Abort for String opcodes
	wire	 [7:0]	ph_str;	// working phase String
	wire			ph_match;
	wire			t2p;
	wire			rw_bit,op_ilo;
	wire			setcfg;
	wire			string_ende;
	wire			wlor;	// Flag to generate WR_REG signal
	wire	 [5:0]	wstr0,wstr1,wstr2;
	wire	 [6:0]	rstr0,rstr1,rstr2;
	wire			rett_exc;
	wire			chk_rmw;

	// Variables for 2- and 3-Byte Dekoder :
	reg		 [5:0]	hzr_c;	// CASE Statement
	wire	 [1:0]	hzl_a;
	wire	 [2:0]	hzl_b;
	wire	 [5:0]	hzr_a,hzr_b,hzr_s;
	wire			hdx_a;
	wire	 [3:0]	hdo_a,hdo_c,hdo_e;
	wire	 [7:0]	hdo_d;
	wire	 [1:0]	hdl_b,hdl_d,hdl_f,hdl_g,hdl_h;
	wire	 [2:0]	hdl_a,hdl_c,hdl_e;
	wire	 [5:0]	hdr_a,hdr_b,hdr_c,hdr_d,hdr_e,hdr_f,hdr_g,hdr_m;
	
	wire	[66:0]	state_0,state_group_50,state_group_60;	// for the Gruppe 2 opcodes
	
	// Address field : Size:2 RD WR LDEA FULLACC INDEX:4 SPUPD disp_val:4 POST CLRMSW SRC2SEL:2
	
	parameter addr_nop	= 19'b10_0000_0000_0_0000_0000;	// all parameter to 0
	parameter push_op	= 19'b10_0111_0000_1_1010_0000;	// i.e. for BSR, ENTER ...
	parameter push_ea	= 19'b10_0111_0000_1_1010_0011;	// SAVE middle
	parameter pop_op	= 19'b10_1011_0010_1_0000_1000;	// RET/RESTORE
	parameter adddisp	= 19'b10_0010_0000_0_0000_0011;	// for RET : reuse of EA
	parameter adddispn	= 19'b10_0010_0000_0_0000_0000;	// for RETT : add Disp to Stack
	parameter save_sp	= 19'b10_0000_0000_1_0000_0000;	// u.a. RET : update of Stack
	parameter next_po	= 19'b10_1011_0010_1_0000_1011;	// RESTORE middle
	parameter dispmin	= 19'b10_0010_0000_0_0100_0011;	// Reuse for ENTER
	parameter rmod_rxp	= 19'b10_1001_0000_1_0000_0100;	// MODUL+0 read : SB , SP Update , therefore no LDEA
	parameter rmod_rtt	= 19'b10_1001_0000_0_0000_0100;	// MODUL+0 read : SB , no LDEA
	parameter rmod_4	= 19'b10_1011_0000_0_0001_0100;	// MODUL+4 read : Link Table Base
	parameter rmod_8	= 19'b10_1011_0000_0_0010_0100;	// MODUL+8 read : Program Base
	parameter rdltab	= 19'b10_1010_0000_0_1000_0000;	// Link table read - EA Phase
	parameter ea_push	= 19'b10_0110_0000_0_1010_0011;	// CXP : 2. Push EA Phase
	parameter ea_min8	= 19'b10_1010_0000_0_1011_0011;	// CXP : reuse of MOD+8
	parameter pop_ru	= 19'b10_1010_0010_0_0000_1011;	// RXP : EA Phase MOD POP
	parameter rd_icu	= 19'b00_1001_0000_0_1100_0010;	// Read ICU : Byte of fix address
	parameter get_vec	= 19'b10_1001_0000_0_01xx_0000;	// Read Exception-Vector : Index Exception No.
	parameter get_veci	= 19'b10_1001_0110_0_0000_0000;	// Read Exception-Vector : Index external Interrupt
	parameter load_ea	= 19'b10_0010_0000_0_0000_0000;	// used for store of TEAR and MSR
	parameter save_msr	= 19'b10_0010_0001_0_0000_0000;	// used for store of TEAR and MSR
	parameter ivar_adr	= 19'b10_0000_0100_0_0000_0010;	// only pass SRC1
	parameter st_trans	= 19'b00_1001_0100_0_0000_0000;	// Translate at String : SRC1 + SRC2 , Byte
	parameter src_x		= 7'hxx;
	parameter dest_x	= 6'hxx;
	parameter imme		= {1'b1,6'hxx};
	parameter frame		= 7'h18;
	parameter ibase		= 7'h1E;
	parameter modul		= 7'h1F;
	parameter w_msr		= 6'h0A;
	parameter w_tear	= 6'h0B;
	parameter fsr_r		= 6'h17;	// not defined register for FSR for opcodes LFSR and SFSR
	parameter temp_l	= 6'h3C;
	parameter temp_h	= 6'h3D;	// second last space for 8B TEMP register
	parameter temp_1	= 6'h3E;	// Backup for register at String operations
	parameter temp_2	= 6'h3F;
	parameter rtmpl		= 7'h3C;
	parameter rtmph		= 7'h3D;
	parameter rtmp1		= 7'h3E;
	parameter rtmp2		= 7'h3F;
	parameter op_mov	= 11'h345;
	parameter op_adr	= 11'h349;
	parameter op_add	= 11'h340;	// for CXP
	parameter op_flip	= 11'h364;	// for CXP : LSHD -16,Ri
	parameter op_lmr	= 11'h36A;	// for LPR CFG, LMR and CINV
	parameter op_wrp	= 11'h387;	// for CXP : write PSR , used also for Exception processing
	parameter op_ldp	= 11'h388;	// for RETT and RETI : load of PSR from Stack
	parameter op_zex	= 11'h076;	// Zero Extension for ICU Vector - is also used at String Option "T"
	parameter op_cop	= 8'hDD;	// Coprozessor Opcode
	
	// ++++++++++++++++++++++++++  The switch logic for the state machine  +++++++++++++++++++++++++++++
	
	always @(ANZ_VAL)
		case (ANZ_VAL)
		  3'd0  : valid = 3'b000;
		  3'd1  : valid = 3'b001;
		  3'd2  : valid = 3'b011;
		default : valid = 3'b111;
		endcase

	assign next = ( PHASE_0 ? op_ok :		// Opcode decoded or Exception processed
						// Displacement or Immediate operand and external memory access can happen in parallel
						// i.e. addressing mode Memory Relative
				    (  ((~dim_feld[0] | ACC_DONE) & (~dim_feld[3] | di_stat[0]))	// ACC_DONE resets dim_feld
						// long operation
				     & ~(long_reg & ~DONE) ) )
						// hard break : abort or fpu_trap or dvz_trap or ovf_flag
				  | abbruch ;
				  
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) long_reg <= 1'b0;
		  else
			long_reg <= next ? do_long : long_reg;	// START[1]
	
	always @(posedge BCLK or negedge BRESET)	// the central phase register
		if (!BRESET) phase_reg <= 8'h0;
		  else
			if (next) phase_reg <= new_op[47:40];
			
	assign PHOUT = phase_reg;	// only to debug
			
	always @(*)	// next switch of micro program counter
		casex ({PHASE_0,op_ok,dim_feld[3],di_stat[0]})
		  4'b11_xx : USED = {1'b0,~op_1byte,(op_1byte | op_3byte)} + {2'd0,opt_imme};
		  4'b0x_11 : USED = di_stat[3:1];
		  default  : USED = 3'd0;
		endcase
	
	// Special phases
	
	assign PHASE_0 = (phase_reg == 8'h00);	// During Phase 0 the opcode is decoded
	
	assign NEXT_PCA = PHASE_0 & ~ovf_flag & ~dbg_flag;
	
	// Pulse to transfer from Trace Bit to Pending Trace Bit, only once in the beginning of phase 0
	// The priority is such that a TRACE exception is served before an UNDEFINED/ILLEGAL exception
	always @(posedge BCLK) no_t2p <= PHASE_0 & ~op_ok;
	assign t2p = PHASE_0 & ~no_t2p;	// signal to I_PFAD
	
	// ++++++++++++++++++++++++++  global control signals  ++++++++++++++++
	
	assign de_flag   = CFG[8];
	assign ivec_flag = CFG[0];
	assign dvz_trap  = TRAPS[1];
	assign fpu_trap  = TRAPS[0];
	
	always @(posedge BCLK) nmi_reg	<= {nmi_reg[0],NMI_N};	// one clock sync and than falling edge detection
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) nmi_flag <= 1'b0;
		  else nmi_flag <= (nmi_reg == 2'b10) | (nmi_flag & ~(phase_reg == 8'h82));
		  
	always @(posedge BCLK) int_flag <= PSR[11] & ~INT_N;	// one clock to synchronise
	
	assign stop		 = (int_flag | nmi_flag) &   PHASE_0 & ~stop_d;		// neccesary if FPU_TRAP and INT at the same time
	assign interrupt = (int_flag | nmi_flag) & (~PHASE_0 |  stop_d);
	
	always @(posedge BCLK or negedge BRESET) 
		if (!BRESET) stop_d <= 1'd0;
		  else stop_d <= stop;
	
	// ++++++++++++++++++++++++++  Exception processing  +++++++++++++++
	
	// IC_ABORT is valid if Opcode Decoder cannot continue
	assign iabo_fall = IC_ABORT & (PHASE_0 ? ~op_ok : (~di_stat[0] & dim_feld[3]));
	
	always @(posedge BCLK) iabort  <= iabo_fall & ~ia_save;	// DC_ABORT ist a pulse
	always @(posedge BCLK) ia_save <= iabo_fall;
	
	// mmu_sel is used in ADDR_UNIT
	always @(posedge BCLK) mmu_sel <= DC_ABORT | (mmu_sel & ~iabort);	// 1 = DCACHE , 0 = ICACHE
	assign MMU_UPDATE[0] = mmu_sel;
	
	assign abort = DC_ABORT | iabort;
	
	// that is the end of String loops where interrupts are checked : 8'hC7 & 8'hCF
	assign string_ende = (phase_reg[7:4] == 4'hC) & (phase_reg[2:0] == 3'b111);	// attention : 8'hCF does not exist

	always @(posedge BCLK) if (PHASE_0 || string_ende) type_nmi <= nmi_flag;	// during processing kept stable
	
	assign svc_flag  = (OPREG[7:0] == 8'hE2) & valid[0];	// Vector  5 : 0101 , Illegal Vector  4 : 0100
	assign bpt_flag  = (OPREG[7:0] == 8'hF2) & valid[0];	// Vector  8 : 1000 , Undefined Vec. 10 : 1010
	assign flag_flag = (phase_reg  == 8'h89) & flag;		// Vector  7 - has an own state
	assign trac_flag = t2p & PSR[10];						// Vector  9 : 1001 , PSR[10] = P Bit , Pending Trace
	assign ovf_flag  = (ovf_pipe[3] & flag) | (ovf_pipe[1] & TRAPS[2]);		// Vector 13 : 1101
	assign dbg_flag  = dbg_trap | (dbg_s & PHASE_0);		// Vector 14 : 1110
	
	// abort + dvz_trap during a opcode, fpu_trap + ovf_flag + dbg_flag later
	assign abbruch  = abort | fpu_trap | dvz_trap | ovf_flag | dbg_flag;	// this 5 stop everything
	assign abbruch2 = abort | fpu_trap | dvz_trap | ovf_flag;	// for exc_vector generation
	
	// forces the next step of state machine (op_ok), generates otype="11" for Trap Service
	assign exception = interrupt | svc_flag | bpt_flag | ILL | UNDEF | trac_flag | abbruch;	
	
	// a TRACE Exception is done before the opcode execution
	assign misc_vectors = trac_flag ? 4'h9 : {(bpt_flag | UNDEF),(svc_flag | ILL),UNDEF,svc_flag};	// the vectors are exclusiv
	
	always @(posedge BCLK)
		if (PHASE_0 || abbruch)	// ABORTs, fpu_trap, dvz_trap + ovf_flag can happen every time
		  begin
			exc_vector <= abbruch ? (abbruch2  ? {ovf_flag,(dvz_trap | ovf_flag),~ovf_flag,(fpu_trap | ovf_flag)} : 4'hE)
								  : (interrupt ? {3'b0,nmi_flag} : misc_vectors);	// misc_vectors is default
		  end
		  else
		    if (flag_flag) exc_vector <= 4'h7;	// FLAG-Trap
		      else
				if (interrupt && string_ende) exc_vector <= {3'b0,nmi_flag};
		  
	assign psr_code[2] = ~psr_code[1];						// Absicht : codiert das Sichern des PSR bei Exception-Entry 
	assign psr_code[1] = abort | ILL | UNDEF | trac_flag;	// enable for reseting the P-Bit during write of PSR to stack
	assign psr_code[0] = (interrupt & ~fpu_trap) | abort;	// enable for reseting the I-Bit of new PSR

	// valid codes are x'89 to x'8F
	assign op_psr = {8'b0_00_1000_1,psr_code};	// is used during first clock cylce after exception, is transfered as OPCODE to I_PFAD
	
	// Specialitiies : ABORT stores address & flags , the Interrrupts read vectors : all is used in big CASE
	assign abo_int = (exc_vector == 4'h2) | (exc_vector[3:1] == 3'b000);
	assign ai_next = (exc_vector == 4'h2) ? {load_ea,8'h84,4'h0} : {rd_icu,8'h82,4'h1};
	
	assign save_pc = {7'b10_0010_0,dia_flag,7'b00_0_0000,dia_flag,3'b001};	// Exception : PC_ARCHI => EA, special case DIA
	assign no_trap = ~fpu_trap & ~ovf_flag & ~dbg_flag;	// suppresion of WREN and LD_OUT[1] and ADDR_UNIT operation

	// ++++++++++++++++++++++++++  Overflow Trap  ++++++++++++++
	
	always @(posedge BCLK)
		if (ovf_flag || !PSR[4]) ovf_pipe <= 4'd0;
		  else
			if (PHASE_0) ovf_pipe <= {ovf_pipe[2],(ovf_op & op_ok),ovf_pipe[0],(ovf2_op & op_ok)};	// V-Bit switches on
		  
	assign ovf_op =  ( ((OPREG[6:2] == 5'b000_11)	// ADDQi
					  | (OPREG[3:2] == 2'b00)) & (OPREG[1:0] != 2'b10))		// ADDi,ADDCi,SUBi,SUBCi
					| ((OPREG[7:0] == 8'h4E) & OPREG[13] & (OPREG[11:10] == 2'b00))	// NEGi,ABSi
					| ((OPREG[7:0] == 8'hEE) & ~OPREG[10]);	// CHECKi

	assign ovf2_op =  ((OPREG[6:2] == 5'b100_11) & (OPREG[1:0] != 2'b10))	// ACBi, these overflows have no FLAG
					| ((OPREG[13:10] == 4'h1) & (OPREG[7:0] == 8'h4E))	// ASHi
					| ( OPREG[13] & (OPREG[11] == OPREG[10]) & (OPREG[7:0] == 8'hCE)); // MULi,DEIi,QUOi,DIVi
					
	// ++++++++++++++++++++++++++  Debug Trap  ++++++++++++++
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) dbg_s <= 1'b0;
		  else dbg_s <= dbg_trap | (dbg_s & ~((exc_vector == 4'hE) & (phase_reg == 8'h81)));
		  
	always @(posedge BCLK) dbg_en <= op_ok | ~PHASE_0;
	
	assign pc_match = dbg_en & TRAPS[3] & PHASE_0 & ~exception;	// TRAPS[3] is only combinatorical
	
	always @(posedge BCLK) dbg_trap <= (pc_match | (addr_cmp & PHASE_0)) & TRAPS[5];	// TRAPS[5] = Enable Trap
	
	always @(posedge BCLK) addr_cmp <= TRAPS[4] | (addr_cmp & ~PHASE_0);	// TRAPS[4] = CAR HIT
			  
	// ++++++++++++++++++++++++++  Special case String Abort  ++++++++++++++
	
	// Flags cleared if entry and exit of string operation and during  Abort sequence, not valid for MOVM/CMPM
	// special case UNTIL/WHILE : reset if exit (op_feld_reg[17] = 1 = UNTIL)
	assign clr_sflag = 	   (phase_reg == 8'hC0) | (phase_reg == 8'hC7) | (phase_reg == 8'hC8) | (phase_reg == 8'h81)
					   | (((phase_reg == 8'hD7) | (phase_reg == 8'hDF)) & ~(STRING[3] ^ op_feld_reg[17])) ;
	assign set_src	 =     (phase_reg == 8'hC1) | (phase_reg == 8'hC9);
	assign set_dest	 =     (phase_reg == 8'hC4) | (phase_reg == 8'hCC);
	
	always @(posedge BCLK or negedge BRESET)	// R1 is modified
		if (!BRESET) ssrc_flag <= 1'b0;
		  else ssrc_flag <= (set_src & ~kurz_st) | (ssrc_flag & ~clr_sflag);
		  
	always @(posedge BCLK or negedge BRESET)	// R2 is modified
		if (!BRESET) sdest_flag <= 1'b0;
		  else sdest_flag <= (set_dest & ~kurz_st) | (sdest_flag & ~clr_sflag);
		  
	assign rrepa = {7'b1000_011,~sdest_flag};	// R1 and if necessary R2 restore
	
	// ++++++++++++++++++++++++++  The one byte opcodes  +++++++++++++++++++
	
	// The one byte opcodes have a special case : one byte opcode but the second byte should be valid too
	// Used with SAVE, RESTORE, ENTER and EXIT with their reg list. 
	// The advantage is that the reg list is store in op_feld_reg.
	
	//	[52:34]	addressing
	//	[33:20] register
	//	[19:18]	1 or 2 Byte opcode
	//	[17:16]	BSR/BR
	// 	 [15:8]	next phase
	//	  [7:4]	START + LD_OUT
	//	  [3:0]	operand access : Displacement or Speicher
	
	always @(*)		// SVC (E2) and BPT (F2) decode as exception
		casex (OPREG[7:0])
			8'hxA : op1_feld = {addr_nop, src_x, src_x, 2'b01,2'b01,8'h01,4'h0,4'hE};	// Bcc , DISP read
			8'h02 : op1_feld = {addr_nop, src_x, src_x, 2'b01,2'b10,8'h01,4'h0,4'hE};	// BSR , DISP read
			8'h12 : op1_feld = {pop_op  , src_x, stack, 2'b01,2'b00,8'h2A,4'h0,4'h1};	// RET , DISP later
			8'h22 : op1_feld = {rmod_4	, src_x, modul, 2'b01,2'b00,8'h35,4'h0,4'h1};	// CXP
			8'h32 : op1_feld = {pop_op,   src_x, stack, 2'b01,2'b00,8'h40,4'h0,4'h1};	// RXP
			8'h42 : op1_feld = {pop_op,	  src_x, stack, 2'b01,2'b00,8'h46,4'h0,4'h1};	// RETT
			8'h52 : op1_feld = {rd_icu,	  src_x, src_x, 2'b01,2'b00,8'h45,4'h0,4'h1};	// RETI
			8'h62 : op1_feld = {addr_nop, src_x, src_x, 2'b10,2'b00,8'h30,4'h0,4'h0};	// SAVE
			8'h72 : op1_feld = {addr_nop, src_x, src_x, 2'b10,2'b00,8'h32,4'h0,4'h0};	// RESTORE
			8'h82 : op1_feld = {push_op , frame, stack, 2'b10,2'b00,8'h2D,4'h2,4'h1};	// ENTER : PUSH FP
			8'h92 : op1_feld = {addr_nop, src_x, src_x, 2'b10,2'b00,8'h32,4'h0,4'h0};	// EXIT : POP FP
			8'hA2 : op1_feld = {addr_nop, src_x, src_x, 2'b01,2'b00,8'h00,4'h0,4'h0};	// NOP
			8'hB2 : op1_feld = {addr_nop, src_x, src_x, 2'b01,2'b00,8'h88,4'h0,4'h0};	// WAIT
			8'hC2 : op1_feld = {addr_nop, src_x, src_x, 2'b01,2'b00,8'h88,4'h0,4'h0};	// DIA
			8'hD2 : op1_feld = {addr_nop, src_x, src_x, 2'b01,2'b00,8'h89,4'h0,4'h0};	// FLAG
		  default : op1_feld = {19'hxxxxx,14'hxxxx,     2'b00,2'b00,16'hxxxx};
		endcase
		
	assign op_1byte  = op1_feld[18] & valid[0];
	assign op_12byte = op1_feld[19] & valid[1];
	
	assign new_addr = op1_feld[52:34];
	assign new_regs = op1_feld[33:20];
	assign new_ph   = op1_feld[15:8];
	assign new_nx   = op1_feld[7:0];	// at Bcond DISP read
	
	assign pop_fp	= new_fp ? pop_op : addr_nop;
	assign ppfp		= new_fp ? 8'h34 : 8'h00;
	
	always @(posedge BCLK)
		if (PHASE_0)
		  begin
			ex_br_op	<= op1_feld[17:16];	// BSR/BR
			cc_feld		<= OPREG[7:4];
			new_fp		<= (OPREG[7:6] == 2'b10);	// not decoded complete but is sufficient
			reti_flag	<= OPREG[4];		// only difference between RETI and RETT is important
			dia_op		<= OPREG[6];		// only difference between DIA and WAIT is important
		  end
		  
	always @(posedge BCLK) dia_flag <= dia_op & (phase_reg == 8'h88);	// special case DIA compared to WAIT : Addr DIA to Stack
	
	always @(posedge BCLK)	// Format 1 opcodes write always DWord to reg, the same is true for Exceptions
		if (PHASE_0 || abbruch) format1 <= (valid[0] & (OPREG[3:0] == 4'h2)) | exception;
		  else
			if (flag_flag || (interrupt && string_ende)) format1 <= 1'b1;
	
	//					Branch etc.				CXP						CXPD
	assign store_pc = (phase_reg == 8'd1) | (phase_reg == 8'h37) | (phase_reg == 8'h6B);	// only save in DIN Reg of DATENPFAD
	assign jump = (ex_br_op[0] & branch) | (acb_reg & ~ACB_ZERO) | ex_br_op[1];
	
	always @(posedge BCLK) ldpc_phase <=  (phase_reg == 8'h3E)	// PC load at CXP/Traps , all one clock cycle guaranted
										| (phase_reg == 8'h43)	// PC load at RXP
										| ((phase_reg == 8'h49)	& reti_flag)	// PC load at RETI
										| (phase_reg == 8'h4E)	// PC load at RETT
										| (phase_reg == 8'h66)	// PC load at JUMP/JSR/CASE
										| (phase_reg == 8'h7B);	// PC load at DE = Direct Exception
	
	assign NEW = ((phase_reg == 8'd1) &  jump & di_stat[0]) | LOAD_PC;
	assign LOAD_PC = ((phase_reg == 8'h2B) & di_stat[0])	// only one pulse, but DISP must be ok => di_stat[0] (RET)
					| ldpc_phase;
	
	assign no_modul = de_flag ? {1'b0,dest_x} : {1'b1,modul[5:0]};
	
	assign negativ	 = PSR[7];
	assign zero      = PSR[6];
	assign flag		 = PSR[5];
	assign larger	 = PSR[2];
	assign carry_psr = PSR[0];
	
	assign rett_exc = ~reti_flag & (phase_reg == 8'h4B);	// special case RETT : Stack can change during opcode
	always @(posedge BCLK) phase_exc <= (phase_reg == 8'h80);	// 1. Exception phase
	always @(negedge BCLK) if (PHASE_0 || phase_exc || rett_exc) s_user <= PSR[9];	// Select Bit for Stack, delayed update
	always @(negedge BCLK)
		if (PHASE_0 || phase_exc) s_mod <= {PSR[9],~PSR[9]};
		  else
			if (rett_exc) s_mod <= s_mod | {PSR[9],~PSR[9]};	// Both can be updated
	
	always @(cc_feld or zero or carry_psr or larger or negativ or flag)
		case (cc_feld)
		  4'h0 : branch =  zero;		// EQual
		  4'h1 : branch = ~zero;		// Not Equal
		  4'h2 : branch =  carry_psr;	// Carry Set
		  4'h3 : branch = ~carry_psr;	// Carry Clear
		  4'h4 : branch =  larger;		// Higher
		  4'h5 : branch = ~larger;		// Lower or Same
		  4'h6 : branch =  negativ;		// Greater Than
		  4'h7 : branch = ~negativ;		// Less or Equal
		  4'h8 : branch =  flag;		// Flag Set
		  4'h9 : branch = ~flag;		// Flag Clear
		  4'hA : branch = ~larger  & ~zero;	// LOwer
		  4'hB : branch =  larger  |  zero;	// Higher or Same
		  4'hC : branch = ~negativ & ~zero;	// Less Than
		  4'hD : branch =  negativ |  zero;	// Greater or Equal
		  4'hE : branch = 1'b1;			// True
		  4'hF : branch = 1'b0;			// False
		endcase
		
	// +++++++++++++++++++++++  Register List Processing  ++++++++++++++++++++++++++++
	
	always @(posedge BCLK) init_rlist <= PHASE_0 | (phase_reg == 8'h2E);
	
	always @(posedge BCLK)
		if (PHASE_0) rpointer <= 3'b000;
		  else
			if (ACC_DONE || init_rlist) rpointer <= reg_nr;
			
	REG_LIST scanner ( .DIN(op_feld_reg[22:15]), .INIT(init_rlist), .IPOS(rpointer), .VALID(save_reg), .OPOS(reg_nr) );
	
	assign saver = {4'h0,reg_nr};
	
	always @(posedge BCLK) if (ACC_DONE || init_rlist) resto <= {3'h0,~reg_nr};	// EXIT and RESTORE have the list mirrored : R0...R7
		
	// ++++++++++++++++++++++++++  Processing of Displacement and Immediate Operand  +++++++++++++++++++
	
	always @(posedge BCLK or negedge BRESET)	// Flag for DISP and IMME access
		if (!BRESET) dim_feld[3] <= 1'b0;
		  else dim_feld[3] <= next ? new_op[3] : ~di_stat[0] & dim_feld[3];
				
	always @(posedge BCLK) if (next) dim_feld[2:1] <= new_op[2:1];
	
	always @(posedge BCLK or negedge BRESET) 	// Flag for external access
		if (!BRESET) dim_feld[0] <= 1'b0;
		  else dim_feld[0] <= next ? new_op[0] : ~ACC_DONE & dim_feld[0];
		  
	// special case QWORD, last term for security
	always @(posedge BCLK) qw_flag <= dim_feld[0] & ACC_DONE & (ACC_FELD[13:12] == 2'b11) & ~qw_flag;
				
	assign LD_IMME = (dim_feld[3] & (dim_feld[2:1] != 2'b11)) | short_op | store_pc;	// Data multiplexer
	assign LD_DIN  =  (di_stat[0] & dim_feld[3] & (dim_feld[2:1] != 2'b11))				// Enable for DIN Register
					| (ACC_DONE   & dim_feld[0]) | qw_flag | short_op | store_pc;		// next not possible : i.e. immediate and disp parallel
	assign ld_disp = (dim_feld[3:1] == 3'b111);											// Enable for DISP Register

	// Signal to ADDR_UNIT , only Displacement critical
	assign disp_ok = ld_disp ? di_stat[0] : 1'b1;
	
	always @(dim_feld or OPREG or valid or ANZ_VAL)	// Bit 0 is "Data ok", the upper 3 bits are for USED
		casex ({dim_feld[2:1],OPREG[7:6]})
		  4'b00_xx : di_stat = {3'b001,valid[0]};
		  4'b01_xx : di_stat = {3'b010,valid[1]};
		  4'b10_xx : di_stat = {3'b100,ANZ_VAL[2]};
		  4'b11_0x : di_stat = {3'b001,valid[0]};
		  4'b11_10 : di_stat = {3'b010,valid[1]};
		  4'b11_11 : di_stat = {3'b100,ANZ_VAL[2]};
		endcase

	always @(OPREG)
		casex (OPREG[7:6])
		  2'b0x : disp_val = {{26{OPREG[6]}},OPREG[5:0]};
		  2'b10 : disp_val = {{19{OPREG[5]}},OPREG[4:0],OPREG[15:8]};
		  2'b11 : disp_val = {{3{OPREG[5]}},OPREG[4:0],OPREG[15:8],OPREG[23:16],OPREG[31:24]};
		endcase
		
	assign DISP_BR = disp_val;	// DISP is also used for Bcc opcode
	
	// The generator for DISP : data is used in ADDR_UNIT
	always @(*)
		casex ({ld_disp,disp_sel})	//	disp_sel from new_op
		  5'b1_00xx : DISP = disp_val;
		  5'b1_01xx : DISP = 32'h0 - disp_val;	// special case for ENTER
		  5'b1_1xxx : DISP = {disp_val[29:0],2'b00};	// DISP*4 for External Address Mode
		  5'b0_11xx : DISP = {20'hFFFFF,3'h7,type_nmi,8'h00};	// Interrupt Service Address
		  5'b0_1000 : DISP = 32'hFFFF_FFFF;		// PUSH Byte
		  5'b0_1001 : DISP = 32'hFFFF_FFFE;		// PUSH Word
		  5'b0_1010 : DISP = 32'hFFFF_FFFC;		// PUSH DWord
		  5'b0_1011 : DISP = 32'hFFFF_FFF8;		// PUSH QWord
		  5'b0_01xx : DISP = {26'h0,exc_vector,2'b00};		// the exception vector as Offset for INTBASE
		  5'b0_00xx : DISP = {28'h0,disp_sel[1:0],2'b00};	// 0,+4,+8,+12 used with MOD, default is 0
		endcase
		
	always @(*)
		casex ({short_op,dim_feld[2:1]})
		  3'b000 : imme_i = op_setcfg ? {28'h0000_00F,OPREG[2:0],setcfg_lsb} : {24'hxx_xxxx,OPREG[7:0]};
		  3'b001 : imme_i =    {16'hxxxx,OPREG[7:0],OPREG[15:8]};
		  3'b01x : imme_i = {OPREG[7:0],OPREG[15:8],OPREG[23:16],OPREG[31:24]};
		  3'b1xx : imme_i = opt_imme ? {24'hxxxx_xx,opti_byte} : {{29{OPREG[10]}},OPREG[9:7]};	// for MOVQ etc. only OPREG can be used
		endcase
		
	assign IMME_Q = store_pc ? PC_SAVE : imme_i;
	
	// ++++++++++++++  Stack Control  +++++++++++++++++
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) new_spsel <= 1'b0;
		  else new_spsel <= spupd | (new_spsel & ~PHASE_0 & ~fpu_trap & ~dvz_trap);
			
	always @(posedge BCLK) upd_info <= PHASE_0 & new_spsel;	// one clock cycle earlier a change occurs, i.e. ADDF TOS,F0 => fpu_trap
	
	assign do_xor = fpu_trap ? upd_info : (PHASE_0 & new_spsel);
	
	always @(negedge BCLK or negedge BRESET)
		if (!BRESET) stack_sel <= 2'b00;
		  else
			if (do_xor) stack_sel <= stack_sel ^ s_mod;
			
	// Special case RETT
	always @(posedge BCLK) if (!phase_reg[1]) old_su <= s_user;	// is tested in state x'49 and used in x'4B
	assign ttstak = {1'b0,((old_su == PSR[9]) ^ stack_sel[PSR[9]]),3'b110,PSR[9],1'b1};
	
	// ++++++++++++++  2 byte opcodes  +++++++++++++++++
	
	// Hint : short_op is decoded separatly
	
	// [47:45]	Source : [2] TOS=>(SP), [1] Ri => (Ri), [0] 1=access of memory
	// [44:42]	Destination : like [47:45]
	// 	  [41]	long opcode	[41:39] only for standard sequenz - not Gruppe 2
	//    [40]	src2_flag - Source 2 is read
	// 	  [39]	dest_flag - a target operand exists
	// [38:33]	src1_r Register field, no message about Immediate
	// [32:27]	src2_r Register field
	// [26:25]	src1_le Length of Source1 - this is used for qword
	// [24:23]	src2_le Length of Source2 : 00=1/01=2/10=4/11=8 Bytes => WMASKE 
	// [22:18]	src1 field
	// [17:13]	src2 field
	// [12:11]	op_type 2 Bit for sort of opcode
	//    [10]	FL : F=1/L=0
	//   [9:8]	original BWD : B=00/W=01/D=11
	//   [7:0]	opcode: operation code
	
	assign valid_size = (OPREG[1:0] != 2'b10) & valid[1];	// valid size + valid OPREG-Bytes
	
	assign hzl_a = (OPREG[1:0] == 2'b11) ? 2'b10 : OPREG[1:0];	// length field recoded
	assign hzl_b = {1'b0,OPREG[1:0]};		// standard Length field
	assign hzr_a = {3'b000,OPREG[13:11]};	// SRC2 or SRC1 regfield
	assign hzr_b = {3'b000,OPREG[8:6]};		// SRC2 regfield
	assign hzr_s = {((OPREG[15:11] == 5'h17) ^ stack_sel[s_user]),3'b110,s_user,1'b1};	// USER or SUPERVISOR Stack, TOS special case
	// Special case LPR & SPR regfield:
	always @(OPREG or stack_sel or s_user)
		casex ({OPREG[10:7]})
		  4'b1001 : hzr_c = {stack_sel[s_user],3'b110,s_user,1'b1};	// USER or SUPERVISOR Stack
		  4'b1011 : hzr_c = {stack_sel[1]	  ,3'b110,1'b1,  1'b1};	// USER Stack
		  4'b1100 : hzr_c = OPREG[6] ? temp_h : 6'h1C;	// CFG special case : LPR : SPR
		  default : hzr_c = {2'b01,OPREG[10:7]};
		endcase
	
	// Unfortunately SETCFG must be implemented : it is transformed to a two byte opcode with one byte IMM operand
	assign setcfg = (OPREG[13:0] == 14'h0B0E) & valid[1];

	always @(*)
	  casex ({setcfg,OPREG[10:2]})
		// Short-Op Codes , ACB is an ADD with following jump
		10'b0xxxx_x0011 : op2_feld = {6'o11,3'o3,6'hxx,hzr_a,hzl_a,hzl_a,5'h14,OPREG[15:11],2'b00,hzl_b,8'h40};	// ADDQ ACB
		10'b0xxxx_00111 : op2_feld = {6'o11,3'o2,6'hxx,hzr_a,hzl_a,hzl_a,5'h14,OPREG[15:11],2'b00,hzl_b,8'h41};	// CMPQ
		10'b0xxxx_01011 : op2_feld = {6'o11,3'o1,hzr_c,hzr_a,hzl_a,hzl_a,5'h00,OPREG[15:11],2'b00,hzl_b,8'h45};	// SPR
		// Scond is moving the SHORT operand in the Integer area as condition field
		10'b0xxxx_01111 : op2_feld = {6'o11,3'o1,6'hxx,hzr_a,hzl_a,hzl_a,5'h14,OPREG[15:11],2'b00,hzl_b,8'h7A};	// Format 7, A=(UNDEF)
		10'b0xxxx_10111 : op2_feld = {6'o11,3'o1,6'hxx,hzr_a,hzl_a,hzl_a,5'h14,OPREG[15:11],2'b00,hzl_b,8'h45};	// MOVQ
		10'b0xxxx_11011 : op2_feld = {6'o11,3'o1,hzr_a,hzr_c,hzl_a,2'b10,OPREG[15:11],5'h00,2'b00,hzl_b,8'h76};	// LPR => MOVZiD
		// Format 3 opcodes :
		10'b00x10_11111 : op2_feld = {6'o11,3'o1,hzr_a,6'h1D,hzl_a,hzl_a,OPREG[15:11],5'h00,2'b00,hzl_b,4'h3,OPREG[10:7]}; // BIC/SPSR
		10'b0x100_11111 : op2_feld = {6'o61,3'o1,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:11],5'h00,2'b10,hzl_b,4'h3,OPREG[10:7]}; // JUMP/JSR
		10'b01110_11111 : op2_feld = {6'o11,3'o1,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:11],5'h00,2'b10,hzl_b,4'h3,OPREG[10:7]}; // CASE
		// Format 4 opcodes : main group
		10'b0xxxx_xxxx0 : op2_feld = {6'o11,3'o3,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:6],		2'b00,hzl_b,4'h4,OPREG[5:2]};
		10'b0xxxx_x0001 : op2_feld = {6'o11,3'o2,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:6],		2'b00,hzl_b,4'h4,OPREG[5:2]}; //CMP no WR
		10'b0xxxx_x0101 : op2_feld = {6'o11,3'o1,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:6],		2'b00,hzl_b,4'h4,OPREG[5:2]}; //MOV no 2.Op
		10'b0xxxx_x1101 : op2_feld = (OPREG[10:9] == 2'b00) ?	// target is Register => standard flow
									 {6'o11,3'o2,hzr_a,hzr_b,hzl_a,2'bxx,OPREG[15:6],		2'b00,hzl_b,4'h4,OPREG[5:2]}	// TBIT
								   : {6'o14,3'o2,hzr_a,hzr_b,hzl_a,2'b00,OPREG[15:6],		2'b10,hzl_b,4'h4,OPREG[5:2]};
		// ADJSPi
		10'b01010_11111 : op2_feld = {6'o11,3'o3,hzr_a,hzr_s,hzl_a,2'b10,OPREG[15:11],5'h00,2'b00,hzl_b,8'h48};	// is a SUBD
		// ADDR, length field not valid
		10'b0xxxx_x1001 : op2_feld = {6'o61,3'o1,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:6],		2'b00,hzl_b,8'h49};
		10'b00000_11111 : op2_feld = {6'o71,3'o1,hzr_a,hzr_b,hzl_a,hzl_a,OPREG[15:11],5'h00,2'b10,hzl_b,4'h3,OPREG[10:7]}; // CXPD no Opcode
		// SETCFG => MOV Befehl , SRC1 is genrated for 32 bit , target is Register temp_h
		10'b1xxxx_xxxxx	: op2_feld = {40'b001001_001_000000_111101_00_10_10100_00000_00_011,			8'h76};
		default	 		: op2_feld = {40'hxx_xxxx_xxxx,4'hA,4'hx};
	  endcase
		
	assign op_2byte = (valid_size | setcfg) & ~op2_feld[7];	// it must be for sure shown "Invalid Opcode"

	// Special case : the quick opcodes with the exception SPR and LPR
	assign short_op = ((((~OPREG[5]) | (OPREG[6:4] == 3'b011)) & (OPREG[3:2] == 2'b11) & valid_size) | opt_imme) & PHASE_0;
	always @(posedge BCLK) if (PHASE_0) short_op_reg <= short_op;
	assign short_def =  PHASE_0 ? short_op : short_op_reg;							// for the big state machine
	assign op_sho = (OPREG[6:4] == 3'b011) ? 11'h07A : op_mov;	// Special case Scond at Index as Dest. , used only in Phase 0
	
	// 2. special case ACB
	assign acb_op = (OPREG[6:2] == 5'h13) & valid_size;
	always @(posedge BCLK) if (PHASE_0) acb_reg <= acb_op;
	assign acb_flag = PHASE_0 ? acb_op : acb_reg;
	assign goacb = acb_flag ? 8'h28 : 8'h00;	// x'28 = 40 , wait jump at REG operation - short-op special case

	// 3. special case load of PSR and Init-Done opcodes : because of U bit in PSR a restart must follow,
	// CINV and LMR PTB must wait until Init-Done and than Restart.
	// All variants of LPR and BIC/S have an extra cycle due to TRACE operation
	always @(OPREG)
		casex (OPREG[18:0])
		  19'bxxx_xxxxx_1101_110_11_xx : waitop = 9'h14C;	// LPRi PSR,...
		  19'bxxx_xxxxx_1100_110_11_xx : waitop = 9'h174;	// LPRi CFG,...
		  19'bxxx_xxxxx_0x10_111_11_xx : waitop = 9'h14C;	// BICPSRi/BISPSRi ...
		  19'bxxxx_x_0010_xx_0000_1110 : waitop = 9'h174;	// SETCFG []
		  19'bxxxx_0_0010_xx_0001_1110 : waitop = 9'h174;	// LMR  - at the end Restart
		  19'bxxxx_0_1001_xx_0001_1110 : waitop = 9'h174;	// CINV - at the end Restart
		  default					   : waitop = 9'h000;
		endcase
		
	assign dowait = waitop[7:0];	// is used in Phase 0 if PSR is loaded from Register
	always @(posedge BCLK) if (PHASE_0) wait_reg <= waitop;

	// Here 2. and 3. special case are coming together:
	// Phase definition, end over jump for ACB , not used in Phase 0
	assign endea = acb_reg ? 8'h01 : (wait_reg[8] ? wait_reg[7:0] : 8'h00);	
	assign diacb = acb_reg ? 4'hE : 4'h0;	// load Disp ?
	
	// special case ADJSPi : SP=SRC2 always 32 Bit
	always @(posedge BCLK)
		if (PHASE_0) dw_info <= (OPREG[10:2] == 9'b1010_11111);
		  else dw_info <= dw_info & ~phase_reg[7];	// for security at ABORT
	
	// SETCFG : Flag to transform the Byte Immeadiate operand
	always @(posedge BCLK) if (PHASE_0) op_setcfg  <= setcfg;
	always @(posedge BCLK) if (PHASE_0) setcfg_lsb <= OPREG[15];
	
	always @(posedge BCLK) if (PHASE_0) jsr_flag <= (OPREG[10:2] == 9'b1100_11111);		// JSR : for PUSH
	always @(posedge BCLK)	// Bit opcodes to Register and EXT:SRC1 / INS:SRC2
		if (PHASE_0) bit_reg  <= ((OPREG[3] ? ((OPREG[7:6] == 2'd0) ? OPREG[23:22] : OPREG[18:17]) : OPREG[10:9]) == 2'b00);
	always @(posedge BCLK) if (PHASE_0) exin_cmd <= (~OPREG[10] & (OPREG[6:0] == 7'h2E)) & valid[2];
	always @(posedge BCLK) if (PHASE_0) extract <= ~OPREG[7];
	always @(posedge BCLK) if (PHASE_0) inss_op <= (OPREG[13:10] == 4'h2) & (OPREG[7:0] == 8'hCE) & valid[2];	// INSS
		
	// ++++++++++++++  3 byte opcodes  +++++++++++++++++

	// [47:45]	Source : [2] TOS=>(SP), [1] Ri => (Ri), [0] 1=access of memory
	// [44:42]	Destination : like [47:45]
	// 	  [41]	long opcode	[41:39] only for standard sequenz - not Gruppe 2
	//    [40]	src2_flag - Source 2 is read
	// 	  [39]	dest_flag - a target operand exists
	// [38:33]	src1_r Register field, no message about Immediate
	// [32:27]	src2_r Register field
	// [26:25]	src1_le Length of Source1 - this is used for qword
	// [24:23]	src2_le Length of Source2 : 00=1/01=2/10=4/11=8 Bytes => WMASKE 
	// [22:18]	src1 field
	// [17:13]	src2 field
	// [12:11]	op_type 2 Bit for sort of opcode
	//    [10]	FL : F=1/L=0
	//   [9:8]	original BWD : B=00/W=01/D=11
	//   [7:0]	opcode: operation code
	
	assign hdx_a = OPREG[7] ? OPREG[8] : OPREG[10];
	assign hdo_a = OPREG[13:10];
	assign hdo_c = {1'b0,OPREG[10],OPREG[7:6]};	// Format 8 opcodes
	assign hdo_d = {6'b0101_00,OPREG[10],1'b0};	// CMPM/S or MOVM/S : 8'h52 or 8'h50
	assign hdo_e = {3'b011,OPREG[10]};	// Special codes for LOGB and SCALB due to DP_OUT datapath
	// Definitions of length
	assign hdl_a = {1'b0,OPREG[9:8]};	// i size, is used in OPER
	assign hdl_b = (OPREG[9:8] == 2'b11) ? 2'b10 : OPREG[9:8];	// recode length field, is used in ACC field
	assign hdl_c = OPREG[10:8];			// FL + BWD
	assign hdl_d = {1'b1,~hdx_a};		// length FP
	assign hdl_e = {OPREG[8],2'bxx};	// BWD don't care
	assign hdl_f = (OPREG[18:17] == 2'b00) ? OPREG[9:8] : {OPREG[8],~(OPREG[9] ^ OPREG[8])};	// exclusiv for DEI
	assign hdl_g = {(OPREG[9:8] != 2'b00),(OPREG[9:8] == 2'b00)};	// exclusiv for EXT/EXTS base operand
	assign hdl_h = {(OPREG[9:8] != 2'b00),(OPREG[9:8] != 2'b01)};	// exclusiv for CHECK bound operand
	// Register definitions
	assign hdr_a = {3'b000,OPREG[21:19]};	// SRC1 Integer Register
	assign hdr_b = {3'b000,OPREG[16:14]};	// SRC2 Integer Register
	assign hdr_c = hdx_a ? {2'b10,OPREG[21:20],1'b0,OPREG[19]} : {2'b10,OPREG[21:19],1'b1};
	assign hdr_d = hdx_a ? {2'b10,OPREG[16:15],1'b0,OPREG[14]} : {2'b10,OPREG[16:14],1'b1};
	assign hdr_e = OPREG[11] ? {2'b10,OPREG[21:20],1'b0,OPREG[19]} : {2'b10,OPREG[21:19],1'b1};
	assign hdr_f = OPREG[11] ? {2'b10,OPREG[16:14],1'b1}		   : {2'b10,OPREG[16:15],1'b0,OPREG[14]};
	assign hdr_g = {3'b000,OPREG[16:15],~OPREG[14]};	// exclusiv for DEI and MEI
	assign hdr_m = {3'b001,OPREG[17:15]};	// MMU Register Index 8-15
	
	always @(*)
		casex (OPREG[13:3])
		  11'b1000_xx_1100x : op3_feld = {6'o11,3'o3,hdr_a,hdr_b, hdl_b,hdl_b,OPREG[23:14],2'b00,hdl_a,4'h7,hdo_a};	// MULi
		  11'b000x_xx_0100x : op3_feld = {6'o11,3'o3,hdr_a,hdr_b, 2'b00,hdl_b,OPREG[23:14],2'b00,hdl_a,4'h6,hdo_a};	// ROTi,ASHi
		  11'b0101_xx_0100x : op3_feld = {6'o11,3'o3,hdr_a,hdr_b, 2'b00,hdl_b,OPREG[23:14],2'b00,hdl_a,4'h6,hdo_a};	// LSHi
		  11'b1x0x_xx_0100x : op3_feld = {6'o11,3'o1,hdr_a,hdr_b, hdl_b,hdl_b,OPREG[23:14],2'b00,hdl_a,4'h6,hdo_a};	// NEGi,NOTi,ABSi,COMi
		  11'b010x_xx_1100x : op3_feld = {6'o11,3'o1,hdr_a,hdr_b, hdl_b,2'b01,OPREG[23:14],2'b00,hdl_a,4'h7,hdo_a};	// MOVX/ZiW
		  11'b011x_xx_1100x : op3_feld = {6'o11,3'o1,hdr_a,hdr_b, hdl_b,2'b10,OPREG[23:14],2'b00,hdl_a,4'h7,hdo_a};	// MOVX/ZiD
		  11'b0001_xx_0110x : op3_feld = {6'o11,3'o3,hdr_a,hdr_b, hdl_b,2'b00,OPREG[23:14],2'b00,hdl_a,4'h8,hdo_c};	// FFSi
	// Floating Point opcodes
		  11'b000x_xx_0011x : op3_feld = {6'o11,3'o5,hdr_a,hdr_d, hdl_b,hdl_d,OPREG[23:14],2'b00,hdl_c,4'h9,hdo_a};	// MOVif
		  11'b010x_xx_0011x : op3_feld = {6'o11,3'o5,hdr_e,hdr_f, 2'b11,2'b10,OPREG[23:14],2'b00,hdl_c,4'h9,hdo_a};	// MOVLF
		  11'b011x_xx_0011x : op3_feld = {6'o11,3'o5,hdr_e,hdr_f, 2'b10,2'b11,OPREG[23:14],2'b00,hdl_c,4'h9,hdo_a};	// MOVFL
		  11'b10xx_xx_0011x : op3_feld = {6'o11,3'o5,hdr_c,hdr_b, hdl_d,hdl_b,OPREG[23:14],2'b00,hdl_c,4'h9,hdo_a};	// ROUNDi,TRUNCi
		  11'b111x_xx_00111 : op3_feld = {6'o11,3'o5,hdr_c,hdr_b, hdl_d,hdl_b,OPREG[23:14],2'b00,hdl_c,4'h9,hdo_a};	// FLOORi
		  11'b111x_xx_00110 : op3_feld = {6'o11,3'o5,hdr_c,hdr_b, hdl_d,hdl_b,OPREG[23:14],2'b00,hdl_c,op_cop};		// SEARCH
		  11'b0x00_0x_10111 : op3_feld = {6'o11,3'o7,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_a};	// ADDf,SUBf
		  11'bxx00_0x_10110 : op3_feld = {6'o11,3'o7,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,op_cop};		// Coprocessor
		  11'b1000_0x_10111 : op3_feld = {6'o11,3'o7,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_a};	// DIVf
		  11'b1100_0x_10111 : op3_feld = {6'o11,3'o7,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_a};	// MULf
		  11'b0010_0x_1011x : op3_feld = {6'o11,3'o6,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_a};	// CMPf
		  11'b0001_0x_10111 : op3_feld = {6'o11,3'o1,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_a};	// MOVf
		  11'bx101_0x_10111 : op3_feld = {6'o11,3'o1,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_a};	// NEGf,ABSf
		  11'b001x_11_00111 : op3_feld = {6'o11,3'o1,hdr_a,fsr_r, 2'b10,2'b10,OPREG[23:19],5'b0,2'b00,3'o3,8'h92};	// LFSR
		  11'b110x_11_00111 : op3_feld = {6'o11,3'o1,fsr_r,hdr_b, 2'b10,2'b10,5'b0,OPREG[18:14],2'b00,3'o3,8'h9C};	// SFSR
	// MMU opcodes
		  11'b0010_11_0001x : op3_feld = {6'o11,3'o1,hdr_a,temp_h,2'b10,2'b10,OPREG[23:19],5'b0,2'b00, 3'o3,8'h45};	// LMR
		  11'b0011_11_0001x : op3_feld = {6'o11,3'o1,hdr_m,hdr_a, 2'b10,2'b10,5'b0,OPREG[23:19],2'b00, 3'o3,8'h45};	// SMR
	// String opcodes
		  11'b000x_xx_0000x : op3_feld = {6'o11,3'o0,6'hxx,6'hxx, 2'bxx,2'b10,OPREG[23:14],     2'b10,hdl_c,hdo_d};	// MOVS,CMPS
		  11'b0011_xx_0000x : op3_feld = {6'o11,3'o0,6'hxx,6'hxx, 2'bxx,2'b10,OPREG[23:14],     2'b10,hdl_c,hdo_d};	// SKPS
	// Custom opcodes
		  11'bxx01_0x_10110 : op3_feld = {6'o11,3'o5,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,op_cop};
	// Integer Divisionen : QUOi REMi DIVi MODi and DEIi + MEIi
		  11'b11xx_xx_1100x : op3_feld = {6'o11,3'o7,hdr_a,hdr_b, hdl_b,hdl_b,OPREG[23:14],2'b00,hdl_a,4'h7,hdo_a};
		  11'b10x1_xx_1100x : op3_feld = {6'o11,3'o7,hdr_a,hdr_g, hdl_b,hdl_f,OPREG[23:14],2'b10,hdl_a,4'h7,hdo_a};	// DEI/MEI
	// Gruppe 2 opcodes
		  11'b0x11_xx_1010x : op3_feld = {6'o77,3'o1,hdr_a,hdr_b, hdl_b,hdl_b,OPREG[23:14],2'b00,hdl_a,8'h45};		// MOVUS,MOVSU
		  11'b000x_xx_1100x : op3_feld = {6'o66,3'o0,hdr_a,hdr_b, 2'bxx,2'b10,OPREG[23:14],2'b10,hdl_c, hdo_d};		// MOVM/CMPM
		  11'b001x_0x_1111x : op3_feld = {6'o11,3'o2,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b10,hdl_e,4'hC,hdo_a};	// DOTf,POLYf
		  11'b0101_0x_1111x : op3_feld = {6'o11,3'o5,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_e};	// LOGB
		  11'b0100_0x_1111x : op3_feld = {6'o11,3'o7,hdr_c,hdr_d, hdl_d,hdl_d,OPREG[23:14],2'b00,hdl_e,4'hB,hdo_e};	// SCALB
		  11'b0011_xx_1100x : op3_feld = {6'o50,3'o0,hdr_a,hdr_b, hdl_g,hdl_b,OPREG[23:14],2'b10,hdl_c,4'h7,hdo_a};	// EXTS
		  11'bxxx0_xx_1110x : op3_feld = {6'o71,3'o2,hdr_a,hdr_b, hdl_h,hdl_b,OPREG[23:14],2'b10,hdl_c,4'h8,hdo_c};	// CHECK
		  11'b0x1x_xx_0100x : op3_feld = (OPREG[18:17] == 2'b00) ?	// target is register => standard flow
										 {6'o11,3'o3,hdr_a,hdr_b, hdl_b,2'b10,OPREG[23:14],2'b00,hdl_a,4'h6,hdo_a}	// SBIT/CBIT
									   : {6'o14,3'o3,hdr_a,hdr_b, hdl_b,2'b00,OPREG[23:14],2'b10,hdl_a,4'h6,hdo_a};
		  11'b1110_xx_0100x : op3_feld = (OPREG[18:17] == 2'b00) ?	// target is register => standard flow
										 {6'o11,3'o3,hdr_a,hdr_b, hdl_b,2'b10,OPREG[23:14],2'b00,hdl_a,4'h6,hdo_a}	// IBIT
									   : {6'o14,3'o3,hdr_a,hdr_b, hdl_b,2'b00,OPREG[23:14],2'b10,hdl_a,4'h6,hdo_a};
		  11'b1x11_xx_0100x : op3_feld = {6'o11,3'o7,hdr_a,hdr_b, hdl_b,hdl_b,OPREG[23:14],2'b00,hdl_a,4'h7,3'd0,OPREG[12]}; // ADDP,SUBP
		  11'bxxx0_xx_0010x : op3_feld = {6'o40,3'o0,hdr_a,hdr_b, hdl_g,hdl_b,OPREG[23:14],2'b10,hdl_c,4'h8,hdo_c}; // EXT
		  11'bxxx0_xx_1010x : op3_feld = {6'o14,3'o0,hdr_a,hdr_b, hdl_b,2'b10,OPREG[23:14],2'b10, 3'o3,4'h8,hdo_c}; // INS
		  11'b0010_xx_1100x : op3_feld = {6'o14,3'o0,hdr_a,hdr_b, hdl_b,2'b10,OPREG[23:14],2'b10, 3'o3,4'h8,hdo_a}; // INSS
		  11'bxxx0_xx_0110x : op3_feld = {6'o61,3'o0,hdr_a,hdr_b, hdl_b,2'b10,OPREG[23:14],2'b10, 3'o3,4'h8,hdo_c}; // CVTP no Opcode
		  11'bxxx1_xx_0010x : op3_feld = {6'o11,3'o2,hdr_a,hdr_b, hdl_b,hdl_b,OPREG[23:14],2'b10, 3'o3,8'h84};		// INDEX
	// Gruppe 2 opcodes can have dedicated operation codes. Therefore the operation code definition here is "don't care"
		  11'b000x_xx_0001x : op3_feld = {6'o70,3'o0,hdr_a,hdr_b, 2'b00,2'b10,OPREG[23:19],5'b0,2'b10,3'o0,8'h45};	// RDVAL+WRVAL 
		  11'b1001_11_0001x : op3_feld = {6'o11,3'o1,hdr_a,temp_h,2'b10,2'b10,OPREG[23:19],5'b0,2'b00,3'o3,8'h45};	// CINV
		
		  default	 	    : op3_feld = {40'hxx_xxxx_xxxx,4'hA,4'hx};
		endcase
	
	assign op_3byte = valid[2] & (OPREG[2:0] == 3'b110) & (op3_feld[7:4] != 4'hA);	// valid for all incl. CUSTOM
	
	// +++++++++++++  Evaluation for 2 and 3 byte opcodes  ++++++++++++++++++

	// for one byte opcodes special treatmant neccessary
	assign opc_bits = op_3byte ? op3_feld : op2_feld;
	
	assign op_ok = (op_1byte | op_12byte | op_2byte | op_3byte | exception) & ~stop;	// used for computation of USED

	always @(posedge BCLK) if (PHASE_0) op_feld_reg	<= opc_bits;
	assign op_feld = PHASE_0 ? opc_bits : op_feld_reg;	// constant for all following cycles

	// Evaluation of op_feld :

	assign atys		 = op_feld[47:45];	// [2] : TOS=>(SP), [1] : Ri => (Ri), [0] : 1=access of memory
	assign atyd		 = op_feld[44:42];	// [2] : TOS=>(SP), [1] : Ri => (Ri), [0] : 1=access of memory
	assign long		 = op_feld[41];
	assign src2_flag = op_feld[40];
	assign dest_flag = op_feld[39];
	
	assign src_1 	= {1'b0,op_feld[38:33]};
	assign src_2 	= {1'b0,op_feld[32:27]};
	assign src1_le 	= op_feld[26:25];
	assign src2_le 	= op_feld[24:23];
	assign acc1 	= (op_feld[22:21] != 2'b00) | atys[1];	// external access Source1 or "addr" : Reg => (Reg)
	assign acc2 	= (op_feld[17:16] != 2'b00) | atyd[1];	// external access Source2 or "addr" : Reg => (Reg)
	assign wlor		= dest_flag & ~acc2;
	assign idx_n 	= {1'b0,(op_feld[22:20] == 3'b111)} + {1'b0,(op_feld[17:15] == 3'b111)};	// Index : 0,1 or 2
	assign idx 		= (idx_n != 2'b00);	// Index is active
	assign n_idx	= idx_n - 2'b01;
	
	// The field otype is used only in Phase 0
	assign otype	= exception ? 2'b11 : ((op_1byte | op_12byte) ? 2'b01 : opc_bits[12:11]);	// string opcodes use code 2'b10
	
	assign opera	= op_feld[10:0];
	
	assign dest_r	= src_2[5:0];
	assign dest_rl	= {dest_r[5:1],1'b0};
	
	// ++++++++++++++++++++++++++++ Immediate Optimization +++++++++++++++++++++++++++++++++++
	
	//						3		Byte					Immediate
	assign opt_imme =  (valid[2] & (OPREG[1:0] == 2'd0) & (OPREG[15:11] == 5'b10100) &
	//							 ADD,ADDC,SUB,SUBC,BIC,OR,AND,XOR		CMP					MOV
						( ((OPREG[10:8] != 3'b111) & (~OPREG[2] | (OPREG[5:2] == 4'h1) | (OPREG[5:2] == 4'h5))) // not ADDR und TBIT
						 |((OPREG[6:2] == 5'b11111) & (OPREG[8:7] == 2'b10) & (OPREG[10:9] != 2'b11))))	// BICPSR,BISPSR,ADJSP and ~CASE
	//						4			not Scaled Index			Immediate
					 | (ANZ_VAL[2] & (OPREG[18:16] != 3'b111) & (OPREG[23:19] == 5'b10100) &
						( ((OPREG[7:0] == 8'h4E) & ~OPREG[13] & ~OPREG[11])		// ROT,ASH,LSH but not NEG,NOT,ABS,COM
						 |((OPREG[7:0] == 8'hCE) & (OPREG[13:12] == 2'b01) & (OPREG[9:8] == 2'd0))));	// MOVX/ZBi

	assign opti_byte = (OPREG[1:0] == 2'b10) ? OPREG[31:24] : OPREG[23:16];
						 
	// +++++++++++++++++++++++++  Coprocessor operations field  ++++++++++++++++++++++++++++++
	
	always @(posedge BCLK) if (PHASE_0) COP_OP <= OPREG[23:0];
	
	// +++++++++++++++++++++++++  Special signals for LMR and CINV  ++++++++++++++++++++++++++
	// op_lmr is constant = parameter
	
	assign STOP_IC	= (phase_reg == 8'h74) | (phase_reg == 8'h75);

	// CINV uses Register x'30 - x'37 :  CINV = 110... , LMR = 001... otherwise CFG
	always @(posedge BCLK) if (PHASE_0) lmrreg <= op_3byte ? {{2{OPREG[13]}},~OPREG[13],OPREG[17:15]} : 6'h1C;

	always @(posedge BCLK) no_init <= (lmrreg[5:4] == 2'b00) & (lmrreg[3:1] != 3'b110);	// LMR waits for INIT at PTB0/1
	// a_ivar = "Addresse IVAR0/1"
	always @(posedge BCLK) a_ivar  <= STOP_IC;	// Phase 74 & 75, is used at INFO_AU together with IC_READ
	
	// CINV detection for IC_CACHE
	always @(posedge BCLK)
		if (PHASE_0) cinv_flag <= OPREG[13] & (OPREG[7:0] == 8'h1E);
			else cinv_flag <= cinv_flag & ~phase_reg[7];	// reset at exception
			
	assign ENA_HK = ~(cinv_flag & STOP_IC);	// always "1", if CINV then "0" 
			
	// +++++++++++++++++++++++++  USER flag for MOVUS & MOVSU  ++++++++++++++++++++++++
	
	always @(posedge BCLK)
		if (PHASE_0) m_ussu <= (~OPREG[13] & (OPREG[11:10] == 2'b11) & (OPREG[7:0] == 8'hAE));
			else m_ussu <= m_ussu & ~phase_reg[7];	// reset at exception
			
	always @(posedge BCLK) if (PHASE_0) m_usel <= OPREG[12];
	
	// +++++++++++++++++++++++++  USER flag for RDVAL & WRVAL  ++++++++++++++++++++++++
	
	always @(posedge BCLK)
		if (PHASE_0) rwval_flag <= (OPREG[13:11] == 3'd0) & (OPREG[7:0] == 8'h1E);
			else rwval_flag <= rwval_flag & ~phase_reg[7];	// reset at exception
			
	always @(posedge BCLK) if (PHASE_0) wrval_flag <= OPREG[10];	// Difference RDVAL=0 and WRVAL=1
	
	// +++++++++++++++++++++++++  Flags for CBIT/I+SBIT/I+IBIT  +++++++++++++++++++++++
	
	assign rw_bit = (op_feld_reg[7:4] == 4'd6) & ((~op_feld_reg[3] & op_feld_reg[1]) | (op_feld_reg[3:0] == 4'hE));
	assign op_ilo = rw_bit & op_feld_reg[0];	// Interlocked : CBITI and SBITI
	
	// +++++++++++++++++++++++++++++  Operations for String processing  +++++++++++++++++
	// Address field : Size:2 RD WR LDEA FULLACC INDEX:4 SPUPD disp_val:4 POST CLRMSW SRC2SEL:2
	
	assign st_src 	= {STRING[1:0],5'b1010_0,(op_feld_reg[15] & ~kurz_st),STRING[1:0],9'b0_0000_1000};	// [15] = BACKWARD
	assign st_src2	= {STRING[1:0],5'b1010_0,(op_feld_reg[15] & ~kurz_st),STRING[1:0],9'b0_0000_1011};	// Reuse EA
	assign st_dest	= {STRING[1:0],5'b0110_0,(op_feld_reg[15] & ~kurz_st),STRING[1:0],9'b0_0000_1011};	// Reuse EA
	assign st_trde	= {2'b00,      5'b0110_0, op_feld_reg[15],            2'b00,      9'b0_0000_1000};	// after Translate to Dest
	assign st_trs2	= {STRING[1:0],5'b1010_0, op_feld_reg[15],            STRING[1:0],9'b0_0000_1000};	// after Match to SRC2
	assign st_len	= {STRING[1:0],17'b0000_0000_0_0000_0000};	// length important for qw_flag
	
	// Signals of DETOIP go to I_PFAD
	always @(posedge BCLK) if (PHASE_0) kill_opt <= ~OPREG[7] & (OPREG[17:15] != 3'b000);	// watch difference of MOVM and MOVS
	assign ph_match = (phase_reg[7:4] == 4'hD) & (phase_reg[2:0] == 3'd7);	// Phase D7 and DF
	
	assign op_str	= {op_feld_reg[10:8],6'b0101_00,op_feld_reg[1],1'b1}; // Opcode 8'h51 or 8'h53;
	assign op_scp	= {op_feld_reg[10:8],8'h41};	// normal CMPi
	assign ph_str	= {4'hC,op_feld_reg[1],3'b001};	// Phase 8'hC1 (MOVS/M) or 8'hC9 (CMPS/M)
	
	always @(posedge BCLK) kurz_st <= (phase_reg == 8'h65) | (kurz_st & ~PHASE_0);			// Flag for MOVM/CMPM
	always @(posedge BCLK) if (PHASE_0) cmps_flag <= ~OPREG[7] & (OPREG[11:10] == 2'b01);	// Flag for CMPS
	always @(posedge BCLK) if (PHASE_0) skps_flag <= ~OPREG[7] & (OPREG[11:10] == 2'b11);	// Flag for SKPS
	always @(posedge BCLK) if (PHASE_0) mt_flag <= ~OPREG[7] & (OPREG[17] | OPREG[15]);		// Flag for Match and Translate

	assign wstr0	= {{4{kurz_st}},2'b00};
	assign wstr1	= {{4{kurz_st}},2'b01};
	assign wstr2	= {{4{kurz_st}},2'b10};
	assign rstr0	= {1'b0,wstr0};
	assign rstr1	= {1'b0,wstr1};
	assign rstr2	= {1'b0,wstr2};
	
	// +++++++++++++++++++++++++++++++++++  Index processing  +++++++++++++++++++++++++++++++++++++++++
	
	assign phase_idx = (phase_reg == 8'h02) | (phase_reg == 8'h50);
	
	assign idx_bytes = idx_1[2] ? OPREG[15:0] : {OPREG[7:0],OPREG[7:0]};	// here last access of OPREG
	always @(posedge BCLK) if (phase_idx) idx_reg <= idx_bytes;
	assign idx_feld = (phase_idx) ? idx_bytes : idx_reg;
	
	// +++++++++++++++++++++++++++++++++++  The big state machine  ++++++++++++++++++++++++++++++++++++
	
	// Hints :
	// 1. At short-op SRC1 is out of memory to use TEMP
	// 2. At SRC2 rmw suppresed TOS and changed it to (SP)
	// 3. The Long-operation path takes the dest_r address to write if WR_REG activ
	// 4. It is ok, that an extra cycle for the read of the index registers is needed - then data could be written ins Out register
	
	// Source 1
	
	assign idx_1 = {1'b0,(op_feld[22:20] == 3'b111),op_feld[19:18]};
	assign src1_addr = idx_1[2] ? idx_feld[7:3] : op_feld[22:18];
	assign stack  = {1'b0,stack_sel[s_user],3'b110,s_user,1'b1};
	assign usp_1  = src1_addr[0] ? stack : {5'b0_0110,src1_addr[1:0]};
	assign src_1l = {src_1[6:1],1'b0};
	assign pop_1  = {2'b00,src1_le,9'h108};	// SP update, DISP=0 and POST
	assign mpoi_1 = (src1_addr[4:2] == 3'b100) | (src1_addr == 5'h16);	// Pointer in memory always DWord
	assign auop_s = atys[0] ? 4'b1011 : 4'b0010;	// Only make effective address ?
	assign src1_tos = (op_feld[22:18] == 5'h17) & ~atys[2] ? 2'b11 : 2'b00;	// Source 1 is true TOS
	
	// Nextfield : 11=DISP read
	// Address field : Size:2 RD WR LDEA FULLACC INDEX:4 SPUPD disp_val:4 POST CLRMSW SRC2SEL:2
	always @(*)
		casex (src1_addr)	//	 RWLF   IDX    ADDR_F NEUP  SRC_REG 		      NEXT
		  // Special case which is only valid at INDEX or "addr" : REG -> ADDR , DISP=0 : starts immediate at read
		  5'b00xxx : gen_src1 = {auop_s, idx_1,9'h000,8'h07,4'h0,src1_addr[2:0],3'b000,atys[0]};	
		  // Register relativ : 0(R0)
		  5'b01xxx : gen_src1 = {auop_s, idx_1,9'h000,8'h07,4'h0,src1_addr[2:0],3'b111,atys[0]};
		  // Memory relativ : 0(0(SB))
		  5'b100xx : gen_src1 = {4'b1011,4'h0, 9'h000,8'h06,usp_1,			  4'b1111};			// 1. access always full
		  // Immediate
		  5'b10100 : gen_src1 = (src1_le == 2'b11) ? 
								{4'h0,   4'h0, 9'h000,8'h0B,src_x,			  1'b1,2'b10,1'b0}	// load in DWord pieces
							  : {4'h0,   4'h0, 9'h000,8'h07,src_x,			  1'b1,src1_le,1'b0};
		  5'b10101 : gen_src1 = {auop_s, idx_1,9'h002,8'h07,src_x,			  3'b111,atys[0]};	// Absolut Addressing
		  5'b10110 : gen_src1 = {4'b1011,4'h0, 9'h014,8'h05,7'h1F,			  4'b0001};			// External with MOD Register +4
		  5'b10111 : gen_src1 = (idx_1[2] | atys[2]) ?											// Access class "addr" ?
								{auop_s, idx_1,9'h000,8'h07,stack,			  3'b000,atys[0]}	// 0(SP) : no TOS flag
							  : {4'b1011,pop_1, 	  8'h07,stack,			  4'b0001};			// TOS
		  // Memory Space : 0(SB)
		  5'b110x0 : gen_src1 = {auop_s, idx_1,9'h000,8'h07,5'b0_0110,src1_addr[1:0],3'b111,atys[0]};	// SB+FP
		  5'b11001 : gen_src1 = {auop_s, idx_1,9'h000,8'h07,stack,			  3'b111,atys[0]};	// SP
		  5'b11011 : gen_src1 = {auop_s, idx_1,9'h001,8'h07,src_x,			  3'b111,atys[0]};	// PC relativ
		  default  : gen_src1 = 36'hx_xxxx_xxxx;	// don't care
		endcase
		
	assign adrd1 = {(mpoi_1 ? 2'b10 : src1_le),gen_src1[35:19]};	// Addressfield : 19 Bits
	assign phrd1 = gen_src1[18:11];					// next phase
	assign rega1 = gen_src1[10:4];					// Source 1 Register
	assign irrw1 = {4'b0,idx_feld[2:0]};			// Index-Register
	assign nxrd1 = gen_src1[3:0];					// Memory/Disp/Immediate operation
	assign exr11 = {2'b10  ,4'b1011,4'h0 ,9'h080};	// 2. access external with Mem.-Pointer + 4* Disp
	assign exr12 = {src1_le,auop_s,idx_1,9'h000};	// for Memory Relative and EXT in last step
	
	// Source 2 resp. Destination
	
	assign rmw = src2_flag & dest_flag;
	assign idx_2 = {1'b0,(op_feld[17:15] == 3'b111),op_feld[14:13]};	// 4 bits
	assign src2_addr = idx_2[2] ? idx_feld[15:11] : op_feld[17:13];
	assign usp_2 = src2_addr[0] ? stack : {5'b0_0110,src2_addr[1:0]};
	assign src_2l = {src_2[6:1],1'b0};
	assign mpoi_2 = (src2_addr[4:2] == 3'b100) | (src2_addr == 5'h16);	// Pointer in memory always DWord
	assign auop_d = atyd[0] ? 4'b1011 : 4'b0010;	// Only make effective address ?
	
	// The next assessment processes TOS separated for PUSH and POP
	assign tos_oper =			src2_flag ?
								{2'b00,atyd[0],2'b01,atyd[0],2'b00,src2_le,7'b1_0000_10,	 src1_tos,4'h7,stack,3'b0,atyd[0]}	// POP
							  : {1'b0,atyd[0],3'b001,atyd[0],4'h0,   1'b1,2'b10,src2_le,2'b0,src1_tos,4'h7,stack,3'b0,atyd[0]};	// PUSH

	// Nextfield : 11=DISP read
	// Address field : Size:2 RD WR LDEA FULLACC INDEX:4 SPUPD disp_val:4 POST CLRMSW SRC2SEL:2
	always @(*)
		casex (src2_addr)	//	 RW:W  RW:R  LF    IDX   ADDR_F NEUP   SRC_REG          NEXT
		  // Special case which is only valid at INDEX or "addr" : REG -> ADDR , DISP=0 : starts immediate at read
		  5'b00xxx : gen_src2 = {1'b0,atyd[0],auop_d,     idx_2,9'h000,4'h7,4'h0,src2_addr[2:0],3'b000,atyd[0]};	
		  // Register relativ : 0(R0)
		  5'b01xxx : gen_src2 = {1'b0,atyd[0],auop_d,     idx_2,9'h000,4'h7,4'h0,src2_addr[2:0],3'b111,atyd[0]};
		  // Memory relativ : 0(0(SB))
		  5'b100xx : gen_src2 = {2'b10,2'b10,2'b11,4'h0, 9'h000,4'h6,usp_2,		4'b1111};	// 1. access always full
		  // Immediate
		  5'b10100 : gen_src2 = (src2_le == 2'b11) ? 
								{2'b00,2'b00,2'b00,4'h0, 9'h000,4'hB,src_x,		1'b1,2'b10,1'b0}	// load in DWord pieces
							  : {2'b00,2'b00,2'b00,4'h0, 9'h000,4'h7,src_x,		1'b1,src2_le,1'b0};
		  5'b10101 : gen_src2 = {1'b0,atyd[0],auop_d,     idx_2,9'h002,4'h7,src_x,		3'b111,atyd[0]};	// Absolut with special coding
		  5'b10110 : gen_src2 = {2'b10,2'b10,2'b11,4'h0, 9'h014,4'h5,7'h1F,		4'b0001};	// External with MOD Register +4
		  5'b10111 : gen_src2 = (idx_2[2] | rmw | atyd[2]) ?
								{1'b0,atyd[0],auop_d, idx_2,7'b0_0000_00,src1_tos,4'h7,stack,	3'b000,atyd[0]}	// 0(SP) : TOS + DISP=0
							  : tos_oper;	// TOS : 2 cases for PUSH and POP
		  // Memory Space
		  5'b110x0 : gen_src2 = {1'b0,atyd[0],auop_d,     idx_2,9'h000,4'h7,5'b0_0110,src2_addr[1:0],3'b111,atyd[0]};
		  5'b11001 : gen_src2 = {1'b0,atyd[0],auop_d,     idx_2,9'h000,4'h7,stack,		3'b111,atyd[0]};
		  5'b11011 : gen_src2 = {1'b0,atyd[0],auop_d,     idx_2,9'h001,4'h7,src_x,		3'b111,atyd[0]};	// PC relativ
		  default  : gen_src2 = 34'hx_xxxx_xxxx;	// don't care
		endcase
		
	assign adrd2 = {(mpoi_2 ? 2'b10 : src2_le),gen_src2[31:15]};
	assign adwr2 = {(mpoi_2 ? 2'b10 : src2_le),gen_src2[33:32],gen_src2[29:15]};
	assign phrd2 = {4'h1,gen_src2[14:11]};				// Phase for Read Source 2
	assign phwr2 = {4'h2,gen_src2[14:11]};				// Phase for Write Destination
	assign rega2 = gen_src2[10:4];
	assign nxrw2 = gen_src2[3:0];
	assign irrw2 = {4'b0,idx_feld[10:8]};
	assign re_wr = {src2_le,4'b0101,4'h0, 9'h003};		// REUSE Address : Write of rmw
	assign exr22 = {src2_le,atyd[0],1'b0,1'b1,atyd[0],idx_2,9'h000};	// for Memory Relative and EXT in last step
	assign exw22 = {src2_le,1'b0,atyd[0],1'b1,atyd[0],idx_2,9'h000};	// for Memory Relative and EXT in last step
	
	// Special case :
	
	assign quei1 = acc1 ? imme : src_1l;	// 8B passing either from register or from extern
	// 8B is requested from both operands but only to certain times
	assign qword = (phase_reg[7:4] != 4'h0) ? (src2_le == 2'b11) :	(src1_le == 2'b11);
	assign quet1 = acc1 ? temp_h : src_1;	// select source during calculation
	
	// Output data of state machine	
	//							LOAD if	 PULS if	simple
	//					NEXT -> ENABLE	 ENABLE		out
	//  [66:48] 19	ADDR : 			X						; Op-length REUSE RD/WR etc.
	//	[47:40]	 8	new phase		X
	//	[39:33]  7	SRC1							X
	//	[32:26]	 7	SRC2							X
	//	   [25]	 1	WREN					X
	//	[24:19]	 6	DEST			X
	// 	 [18:8] 11	OPER			X
	//	  [7:6]	 2	START					X
	//	  [5:4]  2	LD_OUT					X
	//  	[3]  1	ID Load			X
	//	  [2:1]	 2	ID Type 		X						; 0 = DISP
	//		[0]  1	MEM Access		X

	// State	 acc2-src2_flag-dest_flag
	// no SRC2  	x		0		x
	// SRC2=REG		0		1		0	; CMP+TBIT
	// SRC2=REG		0		1		1	; all else
	// SRC2=MEM		1		1		0	; CMP+TBIT
	// SRC2=MEM		1		1		1	; all else
	
	// Input data for state machine

	//	8 phase_reg : 	phase of state machine
	//	2 otype :		Opcode type
	
	//	1 idx :			Index is available : 1 or 2 , only PHASE_0
	//	1 short_op :	short opcodes like ADDQ
	//	1 long :		"long" opcode
	//	1 qword :		8B access at Source (Exception DEI+MEI)

	//	1 acc1 :		Reg/Extern SRC1
	//	1 acc2 :		Reg/Extern SRC2
	//	1 src2_flag :	the 2. operand is being read
	//	1 dest_flag :	there is a target operand : only CMP and TBIT have none
	
	assign phase_ein = abbruch ? 8'h00 : phase_reg;
	
	always @(*)		//		   "_"						 "_"
		casex ({phase_ein,otype, idx,short_def,long,qword, acc1,acc2,src2_flag,dest_flag})
 {8'h00,10'b00_1xxx_xxxx}:	// Index must be loaded : phase 2 : in any case load TEMP for Short-Op and generate LD_OUT
							new_op = short_op ?	// 										   	START LD_OUT
									 {addr_nop,8'h02, imme, src_x, 1'b1,temp_h,		op_sho,	2'b00,2'b10,	1'b1,n_idx,1'b0}
								   : {addr_nop,8'h02, src_1,src_1l,1'b0,dest_x,		opera,	2'b00,~src2_flag,2'b1_1,n_idx,1'b0};
 {8'h00,10'b00_01xx_x0xx}:	// Short-Op to register, LD_OUT because of CMPQ
							new_op = {addr_nop,goacb, imme, src_2,dest_flag,dest_r,	opera,	2'b00,2'b10,	4'h0};
 {8'h00,10'b00_01xx_x11x}:	// Short-Op : external operand read : SRC2 ! Data in TEMP ! Here no Index
							new_op = {adrd2,   phrd2, imme, rega2, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	nxrw2};
 {8'h00,10'b00_01xx_x10x}:	// MOVQ to Mem
							new_op = {adwr2,   phwr2, imme, rega2, 1'b0,dest_x,		opera,	2'b00,2'b10,	nxrw2};
 {8'h00,10'b00_0000_00xx}:	// simple register operation : dest_flag controls WREN, LD_OUT for CMP
							new_op = {addr_nop,dowait,src_1,src_2, dest_flag,dest_r,opera,	2'b00,2'b10,	4'h0};
 {8'h00,10'b00_0001_00xx}:	// "simple" Reg-Op of 8B, phase 8 after 2. DWord , not via LONG-path
							new_op = {addr_nop,8'h08, src_1,src_x, 1'b1,dest_r,		opera,	2'b00,2'b00,	4'h0};
 {8'h00,10'b00_0010_00xx}:	// long register operation i.e. DIV - phase 31
							new_op = {addr_nop,8'h1F, src_1,src_2, wlor,dest_r,		opera,	2'b11,2'b00,	4'h0};
 {8'h00,10'b00_0011_001x}:	// long register operation with QWORD - phase 26 then wait
							new_op = {addr_nop,8'h1A, src_1,src_2, 1'b0,dest_r,		opera,	2'b01,2'b00,	4'h0};
 {8'h00,10'b00_00xx_1xxx}:	// Source 1 in memory - first to read , here no Index
							new_op = {adrd1,   phrd1, src_x,rega1, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrd1};
 {8'h00,10'b00_00xx_011x}:	// Source 2 in memory - first to read (Source 1 in register)
							new_op = {adrd2,   phrd2, src_x,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
 {8'h00,10'b00_0000_0101}:	// Source 1 store in Dest : "pass through" for MOV,NEG,ABS
							new_op = {adwr2,   phwr2, src_1,rega2, 1'b0,dest_x,		opera,	2'b00,2'b10,	nxrw2};
 {8'h00,10'b00_0001_0101}:	// Source 1 store in Dest : "pass through" for MOV,NEG,ABS for Long operands
							new_op = //(op_feld[17:13] == 5'h17) ?	// TOS : special case , first 8B out of Reg and then read SP
									 {addr_nop,8'h1C, src_1,src_1l,1'b0,dest_x,		opera,	2'b00,2'b11,	4'h0};
 {8'h00,10'b00_0010_0101}:	// SRC1 -> DEST with short operands 
							new_op = {addr_nop,8'h1F, src_1,src_x, 1'b0,dest_r,		opera,	2'b11,2'b00,	4'h0};
 {8'h00,10'b00_0011_0x01}:	// SRC1 -> DEST i.e. ROUNDLi
							new_op = {addr_nop,8'h1F, src_1,src_1l,wlor,dest_r,		opera,	2'b11,2'b00,	4'h0};

		// Phase 2 : after read of Index nearly everything is repeated from PHASE_0
 {8'h02,10'bxx_x1xx_x11x}:	// Short-Op : external operand read
							new_op = {adrd2,   phrd2, irrw2,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
 {8'h02,10'bxx_x1xx_x101}:	// MOVQ to Mem, data is in Out-Register
							new_op = {adwr2,   phwr2, irrw2,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
 {8'h02,10'bxx_x0xx_1xxx}:	// Source 1 in memory - first to read
							new_op = {adrd1,   phrd1, irrw1,rega1, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrd1};
 {8'h02,10'bxx_x0xx_011x}:	// Source 2 in memory - first to read
							new_op = {adrd2,   phrd2, irrw2,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
 {8'h02,10'bxx_x00x_0101}:	// Source 1 store in Dest : "pass through" , data is already in Out-Register
							new_op = {adwr2,   phwr2, irrw2,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
 {8'h02,10'bxx_x010_0101}:	// SRC1 -> DEST with short operands
							new_op = {addr_nop,8'h1F, src_1,src_x, 1'b0,dest_x,		opera,	2'b11,2'b00,	4'h0};
 {8'h02,10'bxx_x011_0101}:	// SRC1 -> DEST i.e. ROUNDLi 
							new_op = {addr_nop,8'h1F, src_1,src_1l,1'b0,dest_x,		opera,	2'b11,2'b00,	4'h0};

	// +++++++++++++++++  SRC1 operand loading  +++++++++++++++++++

		// Phase 5 : wait for data and Disp2 for External addressing : part 2 EA = (MOD+4)+4*DISP1
		//		next phase fix : 6
 {8'h05,10'bxx_xxxx_xxxx}:	new_op = {exr11,   8'h06, src_x,imme , 1'b0,dest_x,		opera,	2'b00,2'b00,	4'b1111};
		// Phase 6 : Memory-Pointer for Memory Relative and last access External
		//		next phase fix : 7 , add Index
 {8'h06,10'bxx_xxxx_xxxx}:	new_op = {exr12,   8'h07, irrw1,imme , 1'b0,dest_x,		opera,	2'b00,2'b00,	3'b111,atys[0]};

		// Phase 7 : wait for final data , direct from PHASE_0 if TOS without Index
		//		next phase : if 8B data phase 8 is neccessary
		// if SRC2=REG execution started (otherwise store data in TEMP) and PHASE_0
 {8'h07,10'bxx_xx00_x0xx}:	// into Register , short operation execution , but LD_OUT for PSR Update ! dest_flag => WREN
							new_op = {addr_nop,endea, imme, src_2, dest_flag,dest_r,opera,	2'b00,2'b10,	diacb};
 {8'h07,10'bxx_xx01_x0xx}:	// into Reg but with a step om between for ABSL etc. : phase 8
							new_op = {addr_nop,8'h08, imme, src_x, 1'b1,dest_r,		opera,	2'b00,2'b00,	4'h0};
 {8'h07,10'bxx_xx10_x0xx}:	// execute long operation , wait in phase 31
							new_op = {addr_nop,8'h1F, imme, src_2, wlor,dest_r,		opera,	2'b11,2'b00,	4'h0};
 {8'h07,10'bxx_xx11_xx0x}:	// execute long operation : 2. operand only Dest , load LSD , phase 24 , wait in phase 31
							new_op = {addr_nop,8'h18, imme, src_x, 1'b1,temp_l,		op_mov,	2'b01,2'b00,	4'h0};
 {8'h07,10'bxx_xx11_x01x}:	// lange Operation ausfuehren , LSD laden , phase 25 , warten in phase 31
							new_op = {addr_nop,8'h19, imme, src_2, 1'b0,dest_r,		opera,	2'b01,2'b00,	4'h0};
 {8'h07,10'bxx_xxx0_x11x}:	// Data into TEMP , read 2. operand , is there Index ? Yes -> phase 15
							new_op = idx_2[2] ?
									 {addr_nop,8'h0F, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'h0}
								   : {adrd2,   phrd2, imme, rega2, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	nxrw2};
 {8'h07,10'bxx_xxx1_x11x}:	// 8B data in TEMP , step in between then 2. Op read : phase 10 - can only be "long" operation
							new_op = {addr_nop,8'h0A, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'h0};
 {8'h07,10'bxx_xx00_x101}:	// something like ABSi , execute and store (LD_OUT)
							new_op = idx_2[2] ?
									 {addr_nop,8'h10, imme, src_x, 1'b0,dest_x,		opera, 	2'b00,2'b10,	4'h0}
								   : {adwr2,   phwr2, imme, rega2, 1'b0,dest_x,		opera,	2'b00,2'b10,	nxrw2};
 {8'h07,10'bxx_xx01_x101}:	// ABS etc. : LSD data over SRC2 in 2. OUT-Reg , MSD data see opcode ABS/NEG/MOV , phase 9
							new_op = {addr_nop,8'h09, imme, src_x, 1'b0,dest_x,		opera,	2'b00,2'b10,	4'h0};
 {8'h07,10'bxx_xx10_x101}:	// opcodes like MOVFL
							new_op = {addr_nop,8'h1F, imme, src_x, 1'b0,dest_x,		opera,	2'b11,2'b00,	4'h0};

		// Phase 8 : 2. part of 64 bit data : can be reached from PHASE_0 if 8B data
 {8'h08,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,endea, quei1,src_x, 1'b1,dest_rl,	op_mov,	2'b00,2'b00,	diacb};
		// Phase 9 : step in between to get data in OUT-Reg Low , SRC1 is not possible
 {8'h09,10'bxx_xxxx_xxxx}:	// afterwards to data write
							new_op = {addr_nop,8'h10, src_x,imme , 1'b0,dest_x,		op_mov,	2'b00,2'b01,	4'h0};
		// Phase 10 : LSD data write in TEMP , source can be IMME data to
 {8'h0A,10'bxx_xxxx_xxxx}:	// 8B , after TEMP there can only be a 2. operand
							new_op = idx_2[2] ?
									 {addr_nop,8'h0F, imme, src_x, 1'b1,temp_l,		op_mov,	2'b00,2'b00,	4'h0}
								   : {adrd2,   phrd2, imme, rega2, 1'b1,temp_l,		op_mov,	2'b00,2'b00,	nxrw2};

		// Phase 11 : wait for 8B IMME data : switch over at address decoder , qword flag is for sure "1"
 {8'h0B,10'bxx_xx0x_x0xx}:	// into Reg with step in between for ABSL etc. : phase 12
							new_op = {addr_nop,8'h0C, imme, src_x, 1'b1,dest_r,		opera,	2'b00,2'b00,	4'b1100};
 {8'h0B,10'bxx_xx1x_x01x}:	// execute long operation , load LSD , phase 25 , wait in phase 31
							new_op = {addr_nop,8'h19, imme, src_2, 1'b0,dest_r,		opera,	2'b01,2'b00,	4'b1100};
 {8'h0B,10'bxx_xxxx_x11x}:	// 8B data into TEMP , step in between then read 2. Op : phase 10 - can only be "long" operation
							new_op = {addr_nop,8'h0A, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'b1100};
 {8'h0B,10'bxx_xx0x_x10x}:	// ABS etc. : LSD data via SRC2 into 2. OUT-Reg , MSD data see opcode ABS/NEG/MOV , phase 9
							new_op = {addr_nop,8'h09, imme, src_x, 1'b0,dest_x,		opera,	2'b00,2'b10,	4'b1100};
 {8'h0B,10'bxx_xx1x_xx0x}:	// MOVLF with 8B IMME data ? Must be possible, the end in phase 24 like SRC1=MEM
							new_op = {addr_nop,8'h18, imme, src_x, 1'b1,temp_l,		op_mov,	2'b01,2'b00,	4'b1100};
		// Phase 12 : wait for 2. part of 64 bit IMME data : after phase 0
 {8'h0C,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,endea, imme ,src_x, 1'b1,dest_rl,	op_mov,	2'b00,2'b00,	diacb};

		// Phase 15 : secure in TEMP with Index continue and read 2. operand
 {8'h0F,10'bxx_xxxx_xxxx}:	new_op = {adrd2,   phrd2, irrw2,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
		// Phase 16 : after LD_OUT continue with Index and store 1. operand
 {8'h10,10'bxx_xxxx_xxxx}:	new_op = {adwr2,   phwr2, irrw2,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};

	// +++++++++++++++++  SRC2 operand loading : phase SRC1 + 16  +++++++++++++++++++

		// Phase 21 : wait for data and Disp2 for external addressing : part 2 EA = (MOD+4)+4*DISP1
		//		next phase fix : 22
 {8'h15,10'bxx_xxxx_xxxx}:	new_op = {exr11,   8'h16, src_x,imme , 1'b0,dest_x,		opera,	2'b00,2'b00,	4'b1111};
		// Phase 22 : Memory-Pointer for Memory Relative and last access external
		//		next phase fix : 23 , add Index
 {8'h16,10'bxx_xxxx_xxxx}:	new_op = {exr22,   8'h17, irrw2,imme , 1'b0,dest_x,		opera,	2'b00,2'b00,	3'b111,atyd[0]};

		// Phase 23 : wait for final data , direct from PHASE_0 if TOS without Index
		//		next phase : if 8B data phase 24 is used
 {8'h17,10'bxx_xx0x_xxx1}:	// execute short operation and write data into memory , no WREN -> phase 39 ACC_DONE
							new_op = {re_wr,   8'h27, quet1,imme , 1'b0,dest_r,		opera,	2'b00,2'b10,	4'b0001};
 {8'h17,10'bxx_xx0x_xxx0}:	// execute short operation , no WREN -> phase 0 , CMP(+TBIT)
							new_op = {addr_nop,endea, quet1,imme , 1'b0,dest_r,		opera,	2'b00,2'b10,	diacb};
 {8'h17,10'bxx_xx10_xxxx}:	// execute long operation , wait in phase 31
							new_op = {addr_nop,8'h1F, quet1,imme , wlor,dest_r,		opera,	2'b11,2'b00,	4'h0};
 {8'h17,10'bxx_xx11_xxxx}:	// execute long operation , load LSD in phase 24
							new_op = {addr_nop,8'h18, quet1,imme , 1'b0,dest_r,		opera,	2'b01,2'b00,	4'h0};
		// Phase 24 : load 2. part of 64 bit data : with and without wait - from 28 the phase waits , from 23 not
 {8'h18,10'bxx_xxxx_0xxx}:	// execute long operation , wait in phase 31
							new_op = {addr_nop,8'h1F, src_1l,imme, wlor,dest_r,		opera,	2'b10,2'b00,	4'h0};
 {8'h18,10'bxx_xxxx_1xxx}:	// execute long operation , wait in phase 31 , data from TEMP, used also for ROUNDLi
							new_op = {addr_nop,8'h1F, rtmpl,imme,  wlor,dest_r,		opera,	2'b10,2'b00,	4'h0};
		// Phase 25 : load 2. part of 64 bit data : SRC1 from memory and SRC2 from Reg
 {8'h19,10'bxx_xxxx_xxxx}:	// execute long operation , wait in phase 31
							new_op = {addr_nop,8'h1F, imme, src_2l,wlor,dest_r,		opera,	2'b10,2'b00,	4'h0};
		// Phase 26 : load 2. part of 64 bit data : SRC1 from Reg and SRC2 from Reg
 {8'h1A,10'bxx_xxxx_xxxx}:	// execute long operation , wait in phase 31
							new_op = {addr_nop,8'h1F, src_1l,src_2l,wlor,dest_r,	opera,	2'b10,2'b00,	4'h0};

		// Phase 27 : wait for 8B IMME data : switch over at address decoder , qword flag is for sure "1"
 {8'h1B,10'bxx_xxxx_xxxx}:	// execute long operation , load LSD in phase 24
							new_op = {addr_nop,8'h18, quet1,imme , 1'b0,dest_r,		opera,	2'b01,2'b00,	4'b1100};
		
	// +++++++++++++++++  special case  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// Phase 28 : TOS with 8B SRC1 operand , no Index ! Jump to phase 39
 {8'h1C,10'bxx_xxxx_xxxx}:	// store Source 1 in Dest : "pass through" for MOV,NEG,ABS
							new_op = {adwr2,   phwr2, src_x,rega2, 1'b0,dest_x,		opera,	2'b00,2'b00,	nxrw2};
	// +++++++++++++++++  close operation : write out DEST , TOS update  +++++++++++++++++++

		// Phase 31 : wait for DONE of long operation
 {8'h1F,10'bxx_xxxx_xxx0}:	// CMP done -> phase 0
							new_op = {addr_nop,8'h00, src_x,src_x, 1'b0,dest_r,		opera,	2'b00,2'b10,	4'h0};	// no ACB
 {8'h1F,10'bxx_xxxx_x0x1}:	// operation closed , data into register
							new_op = {addr_nop,8'h00, src_x,src_x, 1'b0,dest_r,		opera,	2'b00,2'b00,	4'h0};	// no ACB
 {8'h1F,10'bxx_xxxx_x101}:	// operation closed , data into memory - first calculate address phase 32+x
							new_op = {adwr2,   phwr2, irrw2,rega2, 1'b0,dest_r,		opera,	2'b00,2'b10,	nxrw2};
 {8'h1F,10'bxx_xxxx_x111}:	// operation closed , data into memory - address reuse phase 39 ACC_DONE
							new_op = {re_wr,   8'h27, src_x,src_x, 1'b0,dest_r,		opera,	2'b00,2'b10,	4'b0001};
		  
		// Destination address calculate
		// Phase 37 : wait for data and Disp2 for External addressing : part 2 EA = (MOD+4)+4*DISP1
		//		next phase fix : 38
 {8'h25,10'bxx_xxxx_xxxx}:	new_op = {exr11,   8'h26, src_x,imme , 1'b0,dest_x,		opera,	2'b00,2'b00,	4'b1111};
		// Phase 38 : Memory-Pointer for Memory Relative and letzter Zugriff External
		//		next phase fix : 39 , add Index and write
 {8'h26,10'bxx_xxxx_xxxx}:	new_op = {exw22,   8'h27, irrw2,imme , 1'b0,dest_x,		opera,	2'b00,2'b00,	4'b1111};

		// Phase 39 : wait for ACC_DONE : consequent numbering : 7+32
 {8'h27,10'bxx_xxxx_xxxx}:	// now operation closed , only ACB could follow
							new_op = {addr_nop,endea, src_x,src_x, 1'b0,dest_x,		opera,	2'b00,2'b00,	diacb};
							
	// +++++++++++++++ special case : ACB to Reg is to fast ! One wait cycle for ZERO-Flag
 {8'h28,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h01,src_x, src_x, 1'b0,dest_x,		opera,	2'b00,2'b00,	4'b1110};
		  
	// +++++++++++++++  The other opcodes are following  ++++++++++++++++++

 {8'h00,10'b01_xxxx_xxxx}:	new_op = {new_addr,new_ph,new_regs,	   1'b0,dest_x,		op_mov,					new_nx};	// 1 Byte Opcodes

		// Phase 1 : used for Bcond and ACB :
 {8'h01,10'bxx_xxxx_xxxx}:	new_op = (ex_br_op[1] | jsr_flag) ? 	// BSR or JSR ?
									 {push_op, 8'h27, imme, stack, 1'b0,dest_x,		op_mov, 2'b00,2'b10,	4'b0001}	// wait at end
								   : {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
 
		// Phase 42 : RET : read of PC from Stack and DIN via SRC1 to PC
 {8'h2A,10'bxx_xxxx_xxxx}:  new_op = {adddisp, 8'h2B, imme, src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'hE};
		// Phase 43 : RET : Displacement add to Stack. Attention : "imme" important to keep source constant for PC
 {8'h2B,10'bxx_xxxx_xxxx}:  new_op = {save_sp, 8'h2C, imme, src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 44 : RET : Update of Stack : fixed phase
 {8'h2C,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
 
		// Phase 45 : ENTER Entry
 {8'h2D,10'bxx_xxxx_xxxx}:	new_op = {dispmin, 8'h2E, src_x,src_x, 1'b1,temp_l,		op_adr,	2'b00,2'b00,	4'hE};
		// Phase 46 : ENTER Stack longer
 {8'h2E,10'bxx_xxxx_xxxx}:	new_op = {save_sp ,8'h31, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 48 : SAVE/ENTER : Init phase , phases 48 & 49 very similar
 {8'h30,10'bxx_xxxx_xxxx}:	new_op = save_reg ?
									 {push_op, 8'h31, saver,stack, 1'b0,dest_x,		op_mov,	2'b00,2'b10,	4'h1}	// 1. load SP=>EA
								   : {addr_nop,8'h00, rtmpl,src_x,new_fp,frame[5:0],op_mov,	2'b00,2'b00,	4'h0};	// At ENTER FP Update
		// Phase 49 : SAVE/ENTER : at the same time memory access and detection of next Reg
 {8'h31,10'bxx_xxxx_xxxx}:	new_op = save_reg ?
									 {push_ea, 8'h31, saver,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b10,	4'h1}	// one more
								   : {addr_nop,8'h00, rtmpl,src_x,new_fp,frame[5:0],op_mov,	2'b00,2'b00,	4'h0};	// At ENTER FP Update

		// Phase 50 : RESTORE/EXIT Entry
 {8'h32,10'bxx_xxxx_xxxx}:	new_op = save_reg ?
									 {pop_op,  8'h33, src_x,stack, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1}
								   : {pop_fp,  ppfp,  src_x,frame, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	3'h0,new_fp};
		// Phase 51 : RESTORE/EXIT next reg
 {8'h33,10'bxx_xxxx_xxxx}:	new_op = save_reg ?
									 {next_po, 8'h33, imme, src_x, 1'b1,resto,		op_mov,	2'b00,2'b00,	4'h1}
								   : {pop_fp,  ppfp,  imme, frame, 1'b1,resto,		op_mov,	2'b00,2'b00,	3'h0,new_fp};
		// Phase 52 : EXIT End
 {8'h34,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, imme, src_x, 1'b1,frame[5:0],	op_mov,	2'b00,2'b00,	4'h0};
								   
		// Phase 53 : CXP Entry : this opcode needs 12 States and 16 cycles minimum ...
 {8'h35,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h36, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 54 : CXP : Store Address Link table
 {8'h36,10'bxx_xxxx_xxxx}:	new_op = {rdltab,  8'h37, src_x,rtmph, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'hE};	// EA Phase : DISP read
		// Phase 55 : CXP : DISP is worked on, the return address => temp_l
 {8'h37,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h38, imme, rtmph, 1'b1,temp_l,		op_mov,	2'b00,2'b00,	4'h1};	// Access
		// Phase 56 : CXP : Access to Link table => Result is MOD-Entry => store in temp_h
 {8'h38,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h39, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 57 : CXP : store and PUSH MOD prepare , Entry from Exception Processing
 {8'h39,10'bxx_xxxx_xxxx}:	new_op = {push_op, 8'h3A, modul,stack, 1'b0,dest_x,		op_wrp,	2'b00,2'b10,	4'h1};
		// Phase 58 : CXP : PUSH of MOD ongoing, PUSH PC prepare
 {8'h3A,10'bxx_xxxx_xxxx}:	new_op = {ea_push, 8'h3B, rtmpl,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b10,	4'h0};
		// Phase 59 : CXP : New EA for PC
 {8'h3B,10'bxx_xxxx_xxxx}:	new_op = {save_sp, 8'h3C, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1};
		// Phase 60 : CXP : write of PC, calculate of Offset
 {8'h3C,10'bxx_xxxx_xxxx}:	new_op = {rmod_8,  8'h3D, rtmph,rtmph, 1'b1,temp_l,		op_flip,2'b00,2'b00,	4'h1};
		// Phase 61 : CXP : read from (MOD:New+8)
 {8'h3D,10'bxx_xxxx_xxxx}:	new_op = {ea_min8, 8'h3E, imme, rtmpl, 1'b1,temp_l,		op_add,	2'b00,2'b00,	4'h0};	// Reuse of EA
		// Phase 62 : CXP : EA Phase of SB read , new PC calculated
 {8'h3E,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h3F, rtmpl,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1};
		// Phase 63 : CXP : read of SB , new PC to ICache
 {8'h3F,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h2F, imme, src_x, 1'b1,6'h1A,		op_mov,	2'b00,2'b00,	4'h0};	// SB load
		// Phase 47 : CXP : Last phase update of MOD prepare
 {8'h2F,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, rtmph,src_x, 1'b1,modul[5:0],	op_mov,	2'b00,2'b00,	4'h0};	// MOD load
		
		// Phase 64 : RXP Entry : POP of PC , full Access
 {8'h40,10'bxx_xxxx_xxxx}:	new_op = {pop_ru,  8'h41, imme, src_x, 1'b1,temp_h,		op_mov, 2'b00,2'b00,	4'h0};
		// Phase 65 : RXP : PC is read, next POP prepare
 {8'h41,10'bxx_xxxx_xxxx}:	new_op = {adddisp, 8'h42, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'hF};
		// Phase 66 : RXP : DISP is addeed to Stack and MOD is read
 {8'h42,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h43, imme, src_x, 1'b1,modul[5:0],	op_mov,	2'b00,2'b00,	4'h0};
		// Phase 67 : RXP : MOD is new
 {8'h43,10'bxx_xxxx_xxxx}:	new_op = {rmod_rxp,8'h44, rtmph,modul, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h1};
		// Phase 68 : RXP : wait for SB data, parallel SP update
 {8'h44,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, imme, src_x, 1'b1,6'h1A,		op_mov,	2'b00,2'b00,	4'h0};	// SB load

		// Phase 69 : RETI : read of ICU for End-of-Interrupt Cycle , prepare read PC from Stack
 {8'h45,10'bxx_xxxx_xxxx}:	new_op = {pop_op,  8'h46, src_x,stack, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1};
		// Phase 70 : RETI/ RETT Entry : POP of PC , full Access
 {8'h46,10'bxx_xxxx_xxxx}:	new_op = {pop_ru,  8'h47, imme, src_x, 1'b1,temp_h,		op_mov, 2'b00,2'b00,	4'h0};
		// Phase 71 : RETI/RETT : PC is read, next POP prepare
 {8'h47,10'bxx_xxxx_xxxx}:	new_op = {save_sp, 8'h48, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1};
		// Phase 72 : RETI/RETT : DISP is added to Stack , PSR load and MOD is loaded if DE off
 {8'h48,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h49, imme, src_x, no_modul,		op_ldp,	2'b00,2'b00,	4'h0};
		// Phase 73 : RETI/RETT : different paths
 {8'h49,10'bxx_xxxx_xxxx}:	new_op = de_flag ?
									 ( reti_flag ?
								     {addr_nop,8'h4A, rtmph,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0}
								   : {addr_nop,8'h4B, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0} )
								   : {rmod_rtt,8'h4B, rtmph,modul, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h1};
		// Phase 74 : RETI/RETT : one pause cycle if DE on
 {8'h4A,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 75 : RETI/RETT : SB read if DE off
 {8'h4B,10'bxx_xxxx_xxxx}:	new_op = reti_flag ?
									 {addr_nop,8'h00, imme, src_x, 1'b1,6'h1A,		op_mov,	2'b00,2'b00,	4'h0}
								   : ( de_flag ?
								     {adddispn,8'h4E, src_x,ttstak,1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'hE}
								   : {adddispn,8'h4E, imme, ttstak,1'b1,6'h1A,		op_mov,	2'b00,2'b00,	4'hE} );
		// Phase 78 : RETT : SP update
 {8'h4E,10'bxx_xxxx_xxxx}:	new_op = {save_sp, 8'h4A, rtmph,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};

	// +++++++++++++++  special wait states for PSR and the Cache/MMU system  +++++++++++
	
		// Phase 76 : PSR in Word case simple delay of 2 cycles : 1. cycle does nothing
 {8'h4C,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h4D, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 77 : PSR in Word case simple delay of 2 cycles : 2. cycle does Restart of instruction processing
 {8'h4D,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 79 : Wait for INIT_DONE from Cachesystem
 {8'h4F,10'bxx_xxxx_xxxx}:	new_op = (INIT_DONE | no_init) ?
									 {addr_nop,8'h4D, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0}
								   : {addr_nop,8'h4F, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
								   
	// +++++++++++++++  Direct Exception procession similar to CXP  ++++++++++++++++++++
	
		// Phase 121 : CXP : store and PUSH PSR prepare , Entry of Exception Processing
 {8'h79,10'bxx_xxxx_xxxx}:	new_op = {push_op, 8'h7A, modul,stack, 1'b0,dest_x,		op_wrp,	2'b00,2'b10,	4'h1};
		// Phase 122 : CXP : PUSH of PSR running, PUSH PC prepare - MOD like normal Exception-Flow
 {8'h7A,10'bxx_xxxx_xxxx}:	new_op = {ea_push, 8'h7B, rtmpl,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b10,	4'h0};
		// Phase 123 : CXP : New EA for PC , Output of Interrupt-Vector and LOAD_PC generation, continue at standard exit
 {8'h7B,10'bxx_xxxx_xxxx}:	new_op = {save_sp, 8'h4A, rtmph,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1};
 
	// +++++++++++++++  here comes the general Exception Processing  ++++++++++++++++++

		// Phase 0 : Entry with saving of PC_ARCHI and PSR
 {8'h00,10'b11_xxxx_xxxx}:	new_op = {save_pc, 8'h80, src_x,src_x, 1'b0,dest_x,		op_psr,	2'b00,2'b00,	4'h0};
		// Phase 128 : different paths to three cases
 {8'h80,10'bxx_xxxx_xxxx}:	new_op = abo_int ?
									 {ai_next[30:4],  src_x,src_x, 1'b1,temp_l,		op_adr,	2'b00,2'b00,	ai_next[3:0]}
								   : {get_vec, 8'h81, src_x,ibase, 1'b1,temp_l,		op_adr,	2'b00,2'b00,	4'h1};
		// Phase 129 : read of Exception-Vectors and store in TEMP_H , then continue at CXP if DE off
 {8'h81,10'bxx_xxxx_xxxx}:	new_op = de_flag ?
									 {addr_nop,8'h79, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'h0}
								   : {addr_nop,8'h39, imme, src_x, 1'b1,temp_h,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 130 : read of Interrupt-Vectors, Zero-Extension of Byte => TEMP_H
 {8'h82,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h83, imme, src_x, 1'b1,temp_h,		op_zex,	2'b00,2'b00,	4'h0};
		// Phase 131 : access of Exception-Vector
 {8'h83,10'bxx_xxxx_xxxx}:	new_op = (type_nmi | ~ivec_flag) ?	// NMI or non-vectored INT ?
									 {get_vec, 8'h81, src_x,ibase, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1}
								   : {get_veci,8'h81, rtmph,ibase, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h1};
		
		// Phase 132 : ABORT : store TEAR
 {8'h84,10'bxx_xxxx_xxxx}:	new_op = {save_msr,8'h85, src_x,src_x, 1'b1,w_tear,		op_adr, 2'b00,2'b00,	4'h0};
		// Phase 133 : store MSR
 {8'h85,10'bxx_xxxx_xxxx}:	new_op = (ssrc_flag | sdest_flag) ?
									 {addr_nop,rrepa, src_x,src_x, 1'b1,w_msr,		op_adr, 2'b00,2'b00,	4'h0}
								   : {get_vec ,8'h81, src_x,ibase, 1'b1,w_msr,		op_adr, 2'b00,2'b00,	4'h1};
		// Phase 134 : reload of pointers for string opcodes : R2 Dest
 {8'h86,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h87, rtmp1,src_x, 1'b1,6'h02,		op_mov, 2'b00,2'b00,	4'h0};
		// Phase 135 : reload of pointers for string opcodes : R1 Source
 {8'h87,10'bxx_xxxx_xxxx}:	new_op = {get_vec ,8'h81, rtmph,ibase, 1'b1,6'h01,		op_mov, 2'b00,2'b00,	4'h1};
		
	// +++++++++++++++++  WAIT  +++++++++++++++++++++++++++++++++
 {8'h88,10'bxx_xxxx_xxxx}:	new_op = interrupt ?
									 {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h0}	// wait ...
								   : {addr_nop,8'h88, src_x,src_x, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h0};	// Loop
 
	// +++++++++++++++++  FLAG  +++++++++++++++++++++++++++++++++
 {8'h89,10'bxx_xxxx_xxxx}:	new_op = flag ?
									 {save_pc, 8'h80, src_x,src_x, 1'b0,dest_x,		op_psr,	2'b00,2'b00,	4'h0}	// TRAP
								   : {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h0};	// continue
								   
	// +++++++++++++++++  The Opcodes of Gruppe 2  +++++++++++++++
	
 {8'h00,10'b10_0xxx_xxxx}:	new_op = state_0;
	// Now the case with Index , the Long Operand is copied to OUT
 {8'h00,10'b10_1xxx_xxxx}:	new_op = {addr_nop,8'h50, src_1,src_1l,1'b0,dest_x,		opera,	2'b00,~src2_flag,2'b1_1,n_idx,1'b0};
	
 {8'h5x,10'bxx_xxxx_xxxx}:	new_op = state_group_50;	// Gruppe 2 Opcodes
 {8'h6x,10'bxx_xxxx_xxxx}:	new_op = state_group_60;	// Gruppe 2 Opcodes
 
 // that is only for CVTP :
 {8'h73,10'bxx_xxxx_x0xx}:	new_op = {addr_nop,8'h00, src_x,src_x, 1'b1,dest_r,		op_adr, 2'b00,2'b00,	4'h0};
 {8'h73,10'bxx_xxxx_x1xx}:	new_op = {adwr2,   phwr2, irrw2,rega2, 1'b0,dest_x,		op_adr,	2'b00,2'b10,	nxrw2};
 
 // that is only for LMR and CINV :
 {8'h74,10'bxx_xxxx_xxxx}:	new_op = (IC_READ | STOP_CINV) ?
									 {ivar_adr,8'h74, rtmph,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0}	// wait ...
								   : {ivar_adr,8'h75, rtmph,src_x, 1'b1,lmrreg,		op_lmr, 2'b00,2'b00,	4'h0};	// continue
 {8'h75,10'bxx_xxxx_xxxx}:	new_op = {ivar_adr,8'h4F, rtmph,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
 
	// +++++++++++++++++  The String Opcodes  +++++++++++++++++++++
	
		// Phase 192 : R0=0 ?
 {8'hC0,10'bxx_xxxx_xxxx}:	new_op = STRING[2] ?	// Is R0<>0 ?
									 {st_src,  ph_str,rstr1,rstr1, ~kurz_st,temp_h,	op_mov,	2'b00,2'b00,	4'h0}
								   : {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0};
		// Phase 193 : 1. part read of SRC-Register => EA
 {8'hC1,10'bxx_xxxx_xxxx}:	new_op = {st_len,  8'hC2, src_x,src_x, 1'b1,wstr1,		op_adr,	2'b00,2'b00,	4'h1};
		// Phase 194 : memory operation : read
 {8'hC2,10'bxx_xxxx_xxxx}:	new_op = mt_flag ?
									 {addr_nop,8'hD3, imme, src_x, 1'b1,temp_2, (op_feld_reg[14] ? op_zex : op_mov),
																							2'b00,2'b00,	4'h0}
								   : {load_ea, 8'hC3, imme, rstr2, 1'b0,dest_x,		op_mov, 2'b00,2'b10,	4'h0};
		// Phase 195 : Data in output register and at the same time R2 to EA
 {8'hC3,10'bxx_xxxx_xxxx}:	new_op = {st_dest, 8'hC4, rstr2,imme,  ~kurz_st,temp_1,	op_mov,	2'b00,2'b01,	4'h0};
		// Phase 196 : 1. part reuse EA and LSD of 8B data to Out-Register
 {8'hC4,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'hC5, src_x,src_x, 1'b1,wstr2,		op_adr,	2'b00,2'b00,	4'h1};
		// Phase 197 : memory operation : write
 {8'hC5,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'hC7, rstr0,src_x, 1'b1,wstr0,		op_str, 2'b00,2'b00,	4'h0};
		// Phase 199 : Test for End and Interrupt
 {8'hC7,10'bxx_xxxx_xxxx}:	new_op = (interrupt & ~kurz_st) ?
									 {save_pc, 8'h80, src_x,src_x, 1'b0,dest_x,		op_psr,	2'b00,2'b00,	4'h0}	// Interrupt !
								   : ( STRING[2] ?	// Is R0<>0 ?
									 {st_src,  ph_str,rstr1,rstr1, ~kurz_st,temp_h,	op_mov,	2'b00,2'b00,	4'h0}
								   : {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0} );
 // String Compare :
		// Phase 201 : 1. part read of SRC-Register => EA
 {8'hC9,10'bxx_xxxx_xxxx}:	new_op = {st_len,  8'hCA, src_x,src_x, 1'b1,wstr1,		op_adr,	2'b00,2'b00,	4'h1};
		// Phase 202 : memory operation : read
 {8'hCA,10'bxx_xxxx_xxxx}:	new_op = mt_flag ?
									 {addr_nop,8'hDB, imme, src_x, 1'b1,temp_2, (op_feld_reg[14] ? op_zex : op_mov),
																							2'b00,2'b00,	4'h0}
								   : ( skps_flag ?	// SKPS read only String1
								     {addr_nop,8'hC7, rstr0,src_x, 1'b1,wstr0,		op_str, 2'b00,2'b00,	4'h0}
								   : {load_ea, 8'hCB, imme, rstr2, 1'b1,temp_2,		op_mov, 2'b00,2'b00,	4'h0} );
		// Phase 203 : Data to output register and at the same time R2 to EA
 {8'hCB,10'bxx_xxxx_xxxx}:	new_op = {st_src2, 8'hCC, rstr2,src_x, ~kurz_st,temp_1,	op_mov,	2'b00,2'b00,	4'h0};
		// Phase 204 : 1. part reuse EA 
 {8'hCC,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'hCD, src_x,src_x, 1'b1,wstr2,		op_adr,	2'b00,2'b00,	4'h1};
		// Phase 205 : memory operation : read and prepare compare
 {8'hCD,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'hCE, rtmp2,imme,  1'b0,dest_x,		op_scp, 2'b00,2'b10,	4'h0};
		// Phase 206 : compare of data
 {8'hCE,10'bxx_xxxx_xxxx}:	new_op = STRING[3] ?	// Elements equal ? Same as ACB_ZERO without delay of 1 cycle
								     {addr_nop,8'hC7, rstr0,src_x, 1'b1,wstr0,		op_str, 2'b00,2'b00,	4'h0}
								   : ( kurz_st ?	// at CMPM direct end
									 {addr_nop,8'h00, src_x,src_x, 1'b0,dest_x,		op_mov,	2'b00,2'b00,	4'h0}
								   : {addr_nop,8'hC8, rtmph,src_x, 1'b1,6'h01,		op_mov,	2'b00,2'b00,	4'h0} );
		// Phase 200 : reload of R1 at CMPS, prepare reload of R2
 {8'hC8,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'h00, rtmp1,src_x, 1'b1,6'h02, 		op_mov, 2'b00,2'b00,	4'h0};
 // String Options Match and Translate for MOVS
		// Phase 211 : Test if Translate
 {8'hD3,10'bxx_xxxx_xxxx}:	new_op = op_feld_reg[14] ?	// Translate ? Translate Base is Register 3
								     {st_trans,8'hD4, rtmp2,7'h03, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h1}
								   : {addr_nop,8'hD7, rtmp2,7'h04, 1'b0,dest_x,		op_scp, 2'b00,2'b10,	4'h0};	// Match
		// Phase 212 : memory operation : read
 {8'hD4,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'hD5, imme, src_x, 1'b1,temp_2,		op_mov, 2'b00,2'b10,	4'h0};
		// Phase 213 : Test if Match
 {8'hD5,10'bxx_xxxx_xxxx}:	new_op = op_feld_reg[16] ?	// Match ? Reference Value is Register 4
								     {addr_nop,8'hD7, rtmp2,7'h04, 1'b0,dest_x,		op_scp, 2'b00,2'b10,	4'h0}
								   : {st_trde, 8'hC4, 7'h02,7'h02, 1'b1,temp_1,		op_mov, 2'b00,2'b00,	4'h0};	// back to MOVS
		// Phase 215 : Match result evaluation
 {8'hD7,10'bxx_xxxx_xxxx}:	new_op = (STRING[3] ^ op_feld_reg[17]) ?	// Not equal? (op_feld_reg[17] = 1 = UNTIL)
								     {load_ea, 8'hC3, rtmp2,7'h02, 1'b0,dest_x,		op_mov, 2'b00,2'b10,	4'h0}	// back to MOVS
								   : {addr_nop,8'h00, rtmph,src_x, 1'b1,6'h01, 		op_mov, 2'b00,2'b00,	4'h0};	// Abort, R1 back
 // String Options Match and Translate for CMPS and SKPS - to many options to get it in one state
		// Phase 218 : Test if Translate
 {8'hDB,10'bxx_xxxx_xxxx}:	new_op = op_feld_reg[14] ?	// Translate ? Translate Base is Register 3
								     {st_trans,8'hDC, rtmp2,7'h03, 1'b0,dest_x,		op_mov, 2'b00,2'b00,	4'h1}
								   : {addr_nop,8'hDF, rtmp2,7'h04, 1'b0,dest_x,		op_scp, 2'b00,2'b10,	4'h0};	// Match
		// Phase 220 : memory operation : read
 {8'hDC,10'bxx_xxxx_xxxx}:	new_op = {addr_nop,8'hDD, imme, src_x, 1'b1,temp_2,		op_mov, 2'b00,2'b10,	4'h0};
		// Phase 221 : Test if Match
 {8'hDD,10'bxx_xxxx_xxxx}:	new_op = op_feld_reg[16] ?	// Match ? Reference value is Register 4
								     {addr_nop,8'hDF, rtmp2,7'h04, 1'b0,dest_x,		op_scp, 2'b00,2'b10,	4'h0}
								   : ( skps_flag ?	// SKPS read only String1
								     {addr_nop,8'hC7, 7'h00,src_x, 1'b1,6'h00,		op_str, 2'b00,2'b00,	4'h0}	// back to SKPS
								   : {st_trs2, 8'hCC, 7'h02,7'h02, 1'b1,temp_1,		op_mov, 2'b00,2'b00,	4'h0});	// back to CMPS
		// Phase 223 : Match result evaluation
 {8'hDF,10'bxx_xxxx_xxxx}:	new_op = (STRING[3] ^ op_feld_reg[17]) ?	// Not equal? (op_feld_reg[17] = 1 = UNTIL)
								     ( skps_flag ?	// SKPS read only String1
								     {addr_nop,8'hC7, 7'h00,src_x, 1'b1,6'h00,		op_str, 2'b00,2'b00,	4'h0}	// back to SKPS
								   : {st_trs2, 8'hCC, 7'h02,7'h02, 1'b1,temp_1,		op_mov, 2'b00,2'b00,	4'h0} )	// back to CMPS
								   : {addr_nop,8'h00, rtmph,src_x, 1'b1,6'h01, 		op_mov, 2'b00,2'b00,	4'h0};	// Abort, R1 back

		  default		 :  new_op = 67'hx_xxxx_xxxx_xxxx_xxxx;
		endcase

	// ++++++++++++++++++++++++  Deliver data of state machine  ++++++++++++++++++++++++++++
	
	// not all new_op bits are evaluated here ...
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) ACC_FELD[11:10] <= 2'b00;	// RD WR
		  else if (next) ACC_FELD[11:10] <= new_op[64:63];
			
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) spupd_i <= 1'b0;	// Stack Pointer Update
		  else if (next) spupd_i <= new_op[56];
			
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) oper_i <= 11'b0;
		  else if (next) oper_i <= new_op[18:8];
			
	always @(posedge BCLK)
		if (next)
		  begin
			ACC_FELD[13:12] <=  new_op[66:65];					// ASIZE[1:0]
			ACC_FELD[8:0]   <= {new_op[61:57],new_op[51:48]};	// FULLACC INDEX[3:0] POST CLRMSW SRC2SEL[1:0]
		    disp_sel <= new_op[55:52];
			wradr_i	 <= new_op[24:19];
		  end
		  
	always @(posedge BCLK) wmaske_i <= src2_le;	// to simple ?
	
	always @(posedge BCLK) index_cmd <= (phase_reg == 8'h60);	// that only for INDEX
	
	// WMASKE : SP always 32 Bit, opcodes in Format 1, Reg-Nr. >31 , INDEX opcodes and the CHECK operand too
	assign WMASKE = {(spupd | format1 | wradr_i[5] | wmaske_i[1] | index_cmd | (oper_i[7:0] == 8'h83)),wmaske_i[0]};
	assign WRADR  = spupd ? {~stack[5],stack[4:0]} : wradr_i;
	assign WREN   = (spupd | wren_i) & no_trap;
	assign START  = no_trap ? start_i : 2'b0;
	assign OPER   = spupd ? op_adr				   : oper_i;
	
	always @(posedge BCLK) ACC_FELD[14] <= next & (new_op[64] | new_op[63] | new_op[62]);	// NEWACC is important
	always @(posedge BCLK) ACC_FELD[9]  <= next & new_op[62];	// LDEA is only one pulse
	
	always @(posedge BCLK) start_i <= next ? new_op[7:6] : 2'b00;
	always @(posedge BCLK) ldoreg  <= next ? new_op[5:4] : 2'b00;	// [1] = LD_OUT , [0] = LD_LDQ
	always @(posedge BCLK) wren_i  <= next & new_op[25] & ~new_op[7];	// only if no START[1] from Long-Op
	
	assign LD_OUT = {(ldoreg[1] & no_trap),ldoreg[0]};	// [1] = LD_OUT (for CMP too) , [0] = LD_LDQ
	
	assign spupd = spupd_i & ~wren_i & ~ldoreg[1] & ~spu_block;	// no Stack Update if OUT Register load or already Write-Register
	
	assign do_long = new_op[7];		// START[1] for long_reg
	
	assign RDAA = {next,new_op[39:33]};	// Source 1
	assign RDAB = {next,new_op[32:26]};	// Source 2
	
	always @(posedge BCLK) if (next) WR_REG = new_op[25] & new_op[7];	// START[1] : if WR then LONG path has register as Destination
	
	// special case : example is POLYL F2,TOS
	always @(posedge BCLK) spu_block <= DONE & WR_REG;
	
	assign MMU_UPDATE[1] = (phase_reg == 8'h84) | (phase_reg == 8'h85);	// serving the MMU at ABORT
	
	// only the real access gets USER Status : important for Memory Relative & External
	always @(posedge BCLK)										//		MOVUS					MOVSU			RDVAL/WRVAL
		if (ACC_FELD[14]) dc_user <= PSR[8] | (m_ussu & (m_usel ? (phase_reg == 8'h07) : (phase_reg == 8'h27))) | RWVAL[1];
			else dc_user <= dc_user & ~abort;
			
	always @(posedge BCLK) dc_ilo <= op_ilo &  (phase_reg == 8'h59);
	always @(posedge BCLK) ILO    <= op_ilo & ((phase_reg == 8'h59) | (phase_reg == 8'h27));
	
	assign RWVAL = {dc_ilo,(rwval_flag & (phase_reg == 8'h53)),wrval_flag};	// is used for DCACHE ILO too
	
	// Signals for the I_PATH + Debug
	assign DETOIP	= {pc_match,cmps_flag,ph_match,op_feld_reg[17],kill_opt,inss_op,exin_cmd,extract,bit_reg,kurz_st,dw_info,acb_reg,t2p};

	// Signals for the ADDR_UNIT : [5]=RMW Signal
	assign chk_rmw	= (phase_reg == 8'h17) | (phase_reg == 8'h58) | ((phase_reg == 8'h59) & rw_bit);	// right Gruppe 2 opcodes
	assign INFO_AU	= {no_trap,chk_rmw,(op_feld_reg[40:39] == 2'b11),RWVAL[1],(a_ivar & ~IC_READ),dc_user,disp_ok};
	
	assign RESTART = (phase_reg == 8'h4D);

	// Signals to generate external STATUS
	assign GENSTAT[2] = (phase_reg == 8'h88);	// WAIT Signal
	assign GENSTAT[1] = (phase_reg == 8'h82);	// Interrupt Acknowlege Cycle
	assign GENSTAT[0] = (phase_reg == 8'h45);	// End-of-Interrupt Cycle
	
	// ++++++++++++++++++++ Here is the Sub-Modul for the opcodes of Gruppe 2  ++++++++++++++++
	
	GRUPPE_2 reste_ops (.BCLK(BCLK), .PHASE_0(PHASE_0), .OPREG(OPREG[18:0]), .PHASE(phase_ein[3:0]), 
						.SRC_1(src_1), .SRC_2(src_2), .REGA1(rega1), .REGA2(rega2), .IRRW1(irrw1), .IRRW2(irrw2),
						.ADRD1(adrd1), .ADRD2(adrd2), .EXR12(exr12), .EXR22(exr22), .PHRD1(phrd1[3:0]), .PHRD2(phrd2[3:0]),
						.NXRD1(nxrd1), .NXRW2(nxrw2), .ACCA({acc1,1'b0,acc2,1'b0}), .OPERA(opera),
						.STATE_0(state_0), .STATE_GROUP_50(state_group_50), .STATE_GROUP_60(state_group_60) );
						
endmodule
