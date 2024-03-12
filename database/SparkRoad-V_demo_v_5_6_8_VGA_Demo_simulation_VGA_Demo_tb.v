// Verilog testbench created by TD v4.6.12906
// 2019-07-09 14:17:50

`timescale 1ns / 1ps

module VGA_Demo_tb();

reg clk_24m = 1'b0;
reg rst_n;
wire [7:0] vga_b;
wire vga_clk;
wire vga_de;
wire [7:0] vga_g;
wire vga_hs;
wire [7:0] vga_r;
wire vga_vs;

//Clock process  24MHz
parameter PERIOD = 41.666;
always #(PERIOD/2) clk_24m = ~clk_24m;

//glbl Instantiate
glbl glbl();

//Unit Instantiate
VGA_Demo uut(
	.clk_24m(clk_24m),
	.rst_n(rst_n),
	.vga_b(vga_b),
	.vga_clk(vga_clk),
	.vga_de(vga_de),
	.vga_g(vga_g),
	.vga_hs(vga_hs),
	.vga_r(vga_r),
	.vga_vs(vga_vs));

//Stimulus process
initial begin
//To be inserted 
rst_n = 1'b0;
#100;
rst_n = 1'b1;
end

endmodule