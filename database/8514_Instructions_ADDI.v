// This program was cloned from: https://github.com/FIUSCIS-CDA/Instructions
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
// CREATED		"Thu May 18 13:22:31 2023"

module ADDI(
	Op,
	addi_output
);


input wire	[31:26] Op;
output wire	addi_output;

wire	NOTOp26;
wire	NOTOp27;
wire	NOTOp28;
wire	NOTOp30;
wire	NOTOp31;




assign	addi_output = Op[29] & NOTOp31 & NOTOp30 & NOTOp28 & NOTOp27 & NOTOp26;

assign	NOTOp31 =  ~Op[31];

assign	NOTOp30 =  ~Op[30];

assign	NOTOp28 =  ~Op[28];

assign	NOTOp27 =  ~Op[27];

assign	NOTOp26 =  ~Op[26];


endmodule
