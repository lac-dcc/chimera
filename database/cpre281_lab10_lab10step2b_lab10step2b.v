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
// CREATED		"Tue Apr 16 18:37:14 2024"

module lab10step2b(
	Clock,
	Enable,
	CLRN,
	Q4,
	Q0,
	Q1,
	Q2,
	Q3
);


input wire	Clock;
input wire	Enable;
input wire	CLRN;
output reg	Q4;
output wire	Q0;
output wire	Q1;
output wire	Q2;
output wire	Q3;

wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_3;
reg	TFF_inst1;
reg	TFF_inst2;
reg	TFF_inst3;
reg	TFF_inst;

assign	Q0 = TFF_inst;
assign	Q1 = TFF_inst1;
assign	Q2 = TFF_inst2;
assign	Q3 = TFF_inst3;




always@(posedge Clock or negedge CLRN)
begin
if (!CLRN)
	begin
	TFF_inst <= 0;
	end
else
	TFF_inst <= TFF_inst ^ Enable;
end


always@(posedge Clock or negedge CLRN)
begin
if (!CLRN)
	begin
	TFF_inst1 <= 0;
	end
else
	TFF_inst1 <= TFF_inst1 ^ SYNTHESIZED_WIRE_7;
end


always@(posedge Clock or negedge CLRN)
begin
if (!CLRN)
	begin
	TFF_inst2 <= 0;
	end
else
	TFF_inst2 <= TFF_inst2 ^ SYNTHESIZED_WIRE_8;
end


always@(posedge Clock or negedge CLRN)
begin
if (!CLRN)
	begin
	TFF_inst3 <= 0;
	end
else
	TFF_inst3 <= TFF_inst3 ^ SYNTHESIZED_WIRE_9;
end


always@(posedge Clock or negedge CLRN)
begin
if (!CLRN)
	begin
	Q4 <= 0;
	end
else
	Q4 <= Q4 ^ SYNTHESIZED_WIRE_3;
end

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_7 & TFF_inst1;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_8 & TFF_inst2;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_9 & TFF_inst3;

assign	SYNTHESIZED_WIRE_7 = Enable & TFF_inst;


endmodule
