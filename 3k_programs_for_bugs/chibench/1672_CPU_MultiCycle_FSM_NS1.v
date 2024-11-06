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
// CREATED		"Sun Aug 14 23:28:40 2022"

module NS1(
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
	NS1
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
output wire	NS1;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;




assign	SYNTHESIZED_WIRE_13 =  ~Op5;

assign	SYNTHESIZED_WIRE_0 =  ~Op4;

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_32 & SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_4 & S1 & SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_35 & S0;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_10 = Op5 & Op1 & Op0;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_9 & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_18;

assign	NS1 = SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_4 =  ~Op3;

assign	SYNTHESIZED_WIRE_26 = S1 & SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_32 & S2;

assign	SYNTHESIZED_WIRE_24 = S3 & SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_29 = S3 & S2 & SYNTHESIZED_WIRE_35 & S0;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_31 & S0;

assign	SYNTHESIZED_WIRE_1 =  ~Op2;

assign	SYNTHESIZED_WIRE_14 =  ~Op1;

assign	SYNTHESIZED_WIRE_15 =  ~Op0;

assign	SYNTHESIZED_WIRE_32 =  ~S3;

assign	SYNTHESIZED_WIRE_33 =  ~S2;

assign	SYNTHESIZED_WIRE_35 =  ~S1;

assign	SYNTHESIZED_WIRE_34 =  ~S0;


endmodule
