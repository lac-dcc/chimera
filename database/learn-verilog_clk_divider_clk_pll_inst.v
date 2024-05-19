// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

clk_pll	clk_pll_inst (
	.areset ( areset_sig ),
	.inclk0 ( inclk0_sig ),
	.c0 ( c0_sig ),
	.locked ( locked_sig )
	);
