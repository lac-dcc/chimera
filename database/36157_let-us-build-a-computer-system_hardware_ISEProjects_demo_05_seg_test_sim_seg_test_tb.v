// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns
module seg_test_tb;
reg clk;
reg rst_n;
wire[5:0] seg_sel;
wire[7:0] seg_data;
initial
begin
	clk = 1'b0;
	rst_n = 1'b0;
	#100 rst_n = 1'b1;
end
always#10 clk = ~clk;//50Mhz

seg_test dut(
	.clk     (clk),
	.rst_n   (rst_n),
	.seg_sel (seg_sel),
	.seg_data(seg_data)
);
endmodule 