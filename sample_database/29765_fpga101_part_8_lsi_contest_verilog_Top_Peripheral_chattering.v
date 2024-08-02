// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kyushu Institute of Technology
// Engineer: DSP Lab
// 
// Create Date:    21:32:48 11/01/2017 
// Design Name:    Neural Network (using backpropagation)
// Module Name:    chattering;
// Project Name:   LSI Design Contest in Okinawa 2018
// Target Devices: 
// Tool versions: 
//
// Description: 
//		prevent chattering when push switch
// Input :
//		sw 		: 1 bit : switch
//		clk	    : 1 bit
//		reset	: 1 bit : high active
// Output : 
//		sig 	: 1 bit : switch after prevent chattering;
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module chattering(
input sw,
input clk,
input res,
output sig
);
	reg sig1,sig2,sig;
	reg [19:0]count;
	wire clk119hz = (count==20'hFFFFF);

	always @(posedge clk or posedge res) //Asynchronous reset. if case posedge res, output error code.
	begin
		if(res == 1)
			count <= 20'h0;
		else 
			count <= count + 20'h1;
	end
	
	// Use 2 FF		
	// Get a SW or BTN signal at every 1/119Hz (sec).
	always @(posedge clk or posedge res)
	begin
	    if(res == 1)
	    begin
	       sig1 <= 1'b0;
	       sig2 <= 1'b0;
	    end
		else if(clk119hz == 1)
		begin
		    sig2 <=sig1;
			sig1 <= sw;
		end
	end
	
	// Posedge is detected, temp = 1.  
	wire temp = sig1 & ~sig2 & clk119hz;
	
	always @(posedge clk or posedge res)
	begin
	   if(res == 1)
	       sig <= 1'b0;
	   else
	       sig <= temp;
    end    

endmodule

