// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ns
module key_test_tb;
reg clk;
reg[3:0] key;
wire[3:0] led;
initial
begin
	clk = 1'b0;
	key = 4'b1111;
	#12  key = 4'b0101;
	#25  key = 4'b1010;
	#8   key[0] = 1'b1;
	#16  key[0] = 1'b0;
	#100
	$stop;
end
always#10 clk = ~clk;//50Mhz

key_test dut
(
	.clk (clk),  //时钟输入——50Mhz
	.key (key),  //4位按键输入，按下是0，弹起是1
	.led (led)   //4位LED显示，1为亮，0为灭
);
endmodule 