// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns

module tb();
  reg [1:0] sel;
  reg clk = 1'b 0,rst = 1'b 0;
  wire [7:0] out;
  funGen fung1(sel,clk,rst,out);
  	always #15 clk = ~clk ;
	initial begin
		rst = 1'b 1 ;
		#30 rst = 1'b 0 ;
		#30 sel = 2'b 00 ;
		#7650 #7650 #7650 
		#7650 sel = 2'b 01 ;
		#7650 #7650 #7650 
		#7650 sel = 2'b 00 ;
		#7650 sel = 2'b 01 ;
		#7650 sel = 2'b 10 ;
		#7650 sel = 2'b 00 ;
		#7650 sel = 2'b 01 ;
		#2000
		$stop ;
	end
endmodule


