// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002(

	// interface 'refclk'
	input wire refclk,

	// interface 'reset'
	input wire rst,

	// interface 'outclk0'
	output wire outclk_0,

	// interface 'outclk1'
	output wire outclk_1,

	// interface 'locked'
	output wire locked
);
`ifdef CYCLONEV
	altera_pll #(
		.fractional_vco_multiplier("false"),
		.reference_clock_frequency("50.0 MHz"),
		.operation_mode("direct"),
		.number_of_clocks(2),
		.output_clock_frequency0("48.000000 MHz"),
		.phase_shift0("0 ps"),
		.duty_cycle0(50),
		.output_clock_frequency1("18.000000 MHz"),
		.phase_shift1("0 ps"),
		.duty_cycle1(50),
		.output_clock_frequency2("0 MHz"),
		.phase_shift2("0 ps"),
		.duty_cycle2(50),
		.output_clock_frequency3("0 MHz"),
		.phase_shift3("0 ps"),
		.duty_cycle3(50),
		.output_clock_frequency4("0 MHz"),
		.phase_shift4("0 ps"),
		.duty_cycle4(50),
		.output_clock_frequency5("0 MHz"),
		.phase_shift5("0 ps"),
		.duty_cycle5(50),
		.output_clock_frequency6("0 MHz"),
		.phase_shift6("0 ps"),
		.duty_cycle6(50),
		.output_clock_frequency7("0 MHz"),
		.phase_shift7("0 ps"),
		.duty_cycle7(50),
		.output_clock_frequency8("0 MHz"),
		.phase_shift8("0 ps"),
		.duty_cycle8(50),
		.output_clock_frequency9("0 MHz"),
		.phase_shift9("0 ps"),
		.duty_cycle9(50),
		.output_clock_frequency10("0 MHz"),
		.phase_shift10("0 ps"),
		.duty_cycle10(50),
		.output_clock_frequency11("0 MHz"),
		.phase_shift11("0 ps"),
		.duty_cycle11(50),
		.output_clock_frequency12("0 MHz"),
		.phase_shift12("0 ps"),
		.duty_cycle12(50),
		.output_clock_frequency13("0 MHz"),
		.phase_shift13("0 ps"),
		.duty_cycle13(50),
		.output_clock_frequency14("0 MHz"),
		.phase_shift14("0 ps"),
		.duty_cycle14(50),
		.output_clock_frequency15("0 MHz"),
		.phase_shift15("0 ps"),
		.duty_cycle15(50),
		.output_clock_frequency16("0 MHz"),
		.phase_shift16("0 ps"),
		.duty_cycle16(50),
		.output_clock_frequency17("0 MHz"),
		.phase_shift17("0 ps"),
		.duty_cycle17(50),
		.pll_type("General"),
		.pll_subtype("General")
	) altera_pll_i (
		.rst	(rst),
		.outclk	({outclk_1, outclk_0}),
		.locked	(locked),
		.fboutclk	( ),
		.fbclk	(1'b0),
		.refclk	(refclk)
	);
`else
	ALTPLL #(
		.BANDWIDTH_TYPE("AUTO"),
		.CLK0_DIVIDE_BY(10'd25),   // 48.000 MHz ~= 50 MHz * 24 / 25
		.CLK0_DUTY_CYCLE(6'd50),
		.CLK0_MULTIPLY_BY(10'd24),
		.CLK0_PHASE_SHIFT(1'd0),
		.CLK1_DIVIDE_BY(10'd25),   // 18.000 MHz ~= 50 MHz * 9 / 25
		.CLK1_DUTY_CYCLE(6'd50),
		.CLK1_MULTIPLY_BY(10'd9),
		.CLK1_PHASE_SHIFT(1'd0),
		.COMPENSATE_CLOCK("CLK0"),
		.INCLK0_INPUT_FREQUENCY(15'd20000),
		.OPERATION_MODE("NORMAL")
	) ALTPLL (
		.ARESET(1'd0),
		.CLKENA(5'd31),
		.EXTCLKENA(4'd15),
		.FBIN(1'd1),
		.INCLK(refclk),
		.PFDENA(1'd1),
		.PLLENA(1'd1),
		.CLK({outclk_1, outclk_0}),
		.LOCKED(locked)
	);
`endif
endmodule

