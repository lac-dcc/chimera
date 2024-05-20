// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns
module spi_flash_test_tb;
reg clk;
reg rst_n;
reg key1;
wire nCS;
wire DCLK;
wire MOSI;
wire MISO;
initial
begin
	clk = 1'b0;
	rst_n = 1'b0;
	key1 = 1'b1;
	#100 rst_n = 1'b1;
	#250 key1 = 1'b0;
	#100000000 key1 = 1'b1;
end
always#10 clk = ~clk;//50Mhz

spi_flash_test dut(
	.clk     (clk),
	.rst_n   (rst_n),
	.key1    (key1),
	.ncs     (nCS),
	.dclk    (DCLK),
	.mosi    (MOSI),
	.miso    (MISO)
);
defparam memory.mem_access.initfile = "D:/AX301_CD_A/02_demo/08_spi_flash_test/sim/initM25P16.txt";
m25p16 memory 
(
	.c(DCLK), 
	.data_in(MOSI), 
	.s(nCS), 
	.w(1'b1), 
	.hold(1'b1), 
	.data_out(MISO)
); 
endmodule 