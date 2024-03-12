`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	gclk_2_gpio 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module gclk_2_gpio(
	
	input		gclk_in, 
	output	clk_out, 
	input		ce
	
	);
	
	ODDR2 #(
		.DDR_ALIGNMENT	("NONE"),
		.INIT				(1'b0),
		.SRTYPE			("SYNC")
	)
	ODDR2_INST(
		.Q					(clk_out),
		.C0				(gclk_in),
		.C1				(~ gclk_in),
		.CE				(ce),
		.D0				(1'b1),
		.D1				(1'b0),
		.R					(1'b0),
		.S					(1'b0)
	);

endmodule
