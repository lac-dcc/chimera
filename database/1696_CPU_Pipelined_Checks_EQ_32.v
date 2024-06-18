// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_Pipelined
// License: MIT License

// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed Aug 17 11:43:30 2022"

module EQ_32(
	A,
	B,
	Y
);


input wire	[31:0] A;
input wire	[31:0] B;
output wire	Y;

wire	A00EQB00;
wire	A01EQB01;
wire	A02EQB02;
wire	A03EQB03;
wire	A04EQB04;
wire	A05EQB05;
wire	A06EQB06;
wire	A07EQB07;
wire	A08EQB08;
wire	A09EQB09;
wire	A10EQB10;
wire	A11EQB11;
wire	A12EQB12;
wire	A13EQB13;
wire	A14EQB14;
wire	A15EQB15;
wire	A16EQB16;
wire	A17EQB17;
wire	A18EQB18;
wire	A19EQB19;
wire	A20EQB20;
wire	A21EQB21;
wire	A22EQB22;
wire	A23EQB23;
wire	A24EQB24;
wire	A25EQB25;
wire	A26EQB26;
wire	A27EQB27;
wire	A28EQB28;
wire	A29EQB29;
wire	A30EQB30;
wire	A31EQB31;
wire	lower8EQ;
wire	second8EQ;
wire	third8EQ;
wire	upper8EQ;




assign	A31EQB31 = A[31] ~^ B[31];

assign	A22EQB22 = A[22] ~^ B[22];

assign	A21EQB21 = A[21] ~^ B[21];

assign	A20EQB20 = A[20] ~^ B[20];

assign	A19EQB19 = A[19] ~^ B[19];

assign	A18EQB18 = A[18] ~^ B[18];

assign	A17EQB17 = A[17] ~^ B[17];

assign	A16EQB16 = A[16] ~^ B[16];

assign	A15EQB15 = A[15] ~^ B[15];

assign	A14EQB14 = A[14] ~^ B[14];

assign	A13EQB13 = A[13] ~^ B[13];

assign	A30EQB30 = A[30] ~^ B[30];

assign	A12EQB12 = A[12] ~^ B[12];

assign	A11EQB11 = A[11] ~^ B[11];

assign	A10EQB10 = A[10] ~^ B[10];

assign	A09EQB09 = A[9] ~^ B[9];

assign	A08EQB08 = A[8] ~^ B[8];

assign	A07EQB07 = A[7] ~^ B[7];

assign	A06EQB06 = A[6] ~^ B[6];

assign	A05EQB05 = A[5] ~^ B[5];

assign	A04EQB04 = A[4] ~^ B[4];

assign	A03EQB03 = A[3] ~^ B[3];

assign	A28EQB28 = A[28] ~^ B[28];

assign	A02EQB02 = A[2] ~^ B[2];

assign	A01EQB01 = A[1] ~^ B[1];

assign	A00EQB00 = A[0] ~^ B[0];

assign	upper8EQ = A31EQB31 & A29EQB29 & A30EQB30 & A28EQB28 & A25EQB25 & A26EQB26 & A24EQB24 & A27EQB27;

assign	second8EQ = A23EQB23 & A21EQB21 & A22EQB22 & A20EQB20 & A17EQB17 & A18EQB18 & A16EQB16 & A19EQB19;

assign	third8EQ = A15EQB15 & A13EQB13 & A14EQB14 & A12EQB12 & A09EQB09 & A10EQB10 & A08EQB08 & A11EQB11;

assign	lower8EQ = A07EQB07 & A05EQB05 & A06EQB06 & A04EQB04 & A01EQB01 & A02EQB02 & A00EQB00 & A03EQB03;

assign	Y = upper8EQ & second8EQ & third8EQ & lower8EQ;

assign	A29EQB29 = A[29] ~^ B[29];

assign	A27EQB27 = A[27] ~^ B[27];

assign	A26EQB26 = A[26] ~^ B[26];

assign	A25EQB25 = A[25] ~^ B[25];

assign	A24EQB24 = A[24] ~^ B[24];

assign	A23EQB23 = A[23] ~^ B[23];


endmodule
