// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    09:09:02 10/09/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    delta2 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//			Calculation of delta2 with 5 input and 1 output
// Input : 
//		clk		    : 1 bit
//		reset		: 1 bit : high active
//		dadz2_i	    : 16 bits 00_0000.0000_0000_00 signed : output value of hidden layer
//		w3_ij		: 16 bits 00_0000.0000_0000_00 signed : weight value (j=1,2)
//		delta3_i	: 16 bits 00_0000.0000_0000_00 signed : delta of third layer (i=1,2)
//
// Output:
//		delta2_i	: 16 bits 00_0000.0000_0000_00 signed : delta2
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module delta2(clk, res, dadz2_i, w3_i1, w3_i2, delta3_1, delta3_2, delta2_i);
	input				        clk;
	input						  res;
	input 	signed [15:0] dadz2_i, w3_i1, w3_i2;
	input 	signed [15:0] delta3_1, delta3_2;
	output 	signed [15:0] delta2_i;
//	reg		signed [15:0] delta2_i;
	reg		signed [47:0] tmp_delta2_i;
	
	always@(posedge clk)
	 begin
		if (res == 1'b1)
			tmp_delta2_i = 0;
		else 
				tmp_delta2_i = (w3_i1 * delta3_1 + w3_i2 * delta3_2) * dadz2_i;
	 end

	assign delta2_i = tmp_delta2_i[35:20];
	
endmodule
