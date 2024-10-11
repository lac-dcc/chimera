// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002(
	input wire refclk,
	input wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire locked
);

	wire feedback0;
	wire feedback1;

	wire locked0;
	wire locked1;

	wire outclk_0_bufg;
	wire outclk_1_bufg;
	
	PLLE2_ADV #(
		.CLKFBOUT_MULT(6'd24),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd25), // 50 * 24 / 25 = 48 MHz
		.CLKOUT0_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) pll_48Mhz (
		.CLKFBIN(feedback0),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback0),
		.CLKOUT0(outclk_0_bufg),
		.LOCKED(locked0)
	);

	PLLE2_ADV #(
		.CLKFBOUT_MULT(6'd18),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd50), // 50 * 18 / 50 = 18 MHz
		.CLKOUT0_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) pll_18Mhz (
		.CLKFBIN(feedback1),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback1),
		.CLKOUT0(outclk_1_bufg),
		.LOCKED(locked1)
	);

	assign locked = locked0 & locked1;

	BUFG outclk_bufg_0 (.I(outclk_0_bufg), .O(outclk_0));
	BUFG outclk_bufg_1 (.I(outclk_1_bufg), .O(outclk_1));	
endmodule