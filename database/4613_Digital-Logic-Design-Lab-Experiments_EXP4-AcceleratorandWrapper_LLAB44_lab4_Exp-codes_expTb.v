// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns

module tb();
	reg clk=0,rst=1,start=0;
	reg [15:0] x = {16{1'b1}};
	wire done;
	wire [1:0] intpart;
	wire [15:0] fracpart;
	exponential UUT(clk,rst,start,x,done,intpart,fracpart);
	initial begin
		#45 rst = 0;
		#20 start = 1;
		#20 start = 0;
		#1000;
		#5 x = {1,{15{1'b0}}};
		#18 start = 1; 
		#20 start = 0;  x = {16{1'b1}};
		#5000 $stop;

	end
	always #10 clk = ~clk;


endmodule