// This program was cloned from: https://github.com/pontazaricardo/Verilog_Calculator_Matrix_Multiplication
// License: Mozilla Public License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ricardo Pontaza
// 
// Create Date:    15:52:29 08/03/2017 
// Design Name: 
// Module Name:    test_bench 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_bench;
	
	reg [143:0] A;
	reg [143:0] B;
	
	wire [143:0] Answer;
	
	Calculator calculator(.A(A), .B(B), .Result(Answer));
	
	initial begin
		
		//Initial inputs
		A={16'd1,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd8,16'd9};
		B={16'd7,16'd3,16'd5,16'd12,16'd11,16'd17,16'd20,16'd3,16'd0};
		
	end
	



endmodule
