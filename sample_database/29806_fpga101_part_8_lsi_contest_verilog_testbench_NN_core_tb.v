// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    13:48:25 09/06/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    NN core test bench
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
// 	Test bench for NN_core module 
// 
// Test scenario:
//		updating parameter until the finish updating signal become active
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Name : date : what changed
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NN_CORE_tb;

	// Inputs
	reg clk;
	reg res;
	reg update_coeff;
	reg [15:0] input_k_1;
	reg [15:0] input_k_2;
	
	// Outputs
	wire [15:0] a3_1;
	wire [15:0] a3_2;
	wire finish_updating;

	// Instantiate the Unit Under Test (UUT)
	NN_CORE uut (
		.clk(clk), 
		.res(res), 
		.update_coeff(update_coeff), 
		.input_k_1(input_k_1),
		.input_k_2(input_k_2),
		.finish_updating(finish_updating), 
		.a3_1(a3_1),
		.a3_2(a3_2)
	);

	parameter STEP = 100;
	
	always begin
		clk = 1; #(STEP/2);
		clk = 0; #(STEP/2);
	end
	
	initial begin
	res = 0;
	update_coeff = 1;
	input_k_1 = 16'b00_1000_0000_0000_00; // 8 = 00_0000. 0000_0000_0000_00
	input_k_2 = 16'b00_1000_0000_0000_00; // 8 = 00_0000. 0000_0000_0000_00
	
	#STEP
	res = 1;
	
	#STEP
	res = 0;

	#STEP

	#(STEP*13)
/*
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	#(STEP*13)
	
	*/
	// Add stimulus here
	// End
	#(STEP*150000) $finish;
	end
	always@(a3_1)
			$display( $time, " a3_1=%b a3_2=%b", 
											a3_1, a3_2);
	endmodule


