// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002(
	input  wire refclk,
	input  wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire outclk_2,
	output wire locked
);

	wire feedback;
	wire cascade;

	wire outclk_0_bufg;
	wire outclk_1_bufg;
	wire outclk_2_bufg;

	MMCME2_ADV #(
		.CLKFBOUT_MULT_F(12.0),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE_F(12.5), // 48 MHz = 50 MHz * 12 / 12.5
		.CLKOUT0_PHASE(1'd0),
		.CLKOUT1_DIVIDE(8'd100), // 6 MHz = 50 MHz * 12 / 100
		.CLKOUT1_PHASE(1'd0),
		.CLKOUT2_DIVIDE(8'd25), // 24 MHz = 50 MHz * 12 / 25
		.CLKOUT2_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) BOMBJACK_PLL (
		.CLKFBIN(feedback),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback),
		.CLKOUT0(outclk_0_bufg),
		.CLKOUT1(outclk_1_bufg),
		.CLKOUT2(outclk_2_bufg),
		.LOCKED(locked)
	);

	BUFG outclk_bufg_0 (.I(outclk_0_bufg), .O(outclk_0));
	BUFG outclk_bufg_1 (.I(outclk_1_bufg), .O(outclk_1));
	BUFG outclk_bufg_2 (.I(outclk_2_bufg), .O(outclk_2));
	
endmodule

