// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002 (
	input wire refclk,
	input wire rst,
	output wire outclk_0,
	output wire outclk_1,
	output wire outclk_2,
	output wire locked
);

`ifdef CYCLONEV
	altera_pll #(
		.fractional_vco_multiplier("false"),
		.reference_clock_frequency("50.0 MHz"),
		.operation_mode("direct"),
		.number_of_clocks(3),
		.output_clock_frequency0("48.000000 MHz"),
		.phase_shift0("0 ps"),
		.duty_cycle0(50),
		.output_clock_frequency1("6.000000 MHz"),
		.phase_shift1("0 ps"),
		.duty_cycle1(50),
		.output_clock_frequency2("24.000000 MHz"),
		.phase_shift2("0 ps"),
		.duty_cycle2(50),
		.pll_type("General"),
		.pll_subtype("General")
	) altera_pll_i (
		.rst	(rst),
		.outclk	({outclk_2, outclk_1, outclk_0}),
		.locked	(locked),
		.fboutclk	( ),
		.fbclk	(1'b0),
		.refclk	(refclk)
	);
`else
	ALTPLL #(
		.BANDWIDTH_TYPE("AUTO"),
		.CLK0_DIVIDE_BY(10'd27),   // 48 MHz ≈ 50 MHz * 26 / 27
		.CLK0_DUTY_CYCLE(6'd50),
		.CLK0_MULTIPLY_BY(10'd26),
		.CLK0_PHASE_SHIFT(1'd0),
		.CLK1_DIVIDE_BY(10'd216),   // 6 MHz ≈ 50 MHz * 26 / 216
		.CLK1_DUTY_CYCLE(6'd50),
		.CLK1_MULTIPLY_BY(10'd26),
		.CLK1_PHASE_SHIFT(1'd0),
		.CLK2_DIVIDE_BY(10'd54),   // 24 MHz ≈ 50 MHz * 26 / 54
		.CLK2_DUTY_CYCLE(6'd50),
		.CLK2_MULTIPLY_BY(10'd26),
		.CLK2_PHASE_SHIFT(1'd0),
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
		.CLK({outclk_2, outclk_1, outclk_0}),
		.LOCKED(locked)
	);
`endif

endmodule

