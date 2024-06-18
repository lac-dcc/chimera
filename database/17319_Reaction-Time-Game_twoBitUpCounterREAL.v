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
// CREATED		"Tue Apr 30 03:58:14 2024"

module twoBitUpCounterREAL(
	CLRN1,
	CLK1,
	EnableReal,
	Q0,
	Q1,
	Q3
);


input wire	CLRN1;
input wire	CLK1;
input wire	EnableReal;
output wire	Q0;
output wire	Q1;
output wire	Q3;

wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_4;
reg	SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_3 = 1;




always@(posedge CLK1 or negedge CLRN1 or negedge SYNTHESIZED_WIRE_3)
begin
if (!CLRN1)
	begin
	SYNTHESIZED_WIRE_4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_3)
	begin
	SYNTHESIZED_WIRE_4 <= 1;
	end
else
if (EnableReal)
	begin
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_4 ^ SYNTHESIZED_WIRE_3;
	end
end


always@(posedge CLK1 or negedge CLRN1 or negedge SYNTHESIZED_WIRE_3)
begin
if (!CLRN1)
	begin
	SYNTHESIZED_WIRE_5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_3)
	begin
	SYNTHESIZED_WIRE_5 <= 1;
	end
else
if (EnableReal)
	begin
	SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_5 ^ SYNTHESIZED_WIRE_4;
	end
end


assign	Q3 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;

assign	Q0 =  ~SYNTHESIZED_WIRE_4;

assign	Q1 = SYNTHESIZED_WIRE_4 ^ SYNTHESIZED_WIRE_5;


endmodule
