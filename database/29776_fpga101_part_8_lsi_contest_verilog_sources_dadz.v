// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    10:47:27 10/09/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    dadz 
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
//	Description:
//		Calculation of differential a
// 
// Input:(i=1,2,3 , j=1,2)
//		clk		    : 1 bit
//		reset		: 1 bit : high active
//  	a	 		: 16 bits 00_0000.0000_0000_00 signed : input value
//
// Output:(i=1,2,3 , j=1,2)
//  	dadz		: 16 bits 00_0000.0000_0000_00 signed : differential of a
//  	(a : sigmoid function)
//  	da/dz=(1/(1+e^(?z) ))Åå=(a?1)aÅå
// Latency:
//
//	Dependencies: 
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dadz(clk,res, a,dadz);
   input					clk;
	input					res;
	input signed 	[15:0]		a;
	output signed 	[15:0]		dadz;
	
	reg signed		[31:0]		tmp_dadz;
	
	always@(posedge clk)
	begin
		if (res == 1'b1)
			tmp_dadz = 0;
		else
			tmp_dadz = (16'b00_0001_0000_0000_00 - a) * a;
	end

	assign  dadz = tmp_dadz[25:10];
	
endmodule
