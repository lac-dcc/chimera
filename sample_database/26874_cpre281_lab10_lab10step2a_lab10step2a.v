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
// CREATED		"Tue Apr 16 19:20:21 2024"

module lab10step2a(
	Clk,
	Enable,
	CLRN,
	Q0,
	Q1,
	Q2,
	Q3,
	Z
);


input wire	Clk;
input wire	Enable;
input wire	CLRN;
output wire	Q0;
output wire	Q1;
output wire	Q2;
output wire	Q3;
output wire	Z;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
reg	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
reg	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
reg	SYNTHESIZED_WIRE_16;

assign	Q0 = SYNTHESIZED_WIRE_16;
assign	Q1 = SYNTHESIZED_WIRE_10;
assign	Q2 = SYNTHESIZED_WIRE_12;
assign	Q3 = SYNTHESIZED_WIRE_14;




always@(posedge Clk or negedge CLRN or negedge CLRN)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_16 <= 0;
	end
else
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_16 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_16 <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge Clk or negedge CLRN or negedge CLRN)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_10 <= 0;
	end
else
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_10 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_1;
	end
end

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_10 & SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13;

assign	Z = SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_15;


always@(posedge Clk or negedge CLRN or negedge CLRN)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_12 <= 0;
	end
else
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_12 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_12 <= SYNTHESIZED_WIRE_5;
	end
end


always@(posedge Clk or negedge CLRN or negedge CLRN)
begin
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_14 <= 0;
	end
else
if (!CLRN)
	begin
	SYNTHESIZED_WIRE_14 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_14 <= SYNTHESIZED_WIRE_6;
	end
end

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_16 ^ Enable;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_10 ^ SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_12 ^ SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_14 ^ SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_16 & Enable;


endmodule
