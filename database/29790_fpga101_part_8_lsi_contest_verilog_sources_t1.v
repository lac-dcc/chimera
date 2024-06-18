// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    13:48:25 09/06/2017 
// Design Name: Neural Network (using backpropagation)
// Module Name:    t1
// Project Name: LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 	    8 bits memory to store value of t1
// Input:
//		clk	    : 1 bit
//		din 	: 1 bit : read enable
//		addr    : 4 bits 0000 : count number of clock with input from 0 to 15 
// Output: 
//		t1		: 16 bits 00_0000.0000_0000_00 unsigned	: output value for t1
// Latency: 
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Name : date : what changed
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module t1(clk, din, addr, t1);
 parameter DWIDTH=16;								//bit width of data
 parameter AWIDTH=4;								//bit width of address
 parameter DWIDTH_TMP=32;
 
 input clk, din;									//	din : read enable signal
 input [AWIDTH-1:0] addr;							// 4 bits address [3:0]	addr
 output [DWIDTH-1:0] t1;							// 16 bits data [15:0] t1
 
 reg [DWIDTH-1:0] t1;								// [15:0] t1 = 1, 0, 0, 0, 0...
 reg [DWIDTH_TMP-1:0] t1_tmp;                       // [31:0] temporary signal for t1 
 reg [DWIDTH_TMP-1:0] mem [0:(2**AWIDTH-1)];		// [31:0] mem [0:15]

 always @(posedge clk)
 begin
			mem[4'b0000]=32'b0000_0001_0000_0000_0000_0000_0000_0000;	//t1= 1
			mem[4'b0001]=32'b0000_0000_0000_0000_0000_0000_0000_0000;	//t1= 0
			mem[4'b0010]=32'b0000_0000_0000_0000_0000_0000_0000_0000;	
			mem[4'b0011]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b0100]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b0101]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b0110]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b0111]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1000]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1001]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1010]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1011]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1100]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1101]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1110]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
			mem[4'b1111]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
 if(din==1) 				//only READ is used
	begin
		t1_tmp = mem[addr]; 	//0000_0000_0000_0000_0000_0000_0000_0000
		t1 = t1_tmp[29:14];	//00_0000_0000_0000_0000_00
	end
else 
	t1=16'bz;				//when no control signal is given, tristate the output
end

endmodule
 