// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10ps
module  pll_0002(
	input  wire refclk,
	input  wire rst,
	output wire outclk_0,
	output wire locked,
	input  wire [63:0] reconfig_to_pll,
	output wire [63:0] reconfig_from_pll
);
`ifdef CYCLONEV
	altera_pll #(
		.fractional_vco_multiplier("true"),
		.reference_clock_frequency("50.0 MHz"),
		.pll_fractional_cout(32),
		.pll_dsm_out_sel("1st_order"),
		.operation_mode("direct"),
		.number_of_clocks(1),
		.output_clock_frequency0("53.693175 MHz"),
		.phase_shift0("0 ps"),
		.duty_cycle0(50),
		.pll_type("Cyclone V"),
		.pll_subtype("Reconfigurable"),
		.m_cnt_hi_div(4),
		.m_cnt_lo_div(4),
		.n_cnt_hi_div(256),
		.n_cnt_lo_div(256),
		.m_cnt_bypass_en("false"),
		.n_cnt_bypass_en("true"),
		.m_cnt_odd_div_duty_en("false"),
		.n_cnt_odd_div_duty_en("false"),
		.c_cnt_hi_div0(4),
		.c_cnt_lo_div0(4),
		.c_cnt_prst0(1),
		.c_cnt_ph_mux_prst0(0),
		.c_cnt_in_src0("ph_mux_clk"),
		.c_cnt_bypass_en0("false"),
		.c_cnt_odd_div_duty_en0("false"),
		.c_cnt_hi_div1(1),
		.c_cnt_lo_div1(1),
		.c_cnt_prst1(1),
		.pll_vco_div(2),
		.pll_cp_current(30),
		.pll_bwctrl(2000),
		.pll_output_clk_frequency("429.5454 MHz"),
		.pll_fractional_division("2537930535"),
		.pll_fbclk_mux_1("glb"),
		.pll_fbclk_mux_2("m_cnt"),
		.pll_m_cnt_in_src("ph_mux_clk"),
		.pll_slf_rst("true")
	) altera_pll_i (
		.rst	(rst),
		.outclk	({outclk_0}),
		.locked	(locked),
		.reconfig_to_pll	(reconfig_to_pll),
		.fboutclk	( ),
		.fbclk	(1'b0),
		.refclk	(refclk),
		.reconfig_from_pll	(reconfig_from_pll)
	);
`else
	ALTPLL #(
		.BANDWIDTH_TYPE("AUTO"),
		.CLK0_DIVIDE_BY(10'd14),
		.CLK0_DUTY_CYCLE(6'd50),
		.CLK0_MULTIPLY_BY(10'd15),
		.CLK0_PHASE_SHIFT(1'd0),
		.COMPENSATE_CLOCK("CLK0"),
		.INCLK0_INPUT_FREQUENCY(15'd20000),
		.OPERATION_MODE("NORMAL")
	) CORE_PLL (
		.ARESET(1'd0),
		.CLKENA(5'd31),
		.EXTCLKENA(4'd15),
		.FBIN(1'd1),
		.INCLK(refclk),
		.PFDENA(1'd1),
		.PLLENA(1'd1),
		.CLK({outclk_0}),
		.LOCKED(locked)
	);
`endif
endmodule

