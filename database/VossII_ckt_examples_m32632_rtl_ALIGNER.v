// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// This file is part of the M32632 project
// http://opencores.org/project,m32632
//
//	Filename:	ALIGNER.v
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
//	1. WR_ALINGER	alignes write data to cache and external devices
//	2. RD_ALINGER	alignes read data for the data path
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	1. WR_ALINGER	alignes write data to cache and external devices
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module WR_ALIGNER ( PACKET, DP_Q, SIZE, WRDATA, ENBYTE );

	input	 [3:0]	PACKET;	// [3:2] Paketnumber , [1:0] Startaddress
	input	[63:0]	DP_Q;
	input	 [1:0]	SIZE;
	output	[31:0]	WRDATA;
	output	 [3:0]	ENBYTE;

	reg		 [3:0]	ENBYTE;
	reg		 [7:0]	dbyte0,dbyte1,dbyte2,dbyte3;
	wire			switch;
	
// Data packet 	[ B7 ],[ B6 ],[ B5 ],[ B4 ],[ B3 ],[ B2 ],[ B1 ],[ B0 ]
// Address , i.e. 001 : one DWORD
// gives  2 packets : 1. packet             [-B6-----B5-----B4-]
// 2. packet, Address + 4           							 [-B7-]
// Addresse , i.e. 010 : one QWORD
// gives  3 packets : 1. packet             [-B1-----B0-]
// 2. packet, Address + 4 					[-B5-----B4-----B3-----B2-]
// 3. packet, Address + 8 								  [-B7-----B6-]

//	SIZE PACKET ADR : Outputbus 
//		00	00	00		 x  x  x B4
//		00	00	01		 x  x B4  x
//		00	00	10		 x B4  x  x
//		00	00	11		B4  x  x  x

//		01	00	00		 x  x B5 B4
//		01	00	01		 x B5 B4  x
//		01	00	10		B5 B4  x  x
//		01	00	11		B4  x  x  x
//		01	10	11		 x  x  x B5

//		10	00	00		B7 B6 B5 B4
//		10	00	01		B6 B5 B4  x
//		10	10	01		 x  x  x B7
//		10	00	10		B5 B4  x  x
//		10	10	10		 x  x B7 B6
//		10	00	11		B4  x  x  x
//		10	10	11		 x B7 B6 B5

