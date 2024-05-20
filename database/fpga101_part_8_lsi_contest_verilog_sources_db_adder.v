// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    22:00:09 10/10/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    db_adder 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//			Calculation of delta2 with 2 input and 1 output
// Input : 
//		clk				: 1 bit
//		reset			: 1 bit : high active
//		delta           : 16 bits 00_0000.0000_0000_00 signed : delta value
//
// Output:
//		dcdb            : 16 bits 00_0000.0000_0000_00 signed : new bias parameter
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module db_adder(clk,res,delta,dcdb);
	input 	clk,res;
	input signed [15:0] delta;
	output signed [15:0] dcdb;
	
	reg [3:0]		q;
	reg signed [15:0]	delta_1,delta_2,delta_3,delta_4;
	reg signed [15:0]	eta = 16'b1111111110011001;//eta=-0.1
	reg signed [31:0]	tmp_dcdb;
		
	always@(posedge clk or posedge res) 
	begin
		if(res == 1'b1)
			q <= 4'h0;
		else if(q == 4'h3)
			q <= 4'h0;
		else
			q <= q + 4'h1;
	end
	
	always@(posedge clk or posedge res)
	begin
		if(res == 1'b1)
		begin
			delta_1 <= 0;
			delta_2 <= 0;
			delta_3 <= 0;
			tmp_dcdb <= 0;
		end
		else
		    begin
		      delta_3 <= delta_2;
		      delta_2 <= delta_1;
		      delta_1 <= delta;
		      tmp_dcdb <= eta * (delta_1 + delta_2 + delta_3 + delta);
		    end
	end
	
	assign dcdb = tmp_dcdb[25:10];
		
endmodule 