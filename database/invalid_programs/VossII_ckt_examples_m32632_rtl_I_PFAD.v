// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	I_PFAD.v
//	Version:	3.0
//	History:	1.1 bug fix of 7 November 2015
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
//	1. BITMASK  	Mask Generator , was a ROM on falling edge in early days
//	2. MULFILTER 	Filter for Multiplier Input Data
//	3. SHIFTER		Barrel Shifter for all Shift Opcodes
//	4. FFS_LOGIK	Logic for FFS opcode 
//	5. SCHALE		Enclosure for Adder/Subtractor
//	6. I_PFAD		The Integer Datapath
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. BITMASK  	Mask Generator , was a ROM on falling edge in early days
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module BITMASK (AA, DOUT);

//	0    :   FFFFFFFF;	Masktype 1 , Zero from right
//	1    :   FFFFFFFE;
//	2    :   FFFFFFFC;
//	3    :   FFFFFFF8;
//	.    :   ...
//	32   :   00000001;	Masktype 2 , Decoder
//	33   :   00000002;
//	34   :   00000004;
//	35   :   00000008;
//	..   :   ...
//	64   :   00000001;	Masktyte 3 , One from right
//	65   :   00000003;
//	66   :   00000007;
//	67   :   0000000F;
//	..   :   ...
//	96   :   FFFFFFFF;	Masktype 4 , like Masktype 3 but AA-1
//	97   :   00000001;
//	98   :   00000003;
//	99   :   00000007;
//	..   :   ...

	input	 	[6:0]	AA;
	
	output	reg	[31:0]	DOUT;
	
	reg		[7:0]	dec_bit;
	
	wire	 [4:0]	code;
	wire			high,low;
	
	
	assign code = AA[4:0] - {4'd0,&AA[6:5]};
	
	assign high = (AA[6:5] == 2'd0);
	assign low  =  AA[6];
	
	always @(code or high or low)
		case (code[2:0])
		  3'b000 : dec_bit = {{7{high}},1'b1         };
		  3'b001 : dec_bit = {{6{high}},1'b1,   low  };
		  3'b010 : dec_bit = {{5{high}},1'b1,{2{low}}};
		  3'b011 : dec_bit = {{4{high}},1'b1,{3{low}}};
		  3'b100 : dec_bit = {{3{high}},1'b1,{4{low}}};
		  3'b101 : dec_bit = {{2{high}},1'b1,{5{low}}};
		  3'b110 : dec_bit = {   high  ,1'b1,{6{low}}};
		  3'b111 : dec_bit = {          1'b1,{7{low}}};
		endcase

	always @(code or high or low or dec_bit)
		case (code[4:3])
		  2'b00 : DOUT = {{24{high}},dec_bit		  };
		  2'b01 : DOUT = {{16{high}},dec_bit,{ 8{low}}};
		  2'b10 : DOUT = {{ 8{high}},dec_bit,{16{low}}};
		  2'b11 : DOUT = {           dec_bit,{24{low}}};
		endcase
		
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. MULFILTER 	Filter for Multiplier Input Data
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module MULFILTER (BWD, SRC1, SRC2, MRESULT);

	input	 [1:0]	BWD;
	input	signed	[31:0]	SRC1,SRC2;
	output	[32:0]	MRESULT;

	wire	signed	[63:0]	muld;
	wire	signed	[31:0]	mulw;
	
	wire			no_ovf;
	
	assign muld = SRC1 * SRC2;
	assign mulw = {(BWD[0] ? SRC1[15:8] : {8{SRC1[7]}}),SRC1[7:0]} * {(BWD[0] ? SRC2[15:8] : {8{SRC2[7]}}),SRC2[7:0]};
	
	assign no_ovf = BWD[1] ? (muld[63:32] == {32{muld[31]}})
						   : ( BWD[0] ? (mulw[31:16] == {16{mulw[15]}})
									  : (mulw[15:8] == {8{mulw[7]}}) );

	assign MRESULT = {~no_ovf,muld[31:16],(BWD[1] ? muld[15:0] : mulw[15:0])};
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. SHIFTER		Barrel Shifter for all Shift Opcodes
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SHIFTER ( MASKE,ROT,LSH,ASH,SIZE,SH_VAL,SH_DAT,SH_OUT,MASK_SEL);

	input  [31:0] MASKE;
	input	      ROT,LSH,ASH;
	input   [1:0] SIZE;
	input   [7:0] SH_VAL;
	input  [31:0] SH_DAT;
	output [31:0] SH_OUT;
	output  [4:0] MASK_SEL;

	reg  [31:0] sh_dat_in;
	wire [31:0] sh_dat_0,sh_dat_1,sh_dat_2,sh_dat_3,sh_dat_4;
	wire  [4:0] shift;
	reg		    msb;
	wire  [1:0] mask_code;
	reg  [31:0] SH_OUT;
	reg   [4:0] MASK_SEL;
	
	// Inputstage : prepare for ROT opcode :
	
	always @(ROT or SIZE or SH_DAT)
	  casex ({ROT,SIZE})
		3'b100  : sh_dat_in = {SH_DAT[31:16],SH_DAT[7:0],SH_DAT[7:0]};	// Byte copy to left
		3'b101  : sh_dat_in = {SH_DAT[15:0],SH_DAT[15:0]};	// Word copy to left
		default : sh_dat_in = SH_DAT;
	  endcase
	
	// Special case for ROT and BYTE : this way less logic
	
	assign shift = (ROT & (SIZE == 2'b00)) ? {2'b11,SH_VAL[2:0]} : SH_VAL[4:0];
	
	// Rotation logic
	
	assign sh_dat_0 = shift[0] ? {sh_dat_in[30:0],sh_dat_in[31]} : sh_dat_in;	// Rotation of 1 bit position
	assign sh_dat_1 = shift[1] ? {sh_dat_0[29:0],sh_dat_0[31:30]} : sh_dat_0;	// 2
	assign sh_dat_2 = shift[2] ? {sh_dat_1[27:0],sh_dat_1[31:28]} : sh_dat_1;	// 4
	assign sh_dat_3 = shift[3] ? {sh_dat_2[23:0],sh_dat_2[31:24]} : sh_dat_2;	// 8
	assign sh_dat_4 = shift[4] ? {sh_dat_3[15:0],sh_dat_3[31:16]} : sh_dat_3;	// 16

	// Detection of negativ data	

	always @(SIZE or SH_DAT)
	  casex (SIZE)
		2'b00   : msb = SH_DAT[7];	// Byte
		2'b01   : msb = SH_DAT[15];	// Word
		default : msb = SH_DAT[31];	// Double = 11
	  endcase
	
	// needs mask for output data : SH_VAL[7] says negativ number and "right" shift
	
	assign mask_code[1] = ROT | (SH_VAL[7] &   ASH &  msb);
	assign mask_code[0] = ROT | (SH_VAL[7] & ((ASH & ~msb) | LSH));

	always @(SH_VAL or SIZE)
	  casex ({SH_VAL[7],SIZE})
		3'b100  : MASK_SEL = {2'b00,SH_VAL[2:0]};	// special mask for Byte at right-shift
		3'b101  : MASK_SEL = {1'b0,SH_VAL[3:0]};	// special mask for Word at right-shift
		default : MASK_SEL = SH_VAL[4:0];
	  endcase

	always @(mask_code or sh_dat_4 or MASKE)	// top bits of MASKE are "1", lower bits are "0"
	  casex (mask_code)
		  2'b00 : SH_OUT = sh_dat_4 &  MASKE;	// LSH and ASH with positiv shift count
		  2'b01 : SH_OUT = sh_dat_4 & ~MASKE;	// Negativ shift count : LSH or ASH with positiv data
		  2'b10 : SH_OUT = sh_dat_4 |  MASKE;	// ASH with negativ shift count and negativ input data
		default : SH_OUT = sh_dat_4;			// ROT
	  endcase

endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	4. FFS_LOGIK	Logic for FFS opcode 
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module FFS_LOGIK  (SRC1, SRC2, BWD, FLAG, DOUT);

	input	[31:0]	SRC1;
	input	 [4:0]	SRC2;
	input	 [1:0]	BWD;
	output	reg		FLAG;
	output	 [4:0]	DOUT;

	reg		 [6:0]	maske;
	reg		 [7:0]	byte_1,byte_2;
	
	wire	 [7:0]	byte_0,byte_3;
	wire	[15:0]	mdat_0;
	wire	 [7:0]	mdat_1;
	wire	 [3:0]	mdat_2;
	wire	 [4:0]	obits;
	
	always @(*)
		case (SRC2[2:0])
		  3'd0 : maske = 7'h7F;
		  3'd1 : maske = 7'h7E;
		  3'd2 : maske = 7'h7C;
		  3'd3 : maske = 7'h78;
		  3'd4 : maske = 7'h70;
		  3'd5 : maske = 7'h60;
		  3'd6 : maske = 7'h40;
		  3'd7 : maske = 7'h00;
		endcase
		
	assign byte_0 = (SRC2[4:3] == 2'b00) ? {SRC1[7],(SRC1[6:0] & maske)} : 8'h00;
	
	always @(*)
		casex (SRC2[4:3])
		  2'b00 : byte_1 = SRC1[15:8];
		  2'b01 : byte_1 = {SRC1[15],(SRC1[14:8] & maske)}; 
		  2'b1x : byte_1 = 8'h00;
		endcase
		
	always @(*)
		casex (SRC2[4:3])
		  2'b0x : byte_2 = SRC1[23:16];
		  2'b10 : byte_2 = {SRC1[23],(SRC1[22:16] & maske)}; 
		  2'b11 : byte_2 = 8'h00;
		endcase
		
	assign byte_3 = (SRC2[4:3] == 2'b11) ? {SRC1[31],(SRC1[30:24] & maske)} : SRC1[31:24];

	assign obits[4] = ({byte_1,byte_0} == 16'h0);
	assign mdat_0	= obits[4] ? {byte_3,byte_2} : {byte_1,byte_0};	// 16 Bit

	assign obits[3]	= (mdat_0[7:0] == 8'h0);
	assign mdat_1	= obits[3] ? mdat_0[15:8] : mdat_0[7:0];

	assign obits[2] = (mdat_1[3:0] == 4'h0);
	assign mdat_2	= obits[2] ? mdat_1[7:4] : mdat_1[3:0];
	
	assign obits[1] =   (mdat_2[1:0] == 2'b00);
	assign obits[0] = ~((mdat_2[2:1] == 2'b10) | mdat_2[0]);
	
	always @(BWD or obits or mdat_2)
		casex ({BWD,obits[4:3]})
		  4'b00_x1 : FLAG = 1;	// Byte Overflow => nothing found
		  4'b00_10 : FLAG = 1;	// Byte Overflow => nothing found
		  4'b01_1x : FLAG = 1;	// Word Overflow => nothing found
		  default  : FLAG = (mdat_2 == 4'b0000);
		endcase

	assign DOUT = FLAG ? 5'h0 : obits;
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	5. SCHALE		Enclosure for Adder/Subtractor
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SCHALE (dataa, datab, cin, add_sub, bwd, result, cout, overflow);

	input	[31:0]	dataa,datab;
	input			cin;
	input			add_sub;	// 1 = Addition , 0 = Subtraction
	input	 [1:0]	bwd;
	
	output	[31:0]	result;
	output			cout,overflow;
	
	reg		 [2:0]	seldat;
	reg				overflow;

	wire	[32:0]	summe;
	
	assign summe = {1'b0,dataa} + {1'b0,(add_sub ? datab : ~datab)} + {32'd0,cin};
	
	always @(bwd or dataa or datab or summe)
		case (bwd)
		  2'b00   : seldat = {summe[7], dataa[7], datab[7]};
		  2'b01   : seldat = {summe[15],dataa[15],datab[15]};
		  default : seldat = {summe[31],dataa[31],datab[31]};
		endcase
		  
	always @(seldat or add_sub)
		case (seldat[1:0])
		  2'b00 : overflow = add_sub ?  seldat[2] : 1'b0;
		  2'b01 : overflow = add_sub ? 1'b0 :  seldat[2];
		  2'b10 : overflow = add_sub ? 1'b0 : ~seldat[2];
		  2'b11 : overflow = add_sub ? ~seldat[2] : 1'b0;
		endcase

	assign cout = add_sub ? summe[32] : ~summe[32];
	assign result = summe[31:0];
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	6. I_PFAD		The Integer Datapath
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module I_PFAD ( BCLK, BRESET, SFP_DAT, FSR, DP_OUT, SRC1, SRC2, BMASKE, ADDR, MRESULT, OPCODE, BWD, FL, SP_CMP, DP_CMP, LD_OUT,
				WREN, WRADR, RDAA, DETOIP, BITSEL, OVF_BCD, DISP, RWVFLAG, DSR, I_OUT, PSR, BMCODE, OV_FLAG, ACB_ZERO, STRING);

	input			BCLK,BRESET;
	input	[31:0]	SFP_DAT,FSR,DP_OUT;
	input	[31:0]	SRC1,SRC2;
	input	[31:0]	BMASKE;
	input	[31:0]	ADDR;
	input	[32:0]	MRESULT;
	input	 [7:0]	OPCODE;
	input	 [1:0]	BWD;
	input			FL;
	input	 [2:0]	SP_CMP;
	input	 [2:0]	DP_CMP;
	input			LD_OUT;
	input			WREN;
	input	 [5:0]	WRADR;
	input	 [7:0]	RDAA;
	input	[11:0]	DETOIP;
	input	 [2:0]	BITSEL;
	input	 [3:0]	OVF_BCD;
	input	 [4:0]	DISP;
	input			RWVFLAG;
	input	 [3:0]	DSR;
	
	output	[31:0]	I_OUT;
	output	[11:0]	PSR;
	output	 [6:0]	BMCODE;	// ROM Address for BITMASK
	output	reg		OV_FLAG;
	output			ACB_ZERO;
	output	 [4:0]	STRING;
	
	reg		[31:0]	I_OUT;
	reg		[31:0]	pfad_7,pfad_6,pfad_8,pfad_4a;
	wire	[31:0]	pfad_4,pfad_5,pfad_11;
	
	reg		[31:0]	bwd_daten1,bwd_daten2;
	wire	[31:0]	addsub_q;

	// +++++++++++++  Global Output Multiplexer  ++++++++++++++++++++++++++++
	
	always @(OPCODE or pfad_4 or pfad_5 or pfad_6 or pfad_7 or pfad_8 or DP_OUT or FL or SFP_DAT or FSR or pfad_11)
		casex (OPCODE[7:3])
		  5'b0100_x : I_OUT = pfad_4;
		  5'b0101_x : I_OUT = pfad_5;	// String opcodes
		  5'b0110_x : I_OUT = pfad_6;	
		  5'b0111_x : I_OUT = pfad_7;
		  5'b1000_x : I_OUT = pfad_8;
		  5'b1001_0 : I_OUT = DP_OUT;	// SP_FPU has higher priority ! LFSR has no output
		  // SFSR : ROUND,TRUNC,FLOOR Integer Data : SP or DP Block
		  5'b1001_1 : I_OUT = (OPCODE[2:1] == 2'b10) ? FSR : (FL ? SFP_DAT : DP_OUT);	
		  5'b1011_x : I_OUT = pfad_11;
		  5'b1101_x : I_OUT = DP_OUT;	// Coprocessor
		  default	: I_OUT = 32'hxxxx_xxxx; 	// don't care
		endcase
		
	// ++++++++++++++ PSR Register :	 I  P S U / N Z F V - L T C
	//									11 10 9 8   7 6 5 4 3 2 1 0
	
	reg		 [3:0]	psr_high;
	reg		 [7:0]	psr_low,psr_new;
	reg		[11:0]	push_psr;	// true Register
	reg		[11:0]	calc_psr;	// only verilog case
	reg		 [1:0]	nl_int;
	
	wire			ld_psr_l,ld_psr_h,up_psr;
	wire			cmp_op,bit_op,ari_op,neg_op,ffs_op,str_op,chk_op,abs_op,rwv_op;
	wire	 [1:0]	fp_nz;
	wire			f_flag,z_flag;
	wire	 [1:0]	nl_flags;
	wire			over_flow,cy_out;
	wire			ffs_flag;	// FLAG result of FFS
	wire			chk_flag;	// FLAG result of CHECK
	wire			save_psr,pop_psr;
	wire	 [4:0]	selbits;
	// Bits from DETOIP;
	wire			cmps_op,ph_match,until,kill_opt,inss_op,exin_cmd,extract,bit_reg,kurz_st,dw_info,acb_reg,t2p;
	wire			bcd_op,bcd_carry;
	
	assign cmps_op	= DETOIP[11];	// for CMPS
	assign ph_match	= DETOIP[10];	// MATCH phase
	assign until	= DETOIP[9];	// UNITL Flag for String
	assign kill_opt	= DETOIP[8];	// optimized execution of MOVS/MOVM
	assign inss_op	= DETOIP[7];	// 1=INSS
	assign exin_cmd = DETOIP[6];	// for EXT/INS
	assign extract  = DETOIP[5] & exin_cmd;	// 1=EXT
	assign bit_reg  = DETOIP[4];	// for Bit opcodes
	assign kurz_st  = DETOIP[3];	// for MOVM/CMPM
	assign dw_info  = DETOIP[2];	// at ADJSPi is SP=SRC2 always 32 Bit
	assign acb_reg  = DETOIP[1];	// suppresses Carry-Set at ACB
	assign t2p	    = DETOIP[0];	// Pulse to Load Trace-Bit to Pending-Trace-Bit
	
	assign bcd_op    = OVF_BCD[1];	// ADDPi,SUBPi - from DP_FPU
	assign bcd_carry = OVF_BCD[0];
	
	assign ld_psr_l = ((WRADR == 6'h1D) | (WRADR == 6'h10)) & WREN;	// Register PSR & UPSR
	assign ld_psr_h =  (WRADR == 6'h1D) & (BWD != 2'b00) & WREN;	// Register PSR
	// LD_OUT[1] is coming out of DECODER for this purpose
	assign up_psr = bcd_op | ((cmp_op | bit_op | ari_op | neg_op | ffs_op | chk_op) & LD_OUT);
	
	assign cmp_op = (OPCODE == 8'h41) | ((OPCODE == 8'hB2) & (FL ? ~SP_CMP[2] : ~DP_CMP[2]));	// CMPi or (CMPf & ~NAN)
	assign bit_op =   ((OPCODE[7:4] == 4'h6) & ((~OPCODE[3] & OPCODE[1]) | OPCODE[3:0] == 4'hE))	// the last term is for IBIT
					| (OPCODE == 8'h4D) | str_op | rwv_op;	// TBIT or CMPS or RDVAL/WRVAL
	assign ari_op = (OPCODE[7:4] == 4'h4) & (OPCODE[1:0] == 2'b0) & ~dw_info;	// ADDi,ADDCi,SUBi,SUBCi - special case ADJSPi no flags
	assign neg_op = (OPCODE[7:4] == 4'h6) & (OPCODE[3] & (OPCODE[1:0] == 2'b0));	// ABSi,NEGi  
	assign ffs_op = (OPCODE 	 == 8'h85);	// FFS
	assign chk_op = (OPCODE 	 == 8'h83);	// CHECK
	assign str_op = (OPCODE[7:4] == 4'h5) & (OPCODE[3:2] == 2'b0) & ~kurz_st;	// String-"S" opcodes : F-Flag to 0, at start always
	assign abs_op = (OPCODE 	 == 8'h6C);	// ABSi : Carry is not affected !
	assign rwv_op = (OPCODE[7:4] == 4'hE) & (OPCODE[3:1] == 3'b0);	// RDVAL + WRVAL
	
	always @(bwd_daten1 or bwd_daten2 or addsub_q)	// SRC1 > SRC2 ?
		case ({bwd_daten2[31],bwd_daten1[31]})
		  2'b00 : nl_int = {addsub_q[31],addsub_q[31]};	// MSB = N , LSB = L
		  2'b01 : nl_int = {   1'b0     ,    1'b1    };
		  2'b10 : nl_int = {   1'b1     ,    1'b0    };
		  2'b11 : nl_int = {addsub_q[31],addsub_q[31]};
		endcase
		
	assign ACB_ZERO = (addsub_q == 32'h0);	// is used for ACBi opcode too
	assign f_flag = str_op ? 1'b0 : (rwv_op ? RWVFLAG : (bit_op ? SRC2[selbits] : (acb_reg ? PSR[5] : over_flow)));
	assign fp_nz  = FL ? SP_CMP[1:0] : DP_CMP[1:0];
	assign z_flag =   OPCODE[1] ?  fp_nz[0] : ACB_ZERO;
	assign nl_flags = OPCODE[1] ? {fp_nz[1],1'b0} : nl_int;
	
	always @(*)	// Bits : N Z F V - L T C
		casex ({cmp_op,bcd_op,bit_op,(ffs_op | chk_op)})
		  4'b0000 : psr_new = {PSR[7:6],          f_flag,PSR[4:1],((acb_reg | abs_op) ? PSR[0] : cy_out)};	// arithmetic Op : CY and F
		  4'b0001 : psr_new = {PSR[7:6],(ffs_op ? ffs_flag : chk_flag),PSR[4:0]};		// FFS or CHECK
		  4'b001x : psr_new = (cmps_op & str_op) ?
							  {2'b01,             f_flag,PSR[4:3],1'b0,PSR[1:0]}		// Init CMPS
							: {PSR[7:6],          f_flag,PSR[4:0]};						// Bit opcode
		  4'b01xx : psr_new = {PSR[7:6],          1'b0,  PSR[4:1],bcd_carry};			// BCD opcode
		  4'b1xxx : psr_new = ph_match ?
							  {PSR[7:6], ~(ACB_ZERO ^ until), PSR[4:0]}					// Until/While Option at String-"S" opcodes
							: {nl_flags[1],z_flag,PSR[5:3],   nl_flags[0],PSR[1:0]};	// CMP f or i
		endcase
		
	always @(save_psr or pop_psr or OPCODE or PSR or SRC1)
		casex ({save_psr,pop_psr,OPCODE[6],OPCODE[2]})
		  4'b10xx : calc_psr = PSR & {~OPCODE[0],11'h0ED};	// clear P S U V T and the I-Bit at Interrupt & ABORT
		  4'b11xx : calc_psr = SRC1[27:16];
		  4'b0x00 : calc_psr = PSR & ~SRC1[11:0];	// BICPSR : Opcode = h32
		  4'b0x01 : calc_psr = PSR |  SRC1[11:0];	// BISPSR			 h36
		  default : calc_psr = SRC1[11:0];			// LPR PSR			 h76
		endcase

	// Special case Exception Handling : Code x'89-x'8F
	assign save_psr = (OPCODE[7:3] == 5'b1000_1);
	assign pop_psr  = (OPCODE[2:0] == 3'b000);

	always @(posedge BCLK or negedge BRESET)	// central memory for PSR low
		if (!BRESET) psr_low <= 8'h0;
		  else
		  begin
			if (ld_psr_l || save_psr) psr_low <= calc_psr[7:0];
			  else
				if (up_psr) psr_low <= psr_new;	// the Status result of a normal opcode
		  end
		  
	always @(posedge BCLK or negedge BRESET)	// central memory for PSR high
		if (!BRESET) psr_high <= 4'h0;
		  else
		  begin
			if (ld_psr_h || save_psr)  psr_high <= calc_psr[11:8];	// only at WORD access
			  else	// t2p : copy T-Bit into P-Bit at the beginning of opcode
				if (t2p) psr_high <= {psr_high[3],psr_low[1],psr_high[1:0]};
		  end
		  
	// Register for storage of PSR at Entry of Exception
	always @(posedge BCLK) if (save_psr) push_psr <= {PSR[11],(~OPCODE[1] & PSR[10]),PSR[9:0]};	// P-Flag modified
		
	assign PSR = {psr_high,psr_low};
	
	// ++++++++++++++  Overflow Detection  ++++++++++++++++++++++++++++++++++++++

	reg				ovf_ash;
	wire	[31:0]	shdat;
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) OV_FLAG <= 1'b0;
		  else
			if (OVF_BCD[3]) OV_FLAG <= OVF_BCD[2];	// DEI,QUO,DIV
			  else
				if (LD_OUT)
				  case (OPCODE)
					 8'h78 : OV_FLAG <= MRESULT[32];
					 8'h61 : OV_FLAG <= ovf_ash;
					 8'h40 : OV_FLAG <= over_flow & acb_reg;	// ADD Opcode at ACB
				   default : OV_FLAG <= 1'b0;
				  endcase
		
	always @(BWD or SRC2 or shdat)
		casex (BWD)
			2'b00 : ovf_ash = (SRC2[7]  != shdat[7]);
			2'b01 : ovf_ash = (SRC2[15] != shdat[15]);
		  default : ovf_ash = (SRC2[31] != shdat[31]);
		endcase
	
	// ++++++++++++++ Format 4 Opcodes : Basic Integer Opcodes, MOVi is special case  +++++++++++++

	reg				cy_in;
	reg				get_psr,rd_psr,rd_dsr,get_mod;
	wire			add_flag;
	
	always @(BWD or SRC1)
		casex (BWD)
			2'b00 : bwd_daten1 = {{24{SRC1[7]}}, SRC1[7:0]};	// Sign Extension
			2'b01 : bwd_daten1 = {{16{SRC1[15]}},SRC1[15:0]};
		  default : bwd_daten1 = SRC1;
		endcase
		
	assign add_flag = ~OPCODE[3] & ~OPCODE[1] & ~OPCODE[0];	// Only ADDi and ADDCi otherwise subtract in SCHALE
	
	always @(PSR or OPCODE)	// more effort due to ABSi und NEGi : Format 6
		casex ({OPCODE[5],OPCODE[3:2]})
		   3'b000 : cy_in = OPCODE[0];	// ADD + CMP
		   3'b001 : cy_in =  PSR[0];	// ADDC
		   3'b011 : cy_in = ~PSR[0];	// SUBC
		  default : cy_in = 1'b1;		// SUB + ABS + NEG : BORROW must be 1 for normal Adder 
		endcase
		
	SCHALE     addsub_ipfad  (.dataa(bwd_daten2), .datab(bwd_daten1), .cin(cy_in), .add_sub(add_flag), .bwd(BWD),
							  .result(addsub_q), .cout(cy_out), .overflow(over_flow) );
							  
	always @(posedge BCLK) get_psr <= (RDAA == 8'h9D) | (RDAA == 8'h90) | (RDAA == 8'h93);	// PSR or US or DSR is read
	always @(posedge BCLK) rd_psr  <= (RDAA[1:0] == 2'b01);
	always @(posedge BCLK) rd_dsr  <= (RDAA[1:0] == 2'b11);
	always @(posedge BCLK) get_mod <= (RDAA == 8'h9F);
	
	always @(OPCODE or SRC1 or SRC2 or get_psr or rd_psr or rd_dsr or get_mod or DSR or PSR or ADDR)
		casex (OPCODE[3:1])
		   3'b001 : pfad_4a = SRC2 & ~SRC1;	// BIC
		   3'bx10 : pfad_4a = get_psr ? {({4{rd_dsr}} & DSR),16'd0,({4{rd_psr}} & PSR[11:8]),({8{~rd_dsr}} & PSR[7:0])}	// MOV
									  : (get_mod ? {16'd0,SRC1[15:0]} : SRC1);
		   3'b011 : pfad_4a = SRC2 |  SRC1;	// OR
		   3'b101 : pfad_4a = SRC2 &  SRC1;	// AND
		   3'b111 : pfad_4a = SRC2 ^  SRC1;	// XOR
		  default : pfad_4a = ADDR;			// ADDR, comes from ADDR_UNIT
		endcase
		
	assign pfad_4 = (OPCODE[1:0] == 2'b00) ? addsub_q : pfad_4a;	// ADD,ADDC,SUB,SUBC have extra path
	
	// ++++++++++++++ Format 5 Opcodes : Strings MOVS , CMPS und SKPS  +++++++++++++++++++++++++++++++

	reg		[11:0]	spointer,dpointer;
	reg		 [9:0]	todo;
	reg		 [9:4]	todo_reg;
	reg				dis_opt;
	wire	[31:0]	diff_poi;
	wire			mehr,weiter,op_str,no_opt;
	
	assign op_str = (OPCODE[7:3] == 5'b0101_0);
	
	assign diff_poi = SRC2 - SRC1;	// Special Case
	
	always @(posedge BCLK) if (op_str && OPCODE[2]) dis_opt <= (diff_poi[31:3] == 29'd0);
	
	// This logic is for detection if an accelerated MOVS/MOVM inside a page is possible - Backward is not possible
	always @(posedge BCLK)
		if (op_str)
			begin
				spointer <= OPCODE[2] ? SRC1[11:0] : (spointer + {8'h00,todo[3:0]});	// Source
				dpointer <= OPCODE[2] ? SRC2[11:0] : (dpointer + {8'h00,todo[3:0]});	// Destination
			end
			
	assign no_opt = OPCODE[1] | ((spointer[11:3] == 9'h1FF) & (spointer[2:0] != 3'b000))
				   | kill_opt | ((dpointer[11:3] == 9'h1FF) & (dpointer[2:0] != 3'b000))
				   | dis_opt;
			
	assign pfad_5 = SRC1 - {28'h0,todo_reg[7:4]};

	assign mehr = (pfad_5[31:4] != 28'h0);
	
	always @(no_opt or BWD or mehr or pfad_5)
		casex ({no_opt,BWD,mehr,pfad_5[3:0]})
		  8'b000_1xxxx : todo = 10'h388;	// Byte
		  8'b000_01xxx : todo = 10'h388;
		  8'b000_001xx : todo = 10'h244;
		  8'b000_0001x : todo = 10'h122;
		  8'b000_00001 : todo = 10'h011;
		//
		  8'b001_1xxxx : todo = 10'h348;	// Word
		  8'b001_01xxx : todo = 10'h348;
		  8'b001_001xx : todo = 10'h348;
		  8'b001_0001x : todo = 10'h224;
		  8'b001_00001 : todo = 10'h112;
		//
		  8'b01x_1xxxx : todo = 10'h328;	// DWord
		  8'b01x_01xxx : todo = 10'h328;
		  8'b01x_001xx : todo = 10'h328;
		  8'b01x_0001x : todo = 10'h328;
		  8'b01x_00001 : todo = 10'h214;
		//
		  8'b100_xxxxx : todo = 10'h011;	// the opcodes CMPS and SKPS work on a single element
		  8'b101_xxxxx : todo = 10'h112;
		  8'b11x_xxxxx : todo = 10'h214;
		  default	   : todo = 10'hxxx;
		endcase
	
	always @(posedge BCLK) if (op_str) todo_reg <= {todo[9:8],(OPCODE[2] ? 4'd0 : todo[7:4])};	// store for next phase 51
		  
	assign weiter = mehr | (pfad_5[3:0] != 4'h0);
	
	assign STRING = {1'b0,ACB_ZERO,weiter,( op_str ? todo[9:8] : todo_reg[9:8] )};	// ACB_ZERO is delayed 1 cycle extern
	
	// +++++++++++++  Format 6 opcodes : ADDP + SUBP are done in DP_FPU  ++++++++++++++++++++

	wire			rot,ash,lsh,eis_op;
	wire	 [7:0]	sh_count;
	wire	 [4:0]	shcode;		// comes from SHIFTER
	
	reg		 [4:0]	disp_reg;	// for EXT/INS
	reg		 [2:0]	offs_reg;	// for INSS
	wire			exin_op,exin_op2;
	wire	 [4:0]	shval_ei;
	wire	 [7:0]	sh_exin;
	
	assign rot = (OPCODE[3:0] == 4'h0);
	assign ash = (OPCODE[3:0] == 4'h1);
	assign lsh = (OPCODE[3:1] == 3'b010);	// 5 is LSH , but 4 is Trap(UND) and is used for right-shift of Offset !
	
	assign eis_op = (OPCODE == 8'h73) | (OPCODE[7] & ~OPCODE[1] & inss_op);	// EXTSi | INSSi at OPCODE=80h
	assign exin_op  = exin_cmd & (OPCODE[7:4] == 4'h8);				// identifies EXT/INS
	assign exin_op2 = (exin_cmd | inss_op) & (OPCODE[7:4] == 4'h6);	// identifies LSH

	always @(posedge BCLK) disp_reg <= DISP;	// at EXT the path via ADDR is already used for DEST !!!
	always @(posedge BCLK) if (OPCODE[7]) offs_reg <= SRC1[7:5];	// for INSS , OPCODE=80h
	
	// Byte for external Bit source, Double for Register
	assign selbits = (bit_reg | eis_op | exin_op) ? (exin_op ? disp_reg : SRC1[4:0]) : {2'b00,BITSEL};
	
	assign shval_ei = inss_op ? {2'b00,offs_reg} : (bit_reg ? SRC1[4:0] : {2'b00,SRC1[2:0]});
	assign sh_exin[4:0] = ({5{extract}} ^ shval_ei) + {4'd0,extract};	// EXT : right shift, INS : left shift
	assign sh_exin[7:5] = (shval_ei == 5'd0) ? 3'b000 : {3{extract}};	// Special case : 0 has no negativ sign !

	// LSH shift by 16 bit to right
	assign sh_count = (OPCODE[3:0] == 4'h4) ? 8'hF0 : (exin_op2 ? sh_exin : SRC1[7:0]);
	
	assign BMCODE = (bit_op | eis_op | exin_op) ? {(eis_op | exin_op),(bit_op | exin_op),selbits} : {2'b00,shcode};
	
	SHIFTER  shift_inst (.MASKE(BMASKE), .ROT(rot), .ASH(ash), .LSH(lsh), .SH_DAT(SRC2), .SH_VAL(sh_count),
						 .MASK_SEL(shcode), .SIZE(BWD), .SH_OUT(shdat) );
	
	always @(BWD or SRC2 or neg_op or dw_info)
		casex ({neg_op,(dw_info | BWD[1]),BWD[0]})				// special case ADJSPi
		   3'b000 : bwd_daten2 = {{24{SRC2[7]}}, SRC2[7:0]};	// Sign Extension
		   3'b001 : bwd_daten2 = {{16{SRC2[15]}},SRC2[15:0]};
		   3'b1xx : bwd_daten2 = 32'h0;							// is used for ABSi and NEGi
		  default : bwd_daten2 = SRC2;
		endcase
		
	always @(OPCODE or SRC2 or BMASKE or addsub_q or bwd_daten1 or SRC1 or shdat or DP_OUT)
		casex (OPCODE[3:0])
		  4'b001x : pfad_6 = SRC2 & ~BMASKE;		// CBIT & CBITI
		  4'b011x : pfad_6 = SRC2 |  BMASKE;		// SBIT & SBITI
		  4'b1000 : pfad_6 = addsub_q;				// NEG
		  4'b1001 : pfad_6 = {SRC1[31:1],~SRC1[0]};	// NOT
		  4'b1010 : pfad_6 = SRC1;					// Special case 6A : not used normal -> op_lmr !
		  4'b1100 : pfad_6 = bwd_daten1[31] ? addsub_q : SRC1;	// ABS
		  4'b1101 : pfad_6 = ~SRC1;					// COM
		  4'b111x : pfad_6 = SRC2 ^  BMASKE;		// IBIT
		  default : pfad_6 = shdat;					// Result of Barrelshifter
		endcase
		
	// ++++++++++++++  Format 7 : MUL  +++++++++++++++++++++++

	// This Condition-Code Decoder is written twice ... see DECODER
	
	reg				sc_bit;
	wire			sc_negativ,sc_zero,sc_flag,sc_larger,sc_carry_psr;
	
	assign sc_negativ	= PSR[7];
	assign sc_zero      = PSR[6];
	assign sc_flag		= PSR[5];
	assign sc_larger	= PSR[2];
	assign sc_carry_psr = PSR[0];
	
	always @(SRC1 or sc_zero or sc_carry_psr or sc_larger or sc_negativ or sc_flag)
		case (SRC1[3:0])
		  4'h0 : sc_bit =  sc_zero;			// EQual
		  4'h1 : sc_bit = ~sc_zero;			// Not Equal
		  4'h2 : sc_bit =  sc_carry_psr;	// Carry Set
		  4'h3 : sc_bit = ~sc_carry_psr;	// Carry Clear
		  4'h4 : sc_bit =  sc_larger;		// Higher
		  4'h5 : sc_bit = ~sc_larger;		// Lower or Same
		  4'h6 : sc_bit =  sc_negativ;		// Greater Than
		  4'h7 : sc_bit = ~sc_negativ;		// Less or Equal
		  4'h8 : sc_bit =  sc_flag;			// Flag Set
		  4'h9 : sc_bit = ~sc_flag;			// Flag Clear
		  4'hA : sc_bit = ~sc_larger  & ~sc_zero;	// LOwer
		  4'hB : sc_bit =  sc_larger  |  sc_zero;	// Higher or Same
		  4'hC : sc_bit = ~sc_negativ & ~sc_zero;	// Less Than
		  4'hD : sc_bit =  sc_negativ |  sc_zero;	// Greater or Equal
		  4'hE : sc_bit = 1'b1;				// True
		  4'hF : sc_bit = 1'b0;				// False
		endcase
		
	reg		 [3:0]  bytes2anz;
	wire	[23:0]	and_src1;
	wire	[31:0]	movxz_dat;
	wire	 [4:0]	kurz_anz;
	wire	[31:0]	ext_sh4,ext_sh2;
	
	assign and_src1  = {{16{BWD[1]}},{8{BWD[0]}}} & SRC1[31:8];	// for MOVZ
	
	assign movxz_dat = (OPCODE[1] ^ OPCODE[0]) ? {and_src1,SRC1[7:0]} : bwd_daten1;	// MOVZ.. ?
	
	always @(ADDR or BWD)
		casex (BWD[1:0])
		  2'b00 : bytes2anz = ADDR[3:0];
		  2'b01 : bytes2anz = {1'b0,ADDR[3:1]};
		  2'b1x : bytes2anz = {2'b0,ADDR[3:2]};
		endcase
		
	assign kurz_anz = {1'b0,bytes2anz} + 5'h01;	// count for MOVM/CMPM
	
	assign ext_sh4 = SRC1[7] ? {4'h0,SRC2[31:4]}    : SRC2;		// EXTSi
	assign ext_sh2 = SRC1[6] ? {2'b0,ext_sh4[31:2]} : ext_sh4;
	
	always @(*)
		casex (OPCODE[3:0])
		  4'b0011 : pfad_7 = (SRC1[5] ? {1'b0,ext_sh2[31:1]} : ext_sh2) & BMASKE;	// EXTSi
		  4'b01xx : pfad_7 = movxz_dat;			// MOVXBW, MOVZBW, MOVZiD, MOVXiD
		  4'b1000 : pfad_7 = MRESULT[31:0];		// MULi
		  4'b1010 : pfad_7 = {27'h0,(kurz_st ? kurz_anz : {4'h0,sc_bit})};	// SCond or start of MOVM/CMPM
		  default : pfad_7 = DP_OUT;			// DIV etc.
		endcase
		
	// ++++++++++++++  Format 8 : multiple opcodes  +++++++++++++++++++++++
	
	reg				chk_p1;
	reg		[31:0]	ins_maske;
	
	wire	 [4:0]	ffs_out;
	wire	[15:0]	low_bou,upp_bou,zeiger,chk_upp,chk_low;
	wire			flag_up,flag_lo;
	
	FFS_LOGIK ffs_unit (.SRC1(SRC1), .SRC2(SRC2[4:0]), .BWD(BWD), .FLAG(ffs_flag), .DOUT(ffs_out) );
	
	// CHECK : SRC1 are the Bounds
	assign low_bou = BWD[0] ? SRC1[31:16] : {{8{SRC1[15]}},SRC1[15:8]};
	assign upp_bou = BWD[0] ? SRC1[15:0]  : {{8{SRC1[7]}}, SRC1[7:0]};
	assign zeiger  = BWD[0] ? SRC2[15:0]  : {{8{SRC2[7]}}, SRC2[7:0]};
	
	assign chk_upp = upp_bou - zeiger;	// F=1 if upp_bou < zeiger
	assign chk_low = zeiger - low_bou;	// F=1 if zeiger < low_bou
	
	assign flag_up = (upp_bou[15] == zeiger[15]) ? chk_upp[15] : upp_bou[15];	// See NL Definition
	assign flag_lo = (low_bou[15] == zeiger[15]) ? chk_low[15] : zeiger[15];
	
	always @(posedge BCLK) chk_p1 <= chk_op & BWD[1];	// CHECKD needs 2 cycles to execute
	
	assign chk_flag = BWD[1] ? (chk_p1 ? (nl_int[1] | psr_low[5]) : nl_int[1]) : (flag_up | flag_lo);
	
	always @(posedge BCLK) ins_maske <= shdat;	// expensive solution in terms of LEs ! 
	
	always @(*)
		casex (OPCODE[3:0])		// CVTP (81) has no OPCODE !
		  4'b000x : pfad_8 = (extract ? SRC2 : 32'hFFFF_FFFF) & BMASKE;	// EXT, the other form is for INS to get the mask
		  4'b0010 : pfad_8 = (SRC1 & ins_maske) | (SRC2 & ~ins_maske);	// INS ins_maske[] ? SRC1[] : SRC2[]
		  4'b0011 : pfad_8 = BWD[1] ? addsub_q : {16'h0,chk_low};
		  4'b0101 : pfad_8 = {24'hxx_xxxx,3'b000,ffs_out};
		  default : pfad_8 = {4'hx,push_psr,SRC1[15:0]};	// Opcode x'87-x'8F is used at CXP and therefore in Exception-Processing
		endcase
		
	// ++++++++++++++ Format 11 : Floating-Point Datapath  +++++++++++++++++++++++++++++++

	assign pfad_11 = (OPCODE[1:0] == 2'b01) ? 
						{((OPCODE[3:2] == 2'b11) ? 1'b0 : (SRC1[31] ^ OPCODE[2])),SRC1[30:0]}	// ABSf , NEGf + MOVf
											: DP_OUT;
	 
endmodule
