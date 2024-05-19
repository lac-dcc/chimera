// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

pll	pll_inst (
	.areset ( areset_sig ),
	.inclk0 ( inclk0_sig ),
	.c0 ( c0_sig ),
	.c1 ( c1_sig ),
	.locked ( locked_sig )
	);
