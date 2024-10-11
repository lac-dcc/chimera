// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_top ();

    reg clk;
    reg rst_n;
    wire pll_locked;
	wire hsync;
	wire vsync;
    wire [15:0] out_rgb;

    pll_vga pll_vga_inst(
		.areset (~rst_n),
        .inclk0 (clk),
        .c0 (vga_clk),
        .locked (pll_locked)
    );

    vga_ctrl vga_ctrl_inst(
        .clk(vga_clk),
        .rst_n(rst_n & pll_locked),
        .in_rgb(16'hffff),
        
		.hsync (hsync),
		.vsync (vsync),
        .out_rgb(out_rgb)
    );

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        #10
        rst_n = 1'b1;
        #5000000
        $finish;
    end

    always #1 clk = ~clk;

endmodule
