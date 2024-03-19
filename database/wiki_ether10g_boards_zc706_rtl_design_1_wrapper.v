//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4.1 (lin64) Build 1431336 Fri Dec 11 14:52:39 MST 2015
//Date        : Thu Apr  7 19:16:28 2016
//Host        : cyan.arc.ics.keio.ac.jp running 64-bit Fedora release 23 (Twenty Three)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`default_nettype none
`define USE_SI5324

module design_1_wrapper (
	// 200MHz reference clock input
	input  wire       SYSCLK_N,
	input  wire       SYSCLK_P,
	// 156.25 MHz clock in
	input  wire       SI5324_OUT_C_N,
	input  wire       SI5324_OUT_C_P,

	output wire       SFP_TX_P,
	output wire       SFP_TX_N,
	input  wire       SFP_RX_P,
	input  wire       SFP_RX_N,

	inout  wire       I2C_CLK,
	inout  wire       I2C_DATA,
	output wire       SI5324_RST_N,
	output wire [3:0] LED,
	output wire       SFP_TX_DISABLE,
	// Zynq APU
	inout wire [14:0] DDR_addr,
	inout wire [2:0]  DDR_ba,
	inout wire        DDR_cas_n,
	inout wire        DDR_ck_n,
	inout wire        DDR_ck_p,
	inout wire        DDR_cke,
	inout wire        DDR_cs_n,
	inout wire [3:0]  DDR_dm,
	inout wire [31:0] DDR_dq,
	inout wire [3:0]  DDR_dqs_n,
	inout wire [3:0]  DDR_dqs_p,
	inout wire 	      DDR_odt,
	inout wire 	      DDR_ras_n,
	inout wire 	      DDR_reset_n,
	inout wire 	      DDR_we_n,
	inout wire 	      FIXED_IO_ddr_vrn,
	inout wire 	      FIXED_IO_ddr_vrp,
	inout wire [53:0] FIXED_IO_mio,
	inout wire        FIXED_IO_ps_clk,
	inout wire        FIXED_IO_ps_porb,
	inout wire        FIXED_IO_ps_srstb,
	input wire [3:0]  dip_switches_4bits_tri_i
);

top inst_top(
	// 200MHz reference clock input
	.SYSCLK_N(SYSCLK_N),
	.SYSCLK_P(SYSCLK_P),
	// 156.25 MHz clock in
	.SI5324_OUT_C_N(SI5324_OUT_C_N),
	.SI5324_OUT_C_P(SI5324_OUT_C_P),

	.SFP_TX_P(SFP_TX_P),
	.SFP_TX_N(SFP_TX_N),
	.SFP_RX_P(SFP_RX_P),
	.SFP_RX_N(SFP_RX_N),

	.LED(LED),
	.SFP_TX_DISABLE(SFP_TX_DISABLE)
);

design_1 design_1_i (
	.DDR_addr(DDR_addr),
	.DDR_ba(DDR_ba),
	.DDR_cas_n(DDR_cas_n),
	.DDR_ck_n(DDR_ck_n),
	.DDR_ck_p(DDR_ck_p),
	.DDR_cke(DDR_cke),
	.DDR_cs_n(DDR_cs_n),
	.DDR_dm(DDR_dm),
	.DDR_dq(DDR_dq),
	.DDR_dqs_n(DDR_dqs_n),
	.DDR_dqs_p(DDR_dqs_p),
	.DDR_odt(DDR_odt),
	.DDR_ras_n(DDR_ras_n),
	.DDR_reset_n(DDR_reset_n),
	.DDR_we_n(DDR_we_n),
	.FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
	.FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
	.FIXED_IO_mio(FIXED_IO_mio),
	.FIXED_IO_ps_clk(FIXED_IO_ps_clk),
	.FIXED_IO_ps_porb(FIXED_IO_ps_porb),
	.FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
	.dip_switches_4bits_tri_i(dip_switches_4bits_tri_i)
);

endmodule
`default_nettype wire
