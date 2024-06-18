// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module clock_divider_tb;

wire clock_div4_0;
wire clock_div4_90;

reg clk = 0;

clock_divider cdiv (.clock_in(clk),
	.clock_div4_0(clock_div4_0),
	.clock_div4_90(clock_div4_90));

initial begin
	$dumpfile("clock_divider_tb.vcd");
	$dumpvars;
	#1000
	$finish;
end

always begin
	clk = 1'b1;
	#2.5;

	clk = 1'b0;
	#2.5;
end

endmodule
