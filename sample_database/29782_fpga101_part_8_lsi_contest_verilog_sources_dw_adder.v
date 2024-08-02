// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    11:50:07 10/10/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    dw_adder 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//			Calculation of delta2 with 2 input and 1 output
// Input : 
//		clk				: 1 bit
//		reset			: 1 bit : high active
//		dw              : 16 bits 00_0000.0000_0000_00 signed : delta weight value
//
// Output:
//		dcdw3            : 16 bits 00_0000.0000_0000_00 signed : new weight parameter
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dw_adder(clk,res,dw,dcdw3);
	input 	clk,res;
	input signed [15:0] dw;
	output signed [15:0] dcdw3;
	
	reg [3:0]		q;
	reg signed [15:0]	delta3a2_1,delta3a2_2,delta3a2_3;
	reg signed [15:0]	eta = 16'b1111111110011001;//eta=-0.1
	reg signed [31:0]	tmp_dcdw3;

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
		if (res == 1'b1)
			begin
				delta3a2_1 <= 16'd0;
				delta3a2_2 <= 16'd0;
				delta3a2_3 <= 16'd0;
				tmp_dcdw3 <= 16'd0;
			end			
		else 
		  begin
		      delta3a2_3 <= delta3a2_2;
		      delta3a2_2 <= delta3a2_1;
		      delta3a2_1 <= dw;
		      tmp_dcdw3 <= eta * (delta3a2_1 + delta3a2_2 + delta3a2_3 + dw);
	       end					
	end
	
	assign dcdw3 = tmp_dcdw3[25:10];

endmodule