//		11	00	00		B3 B2 B1 B0
//		11	10	00		B7 B6 B5 B4
//		11	00	01		B2 B1 B0  x
//		11	01	01		B6 B5 B4 B3
//		11	10	01		 x  x  x B7
//		11	00	10		B1 B0  x  x
//		11	01	10		B5 B4 B3 B2
//		11	10	10		 x  x B7 B6
//		11	00	11		B0  x  x  x
//		11	01	11		B4 B3 B2 B1
//		11	10	11		 x B7 B6 B5

	assign switch = (SIZE == 2'b11) & (PACKET[3:2] == 2'b00);
	
	always @(DP_Q or switch or PACKET)
		case (PACKET[1:0])
		  2'b00 : dbyte0 =    switch ?   DP_Q[7:0] : DP_Q[39:32];
		  2'b01 : dbyte0 = PACKET[3] ? DP_Q[63:56] : DP_Q[31:24];
		  2'b10 : dbyte0 = PACKET[3] ? DP_Q[55:48] : DP_Q[23:16];
		  2'b11 : dbyte0 = PACKET[3] ? DP_Q[47:40] :  DP_Q[15:8];
		endcase
		
	always @(DP_Q or switch or PACKET)
		case (PACKET[1:0])
		  2'b00 : dbyte1 =    switch ?  DP_Q[15:8] : DP_Q[47:40];
		  2'b01 : dbyte1 =    switch ?   DP_Q[7:0] : DP_Q[39:32];
		  2'b10 : dbyte1 = PACKET[3] ? DP_Q[63:56] : DP_Q[31:24];
		  2'b11 : dbyte1 = PACKET[3] ? DP_Q[55:48] : DP_Q[23:16];
		endcase
		
	always @(DP_Q or switch or PACKET)
		case (PACKET[1:0])
		  2'b00 : dbyte2 =    switch ? DP_Q[23:16] : DP_Q[55:48];
		  2'b01 : dbyte2 =    switch ?  DP_Q[15:8] : DP_Q[47:40];
		  2'b10 : dbyte2 =    switch ?   DP_Q[7:0] : DP_Q[39:32];
		  2'b11 : dbyte2 = PACKET[3] ? DP_Q[63:56] : DP_Q[31:24];
		endcase

	always @(DP_Q or switch or PACKET)
		case (PACKET[1:0])
		  2'b00 : dbyte3 =    switch ? DP_Q[31:24] : DP_Q[63:56];
		  2'b01 : dbyte3 =    switch ? DP_Q[23:16] : DP_Q[55:48];
		  2'b10 : dbyte3 =    switch ?  DP_Q[15:8] : DP_Q[47:40];
		  2'b11 : dbyte3 =    switch ?   DP_Q[7:0] : DP_Q[39:32];
		endcase
		
	assign WRDATA = {dbyte3,dbyte2,dbyte1,dbyte0};

	always @(SIZE or PACKET)
		casex ({SIZE,PACKET})
		  6'b00_xx_00 : ENBYTE = 4'b0001;	// BYTE
		  6'b00_xx_01 : ENBYTE = 4'b0010;
		  6'b00_xx_10 : ENBYTE = 4'b0100;
		  6'b00_xx_11 : ENBYTE = 4'b1000;
		 //
		  6'b01_xx_00 : ENBYTE = 4'b0011;	// WORD
		  6'b01_xx_01 : ENBYTE = 4'b0110;
		  6'b01_xx_10 : ENBYTE = 4'b1100;
		  6'b01_0x_11 : ENBYTE = 4'b1000;
		  6'b01_1x_11 : ENBYTE = 4'b0001;
		 //
		  6'b11_xx_00 : ENBYTE = 4'b1111;	// QWORD
		  6'b11_00_01 : ENBYTE = 4'b1110;
		  6'b11_01_01 : ENBYTE = 4'b1111;
		  6'b11_1x_01 : ENBYTE = 4'b0001;
		  6'b11_00_10 : ENBYTE = 4'b1100;
		  6'b11_01_10 : ENBYTE = 4'b1111;
		  6'b11_1x_10 : ENBYTE = 4'b0011;
		  6'b11_00_11 : ENBYTE = 4'b1000;
		  6'b11_01_11 : ENBYTE = 4'b1111;
		  6'b11_1x_11 : ENBYTE = 4'b0111;
		 //	
		  6'b10_xx_00 : ENBYTE = 4'b1111;	// DWORD
		  6'b10_0x_01 : ENBYTE = 4'b1110;
		  6'b10_1x_01 : ENBYTE = 4'b0001;
		  6'b10_0x_10 : ENBYTE = 4'b1100;
		  6'b10_1x_10 : ENBYTE = 4'b0011;
		  6'b10_0x_11 : ENBYTE = 4'b1000;
		  6'b10_1x_11 : ENBYTE = 4'b0111;
		endcase
		  
endmodule

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//	2. RD_ALINGER	alignes read data for the data path
//
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
module RD_ALIGNER ( BCLK, ACC_OK, PACKET, SIZE, REG_OUT, RDDATA, CA_HIT, DP_DI, AUX_QW );

	input			BCLK;
	input			ACC_OK;
	input	 [3:0]	PACKET;	// [3:2] Paketnumber , [1:0] Startaddress
	input	 [1:0]	SIZE;
	input			REG_OUT;
	input	[31:0]	RDDATA;
	input			CA_HIT;
	
	output	[31:0]	DP_DI;
	output	reg		AUX_QW;
	
	reg		 [6:0]	enable;
	reg		 [7:0]	dreg_0,dreg_1,dreg_2,dreg_3,dreg_4,dreg_5,dreg_6;
	reg		 [7:0]	out_0,out_1,out_2,out_3;
	
// RD_ALIGNER principal working : 10 is last packet , 01 is packet in between

