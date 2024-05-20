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
// CREATED		"Thu May 02 08:12:51 2024"

module ForwardDetection(
	EXrm,
	EXrn,
	IDrm,
	IDrn,
	MEMop,
	MEMrn,
	MEMrp,
	WBop,
	WBrn,
	WBrp,
	ForwardA_EX,
	ForwardA_ID,
	ForwardB_EX,
	ForwardB_ID
);


input wire	[4:0] EXrm;
input wire	[4:0] EXrn;
input wire	[4:0] IDrm;
input wire	[4:0] IDrn;
input wire	[5:0] MEMop;
input wire	[4:0] MEMrn;
input wire	[4:0] MEMrp;
input wire	[5:0] WBop;
input wire	[4:0] WBrn;
input wire	[4:0] WBrp;
output wire	[1:0] ForwardA_EX;
output wire	[1:0] ForwardA_ID;
output wire	[1:0] ForwardB_EX;
output wire	[1:0] ForwardB_ID;

wire	AWBtoEX;
wire	AWBtoID;
wire	BWBtoEX;
wire	BWBtoID;
wire	[1:0] ForwardA_EX_ALTERA_SYNTHESIZED;
wire	[1:0] ForwardA_ID_ALTERA_SYNTHESIZED;
wire	[1:0] ForwardB_EX_ALTERA_SYNTHESIZED;
wire	[1:0] ForwardB_ID_ALTERA_SYNTHESIZED;
wire	NOTAMEMtoEX;
wire	NOTAMEMtoID;
wire	NOTBMEMtoEX;
wire	NOTBMEMtoID;





ForwardAfromMEMtoEX	b2v_inst(
	.EXrm(EXrm),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.MEMrp(MEMrp),
	.Y(ForwardA_EX_ALTERA_SYNTHESIZED[0]));


ForwardBfromWBtoID	b2v_inst10(
	.IDrn(IDrn),
	.WBop(WBop),
	.WBrn(WBrn),
	.WBrp(WBrp),
	.Y(BWBtoID));

assign	NOTBMEMtoEX =  ~ForwardB_EX_ALTERA_SYNTHESIZED[0];

assign	ForwardB_EX_ALTERA_SYNTHESIZED[1] = NOTBMEMtoEX & BWBtoEX;

assign	NOTAMEMtoID =  ~ForwardA_ID_ALTERA_SYNTHESIZED[0];

assign	ForwardA_ID_ALTERA_SYNTHESIZED[1] = NOTAMEMtoID & AWBtoID;

assign	NOTBMEMtoID =  ~ForwardB_ID_ALTERA_SYNTHESIZED[0];

assign	ForwardB_ID_ALTERA_SYNTHESIZED[1] = NOTBMEMtoID & BWBtoID;


ForwardAfromWBtoEX	b2v_inst2(
	.EXrm(EXrm),
	.WBop(WBop),
	.WBrn(WBrn),
	.WBrp(WBrp),
	.Y(AWBtoEX));


ForwardBfromMEMtoEX	b2v_inst3(
	.EXrn(EXrn),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.MEMrp(MEMrp),
	.Y(ForwardB_EX_ALTERA_SYNTHESIZED[0]));

assign	NOTAMEMtoEX =  ~ForwardA_EX_ALTERA_SYNTHESIZED[0];

assign	ForwardA_EX_ALTERA_SYNTHESIZED[1] = NOTAMEMtoEX & AWBtoEX;


ForwardBfromWBtoEX	b2v_inst6(
	.EXrn(EXrn),
	.WBop(WBop),
	.WBrn(WBrn),
	.WBrp(WBrp),
	.Y(BWBtoEX));


ForwardAfromMEMtoID	b2v_inst7(
	.IDrm(IDrm),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.MEMrp(MEMrp),
	.Y(ForwardA_ID_ALTERA_SYNTHESIZED[0]));


ForwardAfromWBtoID	b2v_inst8(
	.IDrm(IDrm),
	.WBop(WBop),
	.WBrn(WBrn),
	.WBrp(WBrp),
	.Y(AWBtoID));


ForwardBfromMEMtoID	b2v_inst9(
	.IDrn(IDrn),
	.MEMop(MEMop),
	.MEMrn(MEMrn),
	.MEMrp(MEMrp),
	.Y(ForwardB_ID_ALTERA_SYNTHESIZED[0]));

assign	ForwardA_EX = ForwardA_EX_ALTERA_SYNTHESIZED;
assign	ForwardA_ID = ForwardA_ID_ALTERA_SYNTHESIZED;
assign	ForwardB_EX = ForwardB_EX_ALTERA_SYNTHESIZED;
assign	ForwardB_ID = ForwardB_ID_ALTERA_SYNTHESIZED;

endmodule
