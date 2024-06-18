// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

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
// CREATED		"Fri Apr 19 11:21:02 2024"

module lab10step1(
	In,
	Clk,
	Q4,
	Q1,
	Q2,
	Q3
);


input wire	In;
input wire	Clk;
output reg	Q4;
output wire	Q1;
output wire	Q2;
output wire	Q3;

wire	SYNTHESIZED_WIRE_8;
reg	DFF_inst;
reg	DFF_inst2;
reg	DFF_inst3;

assign	Q1 = DFF_inst;
assign	Q2 = DFF_inst2;
assign	Q3 = DFF_inst3;
assign	SYNTHESIZED_WIRE_8 = 1;




always@(posedge Clk or negedge SYNTHESIZED_WIRE_8 or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	DFF_inst <= 0;
	end
else
if (!SYNTHESIZED_WIRE_8)
	begin
	DFF_inst <= 1;
	end
else
	begin
	DFF_inst <= In;
	end
end



always@(posedge Clk or negedge SYNTHESIZED_WIRE_8 or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	DFF_inst2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_8)
	begin
	DFF_inst2 <= 1;
	end
else
	begin
	DFF_inst2 <= DFF_inst;
	end
end


always@(posedge Clk or negedge SYNTHESIZED_WIRE_8 or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	DFF_inst3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_8)
	begin
	DFF_inst3 <= 1;
	end
else
	begin
	DFF_inst3 <= DFF_inst2;
	end
end


always@(posedge Clk or negedge SYNTHESIZED_WIRE_8 or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	Q4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_8)
	begin
	Q4 <= 1;
	end
else
	begin
	Q4 <= DFF_inst3;
	end
end


endmodule