// Not aligned QWORD  : ADR[1:0] = 3 i.e.
// Bytes to datapath  :	. - . - 4 - 4
// Bytes from memory  :	1 - 4 - 3 - .
// ACC_DONE		   	  :	_______/----\__
//	+ 1 cycle					____/--
// at the end 2 cycles lost. ACC_DONE informs the Op-Dec that data is available and sent one clock cycle later
// the LSD of QWORD access. (ACC_DONE -> REG_OUT is happening in ADDR_UNIT.)
//
// SIZE PACKET ADR :	Output data 					 ACC_OK
//		00	--	00		 x  x  x B0		Byte				1
//		00	--	01		 x  x  x B1							1
//		00	--	10		 x  x  x B2							1
//		00	--	11		 x  x  x B3							1

//		01	00	00		 x  x B1 B0		Word				1
//		01	00	01		 x  x B2 B1							1
//		01	00	10		 x  x B3 B2							1
//		01	00	11		B3  x  x  x	-> Reg : R4  -  -  -	0
//		01	10	11		 x  x B0 R4							1

//		10	00	00		B3 B2 B1 B0		DWORD				1
//		10	00	01		B3 B2 B1  x	-> Reg : R6 R5 R4  -	0
//		10	10	01		B0 R6 R5 R4							1
//		10	00	10		B3 B2  x  x -> Reg : R5 R4  -  -	0
//		10	10	10		B1 B0 R5 R4							1
//		10	00	11		B3  x  x  x -> Reg : R4  -  -  -	0
//		10	10	11		B2 B1 B0 R4							1

//		11	00	00		B3 B2 B1 B0		QWORD				1	MSD
//		11	01	00		B3 B2 B1 B0		not out of Reg!		0	LSD
//		11	00	01		B3 B2 B1  x -> Reg : R2 R1 R0  -	0
//		11	01	01		B3 B2 B1 B0 -> Reg : R6 R5 R4 R3	0
//		11	10	01		B0 R6 R5 R4							1	MSD
//	next cycle:			R3 R2 R1 R0								LSD
//		11	00	10		B3 B2  x  x -> Reg : R1 R0  -  -	0
//		11	01	10		B3 B2 B1 B0 -> Reg : R5 R4 R3 R2	0
//		11	10	10		B1 B0 R5 R4							1	MSD
//	next cycle:			R3 R2 R1 R0								LSD
//		11	00	11		B3  x  x  x -> Reg : R0  -  -  -	0
//		11	01	11		B3 B2 B1 B0 -> Reg : R4 R3 R2 R1	0
//		11	10	11		B2 B1 B0 R4							1	MSD
//	next cycle:			R3 R2 R1 R0								LSD

// IO_ACCESS QWORD :
//		11	00	00		B3 B2 B1 B0 -> Reg : R3 R2 R1 R0	0
//		11	01	00		R3 R2 R1 R0 -> Reg : R3 R2 R1 R0	1	MSD
//	next cycle:			R3 R2 R1 R0								LSD

	always @(ACC_OK or SIZE or PACKET)
		casex ({ACC_OK,SIZE,PACKET})
		  7'b1_xx_0x_00 : enable = 7'b000_1111;	
		  7'b1_01_0x_11 : enable = 7'b001_0000;
		  7'b1_10_0x_01 : enable = 7'b111_0000;
		  7'b1_10_0x_10 : enable = 7'b011_0000;
		  7'b1_10_0x_11 : enable = 7'b001_0000;
		  7'b1_11_00_01 : enable = 7'b000_0111;	// QWORD
		  7'b1_11_01_01 : enable = 7'b111_1000;
		  7'b1_11_00_10 : enable = 7'b000_0011;
		  7'b1_11_01_10 : enable = 7'b011_1100;
		  7'b1_11_00_11 : enable = 7'b000_0001;
		  7'b1_11_01_11 : enable = 7'b001_1110;
		  default		: enable = 7'b000_0000;
		endcase
		
