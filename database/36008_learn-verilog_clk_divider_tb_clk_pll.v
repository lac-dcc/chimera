// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ps/1ps

module tb_clk_pll ();

    reg clk;
    reg rst_n;

    wire pll_clk;
    wire locked;

    clk_pll	clk_pll_inst (
	    .areset ( ~rst_n ),
    	.inclk0 ( clk ),
	    .c0 ( pll_clk ),
	    .locked ( locked )
	);

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        #10
        rst_n = 1'b1;
        #5000
        $finish;
    end

    always #1 clk = ~clk;

endmodule
