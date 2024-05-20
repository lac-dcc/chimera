// This program was cloned from: https://github.com/maxluppe/tt07_maxluppe_nist0102
// License: Apache License 2.0

// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Wed Mar 29 15:08:46 2023"

module Adder_8(
	A,
	B,
	S,
	Cout
);

input wire	[7:0] A;
input wire	[7:0] B;
output wire	[7:0] S;
output wire	Cout;

wire	[8:0] C;

assign	C[0] = 1'b0;

Full_adder	b2v_Adder_s0(
	.Ai(A[0]),
	.Bi(B[0]),
	.Cin(C[0]),
	.Si(S[0]),
	.Cout(C[1]));

Full_adder	b2v_Adder_s1(
	.Ai(A[1]),
	.Bi(B[1]),
	.Cin(C[1]),
	.Si(S[1]),
	.Cout(C[2]));

Full_adder	b2v_Adder_s2(
	.Ai(A[2]),
	.Bi(B[2]),
	.Cin(C[2]),
	.Si(S[2]),
	.Cout(C[3]));

Full_adder	b2v_Adder_s3(
	.Ai(A[3]),
	.Bi(B[3]),
	.Cin(C[3]),
	.Si(S[3]),
	.Cout(C[4]));

Full_adder	b2v_Adder_s4(
	.Ai(A[4]),
	.Bi(B[4]),
	.Cin(C[4]),
	.Si(S[4]),
	.Cout(C[5]));

Full_adder	b2v_Adder_s5(
	.Ai(A[5]),
	.Bi(B[5]),
	.Cin(C[5]),
	.Si(S[5]),
	.Cout(C[6]));

Full_adder	b2v_Adder_s6(
	.Ai(A[6]),
	.Bi(B[6]),
	.Cin(C[6]),
	.Si(S[6]),
	.Cout(C[7]));

Full_adder	b2v_Adder_s7(
	.Ai(A[7]),
	.Bi(B[7]),
	.Cin(C[7]),
	.Si(S[7]),
	.Cout(C[8]));

assign Cout = C[8];

endmodule
