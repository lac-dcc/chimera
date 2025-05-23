// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

// megafunction wizard: %Shift register (RAM-based)%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTSHIFT_TAPS 

// ============================================================
// File Name: IxIyIt_800pts_4line.v
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

module IxIyIt_800pts_4line (
	aclr,
	clken,
	clock,
	shiftin,
	shiftout,
	taps0x,
	taps1x,
	taps2x,
	taps3x);

	input	  aclr;
	input	  clken;
	input	  clock;
	input	[26:0]  shiftin;
	output	[26:0]  shiftout;
	output	[26:0]  taps0x;
	output	[26:0]  taps1x;
	output	[26:0]  taps2x;
	output	[26:0]  taps3x;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  aclr;
	tri1	  clken;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "1"
// Retrieval info: PRIVATE: CLKEN NUMERIC "1"
// Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "4"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "3"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "800"
// Retrieval info: PRIVATE: WIDTH NUMERIC "27"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=AUTO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
// Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "4"
// Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "800"
// Retrieval info: CONSTANT: WIDTH NUMERIC "27"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT VCC "aclr"
// Retrieval info: USED_PORT: clken 0 0 0 0 INPUT VCC "clken"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: shiftin 0 0 27 0 INPUT NODEFVAL "shiftin[26..0]"
// Retrieval info: USED_PORT: shiftout 0 0 27 0 OUTPUT NODEFVAL "shiftout[26..0]"
// Retrieval info: USED_PORT: taps0x 0 0 27 0 OUTPUT NODEFVAL "taps0x[26..0]"
// Retrieval info: USED_PORT: taps1x 0 0 27 0 OUTPUT NODEFVAL "taps1x[26..0]"
// Retrieval info: USED_PORT: taps2x 0 0 27 0 OUTPUT NODEFVAL "taps2x[26..0]"
// Retrieval info: USED_PORT: taps3x 0 0 27 0 OUTPUT NODEFVAL "taps3x[26..0]"
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @shiftin 0 0 27 0 shiftin 0 0 27 0
// Retrieval info: CONNECT: shiftout 0 0 27 0 @shiftout 0 0 27 0
// Retrieval info: CONNECT: taps0x 0 0 27 0 @taps 0 0 27 0
// Retrieval info: CONNECT: taps1x 0 0 27 0 @taps 0 0 27 27
// Retrieval info: CONNECT: taps2x 0 0 27 0 @taps 0 0 27 54
// Retrieval info: CONNECT: taps3x 0 0 27 0 @taps 0 0 27 81
// Retrieval info: GEN_FILE: TYPE_NORMAL IxIyIt_800pts_4line.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL IxIyIt_800pts_4line.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL IxIyIt_800pts_4line.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL IxIyIt_800pts_4line.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL IxIyIt_800pts_4line_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL IxIyIt_800pts_4line_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
