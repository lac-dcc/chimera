// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

module top(
	input wire clk,
	input wire rst_n,
	output wire pll_clk,
	output wire locked
);

    clk_pll	clk_pll_inst (
	    .areset ( ~rst_n ),
    	.inclk0 ( clk ),
	    .c0 ( pll_clk ),
	    .locked ( locked )
	);

endmodule
