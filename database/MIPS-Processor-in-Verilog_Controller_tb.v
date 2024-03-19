`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:44 10/03/2012 
// Design Name: 
// Module Name:    Controller_tb 
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
module Controller_tb(
     );

	reg Clk,Reset;

	Controller c(Clk,Reset);
	
	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
		
		
		# 500; 
	end
	
	initial begin
		Reset <= 1;
		
		#20;
		
		Reset <= 0;
	end


endmodule
