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
// CREATED		"Sat Apr 20 01:52:04 2024"

`ifndef TFlipFlop
  `define TFlipFlop

module TFlipFlop(
	Clock,
	T,
	ClearN,
	PresetN,
	Q,
	Qn
);


input wire	Clock;
input wire	T;
input wire	ClearN;
input wire	PresetN;
output wire	Q;
output wire	Qn;

wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	Q = SYNTHESIZED_WIRE_7;
assign	Qn = SYNTHESIZED_WIRE_6;



assign	SYNTHESIZED_WIRE_4 = ~(SYNTHESIZED_WIRE_6 & T & Clock);

assign	SYNTHESIZED_WIRE_3 = ~(Clock & T & SYNTHESIZED_WIRE_7);

assign	SYNTHESIZED_WIRE_6 = ~(SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_3 & ClearN);

assign	SYNTHESIZED_WIRE_7 = ~(PresetN & SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_6);


endmodule

`endif
