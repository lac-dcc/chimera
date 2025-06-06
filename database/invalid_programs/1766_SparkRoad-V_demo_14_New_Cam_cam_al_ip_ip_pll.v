// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/zhang/Desktop/Cam/cam/al_ip/ip_pll.v
 ** Date	:	2019 10 17
 ** TD version	:	4.6.13941
\************************************************************/

///////////////////////////////////////////////////////////////////////////////
//	Input frequency:             24.000Mhz
//	Clock multiplication factor: 3
//	Clock division factor:       2
//	Clock information:
//		Clock name	| Frequency 	| Phase shift
//		C0        	| 36.000000 MHZ	| 0  DEG     
//		C1        	| 10.800000 MHZ	| 0  DEG     
//		C2        	| 3.600000  MHZ	| 0  DEG     
///////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 100 fs

module ip_pll(refclk,
		reset,
		clk0_out,
		clk1_out,
		clk2_out);

	input refclk;
	input reset;
	output clk0_out;
	output clk1_out;
	output clk2_out;

	wire clk0_buf;

	EG_LOGIC_BUFG bufg_feedback( .i(clk0_buf), .o(clk0_out) );

	EG_PHY_PLL #(.DPHASE_SOURCE("DISABLE"),
		.DYNCFG("DISABLE"),
		.FIN("24.000"),
		.FEEDBK_MODE("NORMAL"),
		.FEEDBK_PATH("CLKC0_EXT"),
		.STDBY_ENABLE("DISABLE"),
		.PLLRST_ENA("ENABLE"),
		.SYNC_ENABLE("DISABLE"),
		.DERIVE_PLL_CLOCKS("DISABLE"),
		.GEN_BASIC_CLOCK("DISABLE"),
		.GMC_GAIN(0),
		.ICP_CURRENT(9),
		.KVCO(2),
		.LPF_CAPACITOR(2),
		.LPF_RESISTOR(8),
		.REFCLK_DIV(2),
		.FBCLK_DIV(3),
		.CLKC0_ENABLE("ENABLE"),
		.CLKC0_DIV(12),
		.CLKC0_CPHASE(11),
		.CLKC0_FPHASE(0),
		.CLKC1_ENABLE("ENABLE"),
		.CLKC1_DIV(40),
		.CLKC1_CPHASE(39),
		.CLKC1_FPHASE(0),
		.CLKC2_ENABLE("ENABLE"),
		.CLKC2_DIV(120),
		.CLKC2_CPHASE(119),
		.CLKC2_FPHASE(0)	)
	pll_inst (.refclk(refclk),
		.reset(reset),
		.stdby(1'b0),
		.extlock(open),
		.psclk(1'b0),
		.psdown(1'b0),
		.psstep(1'b0),
		.psclksel(3'b000),
		.psdone(open),
		.dclk(1'b0),
		.dcs(1'b0),
		.dwe(1'b0),
		.di(8'b00000000),
		.daddr(6'b000000),
		.do({open, open, open, open, open, open, open, open}),
		.fbclk(clk0_out),
		.clkc({open, open, clk2_out, clk1_out, clk0_buf}));

endmodule
