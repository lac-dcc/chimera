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
// CREATED		"Fri Apr 12 19:31:04 2024"

module lab10step1(
	CLK,
	IN,
	VCC,
	Q4,
	Q1,
	Q2,
	Q3
);


input wire	CLK;
input wire	IN;
input wire	VCC;
output reg	Q4;
output wire	Q1;
output wire	Q2;
output wire	Q3;

reg	DFF_inst2;
reg	DFF_inst;
reg	DFF_inst1;

assign	Q1 = DFF_inst2;
assign	Q2 = DFF_inst;
assign	Q3 = DFF_inst1;




always@(posedge CLK or negedge VCC or negedge VCC)
begin
if (!VCC)
	begin
	DFF_inst <= 0;
	end
else
if (!VCC)
	begin
	DFF_inst <= 1;
	end
else
	begin
	DFF_inst <= DFF_inst2;
	end
end


always@(posedge CLK or negedge VCC or negedge VCC)
begin
if (!VCC)
	begin
	DFF_inst1 <= 0;
	end
else
if (!VCC)
	begin
	DFF_inst1 <= 1;
	end
else
	begin
	DFF_inst1 <= DFF_inst;
	end
end


always@(posedge CLK or negedge VCC or negedge VCC)
begin
if (!VCC)
	begin
	DFF_inst2 <= 0;
	end
else
if (!VCC)
	begin
	DFF_inst2 <= 1;
	end
else
	begin
	DFF_inst2 <= IN;
	end
end


always@(posedge CLK or negedge VCC or negedge VCC)
begin
if (!VCC)
	begin
	Q4 <= 0;
	end
else
if (!VCC)
	begin
	Q4 <= 1;
	end
else
	begin
	Q4 <= DFF_inst1;
	end
end


endmodule
