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
// CREATED		"Wed Aug 17 11:45:35 2022"

module EQ_5(
	A,
	B,
	Y
);


input wire	[4:0] A;
input wire	[4:0] B;
output wire	Y;

wire	Bit0EQ;
wire	Bit1EQ;
wire	Bit2EQ;
wire	Bit3EQ;
wire	Bit4EQ;
wire	Power;




assign	Y = Bit3EQ & Power & Bit4EQ & Bit2EQ & Bit1EQ & Bit0EQ;


assign	Bit4EQ = A[4] ~^ B[4];

assign	Bit3EQ = A[3] ~^ B[3];

assign	Bit2EQ = A[2] ~^ B[2];

assign	Bit1EQ = A[1] ~^ B[1];

assign	Bit0EQ = A[0] ~^ B[0];

assign	Power = 1;

endmodule
