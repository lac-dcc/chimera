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
// CREATED		"Wed May 01 13:56:15 2024"

module ForwardAfromMEMtoID(
	IDrm,
	MEMop,
	MEMrn,
	MEMrp,
	Y
);


input wire	[4:0] IDrm;
input wire	[5:0] MEMop;
input wire	[4:0] MEMrn;
input wire	[4:0] MEMrp;
output wire	Y;

wire	MEMopisRTYPE;
wire	MEMopisRTYPE_and_MEMrpisIDrm;
wire	MEMrnisIDrm;
wire	MEMrpisIDrm;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	Y = SYNTHESIZED_WIRE_4 | MEMopisRTYPE_and_MEMrpisIDrm;

assign	MEMopisRTYPE_and_MEMrpisIDrm = MEMopisRTYPE & MEMrpisIDrm;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_5 & MEMrnisIDrm;


ADDI	b2v_inst6(
	.Op(MEMop),
	.Y(SYNTHESIZED_WIRE_2));


SLTI	b2v_inst7(
	.Op(MEMop),
	.Y(SYNTHESIZED_WIRE_1));


LUI	b2v_inst8(
	.Op(MEMop),
	.Y(SYNTHESIZED_WIRE_3));


ORI	b2v_inst9(
	.Op(MEMop),
	.Y(SYNTHESIZED_WIRE_0));


RTYPE	b2v_MEMopRTYPE(
	.Op(MEMop),
	.Y(MEMopisRTYPE));


REGCheck	b2v_MEMrnIDrm(
	.reg1(IDrm),
	.reg2(MEMrn),
	.Y(MEMrnisIDrm));


REGCheck	b2v_MEMrpIDrm(
	.reg1(IDrm),
	.reg2(MEMrp),
	.Y(MEMrpisIDrm));


endmodule
