// This program was cloned from: https://github.com/maxluppe/tt07_maxluppe_nist0102
// License: Apache License 2.0

// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
// CREATED		"Wed Mar 29 15:13:03 2023"

module Sn_counter(
	UD,
	CLK,
	RST,
	SnQ
);

input wire	UD;
input wire	CLK;
input wire	RST;
output wire	[8:0] SnQ;

//wire	SYNTHESIZED_WIRE_1;
wire	RSTn;
wire	UDn;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;

assign	RSTn =  ~RST;

assign	UDn =  ~UD;

Sn_counter_module	b2v_modSn0(
	.UP_in(UD),
	.D_in(1'b1),
	.DN_in(UDn),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[0]),
	.UP_out(SYNTHESIZED_WIRE_3),
	.D_out(SYNTHESIZED_WIRE_4),
	.DN_out(SYNTHESIZED_WIRE_5));

Sn_counter_module	b2v_modSn1(
	.UP_in(SYNTHESIZED_WIRE_3),
	.D_in(SYNTHESIZED_WIRE_4),
	.DN_in(SYNTHESIZED_WIRE_5),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[1]),
	.UP_out(SYNTHESIZED_WIRE_7),
	.D_out(SYNTHESIZED_WIRE_8),
	.DN_out(SYNTHESIZED_WIRE_9));

Sn_counter_module	b2v_modSn2(
	.UP_in(SYNTHESIZED_WIRE_7),
	.D_in(SYNTHESIZED_WIRE_8),
	.DN_in(SYNTHESIZED_WIRE_9),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[2]),
	.UP_out(SYNTHESIZED_WIRE_11),
	.D_out(SYNTHESIZED_WIRE_12),
	.DN_out(SYNTHESIZED_WIRE_13));

Sn_counter_module	b2v_modSn3(
	.UP_in(SYNTHESIZED_WIRE_11),
	.D_in(SYNTHESIZED_WIRE_12),
	.DN_in(SYNTHESIZED_WIRE_13),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[3]),
	.UP_out(SYNTHESIZED_WIRE_15),
	.D_out(SYNTHESIZED_WIRE_16),
	.DN_out(SYNTHESIZED_WIRE_17));

Sn_counter_module	b2v_modSn4(
	.UP_in(SYNTHESIZED_WIRE_15),
	.D_in(SYNTHESIZED_WIRE_16),
	.DN_in(SYNTHESIZED_WIRE_17),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[4]),
	.UP_out(SYNTHESIZED_WIRE_19),
	.D_out(SYNTHESIZED_WIRE_20),
	.DN_out(SYNTHESIZED_WIRE_21));

Sn_counter_module	b2v_modSn5(
	.UP_in(SYNTHESIZED_WIRE_19),
	.D_in(SYNTHESIZED_WIRE_20),
	.DN_in(SYNTHESIZED_WIRE_21),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[5]),
	.UP_out(SYNTHESIZED_WIRE_23),
	.D_out(SYNTHESIZED_WIRE_24),
	.DN_out(SYNTHESIZED_WIRE_25));

Sn_counter_module	b2v_modSn6(
	.UP_in(SYNTHESIZED_WIRE_23),
	.D_in(SYNTHESIZED_WIRE_24),
	.DN_in(SYNTHESIZED_WIRE_25),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[6]),
	.UP_out(SYNTHESIZED_WIRE_27),
	.D_out(SYNTHESIZED_WIRE_28),
	.DN_out(SYNTHESIZED_WIRE_29));

Sn_counter_module	b2v_modSn7(
	.UP_in(SYNTHESIZED_WIRE_27),
	.D_in(SYNTHESIZED_WIRE_28),
	.DN_in(SYNTHESIZED_WIRE_29),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[7]),
	.UP_out(SYNTHESIZED_WIRE_30),
	.D_out(SYNTHESIZED_WIRE_31),
	.DN_out(SYNTHESIZED_WIRE_32));

Sn_counter_module	b2v_modSn8(
	.UP_in(SYNTHESIZED_WIRE_30),
	.D_in(SYNTHESIZED_WIRE_31),
	.DN_in(SYNTHESIZED_WIRE_32),
	.CLK_In(CLK),
	.CLRn_in(RSTn),
	.Q_out(SnQ[8]),
	.UP_out(SYNTHESIZED_WIRE_33),
	.D_out(SYNTHESIZED_WIRE_34),
	.DN_out(SYNTHESIZED_WIRE_35));


endmodule
