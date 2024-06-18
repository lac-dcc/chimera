// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    10:43:18 10/11/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    b3_1 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//		Calculation of b3_1, when the select initial signal is active, 
// 	    the output will be the initial value of b3_1, and when the select update 
//		signal is active, the output will be the new value of b3_1
//	Input: 
//		clk	    : 1 bit
//		reset	: 1 bit : high active
//		db3_1	: 16 bits 00_0000.0000_0000_00 signed	 : delta bias3_1
//		select_initial	: 1 bit	: high active
//		select_update	: 1 bit	: high active
//	Output:
//		b3_1	: 16 bits 00_0000.0000_0000_00 signed : bias3_1
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module b3_1(clk, reset, db3_1, select_initial, select_update, b3_1);
	
	input clk, reset;
	input select_initial, select_update;
	input signed [15:0] db3_1;
	output signed [15:0] b3_1;
	
	reg signed [15:0] zero = 16'b0;
	reg signed [15:0] b3_1;
	reg signed [15:0] init_b3_1 = 16'b11_1111_0000_0000_00;    //initial b3_1 = -1
	reg signed [15:0] net1, net2;
	
	always @(posedge clk)
		begin
			if(reset==1)
				begin
					net1=0;
					net2=0;
					b3_1=0;
				end
			else
				begin
					net1 = select_update? db3_1 : zero;
					net2 = b3_1 + net1;
					b3_1 = select_initial? init_b3_1 : net2;
				end
		end

endmodule
