// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002(
	input wire refclk,
	input wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire outclk_2,
	output wire outclk_3,
	output wire locked
);

	wire feedback;

	wire outclk_0_bufg;
	wire outclk_1_bufg;
	wire outclk_2_bufg;
	wire outclk_3_bufg;
	
	PLLE2_ADV #(
		.CLKFBOUT_MULT(6'd32),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd32), // 50 MHz = 50 MHz * 32 / 32
		.CLKOUT0_PHASE(1'd0),
		.CLKOUT1_DIVIDE(7'd40), // 40 MHz = 50 MHz * 32 / 40
		.CLKOUT1_PHASE(1'd0),
		.CLKOUT2_DIVIDE(7'd64), // 25 MHz = 50 MHz * 32 / 64
		.CLKOUT2_PHASE(1'd0),
		.CLKOUT3_DIVIDE(7'd16), // 100 MHz = 50 MHz * 32 / 16
		.CLKOUT3_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) PLLE2_ADV (
		.CLKFBIN(feedback),
		.CLKIN1(refclk),
		.PWRDWN(1'b0),
		.RST(rst),
		.CLKFBOUT(feedback),
		.CLKOUT0(outclk_0_bufg),
		.CLKOUT1(outclk_1_bufg),
		.CLKOUT2(outclk_2_bufg),
		.CLKOUT3(outclk_3_bufg),
		.LOCKED(locked)
	);

	BUFG outclk_bufg_0 (.I(outclk_0_bufg), .O(outclk_0));
	BUFG outclk_bufg_1 (.I(outclk_1_bufg), .O(outclk_1));
	BUFG outclk_bufg_2 (.I(outclk_2_bufg), .O(outclk_2));
	BUFG outclk_bufg_3 (.I(outclk_3_bufg), .O(outclk_3));
	
endmodule
