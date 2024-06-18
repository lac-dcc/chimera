// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    13:48:25 09/06/2017 
// Design Name: Neural Network (using backpropagation)
// Module Name:    z2
// Project Name: LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 	Calculation of 2 input (k1,k2) and 1 output (z2)
// Input:
//		ki			: 16 bits 00_0000.0000_0000_00 signed 	: input data (i=1,2)
//		b2			: 16 bits 00_0000.0000_0000_00 signed 	: bias value
//		w2_i		: 16 bits 00_0000.0000_0000_00 signed 	: weight value (i=1,2)
//		clk		    : 1 bit
//		reset		: 1 bit : high active
// Output: 
//		z2			: 8 bits 0000.0000 : output value
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

module z2(clk, reset, k1, k2, w2_1, w2_2, b2, z2);

input clk;
input reset;
input signed [15:0] k1, k2;		                 //“ü—Í‘w‚©‚ç‚Ì“ü—Í input	from first layer
input signed [15:0] w2_1, w2_2;				     //’†ŠÔ‘w‚Ìd‚İ		weight of hidden layer
input signed [15:0] b2;							 //’†ŠÔ‘w‚ÌƒoƒCƒAƒX	bias of hidden layer
output signed [7:0] z2;							 //’†ŠÔ‘w‚Ìo—Í	 	output of hidden layer

reg signed [31:0] net1, net2;
reg signed [15:0] z2_tmp;
wire saturation;

always @(posedge clk)
	begin
	//unsynchronized reset
		if (reset==1)
		begin
			net1=0;
			net2=0;
			z2_tmp=0;
		end
		else 
		begin
			net1 = k1*w2_1;
			net2 = k2*w2_2;
			z2_tmp = net1[25:10] + net2[25:10] + b2;
		end 
	end
	//z2 with saturation
 	assign saturation = ~&z2_tmp[15:13] & |z2_tmp[15:13];
	assign z2 = ~saturation ? z2_tmp[13:6] : (z2_tmp[15] ? 8'b1000_0000 : 8'b0111_1111);
	
	//z2 without saturation
	//assign z2 = z2_tmp[13:6];

endmodule 