// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ps / 1 ps

module pll (
	areset,
	inclk0,
	c0,
	c1,
	c2,
	locked);

	input	  areset;
	input	  inclk0;
	output	  c0;
	output	  c1;
	output	  c2;
	output	  locked;

	wire feedback1;
	wire feedback2;

	wire outclk_0_bufg;
	wire outclk_1_bufg;
	wire outclk_2_bufg;
	wire locked1;
	wire locked2;

	PLLE2_ADV #(
		.CLKFBOUT_MULT(6'd24),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd25),
		.CLKOUT0_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) plle2_adv_inst1 (
		.CLKFBIN(feedback1),
		.CLKIN1(inclk0),
		.PWRDWN(1'b0),
		.RST(areset),
		.CLKFBOUT(feedback1),
		.CLKOUT0(outclk_0_bufg),
		.LOCKED(locked1)
	);

	PLLE2_ADV #(
		.CLKFBOUT_MULT(6'd53),
		.CLKIN1_PERIOD(20.0),
		.CLKOUT0_DIVIDE(7'd42),
		.CLKOUT0_PHASE(1'd0),
		.CLKOUT1_DIVIDE(7'd84),
		.CLKOUT1_PHASE(1'd0),
		.DIVCLK_DIVIDE(1'd1),
		.REF_JITTER1(0.01),
		.STARTUP_WAIT("FALSE")
	) plle2_adv_inst2 (
		.CLKFBIN(feedback2),
		.CLKIN1(inclk0),
		.PWRDWN(1'b0),
		.RST(areset),
		.CLKFBOUT(feedback),
		.CLKOUT0(outclk_1_bufg),
		.CLKOUT1(outclk_2_bufg),
		.LOCKED(locked2)
	);

	BUFG outclk_bufg_0 (.I(outclk_0_bufg), .O(c0));
	BUFG outclk_bufg_1 (.I(outclk_1_bufg), .O(c1));	
	BUFG outclk_bufg_2 (.I(outclk_2_bufg), .O(c2));	

	assign locked = locked1 & locked2;

endmodule