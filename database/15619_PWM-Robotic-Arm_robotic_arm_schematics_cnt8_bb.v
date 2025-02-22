// This program was cloned from: https://github.com/Waikebber/PWM-Robotic-Arm
// License: MIT License

// megafunction wizard: %LPM_COUNTER%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_COUNTER 

// ============================================================
// File Name: cnt8.v
// Megafunction Name(s):
// 			LPM_COUNTER
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 18.1.0 Build 625 09/12/2018 SJ Lite Edition
// ************************************************************

//Copyright (C) 2018  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.

module cnt8 (
	clock,
	cnt_en,
	updown,
	q);

	input	  clock;
	input	  cnt_en;
	input	  updown;
	output	[3:0]  q;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACLR NUMERIC "0"
// Retrieval info: PRIVATE: ALOAD NUMERIC "0"
// Retrieval info: PRIVATE: ASET NUMERIC "0"
// Retrieval info: PRIVATE: ASET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: CLK_EN NUMERIC "0"
// Retrieval info: PRIVATE: CNT_EN NUMERIC "1"
// Retrieval info: PRIVATE: CarryIn NUMERIC "0"
// Retrieval info: PRIVATE: CarryOut NUMERIC "0"
// Retrieval info: PRIVATE: Direction NUMERIC "2"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
// Retrieval info: PRIVATE: ModulusCounter NUMERIC "0"
// Retrieval info: PRIVATE: ModulusValue NUMERIC "0"
// Retrieval info: PRIVATE: SCLR NUMERIC "0"
// Retrieval info: PRIVATE: SLOAD NUMERIC "0"
// Retrieval info: PRIVATE: SSET NUMERIC "0"
// Retrieval info: PRIVATE: SSET_ALL1 NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: nBit NUMERIC "4"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_DIRECTION STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_PORT_UPDOWN STRING "PORT_USED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COUNTER"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "4"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: cnt_en 0 0 0 0 INPUT NODEFVAL "cnt_en"
// Retrieval info: USED_PORT: q 0 0 4 0 OUTPUT NODEFVAL "q[3..0]"
// Retrieval info: USED_PORT: updown 0 0 0 0 INPUT NODEFVAL "updown"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @cnt_en 0 0 0 0 cnt_en 0 0 0 0
// Retrieval info: CONNECT: @updown 0 0 0 0 updown 0 0 0 0
// Retrieval info: CONNECT: q 0 0 4 0 @q 0 0 4 0
// Retrieval info: GEN_FILE: TYPE_NORMAL cnt8.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cnt8.inc TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cnt8.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cnt8.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cnt8_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL cnt8_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
