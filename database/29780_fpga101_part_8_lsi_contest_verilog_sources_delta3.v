// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    09:09:02 10/09/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    delta3 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//			Calculation of delta3 with 3 input and 1 output
// Input : 
//		clk		    : 1 bit
//		reset		: 1 bit : high active
//		a3_i		: 16 bits 00_0000.0000_0000_00 signed : output value of third layer
//		t_i		    : 16 bits 00_0000.0000_0000_00 signed : supervisor value
//		dadz3_i	    : 16 bits 00_0000.0000_0000_00 signed : differential of sigmoid
//
// Output:
//		delta3_i	: 16 bits 00_0000.0000_0000_00 signed : delta3
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module delta3(clk, res, a3_i, t_i, dadz3_i, delta3_i);
	 input			  clk;
	 input				res;
	 input 	signed [15:0]    	a3_i;
	 input 	signed [15:0]	  	t_i;
	 input 	signed [15:0]		dadz3_i;
    output 	signed [15:0]		delta3_i;

	 reg		signed [31:0]		tmp_delta3_i;
	 
	 always@(posedge clk)
	 begin
		if (res == 1'b1)
			tmp_delta3_i = 0;
		else
			tmp_delta3_i = (a3_i - t_i) * dadz3_i;
	 end
	
	 assign  delta3_i = tmp_delta3_i[25:10];	
endmodule
