// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

// Copyright (C) 2023  Intel Corporation. All rights reserved.
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
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Standard Edition"
// CREATED		"Wed Apr  3 17:51:20 2024"

module DFlipFLop(
	D,
	Clk,
	Q,
	QN
);


input wire	D;
input wire	Clk;
output wire	Q;
output wire	QN;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





lab9step2	b2v_inst(
	.D(D),
	.Clk(Clk),
	.Q(SYNTHESIZED_WIRE_0)
	);


lab9step2	b2v_inst1(
	.D(SYNTHESIZED_WIRE_0),
	.Clk(SYNTHESIZED_WIRE_1),
	.Q(Q),
	.QN(QN));

assign	SYNTHESIZED_WIRE_1 =  ~Clk;


endmodule
