// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    09:09:02 10/09/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    dw
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//			Calculation of delta2 with 2 input and 1 output
// Input : 
//		clk				: 1 bit
//		reset			: 1 bit : high active
//		unit error		: 16 bits 00_0000.0000_0000_00 signed 
//		input signal	: 16 bits 00_0000.0000_0000_00 signed 
//
// Output:
//		renew parameter: 16 bits 00_0000.0000_0000_00 signed : new parameter
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dw(clk, res, unit_error, input_signal, renew_parameter);
	input clk;
	input res;
	input signed [15:0] unit_error;
	input signed [15:0] input_signal;
	output signed [15:0] renew_parameter;

	reg signed [31:0]	q;
	
	always@(posedge clk)
	 begin
		if (res == 1'b1)
			q = 0;
		else
			q = unit_error * input_signal;
	end
	
	assign 	renew_parameter = q[25:10];

endmodule

