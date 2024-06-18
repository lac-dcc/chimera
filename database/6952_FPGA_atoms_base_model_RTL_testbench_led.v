// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

////////////////////////////////////////////
// 8 个按键控制 8 个 LED 灯的验证平台代码
////////////////////////////////////////////

`timescale 1ns/1ps
module testbench_led(

);

reg			clk;
reg			rst;
reg	  [7:0]	key;
wire  [7:0]	led;

parameter CLK_PERIOD = 10;

led led_test(
	.clk		(clk),
	.rst		(rst),
	.key		(key),
	.led		(led)
);

initial begin
	clk <= 0;
	rst <= 0;
	#1000;
	rst <= 1;
end

always #(CLK_PERIOD/2) clk = ~clk;


integer i;
initial begin
    key <= 0;

    @(posedge rst);
    @(posedge clk);
    
    key <= 8'b00000001;
    #500;
    key <= 8'b00000010;
    #500;
    key <= 8'b00000100;
    #500;
    key <= 8'b00001000;
    #500;
    key <= 8'b00010000;
    #500;
    key <= 8'b00100000;
    #500;
    key <= 8'b01000000;
    #500;
    key <= 8'b10000000;
    #500;
    key <= 0;
    
    #1000;
    
    key <= 8'b11110000;

    #500;
    key <= 8'b10010011;
    
    #1000;
    
    $stop;
end
    
endmodule