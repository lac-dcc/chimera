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
// CREATED		"Wed Mar 29 15:07:33 2023"

module NIST0102(
	RND_in,
	clk,
	rst_n,
	nPass2,
	nPass1,
	nBlkOK1,
	nBlkOK2
);

input wire	RND_in;
input wire	clk;
input wire	rst_n;
output wire	nPass2;
output wire	nPass1;
output wire	nBlkOK1;
output wire	nBlkOK2;

wire	CoutBlk;
wire	CoutRND0a;
wire	CoutRND0b;
wire	GTE123s1;
wire	GTE123s2;
wire	LT30s;
wire	LTE32s;
wire	[7:0] mSnQ;
wire	[7:0] NIST02_d;
wire	[7:0] S;
wire	[7:0] S_C_4_sqr;
wire	[3:0] C_counter_Q;
wire	[6:0] Blk_counter1_Q;
wire	[6:0] Blk_counter2_Q;
wire	[8:0] SnQ;
reg	Blk_counter_RST;
wire	Blk_counter_RSTn;
reg	C_counter_RST;
wire	C_counter_RSTn;
reg	Sn_counter_RST;
wire	Sn_counter_RSTn;
//
wire	Blk_counter_RST2;
wire	C_counter_RST2;
wire	Sn_counter_RST2;
// **************
wire	BlkOK1;
wire	BlkOK2;
wire	SYNTHESIZED_WIRE_0;		// ************Dummy************
wire	SYNTHESIZED_WIRE_1;		// ************Dummy************
wire	SYNTHESIZED_WIRE_2;		// ************Dummy************
wire	[2:0] SYNTHESIZED_WIRE_3;	// ************Dummy************
wire	[3:0] SYNTHESIZED_WIRE_4;	// ************Dummy************
wire	[6:0] SYNTHESIZED_WIRE_5;	// ************Dummy************
	
assign	Blk_counter_RST2 = ~rst_n | Blk_counter_RST;
assign	C_counter_RST2 = ~rst_n | C_counter_RST;
assign	Sn_counter_RST2 = ~rst_n | Sn_counter_RST;

//  NIST01
Sn_counter	b2v_SN_counter(
	.UD(RND_in),
	.CLK(clk),
	.RST(Sn_counter_RST2),
	.SnQ(SnQ));

moduloSn	b2v_moduloSn(
	.SnQ(SnQ),
	.mSnQ(mSnQ));

LT30	b2v_LT30(
	.mSnQ(mSnQ),
	.LT30(LT30s));

assign	BlkOK1 = LT30s & CoutRND0b;

assign	nBlkOK1 =  ~BlkOK1;

Blk_counter	b2v_Blk_counter1(
	.CLKE(BlkOK1),
	.CLK(clk),
	.RST(Blk_counter_RST2),
	.Cout(SYNTHESIZED_WIRE_0),		// ***************
	.Q(Blk_counter1_Q));

GTE123	b2v_GTE124(
	.BlkQ(Blk_counter1_Q),
	.GTE123(GTE123s1));

assign	nPass1 = ~(CoutBlk & GTE123s1);

//  NIST02
C_counter	b2v_C_counter(
	.CLKE(RND_in),
	.CLK(~clk),
	.RST(C_counter_RST2),
	.C(C_counter_Q));

C_4_sqr	b2v_C_4_sqr(
	.C(C_counter_Q),
	.S(S_C_4_sqr)
	);

Adder_8	b2v_ADD8(
	.A(NIST02_d),
	.B(S_C_4_sqr),
	.S(S),
	.Cout(SYNTHESIZED_WIRE_1));		// ***************

Register_8	b2v_REG8(
	.D(S),
	.EN(CoutRND0a),
	.CLK(clk),
	.CLR(Sn_counter_RST2),
	.Q(NIST02_d));

LTE32	b2v_LTE32(
	.S(NIST02_d),
	.LTE32(LTE32s));

assign	BlkOK2 = LTE32s & CoutRND0b;

assign	nBlkOK2 =  ~BlkOK2;

Blk_counter	b2v_Blk_counter2(
	.CLKE(BlkOK2),
	.CLK(clk),
	.RST(Blk_counter_RST2),
	.Cout(SYNTHESIZED_WIRE_2),		// ***************
	.Q(Blk_counter2_Q)
	);

GTE123	b2v_GTE123(
	.BlkQ(Blk_counter2_Q),
	.GTE123(GTE123s2)
	);

assign	nPass2 = ~(CoutBlk & GTE123s2);

//  Control
RND_counter_0a	b2v_RND_counter_0a(
	.CLKE(1'b1),
	.CLK(clk),
	.RSTn(rst_n),
	.Cout(CoutRND0a),
	.Q(SYNTHESIZED_WIRE_3)		// ***************
	);

assign	C_counter_RSTn =  ~C_counter_RST;

always@(posedge clk or negedge C_counter_RSTn)
begin
if (!C_counter_RSTn)
	begin
	C_counter_RST <= 1'b0;
	end
else
	begin
	C_counter_RST <= CoutRND0a;
	end
end

RND_counter_0b	b2v_RND_counter_0b(
	.CLKE(CoutRND0a),
	.CLK(clk),
	.RSTn(rst_n),
	.Cout(CoutRND0b),
	.Q(SYNTHESIZED_WIRE_4)		// ***************
	);

RND_counter	b2v_RND_counter_1(
	.CLKE(CoutRND0b),
	.CLK(clk),
	.RSTn(rst_n),
	.Cout(CoutBlk),
	.Q(SYNTHESIZED_WIRE_5)		// ***************
	);

assign	Sn_counter_RSTn =  ~Sn_counter_RST;

always@(posedge clk or negedge Sn_counter_RSTn)
begin
if (!Sn_counter_RSTn)
	begin
	Sn_counter_RST <= 1'b0;
	end
else
	begin
	Sn_counter_RST <= CoutRND0b;
	end
end

assign	Blk_counter_RSTn =  ~Blk_counter_RST;

always@(posedge clk or negedge Blk_counter_RSTn)
begin
if (!Blk_counter_RSTn)
	begin
	Blk_counter_RST <= 1'b0;
	end
else
	begin
	Blk_counter_RST <= CoutBlk;
	end
end

endmodule
