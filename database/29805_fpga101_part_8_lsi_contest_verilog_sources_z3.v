// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    13:48:25 09/06/2017 
// Design Name: Neural Network (using backpropagation)
// Module Name:    z3
// Project Name: LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 	    Calculation of 3 input (a2) and 1 output (z3)
// Input:
//		a2_i	: 16 bits 00_0000.0000_0000_00 signed 	: input data (i=1,2,3)
//		b3		: 16 bits 00_0000.0000_0000_00 signed	: bias value
//		w3_i	: 16 bits 00_0000.0000_0000_00 signed 	: weight value (i=1,2,3)
//		clk	    : 1 bit
//		reset	: 1 bit : high active
// Output: 
//		z3		: 8 bits 0000.0000 : output value
// Latency: 1 clk
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Name : date : what changed
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module z3(clk, reset, a2_1, a2_2, a2_3, w3_1, w3_2, w3_3, b3, z3);

input clk;
input reset;
input signed [15:0] a2_1, a2_2, a2_3;				    //中間層からの入力 input from hidden layer
input signed [15:0] w3_1, w3_2, w3_3;				    //出力層の重み		weight of third layer
input signed [15:0] b3;									//出力層のバイアス	bias of third layer
output signed [7:0] z3;									//出力層の出力		output of third layer

reg signed [31:0] net1, net2, net3;
reg signed [15:0] z3_tmp;
wire saturation;

always @(posedge clk)
	begin
	//unsynchronized reset
	if (reset==1)
		begin
			net1=0;
			net2=0;
			net3=0;
			z3_tmp=0;
		end
	else
		begin
			net1= a2_1*w3_1;
			net2= a2_2*w3_2;
			net3= a2_3*w3_3;
			z3_tmp = (net1[25:10] + net2[25:10] + net3[25:10] + b3);//[55:24]
		end
	end
		//z3 with saturation
		assign saturation = ~&z3_tmp[15:13] & |z3_tmp[15:13];
		assign z3 = ~saturation ? z3_tmp[13:6] : (z3_tmp[15] ? 8'b1000_0000 : 8'b0111_1111);

        //z3 without saturation
		//assign z3 = z3_tmp[13:6];

endmodule
