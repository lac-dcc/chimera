// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns
module tb();
    reg clk = 0, rst ; 
    reg start, get;
    reg [7:0] in ;
    wire [15:0] out;
    wire ready;
    booth UUT(in,start,clk,rst,ready,out,get);



    always #10 clk = ~clk ;

    initial begin
		
        #5 rst = 1'b1;in = 8'b0;
        #10 rst = 1'b 0 ;
		#40 get = 1'b0;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #20 in = 8'b00001000;
		#40 get = 1'b0;
		#40 get = 1'b1;in = 8'b11111001;
        #40 get = 1'b0;
		#40 get = 1'b1;in = 8'b11111111;
		#40 get = 1'b0;
		#40 get = 1'b1;in = 8'b11111000;
     	#40 get = 1'b0;
		#40 get = 1'b1;in = 8'b11111111;
		#40 get = 1'b0;
        #1000 $stop;

    end
endmodule