// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    10:47:27 10/09/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    delay1 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
//	Description:
//		1 clock delay of 1 input and 1 output
// 
// Input:(i=1,2,3 , j=1,2)
//		clk			: 1 bit
//		reset 		: 1 bit : high active
//		inputdata	: 16 bits 00_0000.0000_0000_00 unsigned : input data
// Output:
//		output		: 16 bits 00_0000.0000_0000_00 unsigned : output data
//
//	Dependencies: 
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module delay1(
    input clk,
	 input res,
    input [15:0] inputdata,
    output [15:0] outputdata
    );

	reg [15:0] out;
	
	always@(posedge clk)
	begin
		if(res== 1)
		out =0;
		else
		out = inputdata;
	end
	assign outputdata = out;
endmodule
