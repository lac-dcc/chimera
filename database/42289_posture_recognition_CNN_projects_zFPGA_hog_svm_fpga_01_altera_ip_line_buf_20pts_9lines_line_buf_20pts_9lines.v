// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

// megafunction wizard: %Shift register (RAM-based)%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTSHIFT_TAPS 

// ============================================================
// File Name: line_buf_20pts_9lines.v
// Megafunction Name(s):
// 			ALTSHIFT_TAPS
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 14.0.0 Build 200 06/17/2014 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus II License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module line_buf_20pts_9lines (
	aclr,
	clken,
	clock,
	shiftin,
	shiftout,
	taps0x,
	taps1x,
	taps2x,
	taps3x,
	taps4x,
	taps5x,
	taps6x,
	taps7x,
	taps8x);

	input	  aclr;
	input	  clken;
	input	  clock;
	input	[15:0]  shiftin;
	output	[15:0]  shiftout;
	output	[15:0]  taps0x;
	output	[15:0]  taps1x;
	output	[15:0]  taps2x;
	output	[15:0]  taps3x;
	output	[15:0]  taps4x;
	output	[15:0]  taps5x;
	output	[15:0]  taps6x;
	output	[15:0]  taps7x;
	output	[15:0]  taps8x;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  aclr;
	tri1	  clken;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [15:0] sub_wire0;
	wire [143:0] sub_wire1;
	wire [15:0] shiftout = sub_wire0[15:0];
	wire [143:128] sub_wire17 = sub_wire1[143:128];
	wire [127:112] sub_wire16 = sub_wire1[127:112];
	wire [127:112] sub_wire15 = sub_wire16[127:112];
	wire [111:96] sub_wire14 = sub_wire1[111:96];
	wire [111:96] sub_wire13 = sub_wire14[111:96];
	wire [95:80] sub_wire12 = sub_wire1[95:80];
	wire [95:80] sub_wire11 = sub_wire12[95:80];
	wire [79:64] sub_wire10 = sub_wire1[79:64];
	wire [79:64] sub_wire9 = sub_wire10[79:64];
	wire [63:48] sub_wire8 = sub_wire1[63:48];
	wire [63:48] sub_wire7 = sub_wire8[63:48];
	wire [47:32] sub_wire6 = sub_wire1[47:32];
	wire [47:32] sub_wire5 = sub_wire6[47:32];
	wire [31:16] sub_wire4 = sub_wire1[31:16];
	wire [31:16] sub_wire3 = sub_wire4[31:16];
	wire [15:0] sub_wire2 = sub_wire1[15:0];
	wire [15:0] taps0x = sub_wire2[15:0];
	wire [15:0] taps1x = sub_wire3[31:16];
	wire [15:0] taps2x = sub_wire5[47:32];
	wire [15:0] taps3x = sub_wire7[63:48];
	wire [15:0] taps4x = sub_wire9[79:64];
	wire [15:0] taps5x = sub_wire11[95:80];
	wire [15:0] taps6x = sub_wire13[111:96];
	wire [15:0] taps7x = sub_wire15[127:112];
	wire [15:0] taps8x = sub_wire17[143:128];

	altshift_taps	ALTSHIFT_TAPS_component (
				.aclr (aclr),
				.clken (clken),
				.clock (clock),
				.shiftin (shiftin),
				.shiftout (sub_wire0),
				.taps (sub_wire1));
	defparam
		ALTSHIFT_TAPS_component.intended_device_family = "Cyclone V",
		ALTSHIFT_TAPS_component.lpm_hint = "RAM_BLOCK_TYPE=M10K",
		ALTSHIFT_TAPS_component.lpm_type = "altshift_taps",
		ALTSHIFT_TAPS_component.number_of_taps = 9,
		ALTSHIFT_TAPS_component.tap_distance = 20,
		ALTSHIFT_TAPS_component.width = 16;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "1"
// Retrieval info: PRIVATE: CLKEN NUMERIC "1"
// Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "9"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "20"
// Retrieval info: PRIVATE: WIDTH NUMERIC "16"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=M10K"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
// Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "9"
// Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "20"
// Retrieval info: CONSTANT: WIDTH NUMERIC "16"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT VCC "aclr"
// Retrieval info: USED_PORT: clken 0 0 0 0 INPUT VCC "clken"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: shiftin 0 0 16 0 INPUT NODEFVAL "shiftin[15..0]"
// Retrieval info: USED_PORT: shiftout 0 0 16 0 OUTPUT NODEFVAL "shiftout[15..0]"
// Retrieval info: USED_PORT: taps0x 0 0 16 0 OUTPUT NODEFVAL "taps0x[15..0]"
// Retrieval info: USED_PORT: taps1x 0 0 16 0 OUTPUT NODEFVAL "taps1x[15..0]"
// Retrieval info: USED_PORT: taps2x 0 0 16 0 OUTPUT NODEFVAL "taps2x[15..0]"
// Retrieval info: USED_PORT: taps3x 0 0 16 0 OUTPUT NODEFVAL "taps3x[15..0]"
// Retrieval info: USED_PORT: taps4x 0 0 16 0 OUTPUT NODEFVAL "taps4x[15..0]"
// Retrieval info: USED_PORT: taps5x 0 0 16 0 OUTPUT NODEFVAL "taps5x[15..0]"
// Retrieval info: USED_PORT: taps6x 0 0 16 0 OUTPUT NODEFVAL "taps6x[15..0]"
// Retrieval info: USED_PORT: taps7x 0 0 16 0 OUTPUT NODEFVAL "taps7x[15..0]"
// Retrieval info: USED_PORT: taps8x 0 0 16 0 OUTPUT NODEFVAL "taps8x[15..0]"
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @shiftin 0 0 16 0 shiftin 0 0 16 0
// Retrieval info: CONNECT: shiftout 0 0 16 0 @shiftout 0 0 16 0
// Retrieval info: CONNECT: taps0x 0 0 16 0 @taps 0 0 16 0
// Retrieval info: CONNECT: taps1x 0 0 16 0 @taps 0 0 16 16
// Retrieval info: CONNECT: taps2x 0 0 16 0 @taps 0 0 16 32
// Retrieval info: CONNECT: taps3x 0 0 16 0 @taps 0 0 16 48
// Retrieval info: CONNECT: taps4x 0 0 16 0 @taps 0 0 16 64
// Retrieval info: CONNECT: taps5x 0 0 16 0 @taps 0 0 16 80
// Retrieval info: CONNECT: taps6x 0 0 16 0 @taps 0 0 16 96
// Retrieval info: CONNECT: taps7x 0 0 16 0 @taps 0 0 16 112
// Retrieval info: CONNECT: taps8x 0 0 16 0 @taps 0 0 16 128
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_9lines.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_9lines.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_9lines.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_9lines.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_9lines_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL line_buf_20pts_9lines_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
