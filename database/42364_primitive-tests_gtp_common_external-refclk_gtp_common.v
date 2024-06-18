// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

module gtp_common (
    input wire clk_p_0,
    input wire clk_n_0,
    input wire clk_p_1,
    input wire clk_n_1,
    input wire test_in,
    output wire test_out
);

wire gtrefclk0, gtrefclk1;

(* keep *)
GTPE2_COMMON #(
	.PLL0_FBDIV(3'd5),
	.PLL0_FBDIV_45(3'd4),
	.PLL0_REFCLK_DIV(1'd1),
	.PLL1_FBDIV(3'd1),
	.PLL1_FBDIV_45(3'd5),
	.PLL1_REFCLK_DIV(2'd2)
) GTPE2_COMMON_0 (
	.BGBYPASSB(1'd1),
	.BGMONITORENB(test_in),
	.BGPDB(1'd1),
	.BGRCALOVRD(5'd31),
	.GTREFCLK0(gtrefclk0),
	.GTREFCLK1(gtrefclk1),
	.PLL0LOCKEN(1'd1),
	.PLL0PD(1'd0),
	.PLL0REFCLKSEL(1'd1),
	.PLL1PD(1'd1),
	.RCALENB(1'd1),
	.REFCLKOUTMONITOR0(test_out)
);

IBUFDS_GTE2 IBUFDS_GTE2_0 (
	.CEB(1'd0),
	.I(clk_p_0),
	.IB(clk_n_0),
	.O(gtrefclk0)
);

IBUFDS_GTE2 IBUFDS_GTE2_1 (
	.CEB(1'd0),
	.I(clk_p_1),
	.IB(clk_n_1),
	.O(gtrefclk1)
);

endmodule
