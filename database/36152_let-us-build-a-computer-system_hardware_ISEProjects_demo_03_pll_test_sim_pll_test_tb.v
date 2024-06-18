// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns
module pll_test_tb;
reg clk;
reg rst_n;
wire clkout1;
wire clkout2;
wire clkout3;
wire clkout4;
initial
begin
	clk = 1'b0;
	rst_n = 1'b0;
	#100
	rst_n = 1'b1;
end
always#10 clk = ~clk;//50Mhz

pll_test dut(
	.clk       (clk    ),
	.rst_n     (rst_n  ),
	.clkout1   (clkout1),      //pll clock output
	.clkout2   (clkout2),      //pll clock output
	.clkout3   (clkout3),      //pll clock output
	.clkout4   (clkout4)       //pll clock output					 
    );
	 
endmodule 