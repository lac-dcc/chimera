`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:14 12/24/2014 
// Design Name: 
// Module Name:    gclk_2_sdr_2 
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
module gclk_2_sdr_2(
  
	input		clk_lvds_sdr_in, 
	output	clk_lvds_sdr, 
	input		ce

	);
	
	
	
	ODDR2 #(
		.DDR_ALIGNMENT	("NONE"),
		.INIT				(1'b0),
		.SRTYPE			("SYNC")
	)
	ODDR2_INST(
		.Q					(clk_lvds_sdr),
		.C0				(clk_lvds_sdr_in),
		.C1				(~ clk_lvds_sdr_in),
		.CE				(ce),
		.D0				(1'b1),
		.D1				(1'b0),
		.R					(1'b0),
		.S					(1'b0)
	);

endmodule
