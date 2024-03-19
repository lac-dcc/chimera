// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	SP_FPU.v
//	Version:	2.0
//	History:	1.0 first release of 30 Mai 2015
//	Date:		14 August 2016
//
// Copyright (C) 2016 Udo Moeller
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
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	Testversion mit Pipeline Register in SFPU_ADDSUB **************
//
//	Modules contained in this file:
//	1. ADDSUB		Adder and Subtractor for 36 bit
//	2. SFPU_ADDSUB	Single Precision Floating Point Adder/Subtractor and Converter
//	3. SFPU_MUL		Single Precision Floating Point Multiplier
//	4. SP_FPU		Top Level of Single Precision Floating Point Unit
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. ADDSUB		Adder and Subtractor for 36 bit
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module ADDSUB (dataa, datab, add_sub, result);

	input	[35:0]	dataa,datab;
	input			add_sub;	// 1 = Addition , 0 = Subtraction
	output	[35:0]	result;
	
	assign result = dataa + (add_sub ? datab : ~datab) + {35'd0,~add_sub};
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. SFPU_ADDSUB	Single Precision Floating Point Adder/Subtractor and Converter
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SFPU_ADDSUB ( BCLK, SRC1, SRC2, NZEXP, BWD, SELECT, OUT, IOUT, CMPRES );

	input			BCLK;
	input	[31:0]	SRC1,SRC2;	// Input data
	input	 [2:1]	NZEXP;
	input	 [1:0]	BWD;		// size of integer
	input	 [3:0]	SELECT;

	output		[36:0]	OUT;	// the result
	output	reg [31:0]	IOUT;	// result of ROUNDFi/TRUNCFi/FLOORFi
	output	reg  [1:0]	CMPRES;

	// ++++++++++++++++++++++++++++++++++
	// MOViF : 1. step
	
	reg  [31:0]	movdat;
	wire [31:0]	movif;

	always @(BWD or SRC1)
		casex(BWD)
		  2'b00 : movdat = {{24{SRC1[7]}}, SRC1[7:0]};	// Byte
		  2'b01 : movdat = {{16{SRC1[15]}},SRC1[15:0]};	// Word
		default : movdat = 		SRC1[31:0];				// Double
		endcase
		
	assign movif = ({32{movdat[31]}} ^ movdat) + {31'h0,movdat[31]};
								// -2^31 is kept
	
	// ROUNDFi/TRUNCFi/FLOORFi : 1. step
	
	reg			ovflag,ovflag2;
	wire [8:0]	rexdiff,rexo;
	reg			rovfl;
	wire		minint;
	wire 		ganzklein;	// Flag for 0
	
	assign rexdiff = 9'h09D - {1'b0,SRC1[30:23]};	// 4..0 is the right shift value
	always @(posedge BCLK) rovfl <= (ovflag | ovflag2) & (SELECT[1:0] == 2'b11) & ~minint;
	assign ganzklein = (~rexdiff[8]	& (rexdiff[7:5] != 3'b000));	// 0 is implicit via SRC1[30:23]=0
	
	// Detection of Overflow
	assign rexo = ({1'b0,SRC1[30:23]} - {8'h3F,~BWD[1]});	// subtract B/W = 7F , D = 7E
	
	always @(BWD or rexo)
		casex (BWD)
		  2'b00 : ovflag = (~rexo[8] & (rexo[7:3] != 5'h0));	// Exponent 0..7 because of -128.4 => -128
		  2'b01 : ovflag = (~rexo[8] & (rexo[7:4] != 4'h0));	// Exponent 0..15 because of -128.4 => -128
		default : ovflag = (~rexo[8] & (rexo[7:5] != 3'h0));	// Exponent only 0..30 
		endcase
		
	assign minint = (SRC1 == 32'hCF00_0000) & BWD[1];	// detection of -2^31
	
	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB : 1. step : which operand ist bigger ? if required exchange
	// SUB/CMP : SRC2 - SRC1
	
	wire  [8:0]	exdiff;
	wire [23:0]	madiff;
	wire		switch,sign1,sign2;
	reg			variante;
	wire		vorz,addflag;
	wire [35:0]	result,result_sw,result_nosw;
	wire [24:0] value1,value2;
	wire		cmp_res;
	
	assign exdiff = {1'b0,SRC2[30:23]} - {1'b0,SRC1[30:23]};	// Difference of Exponents
	assign madiff = {1'b0,SRC2[22:0]}  - {1'b0,SRC1[22:0]};		// Difference of Mantissas
	
	// if exdiff = 0 the shifter to the right is not needed ! MUX at the end, ROUND/TRUNC/MOViF uses case 1
	always @(posedge BCLK) variante <= (exdiff[8:1] == 8'h00) | (exdiff == 9'h1FF) | SELECT[1];
	
// ++++++++++++++++++++++++++  1. case works on MOViF  +++++++++++++++++++++++++++++++++++++++

	assign switch = exdiff[8] | ((exdiff[7:0] == 8'h0) & madiff[23]);	// exchange ?

	assign value1 = exdiff[0] ? {1'b0,NZEXP[1],SRC1[22:0]} : {NZEXP[1],SRC1[22:0],1'b0};
	assign value2 = exdiff[0] ? {1'b0,NZEXP[2],SRC2[22:0]} : {NZEXP[2],SRC2[22:0],1'b0};
	
	// The Subtraction needs 3 Guard-Bits after LSB for rounding ! 36 Bit wide
	//												1
	ADDSUB	addsub_nosw	(.dataa({1'b0,SRC2[30:23],NZEXP[2],SRC2[22:0],3'b000}),	
						 .datab({9'h0,value1,2'b0}), .add_sub(addflag), 
						 .result(result_nosw) );

	ADDSUB	addsub_sw	(.dataa({1'b0,SRC1[30:23],NZEXP[1],SRC1[22:0],3'b000}),	
						 .datab({9'h0,value2,2'b0}), .add_sub(addflag), 
						 .result(result_sw) );

	assign result = switch ? result_sw : result_nosw;
	
	//	SRC2   SRC1	: switch = 0		SRC2   SRC1 : switch = 1
	//	  5  +   3  : +(5 + 3) =  8		  3  +   5  : +(5 + 3) =  8		SELECT[0] = 0
	//	  5  + (-3) : +(5 - 3) =  2		  3  + (-5) : -(5 - 3) = -2
	//	(-5) +   3  : -(5 - 3) = -2		(-3) +   5  : +(5 - 3) =  2
	//	(-5) + (-3) : -(5 + 3) = -8		(-3) + (-5) : -(5 + 3) = -8
	//	  5  -   3  : +(5 - 3) =  2		  3  -   5  : -(5 - 3) = -2		SELECT[0] = 1
	//	  5  - (-3) : +(5 + 3) =  8		  3  - (-5) : +(5 + 3) =  8
	//	(-5) -   3  : -(5 + 3) = -8		(-3) -   5  : -(5 + 3) = -8
	//	(-5) - (-3) : -(5 - 3) = -2		(-3) - (-5) : +(5 - 3) =  2
	
	assign sign1 = SRC1[31];
	assign sign2 = SRC2[31];
	
	assign vorz    = switch ? (SELECT[0] ^ sign1) : sign2;
	assign addflag = ~(SELECT[0] ^ (sign1 ^ sign2));

	// CMPF : 1. step : what happend if Invalid Operand occurs - no Flag update !
	
	assign cmp_res = (SRC1 == SRC2) | (~NZEXP[2] & ~NZEXP[1]);		// Z-Bit : SRC1=SRC2, +0.0 = -0.0
	always @(posedge BCLK) CMPRES <= {(~cmp_res & (switch ? ~sign1 : sign2)),cmp_res};	// see table above : N-Bit=1 if SRC1 > SRC2	

	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB : 3. step : prepare of Barrelshifter Left
	
	wire [31:0] blshift;
	reg   [9:0]	shiftl;
	wire		shift_16;
	reg	 [33:0] add_q;
	wire [31:0]	muxsrc2;
	wire  [1:0] inex;
	
	assign blshift = SELECT[1] ? movif : {result[26:0],5'h00};	// Feeding of MOViF

	always @(posedge BCLK) shiftl <= SELECT[1] ? 10'h09E : {1'b0,result[35:27]};	// MOViF

	assign shift_16 = (blshift[31:16] == 16'h0000);

	// In case of ADD the result bypasses the Barrelshifter left
	always @(posedge BCLK) add_q <= (muxsrc2[24] != result[27]) ? {result[35:3],(result[2:0] != 3'b000)}
																: {result[35:27],result[25:2],(result[1:0] != 2'b00)} ;
	
	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB : 4. step : Barrelshifter left for SUB and MOViF :
	
	wire		shift_8,shift_4,shift_2,shift_1;
	wire  [1:0] lsb_bl;
	wire [31:0]	blshifta,blshiftc,blshiftd,blshifte;
	reg	 [31:0] blshiftb;
	wire  [9:0]	expol;
	wire [36:0] out_v1;
	reg	  [1:0]	rinex;
	reg			zero,sign,select_v1;
	reg	  [4:3] pshift;
	
	assign blshifta = shift_16 ? {blshift[15:0],16'd0}	: blshift;
	assign shift_8 = (blshifta[31:24] == 8'h00);
	always @(posedge BCLK)
		   blshiftb <= shift_8 ? {blshifta[23:0],8'd0}	: blshifta;
	assign shift_4 = (blshiftb[31:28] == 4'h0);
	assign blshiftc = shift_4  ? {blshiftb[27:0],4'd0}	: blshiftb;
	assign shift_2 = (blshiftc[31:30] == 2'b00);
	assign blshiftd = shift_2  ? {blshiftc[29:0],2'd0}	: blshiftc;
	assign shift_1 = ~blshiftd[31];
	assign blshifte = shift_1  ? {blshiftd[30:0],1'b0}	: blshiftd;
	
	always @(posedge BCLK) pshift  <= {shift_16,shift_8};

	// Overflow at ROUNDFi/TRUNCFi/FLOORFi via overflow in exponent shown, SELECT[1] is then 1 !
	assign expol = (shiftl - {5'h00,pshift,shift_4,shift_2,shift_1}) | {1'b0,rovfl,8'd0};
		
	always @(posedge BCLK) rinex <= inex;
	// Inexact at ROUNDFi/TRUNCFi/FLOORFi : evaluation for all one level higher
	assign lsb_bl = (SELECT[1:0] == 2'b11) ? rinex : {blshifte[7],(blshifte[6:0] != 7'd0)};
	
	always @(posedge BCLK) zero <=  (~SELECT[1] & ~NZEXP[2] & ~NZEXP[1])	
								  | ((blshift == 32'h0) & ((~addflag & ~SELECT[1]) | (SELECT[1:0] == 2'b10)));
	
	always @(posedge BCLK) sign <= SELECT[1] ? movdat[31] : vorz;
	
	always @(posedge BCLK) select_v1 <= addflag & ~SELECT[1];
	
	assign out_v1 = select_v1 ? {zero,sign,1'b0,add_q}
							  : {zero,sign,expol,blshifte[30:8],lsb_bl};
	
// +++++++++++++++++++++++++  2. case works on ROUND/TRUNC/FLOOR  ++++++++++++++++++++++++++++++++++

	wire		vswitch;
	wire  [4:0]	shift1,shift2;
	wire  [8:0]	exdiff12;
	wire [23:0]	muxsrc1;
	wire [32:9]	pipe1;	// numbering special for Right Shifter
	wire  [4:0]	shift;
	
// the difference between SRC1 and SRC2 is bigger/equal 4:1 => no Barrelshifter after ADDSUB neccessary

	assign vswitch = exdiff[8];	// exchange ?
		
	assign shift1 = (exdiff[7:5] != 3'h0) ? 5'h1F : exdiff[4:0];
	assign exdiff12 = {1'b0,SRC1[30:23]} - {1'b0,SRC2[30:23]};	// caclulate already
	assign shift2 = (exdiff12[7:5] != 3'h0) ? 5'h1F : exdiff12[4:0];
	
	assign muxsrc2 = vswitch ? {SRC1[30:23],1'b1,SRC1[22:0]} : {SRC2[30:23],1'b1,SRC2[22:0]};	// Including exponent
	assign muxsrc1 = vswitch ? {NZEXP[2],SRC2[22:0]} : {NZEXP[1],SRC1[22:0]};

	assign pipe1 = SELECT[1] ? (ganzklein ? 24'h0 : {NZEXP[1],SRC1[22:0]}) : muxsrc1;	// Feeding in R.T.F.
		
	assign shift = SELECT[1] ? rexdiff[4:0] : (vswitch ? shift2 : shift1);
		
	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB + ROUND/TRUNC/FLOOR : 2. step : Barrelshifter to right -->
	
	wire [32:0] brshifta,brshiftb,brshiftc,brshiftd;
	wire [32:0] brshifte;	// last stage
	
	// 33322222222221111111111
	// 2109876543210987654321098765432-10
	// 1VVVVVVVVVVVVVVVVVVVVVVV0000000-00	// last 2 Bit for rounding
	
	assign brshifta = shift[4] ? {16'h0,pipe1[32:17],  (pipe1[16:9]   != 8'h00)}  : {pipe1,9'h0};
	assign brshiftb = shift[3] ? { 8'h0,brshifta[32:9],(brshifta[8:0] != 9'h000)} : brshifta;
	assign brshiftc = shift[2] ? { 4'h0,brshiftb[32:5],(brshiftb[4:0] != 5'h00)}  : brshiftb;
	assign brshiftd = shift[1] ? { 2'h0,brshiftc[32:3],(brshiftc[2:0] != 3'h0)}   : brshiftc;
	assign brshifte = shift[0] ? { 1'b0,brshiftd[32:2],(brshiftd[1:0] != 2'h0)}   : brshiftd;
	
	// ++++++++++++++++++++++++++++++++++
	// ROUNDFi/TRUNCFi/FLOORFi : 3. step : round to integer
	
	reg			car_ry;
	wire [32:0] iadder;
	
	assign inex = brshifte[1:0];		// Inexact-Flag-Data via multiplexer at the end
	
	always @(SELECT or sign1 or brshifte or inex or ganzklein)
		casex (SELECT[3:2])
		    2'b00 : car_ry = sign1 ^ ((brshifte[2:0] == 3'b110) | (inex == 2'b11));	// ROUNDLi
		    2'b1x : car_ry = sign1 ? (~ganzklein & (inex == 2'b00)) : 1'b0;	// +numbers like TRUNCLi, -numbers round to "-infinity"
		  default : car_ry = sign1;	// TRUNCLi , simple cut
		endcase

	assign iadder = (sign1 ? {2'b11,~brshifte[32:2]} : {2'b0,brshifte[32:2]}) + {32'h0,car_ry};
	
	always @(posedge BCLK) IOUT <= minint ? 32'h8000_0000 : iadder[31:0];

	always @(iadder or BWD or sign1)	// special overflow detection i.e. -129 bis -255 bei Byte
		casex (BWD)						// or 127.9 -> 128 = Fehler !
		  2'b00 : ovflag2 = (iadder[8]  != iadder[7]);	// Byte
		  2'b01 : ovflag2 = (iadder[16] != iadder[15]);	// Word
		default : ovflag2 = (iadder[32] != iadder[31]);	// Double
		endcase
		
	// ++++++++++++++++++++++++++++++++++
	// only ADD/SUB : 3. step : Add or Subtract
	// the modul ADDSUB integrates the carry from the mantissa : 35 Bit
	
	wire		lsb;
	wire [35:0]	vresult;
	wire  [7:0]	eminus1;
	wire [33:0] vadd_q,vsub_q;
	wire		vzero;
	reg	 [36:0] out_v0;
	
	assign lsb = (brshifte[6:0] != 7'h00);

	// Adder-Definition : "0"(8 Bit Exponent)"1"(23 Bit Mantissa)"000"

	ADDSUB	addsub_v	(.dataa({1'b0,muxsrc2,3'b000}),
						 .datab({9'h0,brshifte[32:7],lsb}), .add_sub(addflag), 
						 .result(vresult) );
						
	assign eminus1 = muxsrc2[31:24] - 8'h01;	// a greater Underflow can not exist, because minimal Exponent = 0..01

	// Case ADD : Bit 23 : LSB of exponent
	assign vadd_q = (muxsrc2[24] != vresult[27]) ? {vresult[35:3],(vresult[2:0] != 3'b000)}
												 : {vresult[35:27],vresult[25:2],(vresult[1:0] != 2'b00)} ;

	// Case SUB : Bit 26 : "hidden" MSB of mantissa
	assign vsub_q = vresult[26] ? {vresult[35:27],     vresult[25:2],(vresult[1:0] != 2'b00)}	// like the vadd_q "0" case
							    : {vresult[35],eminus1,vresult[24:0]} ;
							   
	// SELECT[1] has here no meaning
	assign vzero = (vresult[26:0] == 27'h0);	// only if "-" can be the result 0

	always @(posedge BCLK) out_v0 <= addflag ? { 1'b0,vorz,1'b0,vadd_q}
											 : {vzero,vorz,1'b0,vsub_q} ;
	
	assign OUT = variante ? out_v1 : out_v0;	// Last multiplexer
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. SFPU_MUL		Single Precision Floating Point Multiplier
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SFPU_MUL ( BCLK, SRC1, SRC2, MRESULT, NZEXP, OUT);

	input			BCLK;
	input	[31:0]	SRC1,SRC2;	// only exponent of input data used
	input	[47:0]	MRESULT;
	input	 [2:1]	NZEXP;		// Flags of input data
	
	output	reg	[36:0]	OUT;		// The result

	wire  [9:0] exponent,expoh,expol;
	wire  [1:0] restlow,resthigh;
	wire 		zero,sign,orlow;
		
	assign zero = 	~NZEXP[2] | ~NZEXP[1];	// one of both NULL -> NULL is the result
	assign sign = 	(SRC1[31] ^ SRC2[31]) & ~zero;
	assign orlow = 	(MRESULT[21:0] != 22'b0);
	
	assign restlow  = {MRESULT[22],orlow};
	assign resthigh = {MRESULT[23],(MRESULT[22] | orlow)};
	
	assign exponent = {2'b00,SRC1[30:23]} + {2'b00,SRC2[30:23]};
	assign expoh    = exponent - 10'h07E;
	assign expol	= exponent - 10'h07F;	// for MSB if MRESULT=0
	
	always @(posedge BCLK) OUT <= MRESULT[47] ? {zero,sign,expoh,MRESULT[46:24],resthigh}
											  : {zero,sign,expol,MRESULT[45:23],restlow};
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	4. SP_FPU		Top Level of Single Precision Floating Point Unit
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SP_FPU (BCLK, START, OPCODE, SRC1, SRC2, FSR, MRESULT, BWD, FL, FP_OUT, I_OUT, TT_SP, SP_CMP, SP_MUX, LD_FSR, UP_SP);

	input			BCLK;		// is not used !
	input			START;
	input	 [7:0]	OPCODE;	
	input	[31:0]	SRC1,SRC2;	// Input data
	input	 [8:3]	FSR;		// Floating Point Status Register
	input	[47:0]	MRESULT;	// Multiplier result
	input	 [1:0]	BWD;		// Size of integer
	input			FL;

	output	[31:0]	FP_OUT,I_OUT;	// The results
	output	 [4:0]	TT_SP;		// Trap-Type
	output	 [2:0]	SP_CMP;		// CMPF result
	output			SP_MUX,LD_FSR;
	output	reg		UP_SP;

	reg		 [2:0]	tt;
	reg		 [3:0]	select;
	reg				nan;
	reg				car_ry;

	wire	[36:0]	mulout,addout,fpout;
	wire	 [2:1]	nzexp;
	wire	[34:2]	rund;		// Indexnumbers like xxxout
	wire			overflow,underflow,inexact;
	wire			op_cmp;
	wire			nan_1,nan_2;
	
	// Control of datapath 

	always @(OPCODE)
		casex (OPCODE)
		  8'b1011_0000 : select = 4'b1000;	// 0 0 0 :	ADDF	Shifter are reused
		  8'b1011_0100 : select = 4'b1001;	// 0 0 1 :	SUBF
		  8'b1001_000x : select = 4'b1010;	// 0 1 0 :	MOViF
		  8'b1001_100x : select = 4'b1011;	// 0 1 1 :	ROUNDFi
		  8'b1001_101x : select = 4'b1011;	// 0 1 1 :	TRUNCFi
		  8'b1001_111x : select = 4'b1011;	// 0 1 1 :	FLOORFi
		  8'b1011_0010 : select = 4'b1001;	// 0 0 1 :	CMPF
		  8'b1011_1100 : select = 4'b1100;	// 1 x x :	MULF
		  default      : select = 4'b0;
		endcase

	assign SP_MUX = select[3] & (select[1:0] != 2'b11) & FL;	// Output multiplexer
	
	assign LD_FSR = (OPCODE[7:4] == 4'h9) & (OPCODE[3:1] == 3'b001);	// LFSR does only Double (according datasheet NS32016)
	always @(posedge BCLK) UP_SP = select[3] & FL & START;				// All FPU opcodes of SP_FPU, all are using 2 Clock
	assign op_cmp = (OPCODE == 8'hB2) & FL;
	
	// SRCFLAGS
	
	assign nzexp[2]	= (SRC2[30:23] != 8'd0);		// only exponent 0 ,denormalized Number => NAN !
	assign nzexp[1] = (SRC1[30:23] != 8'd0);		// only exponent 0 ,denormalized Number => NAN !
	assign nan_2 	= (SRC2[30:23] == 8'hFF) | (~nzexp[2] & (SRC2[22:0] != 23'd0));	// NAN
	assign nan_1 	= (SRC1[30:23] == 8'hFF) | (~nzexp[1] & (SRC1[22:0] != 23'd0));	// NAN

	always @(posedge BCLK) nan <= (select[1:0] == 2'b11) ? nan_1 : (~select[1] & (nan_2 | nan_1));
	
	// 001 : ADDF,... + 011 : CMPF
	SFPU_ADDSUB IADDSUB	( .BCLK(BCLK), .SRC1(SRC1), .SRC2(SRC2), .NZEXP(nzexp), .BWD(BWD),
						  .SELECT({OPCODE[2:1],select[1:0]}), .OUT(addout), .IOUT(I_OUT), .CMPRES(SP_CMP[1:0]) );
					
	// 100 : MULF
	SFPU_MUL IMUL ( .BCLK(BCLK), .SRC1(SRC1), .SRC2(SRC2), .MRESULT(MRESULT), .OUT(mulout), .NZEXP(nzexp) );
					
	// FP - Pfad : selection of result and rounding :

	assign fpout = (OPCODE[5] & OPCODE[3]) ? mulout : addout;
	
	always @(FSR or fpout)	// calculate Carry according rounding mode, fpout[35] = sign bit
		casex (FSR[8:7])
		  2'b00 : car_ry = ((fpout[1:0] == 2'b10) & fpout[2]) | (fpout[1:0] == 2'b11);	// round to nearest
		  2'b10 : car_ry = ~fpout[35] & (fpout[1:0] != 2'b00);	// round to positiv infinity
		  2'b11 : car_ry =  fpout[35] & (fpout[1:0] != 2'b00);	// round to negativ infinity
		default : car_ry = 1'b0;								// round to zero
		endcase

	assign rund = {fpout[34:2]} + {32'h0,car_ry};
	
	// Detection of Overflow, Underflow and Inexact : epxonent is [34:25] = 10 Bits
	assign overflow  = ~rund[34] & (rund[33] | (rund[32:25] == 8'hFF));
	assign underflow = (rund[34] | (rund[33:25] == 9'h0)) & ~fpout[36];	// Zero-Flag
	assign inexact   = (fpout[1:0] != 2'b00);
	
	// CMPF can have no other error except NAN 
	always @(nan or op_cmp or overflow or underflow or inexact or FSR)
		casex ({nan,op_cmp,overflow,FSR[3],underflow,FSR[5],inexact})
			7'b1xxxxxx : tt = 3'b101;	// Invalid operation
			7'b001xxxx : tt = 3'b010;	// Overflow
			7'b00011xx : tt = 3'b001;	// Underflow
			7'b0000011 : tt = 3'b110;	// Inexact Result
			default	   : tt = 3'b000;	// no error
		endcase

	assign TT_SP = {(inexact & ~op_cmp),(underflow & ~op_cmp),tt};
	assign SP_CMP[2] = nan;	
	
	// Underflow Special case and force ZERO 
	assign FP_OUT = (underflow | fpout[36]) ? 32'd0 : {fpout[35],rund[32:2]};
	
endmodule