// Register for inbetween data: simple multiplexer

	always @(posedge BCLK)
		if (enable[0])
			case (PACKET[1:0])
			  2'b01 : dreg_0 <= RDDATA[15:8];
			  2'b10 : dreg_0 <= RDDATA[23:16];
			  2'b11 : dreg_0 <= RDDATA[31:24];
			default : dreg_0 <= RDDATA[7:0];
			endcase

	always @(posedge BCLK)
		if (enable[1])
			case (PACKET[1:0])
			  2'b01 : dreg_1 <= RDDATA[23:16];
			  2'b10 : dreg_1 <= RDDATA[31:24];
			  2'b11 : dreg_1 <= RDDATA[7:0];
			default : dreg_1 <= RDDATA[15:8];
			endcase

	always @(posedge BCLK)
		if (enable[2])
			case (PACKET[1:0])
			  2'b01 : dreg_2 <= RDDATA[31:24];
			  2'b10 : dreg_2 <= RDDATA[7:0];
			  2'b11 : dreg_2 <= RDDATA[15:8];
			default : dreg_2 <= RDDATA[23:16];
			endcase

	always @(posedge BCLK)
		if (enable[3])
			case (PACKET[1:0])
			  2'b01 : dreg_3 <= RDDATA[7:0];
			  2'b10 : dreg_3 <= RDDATA[15:8];
			  2'b11 : dreg_3 <= RDDATA[23:16];
			default : dreg_3 <= RDDATA[31:24];
			endcase

	always @(posedge BCLK)
		if (enable[4])
			case (PACKET[1:0])
			  2'b01 : dreg_4 <= RDDATA[15:8];
			  2'b10 : dreg_4 <= RDDATA[23:16];
			  2'b11 : dreg_4 <= RDDATA[31:24];
			default : dreg_4 <= dreg_4;
			endcase

	always @(posedge BCLK) if (enable[5]) dreg_5 <= PACKET[1] ? RDDATA[31:24] : RDDATA[23:16];
	
	always @(posedge BCLK) if (enable[6]) dreg_6 <= RDDATA[31:24];

	// +++++++++++++++++++++++
	
	always @(SIZE or PACKET or RDDATA or dreg_0 or dreg_4)
		casex ({SIZE,PACKET[3],PACKET[1:0]})
		  5'b0x_0_01 : out_0 = RDDATA[15:8];
		  5'b0x_0_10 : out_0 = RDDATA[23:16];
		  5'b00_0_11 : out_0 = RDDATA[31:24];
		  5'b01_1_11 : out_0 = dreg_4;
		  5'b1x_1_01 : out_0 = dreg_4;
		  5'b1x_1_1x : out_0 = dreg_4;
		  default	 : out_0 = RDDATA[7:0];
		endcase

	always @(SIZE or PACKET or RDDATA or dreg_1 or dreg_5)
		casex ({SIZE,PACKET[3],PACKET[1:0]})
		  5'b01_0_01 : out_1 = RDDATA[23:16];
		  5'b01_0_10 : out_1 = RDDATA[31:24];
		  5'bxx_x_11 : out_1 = RDDATA[7:0];
		  5'b1x_1_01 : out_1 = dreg_5;
		  5'b1x_1_10 : out_1 = dreg_5;
		  default	 : out_1 = RDDATA[15:8];
		endcase
		
	always @(SIZE or PACKET or RDDATA or dreg_2 or dreg_6)
		case ({SIZE[1],PACKET[3],PACKET[1:0]})
		  4'b1_1_01 : out_2 = dreg_6;
		  4'b1_1_10 : out_2 = RDDATA[7:0];
		  4'b1_1_11 : out_2 = RDDATA[15:8];
		  default	: out_2 = RDDATA[23:16];
		endcase
		
	always @(SIZE or PACKET or RDDATA or dreg_3)
		case ({SIZE[1],PACKET[3],PACKET[1:0]})
		  4'b1_1_01 : out_3 = RDDATA[7:0];
		  4'b1_1_10 : out_3 = RDDATA[15:8];
		  4'b1_1_11 : out_3 = RDDATA[23:16];
		  default	: out_3 = RDDATA[31:24];
		endcase
		
	assign DP_DI = REG_OUT ? {dreg_3,dreg_2,dreg_1,dreg_0} : {out_3,out_2,out_1,out_0};
	
	// ++++++++++++++++ Special case QWord if cache switched off +++++++++++++++++++
	
	always @(posedge BCLK) AUX_QW <= ACC_OK & ~CA_HIT & (SIZE == 2'b11) & PACKET[3];
	
endmodule
