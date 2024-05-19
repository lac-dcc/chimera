// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	DP_FPU.v
//	Version:	3.0
//	History:	2.0 of 14 August 2016
//				1.0 of 30 Mai 2015
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
//	1. PREPDATA  	Prepare data for the big multiplier
//	2. BCDADDER  	4 bit BCD adder
//	3. DFPU_BCD		Binary coded decimal (BCD) adder and subtractor
//	4. DFPU_ADDSUB	Double precision floating point adder and subtractor
//	5. DFPU_MISC	Double precision floating point miscellaneous operations 
//	6. DFPU_MUL		Double precision floating point multiplier
//	7. SCANDIG		Scan digit for leading one
//	8. DIVI_PREP	Prepare data for the divider
//	9. DFPU_DIV		The divider for all divide opcodes : double, single and integer
// 10. DP_LOGIK		Control logic and result path for different functions
// 11. DP_FPU		Top level of long operations datapath
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. PREPDATA  	Prepare data for the big multiplier
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module PREPDATA ( START, MEI, DFLOAT, BWD, SRC1, SRC2,
				  MSD_1, MSD_2, LSD_1, LSD_2, LOAD_MSD, LOAD_LSD1, LOAD_LSD2 );

	input	 [1:0]	START;
	input			MEI,DFLOAT;
	input	 [1:0]	BWD;
	input	[31:0]	SRC1,SRC2;
	
	output [52:32]	MSD_1,MSD_2;
	output	[31:0]	LSD_1,LSD_2;
	output			LOAD_MSD,LOAD_LSD1,LOAD_LSD2;

	reg		[31:0]	LSD_1,LSD_2;
	
	assign MSD_1 = MEI ? 21'h0 : {1'b1,SRC1[19:0]};	  
	assign MSD_2 = MEI ? 21'h0 : {1'b1,SRC2[19:0]};
	
	always @(MEI or BWD or SRC1)
		casex ({MEI,BWD})
		  3'b100 : LSD_1 = {24'h000000,SRC1[7:0]};
		  3'b101 : LSD_1 = {16'h0000,SRC1[15:0]};
		 default : LSD_1 = SRC1;
		endcase
	
	always @(MEI or BWD or SRC2)
		casex ({MEI,BWD})
		  3'b100 : LSD_2 = {24'h000000,SRC2[7:0]};
		  3'b101 : LSD_2 = {16'h0000,SRC2[15:0]};
		 default : LSD_2 = SRC2;
		endcase

	assign LOAD_MSD  = (START[0] & MEI) | (START[0] & DFLOAT);	// 1. step data load at DFLOAT
	assign LOAD_LSD1 = (START[0] & MEI) | (START[1] & DFLOAT);	// 2. step execute at DFLOAT
	assign LOAD_LSD2 = (START[1] & MEI) | (START[1] & DFLOAT);	// 2. step execute at DFLOAT
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. BCDADDER  	4 bit BCD adder
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module BCDADDER ( A_IN, B_IN, CY_IN, SUBP, OUT, CY_OUT );

	input	 [3:0]	A_IN,B_IN;
	input			CY_IN;
	input			SUBP;
	
	output	 [3:0]	OUT;
	output			CY_OUT;
	
	reg		 [4:0]	data;
	wire	 [4:0]	result;
	wire			over;
	
	always @(B_IN)
		case (B_IN)
			4'h0 : data = 5'h00;
			4'h1 : data = 5'h1F;
			4'h2 : data = 5'h1E;
			4'h3 : data = 5'h1D;
			4'h4 : data = 5'h1C;
			4'h5 : data = 5'h1B;
			4'h6 : data = 5'h1A;
			4'h7 : data = 5'h19;
			4'h8 : data = 5'h18;
			4'h9 : data = 5'h17;
		 default : data = 5'hxx;
		endcase

	assign result = {1'b0,A_IN} + (SUBP ? data : {1'b0,B_IN}) + {{4{SUBP & CY_IN}},CY_IN};
	
	assign over = result[4] | (result[3] & (result[2] | result[1]));
	
								//		if result<0 : -6				if result>9 : -10
	assign OUT = result[3:0] - (SUBP ? {1'b0,result[4],result[4],1'b0} : {over,1'b0,over,1'b0});

	assign CY_OUT = SUBP ? result[4] : over;
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	3. DFPU_BCD		Binary coded decimal (BCD) adder and subtractor
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DFPU_BCD ( BCLK, BRESET, START, DO_BCD, BWD, SRC1, SRC2, CY_IN, SUBP, BCD_Q, CY_OUT, BCD_DONE );

	// Byte : 3 cycles in shortest case REG-REG, Word : 4 cycles and Double : 6 cycles
	input			BCLK;
	input			BRESET;
	input			START;	// START[1]
	input			DO_BCD;	// BCD Opcode is valid
	input	 [1:0]	BWD;
	input	[31:0]	SRC1,SRC2;	// Source , Destination, data is stable during operation
	input			CY_IN;	// comes from PSR
	input			SUBP;	// SUBP = 1 : SUBP , 0 : ADDP
	
	output	reg	[31:0]	BCD_Q;
	output	reg		CY_OUT;	// went to PSR if DONE is valid
	output			BCD_DONE;
	
	reg				run_bcd;
	reg		 [1:0]	byte_cou;
	reg		[15:0]	datain;
	
	wire	 [7:0]	result;
	wire			carry,carry_lsd,carry_msd;
	
	// START :     _/---\________________
	// byte_cou :  xxxxxx 0 x 1 x 2 x 3 x
	// BCD_DONE :  _____/---\____________  if BWD = Byte
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) run_bcd <= 1'b0;
		  else
			run_bcd <= (START & DO_BCD & (BWD != 2'd0)) | (run_bcd & (BWD != byte_cou));
	
	always @(posedge BCLK) byte_cou <= START ? 2'd1 : byte_cou + {1'b0,run_bcd};
	
	always @(*)
		casex ({START,byte_cou})
		  3'b1_xx : datain = {SRC1[7:0],  SRC2[7:0]};
		  3'b0_0x : datain = {SRC1[15:8], SRC2[15:8]};
		  3'b0_10 : datain = {SRC1[23:16],SRC2[23:16]};
		  3'b0_11 : datain = {SRC1[31:24],SRC2[31:24]};
		endcase
		
	assign carry = START ? CY_IN : CY_OUT;
	
	BCDADDER	lsd_inst ( .A_IN(datain[3:0]), .B_IN(datain[11:8]), .CY_IN(carry), .SUBP(SUBP),
						   .OUT(result[3:0]), .CY_OUT(carry_lsd) );
						   
	BCDADDER	msd_inst ( .A_IN(datain[7:4]), .B_IN(datain[15:12]), .CY_IN(carry_lsd), .SUBP(SUBP),
						   .OUT(result[7:4]), .CY_OUT(carry_msd) );
						   
	always @(posedge BCLK) CY_OUT <= carry_msd;
	
	always @(posedge BCLK) if (START)			 BCD_Q[7:0]   <= result;
	always @(posedge BCLK) if (~byte_cou[1])	 BCD_Q[15:8]  <= result;
	always @(posedge BCLK) if (byte_cou == 2'd2) BCD_Q[23:16] <= result;
	always @(posedge BCLK) if (byte_cou == 2'd3) BCD_Q[31:24] <= result;
	
	assign BCD_DONE = (START & DO_BCD & (BWD == 2'd0)) | (run_bcd & (BWD == byte_cou));

endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	4. DFPU_ADDSUB	Double precision floating point adder and subtractor
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DFPU_ADDSUB ( BCLK, START, SRC1, SRC2, MAN1, MAN2, SRCFLAGS, BWD, SELECT, OUT, IOUT, CMPRES );

	input 			BCLK;
	input	 [1:0]	START;
	input	[31:0]	SRC1,SRC2;	// The input data
	input	[20:0]	MAN1,MAN2;
	input	 [5:0]	SRCFLAGS;	// NAN, ZERO and SIGN of operands
	input	 [1:0]	BWD;		// size of integer
	input	 [3:0]	SELECT;		// upper 2 bits : R.T.F. code
	
	output	[69:0]	OUT;
	output	[31:0]	IOUT;		// result of ROUNDLi/TRUNCLi/FLOORLi = R.T.F.
	output	[1:0]	CMPRES;

	reg		[69:0]	outreg;
	reg		[31:0]	IOUT;

	// MOViL   : 2 cycles
	// ROUNDLi : 3 cycles (+TRUNC & FLOOR)
	// ADD/SUB : 4 cycles
	// CMP     : 2 cycles
			
	// ++++++++++++++++++++++++++++++++++
	// MOViL : 1. Pipeline stage : needs 3 cycles
	
	reg  [31:0]	movdat;
	reg	 [31:0]	movif;
	reg			sign_movif;

	always @(BWD or SRC1)
		casex(BWD)
		  2'b00 : movdat = {{24{SRC1[7]}}, SRC1[7:0]};	// Byte
		  2'b01 : movdat = {{16{SRC1[15]}},SRC1[15:0]};	// Word
		default : movdat = 		SRC1[31:0];				// Double
		endcase
	
	// This  pipeline stage for better timing 
	always @(posedge BCLK) movif <= ({32{movdat[31]}} ^ movdat) + {31'h0,movdat[31]};	// -2^31 is kept !
	
	always @(posedge BCLK) sign_movif <= movdat[31];
	
	// ROUNDLi/TRUNCLi/FLOORLi : 1. pipeline stage : can Opcode-Decoder deliver direct the 64 bit operand ? From register "yes"
	
	reg			ovflag,ovflag2;
	reg			rovfl;
	reg			minint;
	wire [11:0]	rexdiff,rexo;
	wire 		ganzklein;	// Flag for 0
	
	assign rexdiff = 12'h41D - {1'b0,SRC1[30:20]};	// 4..0 is the right shift value : like Single FP same value space
	
	// ovflag2 at the end of rounding : Check for Overflow
	always @(posedge BCLK) rovfl <= (ovflag | ovflag2) & (SELECT[1:0] == 2'b11) & ~minint;
	
	// a large positiv difference is a very small number :
	assign ganzklein = (~rexdiff[11] & (rexdiff[10:5] != 6'b0));	// 0 is implicit via SRC1[30:20]=0
	
	// Detection of Overflow
	assign rexo = ({1'b0,SRC1[30:20]} - {11'h1FF,~BWD[1]});	// subtract B/W = 3FF , D = 3FE
	
	always @(BWD or rexo)	// 0 ist in implicitly
		casex (BWD)
		  2'b00 : ovflag = (~rexo[11] & (rexo[10:3] != 8'h0));	// Exponent 0..7 because -128.4 => -128
		  2'b01 : ovflag = (~rexo[11] & (rexo[10:4] != 7'h0));	// Exponent 0..15 look above
		default : ovflag = (~rexo[11] & (rexo[10:5] != 6'h0));	// but Exponent only 0..30
		endcase
		
	always @(posedge BCLK)
		if (START[1]) minint <= (SRC1 == 32'hC1E0_0000) & (SRC2 == 32'h0) & BWD[1];	// detection of -2^31
	
	// ++++++++++++++++++++++++++++++++++++
	// ADD/SUB : 1. Pipeline Stage : which operand ist bigger ? Exchange if neccessary
	// SUB/CMP : SRC2 - SRC1
	
	reg				ex_null,ma_null,ex_msb,ma_msb;
	reg		[10:0]	expo1,expo2;
	wire	[11:0]	exdiff,exdiff12;
	wire	[20:0]	madiff;
	wire			switch,nan,sign,sign1,sign2;
	reg		 [5:0]	shift1,shift2;

		// Pipeline register :
	reg		[63:0]	muxsrc2;
	wire	[55:3]	pipe1;	// Nummbers for right shifter
	wire 	 [5:0]	shift;
	reg		 [2:0]	pshift;
	reg				vorz,addflag;

	wire	[52:0]	muxsrc1;
	wire	[32:0]	lowdiff;
	
	assign nan = (SELECT[1:0] == 2'b11) ? SRCFLAGS[1] : (~SELECT[1] & (SRCFLAGS[3] | SRCFLAGS[1]));	// used at the end
	
	assign exdiff	= {1'b0,SRC2[30:20]} - {1'b0,SRC1[30:20]};	// Difference of Exponents
	assign madiff	= {1'b0,SRC2[19:0]}  - {1'b0,SRC1[19:0]};	// Difference of Mantissa 
	assign exdiff12 = {1'b0,SRC1[30:20]} - {1'b0,SRC2[30:20]};	// Diff. Exponents exchanged
	
	always @(posedge BCLK)
		if (START[0])
		  begin
			ex_null <= (exdiff[10:0] == 11'h0);
			ma_null <= (madiff[19:0] == 20'h0);
			ex_msb  <= exdiff[11];
			ma_msb  <= madiff[20];
			shift1  <= (exdiff[10:6]   != 5'h0) ? 6'h3F : exdiff[5:0];
			shift2  <= (exdiff12[10:6] != 5'h0) ? 6'h3F : exdiff12[5:0];
			expo1	<= SRC1[30:20];
			expo2	<= SRC2[30:20];
		  end
			
	assign lowdiff = {1'b0,SRC2} - {1'b0,SRC1};	// LSD compare
	
	assign switch = ex_msb | (ex_null & (ma_msb | (ma_null & lowdiff[32])));	// exchange ?

	assign muxsrc1 = switch ? {MAN2,SRC2} : {MAN1,SRC1};

	assign pipe1 = SELECT[1] ? (ganzklein ? 53'd0  : {1'b1,SRC1[19:0],SRC2}) : muxsrc1;	// feeding of R.T.F.
	assign shift = SELECT[1] ? {1'b0,rexdiff[4:0]} : (switch ? shift2 : shift1);

	always @(posedge BCLK)	// Pipeline Reg
	  begin
		muxsrc2 <= switch  ? {expo1,MAN1,SRC1}   : {expo2,MAN2,SRC2};	// Incl. Exponent & "1" of mantisse
		pshift  <= shift[2:0];
	  end
	
	//	SRC2   SRC1	: switch = 0		SRC2   SRC1 : switch = 1
	//	  5  +   3  : +(5 + 3) =  8		  3  +   5  : +(5 + 3) =  8		SELECT[0] = 0
	//	  5  + (-3) : +(5 - 3) =  2		  3  + (-5) : -(5 - 3) = -2
	//	(-5) +   3  : -(5 - 3) = -2		(-3) +   5  : +(5 - 3) =  2
	//	(-5) + (-3) : -(5 + 3) = -8		(-3) + (-5) : -(5 + 3) = -8
	//	  5  -   3  : +(5 - 3) =  2		  3  -   5  : -(5 - 3) = -2		SELECT[0] = 1
	//	  5  - (-3) : +(5 + 3) =  8		  3  - (-5) : +(5 + 3) =  8
	//	(-5) -   3  : -(5 + 3) = -8		(-3) -   5  : -(5 + 3) = -8
	//	(-5) - (-3) : -(5 - 3) = -2		(-3) - (-5) : +(5 - 3) =  2
	
	assign sign1 = SRCFLAGS[4];
	assign sign2 = SRCFLAGS[5];
	
	always @(posedge BCLK)	// Pipeline Reg
	  begin
		vorz 	<= switch ? (SELECT[0] ^ sign1) : sign2;
		addflag <= ~(SELECT[0] ^ (sign1 ^ sign2));
	  end
	
	// CMPF : 1. Pipeline Stage : first result : is stored one level higer in Reg
	
	assign CMPRES[1] = ~CMPRES[0] & (switch ? ~sign1 : sign2);	// look table above
	assign CMPRES[0] = (ex_null & ma_null & (sign1 == sign2) & (lowdiff == 33'h0)) | (SRCFLAGS[2] & SRCFLAGS[0]);
	
	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB + ROUND/TRUNC : 2. Step : Barrelshifter to the right -->
	
	wire [55:0] brshifta,brshiftb,brshiftd,brshifte,brshiftf;
	reg	 [55:0] brshiftc;
	
	// 5..33322222222221111111111	is this picture still correct ? Took over from Single FP
	// 5..2109876543210987654321098765432-10
	// 1..VVVVVVVVVVVVVVVVVVVVVVVV0000000-00	// last 2 bit for rounding
	
	assign brshifta  =  shift[5] ? {32'h0,   pipe1[55:33],   (pipe1[32:3] != 30'h0)} : {pipe1,3'h0};
	assign brshiftb  =  shift[4] ? {16'h0,brshifta[55:17],(brshifta[16:0] != 17'h0)} : brshifta;
	always @(posedge BCLK)
		   brshiftc <=  shift[3] ? { 8'h0, brshiftb[55:9], (brshiftb[8:0] !=  9'h0)} : brshiftb;
	assign brshiftd  = pshift[2] ? { 4'h0, brshiftc[55:5], (brshiftc[4:0] !=  5'h0)} : brshiftc;
	assign brshifte  = pshift[1] ? { 2'h0, brshiftd[55:3], (brshiftd[2:0] !=  3'h0)} : brshiftd;
	assign brshiftf  = pshift[0] ? { 1'b0, brshifte[55:2], (brshifte[1:0] !=  2'h0)} : brshifte;
	
	// ++++++++++++++++++++++++++++++++++
	// ROUNDLi/TRUNCLi/FLOORLi : 3. Step : round to Integer
	
	reg			car_ry;
	wire  [1:0] inex;
	wire [32:0] iadder;
	wire		restbits;
	
	assign restbits = (brshiftf[23:0] != 24'h0);
	assign inex     = {brshiftf[24],restbits};		// Inexact-Flag-Data transfered to multiplexer at the end
	
	always @(SELECT or sign1 or brshiftf or restbits or inex or ganzklein)
		casex (SELECT[3:2])
		    2'b00 : car_ry = sign1 ^ (((brshiftf[25:24] == 2'b11) & ~restbits) | (inex == 2'b11));	// ROUNDLi
		    2'b1x : car_ry = sign1 ? (~ganzklein & (inex == 2'b00)) : 1'b0;	// +numbers like TRUNCLi, -numbers to "-infinity" round
		  default : car_ry = sign1;	// TRUNCLi , simple cut off
		endcase

	assign iadder = (sign1 ? {2'b11,~brshiftf[55:25]} : {2'b0,brshiftf[55:25]}) + {32'h0,car_ry};
	
	always @(posedge BCLK) IOUT <= minint ? 32'h8000_0000 : iadder[31:0];

	always @(iadder or BWD or sign1)	// special overflow detection i.e. -129 to -255 at Byte
		casex (BWD)						// or 127.9 -> 128 = error !
		  2'b00 : ovflag2 = (iadder[8]  != iadder[7]);	// Byte
		  2'b01 : ovflag2 = (iadder[16] != iadder[15]);	// Word
		default : ovflag2 = (iadder[32] != iadder[31]);	// Double
		endcase
		
	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB : 3. Step : Addition or Subtraction
	
	wire	[67:0]	result;
	wire	[55:0]	blshifti;
	wire	[12:0]	shiftl;
	wire			shift_32;
	wire	[65:0]	add_q;
	
	// The central adder : the subtraction needs 3 Guard-Bits after LSB for correct rounding
	assign result = {1'b0,muxsrc2,3'b000} + (addflag ? {12'h0,brshiftf} : {12'hFFF,~brshiftf}) + {67'd0,~addflag};
						
	assign blshifti = SELECT[1] ? {movif,24'h0} : result[55:0];	// Feeding of MOViL, comes from Register

	assign shiftl = SELECT[1] ? 13'h041E : {1'b0,result[67:56]};	// MOViL
		
	assign shift_32 = (blshifti[55:24] == 32'h0);
	
	// In case of ADD the result bypasses the barrelshifter : LSB of exponent has changed
	assign add_q = (muxsrc2[53] != result[56]) ? {result[67:3],(result[2:0] != 3'b000)}
											   : {result[67:56],result[54:2],(result[1:0] != 2'b00)} ;
	
	// ++++++++++++++++++++++++++++++++++
	// ADD/SUB : 4. Step : Barrelshifter left for SUB and MOViF :
	
	wire		shift_16,shift_8,shift_4,shift_2,shift_1,zero;
	wire  [1:0] lsb_bl;
	wire [55:0]	blshifta,blshiftb,blshiftc,blshiftd,blshifte,blshiftf;
	wire [12:0]	expol;
	
	assign blshifta = shift_32 ? {blshifti[23:0],32'h0} : blshifti;
	assign shift_16 = (blshifta[55:40] == 16'h0);
	assign blshiftb = shift_16 ? {blshifta[39:0],16'h0}	: blshifta;
	assign shift_8  = (blshiftb[55:48] == 8'h00);
	assign blshiftc = shift_8  ? {blshiftb[47:0],8'h0} 	: blshiftb;
	assign shift_4  = (blshiftc[55:52] == 4'h0);
	assign blshiftd = shift_4  ? {blshiftc[51:0],4'h0} 	: blshiftc;
	assign shift_2  = (blshiftd[55:54] == 2'b00);
	assign blshifte = shift_2  ? {blshiftd[53:0],2'b0} 	: blshiftd;
	assign shift_1  = ~blshifte[55];
	assign blshiftf = shift_1  ? {blshifte[54:0],1'b0} 	: blshifte;
	
	// Overflow at ROUNDLi/TRUNCLi/FLOORLi is shown in overflow of exponent , SELECT[1] is then 1
	assign expol = shiftl - {7'h00,shift_32,shift_16,shift_8,shift_4,shift_2,shift_1};
		
	// Inexact at ROUNDLi/TRUNCLi/FLOORLi : evaluation for all one level higher
	assign lsb_bl = (SELECT == 2'b11) ? inex : {blshiftf[2],(blshiftf[1:0] != 2'b0)};
	
	assign zero =  (~SELECT[1] & SRCFLAGS[2] & SRCFLAGS[0])
				 | ((blshifti == 56'h0) & ((~addflag & ~SELECT[1]) | (SELECT[1:0] == 2'b10)));
	
	assign sign = SELECT[1] ? sign_movif : (vorz & ~zero);	// sign for MOViL
	
	// 2. Pipeline register for ADD , SUB and MOViL 
	always @(posedge BCLK)
		outreg <= (addflag & ~SELECT[1]) ? {nan,zero,sign,1'b0,add_q}
										 : {nan,zero,sign,expol,blshiftf[54:3],lsb_bl};
										
	// ++++++++++++++++++++++++++++++++++
	
	assign OUT = {outreg[69:67],(rovfl ? 2'b01 : outreg[66:65]),outreg[64:0]};
		
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	5. DFPU_MISC	Double precision floating point miscellaneous operations 
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DFPU_MISC ( BCLK, START, SRC1, SRC2, MAN2, SRCFLAGS, MODE, OUT );

	input			BCLK;
	input 	 [1:0]	START;
	input	[31:0]	SRC1,SRC2;
	input	[19:0]	MAN2;
	input	 [5:0]	SRCFLAGS;
	input	 [3:0]	MODE;
	output	[69:0]	OUT;
	
	reg		[69:0]	OUT;
	reg		[63:0]	daten;
	
	wire			sign;
	wire	[12:0]	lexpo,sexpo;
	wire	[69:0]	scalb_res,logb_res,fl_lf;
	
	always @(posedge BCLK) if (START[1]) daten <= {SRC1,SRC2};
	assign sign = daten[63];
	
	// +++++++++++++++++++++++++++ MOVFL and MOVLF +++++++++++++++++++++++++++++++++++
	
	assign lexpo = {5'b0,daten[62:55]} + 13'h0380;	// -7F + 3FF
	
	assign sexpo = (daten[62:52] > 11'h47E) ? 13'h0FFF 
											: ((daten[62:52] < 11'h381) ? 13'h0 : {2'b0,{4{daten[62]}},daten[58:52]});

	assign fl_lf = MODE[0] ? {SRCFLAGS[1:0],sign,lexpo,daten[54:32],31'h0}										// MOVFL
						   : {SRCFLAGS[1:0],sign,sexpo,daten[51:29],28'h0,daten[29:28],(daten[27:0] != 28'h0)};	// MOVLF
	
	// +++++++++++++++++++++++++++  LOGBf  +++++++++++++++++++++++++++++++++++
	
	wire	 [9:0]	sel_data,unbiased,shift_l8,shift_l4,shift_l2;
	wire	 [8:0]	shift_l;
	wire			posi_8,posi_4,posi_2,posi_1;
	wire	 [4:0]	calc_exp;
	wire	 [6:0]	logb_exp;
	
	assign sel_data  = MODE[1] ? {{3{~daten[62]}},daten[61:55]} : daten[61:52];
	assign unbiased  = daten[62] ? (sel_data + 10'h001) : ~sel_data;

	// detection of leading "1"
	assign posi_8	= (unbiased[9:2] == 8'h00);
	assign shift_l8 = posi_8 ? {unbiased[1:0],8'h00} : unbiased;
	assign posi_4	= (shift_l8[9:6] == 4'h0);
	assign shift_l4 = posi_4 ? {shift_l8[5:0],4'h0}  : shift_l8;
	assign posi_2	= (shift_l4[9:8] == 2'b00);
	assign shift_l2 = posi_2 ? {shift_l4[7:0],2'b0}  : shift_l4;
	assign posi_1	= ~shift_l2[9];
	assign shift_l	= posi_1 ? {shift_l2[7:0],1'b0}  : shift_l2[8:0];	// top bit is hidden "1"
	
	assign calc_exp = 5'h08 - {1'b0,posi_8,posi_4,posi_2,posi_1};	// Minimum is "F" = for exponent +/-1 <=> 2^0
	
	// exponent is set one level higher for F and L
	assign logb_exp = MODE[1] ? {{4{~calc_exp[4]}},{3{calc_exp[4]}}} : {~calc_exp[4],{6{calc_exp[4]}}};
	
	assign logb_res = {SRCFLAGS[1],1'b0,~daten[62],2'b00,logb_exp,calc_exp[3:0],shift_l,45'h0};
	
	// ++++++++++++++++++++++++  SCALBf  ++++++++++++++++++++++++++++++++++
	
	reg		 [3:0]	rshift;
	reg		[10:0]	shf_r0,dexpo;	// dexpo = Exponent Destination
	reg				huge;
	reg				svorz,dvorz;
	
	wire	[10:0]	shf_r1,shf_r2,shf_r4,shf_r8;
	wire	[12:0]	addexp,newexp,finexp;
	wire			nan;
	
	always @(posedge BCLK)	// 2**0,9.. is transformed to 2**0 = 1 -> no change at SRC2
		if (START[0])
			begin
				shf_r0 <= ( SRC1[30] | ((SRC1[29:23] ==  7'h7F) & (MODE[1] | (SRC1[22:20] == 3'd7))) ) ? 
								(MODE[1] ? {4'd1,SRC1[22:16]} : {1'b1,SRC1[19:10]}) : 11'd0;
				rshift <= MODE[1] ? 4'd6 - SRC1[26:23] : 4'd9 - SRC1[23:20];
				huge   <= MODE[1] ? ( SRC1[30] & ((SRC1[29:26] != 4'd0) | (SRC1[25:23] == 3'h7)) )	// >406 in Double Style
								  : ( SRC1[30] & ((SRC1[29:24] != 6'd0) | (SRC1[23] & (SRC1[22] | SRC1[21]))) );	// >409
				svorz  <= SRC1[31];
				dvorz  <= SRC2[31];
				dexpo  <= MODE[1] ? {3'd0,SRC2[30:23]} : SRC2[30:20];
			end

	assign shf_r1 = rshift[0] ? {1'b0,shf_r0[10:1]} : shf_r0;	// a mini-TRUNC of 11 Bits
	assign shf_r2 = rshift[1] ? {2'd0,shf_r1[10:2]} : shf_r1;
	assign shf_r4 = rshift[2] ? {4'd0,shf_r2[10:4]} : shf_r2;
	assign shf_r8 = rshift[3] ? {8'd0,shf_r4[10:8]} : shf_r4;

	assign addexp = svorz ? {2'd0,dexpo} - {2'd0,shf_r8} : {2'd0,dexpo} + {2'd0,shf_r8};
	
	assign newexp = MODE[1] ? {addexp[9:8],{3{addexp[7]}},addexp[7:0]} : addexp[12:0];
	
	assign finexp = SRCFLAGS[2] ? {3'd0,newexp[9:0]}	// never an Overflow if SRC2 = 0.0 !
								: {(huge ? {svorz,1'b1} : newexp[12:11]),newexp[10:0]};	// Overflow or Underflow
	
	assign nan = SRCFLAGS[3] | SRCFLAGS[1];
	
	assign scalb_res = MODE[1] ?	// Mantisse doesn't change !
					   {nan,SRCFLAGS[2],daten[31],finexp,daten[22:0],daten[28:0],2'b00}
					 : {nan,SRCFLAGS[2],dvorz,finexp,MAN2,daten[31:0],2'b00};
					 
	// ++++++++++++++++++++++++  Output  ++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	always @(posedge BCLK) OUT <= MODE[3] ? (MODE[2] ? logb_res : scalb_res) : fl_lf ;	// LOGB/SCALB : MOVLF/MOVFL
					
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	6. DFPU_MUL		Double precision floating point multiplier
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DFPU_MUL ( BCLK, SRC1, SRC2, START, MRESULT, SRCFLAGS, OUT );

	input			BCLK;
	input	[31:0]	SRC1,SRC2;
	input			START;		// that is START[0]
	input  [105:0] 	MRESULT;
	input	 [5:0] 	SRCFLAGS;	// NAN and ZERO flags
	output  [69:0] 	OUT;		// The result

	reg		[69:0]	OUT;
	reg		[12:0]	exponent;
	wire			orlow;
	wire	[12:0]	expoh,expol;
	wire	 [1:0]	restlow,resthigh;
	wire			zero,nan,sign;
		
	assign zero = 	SRCFLAGS[2] | SRCFLAGS[0];	// one is NULL -> NULL is the result
	assign nan = 	SRCFLAGS[3] | SRCFLAGS[1];	// one is NAN -> error
	assign sign = 	(SRCFLAGS[5] ^ SRCFLAGS[4]) & ~zero;
	
	assign orlow = (MRESULT[50:0] != 51'b0);
	
	assign restlow  = {MRESULT[51],orlow};
	assign resthigh = {MRESULT[52],(MRESULT[51] | orlow)};
	
	always @(posedge BCLK) if (START) exponent <= {2'b00,SRC1[30:20]} + {2'b00,SRC2[30:20]};
		
	assign expoh    = exponent - 13'h03FE;
	assign expol	= exponent - 13'h03FF;	// for MSB if MRESULT=0
	
	always @(posedge BCLK)
		OUT <= MRESULT[105] ? {nan,zero,sign,expoh,MRESULT[104:53],resthigh}	// 52 Bit Mantissa
							: {nan,zero,sign,expol,MRESULT[103:52],restlow};
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	7. SCANDIG		Scan digit for leading one
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module SCANDIG (DIN, MBIT, LBIT, NONZ);

	input	[3:0]	DIN;
	output			MBIT,LBIT,NONZ;
	
	assign MBIT = DIN[3] | DIN[2];					// 1xxx = 11
	assign LBIT = DIN[3] | (DIN[3:1] == 3'b001);	// 01xx = 10
	assign NONZ = (DIN != 4'd0);					// 001x = 01
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	8. DIVI_PREP	Prepare data for the divider
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DIVI_PREP (SRC, BWD, NOT_DEI, EXTDATA, DOUT, MSB, NULL, MINUS);

	input	[31:0]	SRC;
	input	 [1:0]	BWD;
	input			NOT_DEI;
	input			EXTDATA;
	
	output	[31:0]	DOUT;
	output	 [4:0]	MSB;
	output			NULL;
	output			MINUS;

	reg		[31:0]	double;
	reg		 [2:0]	select;
	
	wire	 [1:0]	modus;
	wire	 [7:0]	mbits,lbits,dnonz;
	
	assign modus = (NOT_DEI | EXTDATA) ? BWD : {(BWD[1] | BWD[0]),1'b1};
	
	always @(modus or SRC or NOT_DEI)
		casex (modus)
		  2'b00 : double = {{24{SRC[7]  & NOT_DEI}},SRC[7:0]};
		  2'b01 : double = {{16{SRC[15] & NOT_DEI}},SRC[15:0]};
		  2'b1x : double = SRC;
		endcase
		
	assign MINUS = double[31] & NOT_DEI;
	
	assign DOUT = ({32{MINUS}} ^ double) + {31'h0,MINUS};	//	assign DOUT = MINUS ? (32'd0 - double) : double;
	
	// now find most significant set bit : FFS
	
	SCANDIG	digit_0	(.DIN(DOUT[3:0]),   .MBIT(mbits[0]), .LBIT(lbits[0]), .NONZ(dnonz[0]) );
	SCANDIG	digit_1	(.DIN(DOUT[7:4]),   .MBIT(mbits[1]), .LBIT(lbits[1]), .NONZ(dnonz[1]) );
	SCANDIG	digit_2	(.DIN(DOUT[11:8]),  .MBIT(mbits[2]), .LBIT(lbits[2]), .NONZ(dnonz[2]) );
	SCANDIG	digit_3	(.DIN(DOUT[15:12]), .MBIT(mbits[3]), .LBIT(lbits[3]), .NONZ(dnonz[3]) );
	SCANDIG	digit_4	(.DIN(DOUT[19:16]), .MBIT(mbits[4]), .LBIT(lbits[4]), .NONZ(dnonz[4]) );
	SCANDIG	digit_5	(.DIN(DOUT[23:20]), .MBIT(mbits[5]), .LBIT(lbits[5]), .NONZ(dnonz[5]) );
	SCANDIG	digit_6	(.DIN(DOUT[27:24]), .MBIT(mbits[6]), .LBIT(lbits[6]), .NONZ(dnonz[6]) );
	SCANDIG	digit_7	(.DIN(DOUT[31:28]), .MBIT(mbits[7]), .LBIT(lbits[7]), .NONZ(dnonz[7]) );

	always @(dnonz)
		casex (dnonz[7:1])
		  7'b1xxx_xxx : select = 3'b111;
		  7'b01xx_xxx : select = 3'b110;
		  7'b001x_xxx : select = 3'b101;
		  7'b0001_xxx : select = 3'b100;
		  7'b0000_1xx : select = 3'b011;
		  7'b0000_01x : select = 3'b010;
		  7'b0000_001 : select = 3'b001;
		  default     : select = 3'b000;
		endcase
	
	assign NULL = (dnonz == 8'd0);
	
	assign MSB = {select,mbits[select],lbits[select]};
	
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	9. DFPU_DIV		The divider for all divide opcodes : double, single and integer
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DFPU_DIV ( BCLK, BRST, START, SRC1, SRC2, MAN1, MAN2, SRCFLAGS, FL, BWD, OPCODE, OUT, DONE, DIVI_OUT, DVZ_TRAP, DEI_OVF );

	// This version needs for Double 28+1 cycles if MAN1<MAN2 otherwise 28+2.
	// For Single it needs 13+1 cyckes or 13+2.
	
	input			BCLK,BRST;
	input	 [3:0]	START;		// START & recognized Divider Operation
	input	[31:0]	SRC1,SRC2;	// input data
	input	[20:0]	MAN1,MAN2;
	input	 [5:0]	SRCFLAGS;	// NAN and ZERO
	input			FL;
	input	 [1:0]	BWD;
	input	 [2:0]	OPCODE;		// for all DIVi variants
	
	output	[69:0]	OUT;		// the result
	output	reg		DONE;		// Pipeline-Flag
	output	[63:0]	DIVI_OUT;	// for Integer Division
	output			DVZ_TRAP;	// Divide by Zero Trap
	output	 [1:0]	DEI_OVF;	// DEI Overflow
	
	// ++++++++++++++  for Integer Division  ++++++++++++++
	reg				run_divi;
	reg				divi_pipe1,divi_pipe2,divi_pipe3,divi_pipe4;
	reg				neg_src1,neg_src2,nul_src2;
	reg		 [4:0]	msb_src1;
	reg		 [5:0]	msb_src2;
	reg		[31:0]	ivalue,src2_reg,pipe_reg;
	reg		 [4:0]	divi_counter;
	reg				sub_case;
	reg				negativ;
	reg		[32:0]	divi_result;
	reg		[63:0]	DIVI_OUT;
	reg				DVZ_TRAP,dvz_pipe;
	reg				sel_in;
	reg		[62:0]	din_mux;
	reg				dei_pipe;
	reg				extdata;	// extended data : 2 data packets, only apply to DEI
	reg		 [2:0]	addoff;
	reg				next_msb2;
	reg		[31:0]	dei_result;
	reg		 [1:0]	DEI_OVF;
	
	wire	[31:0]	i_in;
	wire	[37:0]	i_out;
	wire	 [6:0]	diff_msb;
	wire	 [5:1]	shift_r;
	wire	[62:0]	shift_2;
	wire	[62:0]	shift_4;
	wire	[62:0]	shift_8;
	wire	[62:0]	shift_16;
	wire	[64:0]	shift_32;
	wire			stop_divi,neg_flag;
	wire			rest_null,plus_1,ist_null;
	wire			not_dei;
	wire			valdata;	// Data <> 0 at DEI
	
	// ++++++++++++++  Floating Point & calculation path  ++++++++
	reg		[69:0]	OUT;
	reg		[32:0]	save1;
	reg				runflag;
	reg		[55:0]	dreimal;
	reg		[56:0]	divreg,divsr;
	reg		[31:0]	divreg_ext;
	reg		[12:0]	exponent;
	
	wire			load_src1,load_src2;
	wire	[56:0]	sub1,sub2,sub3;
	wire	[32:0]	src_1;
	wire	[20:0]	man_1;
	wire	[12:0]	expoh,expol,offset;
	wire			restlsb,restlow,resthigh;
	wire			zero,nan,sign,ende;
	wire			orlow_s,orlow_d;
	wire			short;
		
	// +++++++++++++++++++++++++++  Integer Division, DEI  +++++++++++++++++++++++++++

	assign not_dei = OPCODE[2];	// 0 = DEI
	always @(posedge BCLK) if (START[3]) extdata <= ~START[1];	// during START[0] for SRC1 not valid
	
	always @(posedge BCLK or negedge BRST)
		if (!BRST) run_divi <= 1'b0;
			else
				run_divi <= (START[3] & ~ist_null) | (~divi_pipe4 & run_divi);	// Abort at DVZ Trap
	
	always @(posedge BCLK) divi_pipe1 <= START[3] & ~ist_null;	// no start if SRC1 = 0 : DVZ Trap
	always @(posedge BCLK) dei_pipe	  <= divi_pipe1 & extdata;
	always @(posedge BCLK) divi_pipe2 <= extdata ? dei_pipe : divi_pipe1;
	
	always @(posedge BCLK) src2_reg <= SRC2;
	
	always @(posedge BCLK) sel_in <= START[3] | divi_pipe1;	// two times data for DEI
	assign i_in = sel_in ? src2_reg : SRC1;	
	
	DIVI_PREP prep_inst ( .SRC(i_in), .BWD(BWD), .NOT_DEI(not_dei), .EXTDATA(extdata | START[0]),
						  .DOUT(i_out[31:0]), .MSB(i_out[36:32]), .NULL(ist_null), .MINUS(i_out[37]) );

	always @(posedge BCLK) dvz_pipe <= START[3] & ist_null;	// Pulse 1 cycle long
	always @(posedge BCLK) DVZ_TRAP <= dvz_pipe;	// one cycle later if DEI with extdata
	
	always @(posedge BCLK)
		if (START[3])
			begin
				neg_src1 <= i_out[37];
				msb_src1 <= i_out[36:32];
			end
	
	always @(posedge BCLK)
		if (divi_pipe1)
			begin
				nul_src2 <= ist_null;
				neg_src2 <= i_out[37];
			end

	always @(posedge BCLK) ivalue   <= i_out[31:0];

	// The following is only for DEI :
	always @(posedge BCLK) pipe_reg <= {32{extdata}} & ivalue;	// Register must be 0 if not used

	assign valdata = extdata & ~ist_null;
	always @(BWD or valdata)
		casex (BWD)
		  2'b00   : addoff = {   1'b0,   1'b0,valdata};
		  2'b01   : addoff = {   1'b0,valdata,   1'b0};
		  default : addoff = {valdata,   1'b0,   1'b0};
		endcase
		
	always @(posedge BCLK) next_msb2 <= extdata & ist_null & divi_pipe1;	// Special case at DEI : MSD = 0
	
	always @(posedge BCLK)
		if (divi_pipe1) msb_src2 <= {addoff[2],(addoff[1:0] | i_out[36:35]),i_out[34:32]};
		  else
			if (next_msb2) msb_src2 <= {1'b0,i_out[36:32]};
			
	// Shifter for Source2 
	
	assign diff_msb = {1'b0,msb_src2} - {2'b0,msb_src1};
	
	// negativ shift limited to 0 : Source2=0 calculated without special handling, result always 0
	assign shift_r = diff_msb[6] ? 5'd0 : diff_msb[5:1];	// LSB does not count
	
	always @(BWD or extdata or ivalue or pipe_reg)
		casex ({BWD,extdata})
			3'b0x0  : din_mux = {31'b0,ivalue};	// the normal case for all except DEI
			3'b001  : din_mux = {23'b0,pipe_reg,ivalue[7:0]};
			3'b011  : din_mux = {15'b0,pipe_reg,ivalue[15:0]};
			default : din_mux = {pipe_reg[30:0],ivalue};		// 63 Bit wide
		endcase

	assign shift_2  = shift_r[1] ? din_mux : {din_mux[60:0], 2'b0};
	assign shift_4  = shift_r[2] ? shift_2 : {shift_2[58:0], 4'b0};
	assign shift_8  = shift_r[3] ? shift_4 : {shift_4[54:0], 8'b0};
	assign shift_16 = shift_r[4] ? shift_8 : {shift_8[46:0],16'b0};	// Result is 63 Bit wide
	
	// 65 Bit result because of DEI 
	assign shift_32 = shift_r[5] ? {1'b0,pipe_reg,ivalue} : {shift_16,2'b00};	// special case DEI : 32 times shift
	
	always @(posedge BCLK or negedge BRST)	// Flag for rounding, only if DEST <>0 
		if (!BRST) divi_pipe3 <= 1'b0;
		  else
		    divi_pipe3 <= divi_pipe2 | (divi_pipe3 & ~stop_divi);
		    
	always @(posedge BCLK)
		if (divi_pipe2) divi_counter <= shift_r;
		  else divi_counter <= divi_counter - {4'b000,~stop_divi};	// should stop at 0 
		  
	assign stop_divi = (divi_counter == 5'h0);	// caclulation ready
	
	always @(posedge BCLK) divi_pipe4 <= divi_pipe3 & stop_divi;
	
	assign neg_flag  = neg_src1 ^ neg_src2;
	assign rest_null = (divreg[33:2] == 32'h0);
	
	always @(posedge BCLK) sub_case <= neg_flag & ~nul_src2;	// little help for MODi opcode
		
	// Result preparation :
	// DEST  SRC    QUO  REM /  DIV  MOD
	//  +33  +13 :   2    7  /   2    7
	//	+33  -13 :  -2    7  /  -3   -6
	//	-33  +13 :  -2   -7  /  -3    6
	//	-33  -13 :   2   -7  /   2   -7
	always @(*)
		case (OPCODE[1:0])
		  2'b00 : divi_result = {neg_flag,divsr[31:0]};		// QUO
		  2'b01 : divi_result = {neg_src2,divreg[33:2]};	// REM
		  2'b10 : divi_result = {neg_src1,((sub_case & ~rest_null) ? (save1[31:0] - divreg[33:2]) : divreg[33:2])};	// MOD
		  2'b11 : divi_result = {neg_flag,divsr[31:0]};		// DIV
		endcase
	
	always @(posedge BCLK) negativ <= divi_result[32];
	
	assign plus_1 = (OPCODE[1:0] == 2'b11) ? (negativ & rest_null) : negativ;	// Special case Rest=0 at DIV
	
	always @(posedge BCLK)
		if (divi_pipe4) DIVI_OUT[63:32] <= not_dei ? (({32{negativ}} ^ divi_result[31:0]) + {31'd0,plus_1}) : dei_result;
	
	always @(posedge BCLK) if (divi_pipe4) DIVI_OUT[31:0] <= divreg[33:2];
	
	always @(extdata or BWD or divsr or divreg)
		casex ({extdata,BWD})
		  3'b000  : dei_result = {16'hxxxx,divsr[7:0],divreg[9:2]};
		  3'b001  : dei_result = {divsr[15:0],divreg[17:2]};
		  default : dei_result = divsr[31:0];
		endcase
		
	// +++++++++++++++++++++++++++  Calculation path for Division  ++++++++++++++++++++++++++++
	
	always @(posedge BCLK or negedge BRST)
		if (!BRST) runflag <= 1'b0;
			else
				runflag <= START[2] | (~ende & runflag);
	
	always @(posedge BCLK) DONE <= (ende & runflag) | divi_pipe4;
	
	assign man_1 = (FL | run_divi) ? 21'h0 : MAN1;
	assign src_1 = run_divi ? {1'b0,ivalue} : ( FL ? {10'h001,SRC1[22:0]} : {SRC1,1'b0});
	
	assign load_src1 = START[2] | divi_pipe1;
	
	//														*2 		   +       *1	
	always @(posedge BCLK) if (load_src1) dreimal <= {1'b0,man_1,src_1,1'b0} + {2'b00,man_1,src_1};	// 54 Bit Reg
	
	always @(posedge BCLK) if (load_src1) save1 <= src_1;

	assign sub1 = divreg - {3'b000, man_1,save1     };
	assign sub2 = divreg - {2'b00 ,man_1,save1,1'b0};
	assign sub3 = divreg - {1'b0, dreimal         };

	assign load_src2 = START[2] | divi_pipe2;
	
	always @(posedge BCLK)
		if (load_src2) divreg <= divi_pipe2 ? {23'h0,shift_32[64:32]} : ( FL ? {34'h0_0000_0001,SRC2[22:0]} : {3'b0,MAN2,SRC2,1'b0});
		else
			begin
			  casex ({sub3[56],sub2[56],sub1[56]})
				3'b0xx : divreg <=   {sub3[54:0],divreg_ext[31:30]};
				3'b10x : divreg <=   {sub2[54:0],divreg_ext[31:30]};
				3'b110 : divreg <=   {sub1[54:0],divreg_ext[31:30]};
			  default  : divreg <= {divreg[54:0],divreg_ext[31:30]};
			  endcase
			end
			
	always @(posedge BCLK)	// Extension Register for Integer Division
		if (load_src2) divreg_ext <= divi_pipe2 ? shift_32[31:0] : 32'd0;
		  else
		    divreg_ext <= {divreg_ext[29:0],2'b0};
		    
	always @(posedge BCLK)
		if (load_src2) divsr <= 57'h0;
		else
			begin
			  casex ({sub3[56],sub2[56],sub1[56]})
				3'b0xx : divsr <= {divsr[54:0],2'b11};
				3'b10x : divsr <= {divsr[54:0],2'b10};
				3'b110 : divsr <= {divsr[54:0],2'b01};
			  default  : divsr <= {divsr[54:0],2'b00};
			  endcase
			end

	// Overflow Detection for DEI : serial calculation
	always @(posedge BCLK)
		if (load_src2) DEI_OVF[0] <= 1'b0;
		  else DEI_OVF[0] <= DEI_OVF[0] | (BWD[1] ? |divsr[33:32] : (BWD[0] ? |divsr[17:16] : |divsr[9:8]));
		  
	always @(posedge BCLK) DEI_OVF[1] <= divi_pipe4;	// Timing pulse for OVF inclusiv for DIV and QUO
		  
	assign short = (SRCFLAGS[3:0] != 4'h0) & runflag;	
	
	assign ende = ((FL ? (divsr[26] | divsr[25]) : (divsr[56] | divsr[55])) & runflag) | short;

	assign sign = (SRCFLAGS[4] ^ SRCFLAGS[5]) & ~zero;
	assign zero =  SRCFLAGS[2] & ~SRCFLAGS[0];		// SRC2 = NULL -> NULL as result
	assign nan  =  SRCFLAGS[3] | SRCFLAGS[1] | (SRCFLAGS[2] & SRCFLAGS[0]);
			// one of both NAN or both 0 -> invalid Operation 

	assign orlow_d = (divreg[56:27] != 29'b0) & ~zero & ~FL;	// is there Rest ? [1:0] are always 0.
	assign orlow_s = (divreg[26:2]  != 25'b0) & ~zero;
	
	assign restlsb  = divsr[0] | orlow_s;
	assign restlow  = (divsr[1:0] != 2'b00) | orlow_s | orlow_d;
	assign resthigh = divsr[2] | restlow;
	
	always @(posedge BCLK) if (START[0]) exponent <= FL ? ({5'b00,SRC2[30:23]} - {5'b00,SRC1[30:23]})
														: ({2'b00,SRC2[30:20]} - {2'b00,SRC1[30:20]});
	assign offset   = FL ? 13'h007E : 13'h03FE;
	assign expoh    = exponent + {offset[12:1],1'b1};	// Double = 3FF/3FE	Single = 7F/7E
	assign expol	= exponent + offset;				// in case of normalizing
	
	always @(posedge BCLK)
	  if (ende && runflag)
		casex ({FL,divsr[26],divsr[56]})
		  3'b11x : OUT <= {nan,zero,sign,expoh[9:8],expoh[7],expoh[7],expoh[7],expoh[7:0],divsr[25:3],28'b0,divsr[3:2],restlow};
		  3'b10x : OUT <= {nan,zero,sign,expol[9:8],expol[7],expol[7],expol[7],expol[7:0],divsr[24:2],28'b0,divsr[2:1],restlsb};
		  3'b0x1 : OUT <= {nan,zero,sign,expoh,divsr[55:3],resthigh};
		  3'b0x0 : OUT <= {nan,zero,sign,expol,divsr[54:2],restlow};
		endcase
		
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	10. DP_LOGIK		Control logic and result path for different functions
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DP_LOGIK ( BCLK, BRESET, OPCODE, SRC1, SRC2, FSR, START, MRESULT, BWD, FL, MAN1, MAN2, WR_REG, CY_IN,
				  COP_DONE, COP_OP, COP_IN,
				  DOUT, TT_DP, DP_CMP, OVF_BCD, MEI, DFLOAT, DONE, UP_DP, CLR_LSB, WREN_L, DVZ_TRAP, COP_GO );

// Definition of output word OUT of sub-moduls : the hidden-bit of the mantissa is already gone
//
//   N Z S   Exponent			Mantissa												 Round
//   A E I  Double : 13 Bit		52 Bit														 2 Bit
//   N R G  Single : 10 Bit     23 Bit														 2 Bit
//     O N				   -mmmm.mmmm.mmmm.mmmm.mmmm.mmm-.--							  -m.
//  -F-F-F-E.EEEE.EEEE.EEEE-MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.MMMM.RR
//
//   6 6 6 6 6666 6655 5555 5555 4444 4444 4433 3333 3333 2222 2222 2211 1111 1111 0000 0000 00
//   9 8 7 6 5432 1098 7654 3210 9876 5432 1098 7654 3210 9876 5432 1098 7654 3210 9876 5432 10
//
// Single FP delivers the exponent in a way, that it is identical for rounding :
//
//  Exponent 61 - 54 => kept
//  Bits 64 - 62 are filled with bit 61 , carry should come through
//  Exponent 62 => Bit 65  , Overflow
//  Exponent 63 => Bit 66  , Underflow

	input			BCLK,BRESET;
	input	 [7:0]	OPCODE;	
	input	[31:0]	SRC1,SRC2;	// the input data
	input	[20:0]	MAN1,MAN2;	// the MSB of mantissa
	input	 [8:3]	FSR;		// Floating Point Status Register
	input	 [1:0]	START;
	input  [105:0]	MRESULT;	// Result of multiplier
	input	 [1:0]	BWD;		// Size of integer
	input			FL;
	input			WR_REG;		// from DECODER
	input			CY_IN;
	input			COP_DONE;	// Coprozessor Interface
	input	[23:0]	COP_OP;
	input	[63:0]	COP_IN;

	output	[63:0]	DOUT;
	output	 [4:0]	TT_DP;		// Trap-Info to FSR
	output	 [2:0]	DP_CMP;		// CMPL result
	output	 [3:0]	OVF_BCD;	// Integer Division Overflow + BCD Carry update
	output			MEI,DFLOAT;
	output			DONE,UP_DP,WREN_L;
	output	reg		CLR_LSB;
	output			DVZ_TRAP;
	output	reg		COP_GO;

	reg		[63:0]	DOUT;
	reg		 [2:0]	DP_CMP;
	reg		 [5:0]	preflags;
	reg		 [5:0]	srcflags;
	reg		[69:0]	fpout;
	reg		 [2:0]	tt;
	reg		 [7:0]	select;
	reg		 [5:0]	wctrl;
	reg		 [2:1]	sequ;
	reg				misc_op;
	reg 			car_ry;
	reg				wr_part2;
	reg				up_flag;
	reg				ovf_div;
	reg				late_bcd_done;
	
	wire			zexp2,zman2,zexp1,zman1,znan1;
	wire			make_i;
	wire			op_cmp;
	wire	[69:0]	mulout,addout,divout,miscout;
	wire			go_divf,go_divi,divi_ops,div_done;
	wire			bcd_ops,man_ops;
	wire	[31:0]	i_out;
	wire	[63:0]	divi_out;
	wire	[66:2]	rund,cy_val;	// Indexnumber like in xxxout
	wire 			div_zero,overflow,underflow,inexact;
	wire	 [1:0]	cmpres;
	wire	[63:0]	fp_out,fp_res;
	wire			wr_part1;
	wire			done_i;
	wire			later;
	wire	[31:0]	bcd_q;
	wire			bcd_done;
	wire			bcd_carry;
	wire	 [1:0]	dei_ovf;
	wire			quo_div;
	wire			copop;
	wire			copwr;
	
	// Control of datapath : together with START the Double Unit becomes activ 

	always @(OPCODE or FL)
		casex (OPCODE)
		  8'b1001_000x : select = {5'b0000_0,			~FL ,2'b10};	// 0 1 0 :	MOViL
		  8'b1001_010x : select = {5'b0001_1,			1'b1,2'b00};	// MOVLF
		  8'b1001_011x : select = {5'b0011_1,			1'b1,2'b00};	// MOVFL
		  8'b1001_100x : select = {5'b0001_0,			~FL ,2'b11};	// 0 1 1 :	ROUNDLi
		  8'b1001_101x : select = {5'b0001_0,			~FL ,2'b11};	// 0 1 1 :  TRUNCLi
		  8'b1001_111x : select = {5'b0001_0,			~FL ,2'b11};	// 0 1 1 :	FLOORLi
		  8'b1011_0000 : select = {5'b1010_0,			~FL ,2'b00};	// 0 0 0 :	ADDL	Es werden Shifter wiederverwendet...
		  8'b1011_0010 : select = {5'b1010_0,			~FL ,2'b01};	// 0 0 1 :	CMPL
		  8'b1011_0100 : select = {5'b1010_0,			~FL ,2'b01};	// 0 0 1 :	SUBL
		  8'b1011_1000 : select = {1'b1,FL,1'b1,FL,1'b0,1'b1,2'b00};	// 1 0 1 :  DIVf , Default Float fuer srcflags
		  8'b1011_1100 : select = {5'b1010_0,			~FL ,2'b00};	// 1 0 0 :	MULL
		  8'b1011_0110 : select = {1'b1,FL,1'b1,FL,1'b1,1'b1,2'b00};	// SCALBf
		  8'b1011_0111 : select = {2'b00,FL,2'b1_1,		1'b1,2'b00};	// LOGBf
		  default      : select = 8'b0;
		endcase

	assign MEI      = (OPCODE == 8'h79);
	assign divi_ops = (OPCODE[7:2] == 6'b0111_11) | (OPCODE == 8'h7B);	// QUO/REM/MOD/DIV & DEI
	assign go_divf  = (OPCODE == 8'hB8) & START[1];					// because of runflag in DIV Unit
	assign go_divi  = divi_ops & (OPCODE[2] ? START[1] : START[0]);	// DEI starts with START[0]
	assign bcd_ops  = (OPCODE == 8'h71) | (OPCODE == 8'h70);	// ADDP , SUBP
	
	assign man_ops  = (OPCODE == 8'hB1) | (OPCODE == 8'hB5) | (OPCODE == 8'hB9) | (OPCODE == 8'hBD);	// MOVf,NEGf,XXXf,ABSf

	assign DFLOAT   = (select[2] | copop) & ~FL;	// all Double Floating Point Operations for PREPDATA
	assign make_i   = (select[1:0] == 2'b11) | divi_ops | bcd_ops;	// ROUND/TRUNC/FLOOR for output multiplexer
	assign op_cmp   = (OPCODE == 8'hB2) & ~FL;
	always @(posedge BCLK) misc_op <= select[3];	// for OUT-Multiplexer
	
	assign copop	= (OPCODE == 8'hDD);
	assign copwr	= (COP_OP[18:17] == 2'd0) & (COP_OP[13:11] == 3'b111) & (COP_OP[7:5] == 3'b001);	// Custom Convert
	
	// SRCFLAGS : special handling for operands is done locally
	
	assign zexp2 = (SRC2[30:20] == 11'd0);
	assign zman2 = (SRC2[19:0] == 20'd0);
	assign zexp1 = (SRC1[30:20] == 11'd0);
	assign zman1 = (SRC1[19:0] == 20'd0);
	assign znan1 = (SRC1[30:20] == 11'h7FF);
	
	always @(posedge BCLK)
		if (START[0])
		  begin
			srcflags[5] <= SRC2[31];
			srcflags[4] <= SRC1[31];
			preflags    <= {(SRC2[30:20] == 11'h7FF),zexp2,zman2,znan1,zexp1,zman1};
		   end

	// case Definition : 00 : 0		, if START[i]=0 then there are always 2 long operands
	//					 01 : 1 Float Operand SCR1
	//					 10 : 1 Long Operand SRC1+SRC2
	//					 11 : 2 Float Operands SRC1 , SRC2
	
	always @(posedge BCLK)	// NaN 
		if (START[1])
			case (select[7:6])
			  2'b10 : srcflags[3] <= preflags[5] | (preflags[4] & (~preflags[3] | SRC2[31] | ~zexp2 | ~zman2));
			  2'b11 : srcflags[3] <= (SRC2[30:23] == 8'hFF) | ((SRC2[30:23] == 8'd0) & ((SRC2[22:20] != 3'd0) | ~zman2));	// F:SRC2 = NaN
			default : srcflags[3] <= 1'b0;
			endcase
			
	always @(posedge BCLK)	// Zero : only exponent ! If denormalized => NaN !
		if (START[1])
			case (select[7:6])
			  2'b10 : srcflags[2] <= preflags[4];	// L:SRC2 = Zero , 2*SRC2
			  2'b11 : srcflags[2] <= (SRC2[30:23] == 8'd0);	// F:SRC2 = Zero
			default : srcflags[2] <= 1'b0;
			endcase
			
	always @(posedge BCLK)	// NaN 
		if (START[1])
			case (select[5:4])
			  2'b01 : srcflags[1] <= znan1 | (zexp1 & (~zman1 | SRC2[31] | ~zexp2 | ~zman2));	// L:(SRC1,SRC2) = NaN , SRC1 = MSB
			  2'b10 : srcflags[1] <= preflags[2] | (preflags[1] & (~preflags[0] | SRC1[31] | ~zexp1 | ~zman1));
			  2'b11 : srcflags[1] <= (SRC1[30:23] == 8'hFF) | ((SRC1[30:23] == 8'd0) & ((SRC1[22:20] != 3'd0) | ~zman1));	// F:SRC1 = NaN
			default : srcflags[1] <= 1'b0;
			endcase
			
	always @(posedge BCLK)	// Zero : only exponent ! If denormalized => NaN !
		if (START[1])
			case (select[5:4])
			  2'b01 : srcflags[0] <= zexp1;	// L:(SRC1,SRC2) = Zero , SRC1 = MSB, Special Case ROUNDL,etc.
			  2'b10 : srcflags[0] <= preflags[1];	// L:SRC1 = Zero , 2*SRC1
			  2'b11 : srcflags[0] <= (SRC1[30:23] == 8'd0);	// F:SRC1 = Zero
			default : srcflags[0] <= 1'b0;
			endcase

			// The Sub-moduls : 
	
	DFPU_ADDSUB as_inst	( .BCLK(BCLK), .START(START), .SRC1(SRC1), .SRC2(SRC2),
						  .MAN1({~preflags[1],MAN1[19:0]}), .MAN2({~preflags[4],MAN2[19:0]}),
						  .SRCFLAGS(srcflags), .BWD(BWD), .SELECT({OPCODE[2:1],select[1:0]}),
						  .OUT(addout), .IOUT(i_out), .CMPRES(cmpres) );
					
	DFPU_MUL mul_inst	( .BCLK(BCLK), .SRC1(SRC1), .SRC2(SRC2), .START(START[0]), .MRESULT(MRESULT),
						  .OUT(mulout), .SRCFLAGS(srcflags) );
					
	DFPU_DIV div_inst	( .BCLK(BCLK), .BRST(BRESET), .START({go_divi,go_divf,START}), .SRC1(SRC1), .SRC2(SRC2),
						  .MAN1(MAN1), .MAN2(MAN2), .SRCFLAGS(srcflags), .FL(FL), .OUT(divout), .DONE(div_done),
						  .BWD(BWD), .OPCODE(OPCODE[2:0]), .DIVI_OUT(divi_out), .DVZ_TRAP(DVZ_TRAP), .DEI_OVF(dei_ovf) ); 

	DFPU_MISC misc_inst	( .BCLK(BCLK), .START(START), .SRC1(SRC1), .SRC2(SRC2), .MAN2(MAN2[19:0]), .SRCFLAGS(srcflags),
						  .MODE({OPCODE[5],OPCODE[0],FL,OPCODE[1]}), .OUT(miscout) );
						  
	DFPU_BCD bcd_inst	( .BCLK(BCLK), .BRESET(BRESET), .START(START[1]), .DO_BCD(bcd_ops), .BWD(BWD), .SRC1(SRC1), .SRC2(SRC2),
						  .CY_IN(CY_IN), .SUBP(~OPCODE[0]), .BCD_Q(bcd_q), .CY_OUT(bcd_carry), .BCD_DONE(bcd_done) );
	
	// FP - path : selection of result and rounding :

	always @(misc_op or OPCODE or mulout or addout or divout or miscout)
		casex ({misc_op,OPCODE[5],OPCODE[3:2]})	//OPCODE[5] only for Flags i.e. NAN 
		  4'b1xxx : fpout = miscout;		// for MOVLF,MOVFL,SCALB & LOGB
		  4'b0110 : fpout = divout;
		  4'b0111 : fpout = mulout;
		  default : fpout = addout;
		endcase
	
	always @(FSR or fpout)	// Calculation of Carry according to rounding mode, fpout[67] = sign bit
		casex (FSR[8:7])
		  2'b00 : car_ry = ((fpout[1:0] == 2'b10) & fpout[2]) | (fpout[1:0] == 2'b11);	// round to nearest
		  2'b10 : car_ry = ~fpout[67] & (fpout[1:0] != 2'b00);	// round to positiv infinity
		  2'b11 : car_ry =  fpout[67] & (fpout[1:0] != 2'b00);	// round to negativ infinity
		default : car_ry = 1'b0;								// round to zero
		endcase

	assign cy_val = {35'h0,(FL & car_ry),28'h0,(~FL & car_ry)};
	
	assign rund = {fpout[66:2]} + cy_val;
	
	// Detection of Div-by-0, Overflow, Underflow and Inexact : Epxonent from [66:54] = 13 Bits
	assign div_zero  = (srcflags[3:0] == 4'h1) & ((OPCODE == 8'hB8) | (OPCODE == 8'hB7));	// true FPU Divide by Zero also for LOGBf
	assign overflow  = ~rund[66] & (rund[65] | (rund[64:54] == 11'h7FF));
	assign underflow = (rund[66] | (rund[65:54] == 12'h0)) & ~fpout[68];	// Zero-Flag
	assign inexact   = (fpout[1:0] != 2'b00);
	
	always @(fpout or op_cmp or div_zero or overflow or underflow or inexact or FSR)
		casex ({fpout[69],op_cmp,div_zero,overflow,FSR[3],underflow,FSR[5],inexact})	// [69] = NAN
			8'b1xxxxxxx : tt = 3'b101;	// Invalid operation
			8'b001xxxxx : tt = 3'b011;	// Divide by Zero
			8'b0001xxxx : tt = 3'b010;	// Overflow
			8'b000011xx : tt = 3'b001;	// Underflow
			8'b00000011 : tt = 3'b110;	// Inexact Result
			default		: tt = 3'b000;	// no error
		endcase
		
	assign TT_DP = man_ops ? 5'd0 : {(inexact & ~op_cmp),(underflow & ~op_cmp),tt};	// at ABSf/NEGf no error : different to NS32381 !

	assign fp_res = FL ? {fpout[67],rund[61:31],rund[33:2]}
					   : {fpout[67],rund[64:2]};	// lower 32 bits identical

	// Underflow special case and get ZERO
	assign fp_out = (underflow | fpout[68]) ? 64'h0 : fp_res;
	
	// 63..32 goes to memory if Word or Byte ! Also in ODD Register , 31..0 goes in EVEN Register
	// DEI comes without WR_REG information
	always @(make_i or copop or MEI or BWD or WR_REG or MRESULT or COP_IN or i_out or fp_out or divi_ops or divi_out or bcd_ops or bcd_q)
		casex ({make_i,copop,MEI,BWD})
		  5'b00100 : DOUT = {MRESULT[31:8], (WR_REG ? MRESULT[15:8]  : MRESULT[7:0]), MRESULT[31:0]};	// LSD always the same
		  5'b00101 : DOUT = {MRESULT[31:16],(WR_REG ? MRESULT[31:16] : MRESULT[15:0]),MRESULT[31:0]};
		  5'b0011x : DOUT =  MRESULT[63:0];
		  5'b01xxx : DOUT =  COP_IN;	// true alignment in Coprocessor
		  5'b1xxxx : DOUT = divi_ops ? divi_out : {(bcd_ops ? bcd_q : i_out),fp_out[31:0]};	// MSD is written first
		  default  : DOUT = fp_out;
		endcase
		
	always @(posedge BCLK) DP_CMP <= {(srcflags[3] | srcflags[1]),cmpres};	// Only valid if not NaN
	
	// Pipeline Control + Registerfile write control
	
	always @(posedge BCLK or negedge BRESET)
		if (!BRESET) sequ <= 2'b00;
		  else
			sequ <= {(sequ[1] & ~DONE),(START[1] & ~wctrl[5])};
		  
	always @(FL or OPCODE or copwr)
		casex ({FL,OPCODE})	// WRITE Control : [2] = clr_lsb, [1] = wr_part2, [0] = wr_part1
		  9'b0_1001_000x : wctrl = 6'b001_111;	// MOViL
		  9'b1_1001_000x : wctrl = 6'b100_010;	// MOViF  <= SFPU
		  9'bx_1001_010x : wctrl = 6'b000_010;	// MOVLF
		  9'bx_1001_011x : wctrl = 6'b001_111;	// MOVFL
		  9'b0_1001_100x : wctrl = 6'b000_010;	// ROUNDLi
		  9'b0_1001_101x : wctrl = 6'b000_010;	// TRUNCLi
		  9'b0_1001_111x : wctrl = 6'b000_010;	// FLOORLi
		  9'b1_1001_100x : wctrl = 6'b100_010;	// ROUNDFi
		  9'b1_1001_101x : wctrl = 6'b100_010;	// TRUNCFi
		  9'b1_1001_111x : wctrl = 6'b100_010;	// FLOORFi
		  9'b0_1011_0000 : wctrl = 6'b001_111;	// ADDL
		  9'b1_1011_0000 : wctrl = 6'b100_010;	// ADDF   <= SFPU
		  9'b0_1011_0010 : wctrl = 6'b000_000;	// CMPL
		  9'b1_1011_0010 : wctrl = 6'b100_000;	// CMPF
		  9'b0_1011_0100 : wctrl = 6'b001_111;	// SUBL
		  9'b1_1011_0100 : wctrl = 6'b100_010;	// SUBF   <= SFPU
		  9'b1_1011_1000 : wctrl = 6'b010_001;	// DIVF - measured 18 clocks Reg-Reg
		  9'b0_1011_1000 : wctrl = 6'b010_111;	// DIVL - measured 34 clocks Reg-Reg
		  9'b0_1011_1100 : wctrl = 6'b001_111;	// MULL
		  9'b1_1011_1100 : wctrl = 6'b100_010;	// MULF   <= SFPU
		  9'bx_0111_000x : wctrl = 6'b100_010;	// ADDP,SUBP
		  9'bx_0111_1001 : wctrl = 6'b000_111;	// MEIi
		  9'bx_0111_1011 : wctrl = 6'b010_111;	// DEIi
		  9'bx_0111_11xx : wctrl = 6'b010_001;	// QUOi,REMi,MODi,DIVi
		  9'b1_1011_011x : wctrl = 6'b000_010;	// SCALBF/LOGBF
		  9'b0_1011_011x : wctrl = 6'b001_111;	// SCALBL/LOGBL
		  9'bx_1101_1101 : wctrl = {5'b010_00,copwr};	// Coprocessor opcode
		  default      	 : wctrl = 6'b00;
		endcase

	assign later = wctrl[3] & WR_REG;	// if DEST = Reg and 64 bit of data then DONE comes 1 clock later
	assign done_i = wctrl[4] ? (div_done | COP_DONE) : ( later ? sequ[2] : sequ[1] );
	assign DONE = wctrl[5] ? (bcd_ops ? bcd_done : START[1]) : ~START[1] & done_i;	// DONE is valid for all opcodes

	assign wr_part1 = DONE & WR_REG & wctrl[0];
	
	always @(posedge BCLK) CLR_LSB 	<= DONE & WR_REG & wctrl[2];
	always @(posedge BCLK) wr_part2 <= DONE & WR_REG & wctrl[1];
	
	assign WREN_L 	= wr_part1 | wr_part2;
	
	always @(posedge BCLK) up_flag <= DONE & ~later;		// DONE one cycle later
	assign UP_DP    = (select[2] & (later ? DONE : up_flag)) | man_ops;	// Update FSR Trap etc. : all FPU opcodes of DP_FPU
	
	// Overflow Trap for Division : DEI, QUO, DIV
	assign quo_div = (OPCODE == 8'h7C) | (OPCODE == 8'h7F);
	always @(*)
		casex ({OPCODE[2],BWD})
		   3'b100 : ovf_div = (divi_out[39] & SRC1[7]  & SRC2[7] ) & quo_div;
		   3'b101 : ovf_div = (divi_out[47] & SRC1[15] & SRC2[15]) & quo_div;
		   3'b11x : ovf_div = (divi_out[63] & SRC1[31] & SRC2[31]) & quo_div;
		  default : ovf_div = dei_ovf[0] & (OPCODE == 8'h7B);	// DEI
		endcase
		  
	always @(posedge BCLK) late_bcd_done <= bcd_done;	// parallel to data write

	assign OVF_BCD = {dei_ovf[1],ovf_div,late_bcd_done,bcd_carry};	// to I_PFAD
	
	always @(posedge BCLK) COP_GO <= START[1] & copop;

endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// 11. DP_FPU		Top level of long operations datapath
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module DP_FPU( BCLK, FL, BRESET, LD_OUT, WR_REG, BWD, FSR, OPCODE, SRC1, SRC2, START, CY_IN, COP_DONE, COP_OP, COP_IN,
			   DONE, UP_DP, WREN_L, CLR_LSB, DVZ_TRAP, DP_CMP, DP_OUT, DP_Q, TT_DP, OVF_BCD, COP_GO, COP_OUT );

input			BCLK;
input			FL;
input			BRESET;
input	 [1:0]	LD_OUT;
input			WR_REG;
input	 [1:0]	BWD;
input	 [8:3]	FSR;
input	 [7:0]	OPCODE;
input	[31:0]	SRC1;
input	[31:0]	SRC2;
input	 [1:0]	START;
input			CY_IN;
input			COP_DONE;
input	[23:0]	COP_OP;
input	[63:0]	COP_IN;

output			DONE;
output			UP_DP;
output			WREN_L;
output			CLR_LSB;
output			DVZ_TRAP;
output	 [2:0]	DP_CMP;
output	[31:0]	DP_OUT;
output	[31:0]	DP_Q;
output	 [4:0]	TT_DP;
output	 [3:0]	OVF_BCD;
output			COP_GO;
output [127:0]	COP_OUT;

reg		[52:0]	MDA;
reg		[52:0]	MDB;
reg		[31:0]	DP_Q;
reg	   [31:20]	RCOPA,RCOPB;

wire	[63:0]	DOUT;
wire   [105:0]	MRESULT;
wire			MEI;
wire			DFLOAT;
wire			LOAD_MSD;
wire			LOAD_LSD1;
wire			LOAD_LSD2;
wire	[31:0]	LSD_1;
wire	[31:0]	LSD_2;
wire   [52:32]	MSD_1;
wire   [52:32]	MSD_2;


DP_LOGIK	DOUBLE_U(
	.FL(FL),
	.BRESET(BRESET),
	.BCLK(BCLK),
	.WR_REG(WR_REG),
	.BWD(BWD),
	.FSR(FSR),
	.MAN1(MDA[52:32]),
	.MAN2(MDB[52:32]),
	.MRESULT(MRESULT),
	.OPCODE(OPCODE),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.START(START),
	.MEI(MEI),
	.DFLOAT(DFLOAT),
	.DONE(DONE),
	.UP_DP(UP_DP),
	.CLR_LSB(CLR_LSB),
	.WREN_L(WREN_L),
	.DVZ_TRAP(DVZ_TRAP),
	.DOUT(DOUT),
	.DP_CMP(DP_CMP),
	.TT_DP(TT_DP),
	.CY_IN(CY_IN),
	.OVF_BCD(OVF_BCD),
	.COP_DONE(COP_DONE),
	.COP_OP(COP_OP),
	.COP_IN(COP_IN),
	.COP_GO(COP_GO));

PREPDATA	DP_PREP(
	.MEI(MEI),
	.DFLOAT(DFLOAT),
	.BWD(BWD),
	.SRC1(SRC1),
	.SRC2(SRC2),
	.START(START),
	.LOAD_LSD1(LOAD_LSD1),
	.LOAD_LSD2(LOAD_LSD2),
	.LOAD_MSD(LOAD_MSD),
	.LSD_1(LSD_1),
	.LSD_2(LSD_2),
	.MSD_1(MSD_1),
	.MSD_2(MSD_2));

	assign MRESULT = MDA * MDB;	// unsigned multiplier 53 * 53 bits = 106 bits
	
	assign DP_OUT = CLR_LSB ? DP_Q : DOUT[63:32];
	
	always@(posedge BCLK) if (LD_OUT[1] || LD_OUT[0] || WREN_L) DP_Q <= LD_OUT[0] ? SRC2 : DOUT[31:0];

	always@(posedge BCLK) if (LOAD_LSD1) MDA[31:0] <= LSD_1;

	always@(posedge BCLK) if (LOAD_LSD2) MDB[31:0] <= LSD_2;

	always@(posedge BCLK)
		if (LOAD_MSD)
			begin
				MDA[52:32] <= MSD_1;
				MDB[52:32] <= MSD_2;
				RCOPA	   <= SRC1[31:20];
				RCOPB	   <= SRC2[31:20];
			end
			
	assign COP_OUT = {RCOPA,MDA[51:32],SRC1,RCOPB,MDB[51:32],SRC2};

endmodule
