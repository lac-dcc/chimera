// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * xc7_25MHz_125MHz_mmcm.v
 *
 * Copyright (C) 2017-2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

`default_nettype none
`timescale 1ns / 1ps

module pll (
	input  wire clock_in,      // input clock
	input  wire rst_in,        // reset
	output wire clock0_out,    // clock0 out
	output reg  clock0_locked, // lock sync with clock0
	output wire clock1_out,    // clock1 out
	output reg  clock1_locked  // lock sync with clock1
);

	localparam
		IN_PERIOD = 10.0, // input clock (ns) (10 ns == 100 MHz)
		VCO_MULT  = 10,   // VCO clock multiplier (2.000-64.000)
		VCO_DIV   = 1,    // VCO clock divider (1-106)
		CLK0_DIV  = 40.0, // clock0 divider (100M -> 1G ->  25M)
		CLK1_DIV  = 8;    // clock1 divider (100M -> 1G -> 125M)

	wire feedback;         // PLL feedback
	wire clock0_unbuf; // unbuffered clock0
	wire clock1_unbuf; // unbuffered clock1
	wire locked_s;     // unsynced lock signal

	// see Xilinx UG472 for MMCME2_BASE and BUFG
	MMCME2_BASE #(
		.CLKFBOUT_MULT_F(VCO_MULT),
		.CLKIN1_PERIOD(IN_PERIOD),
		.CLKOUT0_DIVIDE_F(CLK0_DIV),
		.CLKOUT1_DIVIDE(CLK1_DIV),
		.DIVCLK_DIVIDE(VCO_DIV)
	) MMCME2_BASE_inst (
		.CLKIN1(clock_in),
		.RST(rst_in),
		.CLKOUT0(clock0_unbuf),
		.CLKOUT1(clock1_unbuf),
		.LOCKED(locked_s),
		.CLKFBOUT(feedback),
		.CLKFBIN(feedback),
		/* verilator lint_off PINCONNECTEMPTY */
		.CLKOUT0B(),
		.CLKOUT1B(),
		.CLKOUT2(),
		.CLKOUT2B(),
		.CLKOUT3(),
		.CLKOUT3B(),
		.CLKOUT4(),
		.CLKOUT5(),
		.CLKOUT6(),
		.CLKFBOUTB(),
		.PWRDWN()
		/* verilator lint_on PINCONNECTEMPTY */
	);

	// buffer output clocks
	BUFG bufg_clock0(.I(clock0_unbuf), .O(clock0_out));
	BUFG bufg_clock1(.I(clock1_unbuf), .O(clock1_out));

	// sync clock lock with clocks
	reg clock0_locked_sync_0;
	always @(posedge clock0_out) begin
		clock0_locked_sync_0 <= locked_s;
		clock0_locked <= clock0_locked_sync_0;
	end
	reg clock1_locked_sync_0;
	always @(posedge clock1_out) begin
		clock1_locked_sync_0 <= locked_s;
		clock1_locked <= clock1_locked_sync_0;
	end
endmodule
