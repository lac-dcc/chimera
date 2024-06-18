// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_MultiCycle
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
// CREATED		"Mon Aug 15 11:16:31 2022"

module NS0(
	Op5,
	Op4,
	Op3,
	Op2,
	Op1,
	Op0,
	S3,
	S2,
	S1,
	S0,
	NS0
);


input wire	Op5;
input wire	Op4;
input wire	Op3;
input wire	Op2;
input wire	Op1;
input wire	Op0;
input wire	S3;
input wire	S2;
input wire	S1;
input wire	S0;
output wire	NS0;

wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;




assign	SYNTHESIZED_WIRE_1 =  ~Op5;

assign	SYNTHESIZED_WIRE_6 =  ~Op4;

assign	SYNTHESIZED_WIRE_5 = Op5 & Op0 & S1 & SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_32 & S0;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_6 & SYNTHESIZED_WIRE_7 & Op1 & SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_9 & SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_14 = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_12;

assign	NS0 = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_34 & SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_19 = S2 & S1;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_33 & SYNTHESIZED_WIRE_31;


assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_21 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_29 = S2 & SYNTHESIZED_WIRE_32 & S0;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_34 & S1 & SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_23 = S3 & SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_7 =  ~Op2;

assign	SYNTHESIZED_WIRE_2 =  ~Op0;

assign	SYNTHESIZED_WIRE_33 =  ~S3;

assign	SYNTHESIZED_WIRE_34 =  ~S2;

assign	SYNTHESIZED_WIRE_32 =  ~S1;

assign	SYNTHESIZED_WIRE_31 =  ~S0;



endmodule
