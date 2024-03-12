`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	test_io_module 
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module test_io_module( test_in_0, test_in_1, test_in_2, test_in_3, test_in_4, test_in_5, test_in_6, test_in_7, test_out
    );
	input				test_in_0;
	input				test_in_1;
	input				test_in_2;
	input				test_in_3;
	input				test_in_4;
	input				test_in_5;
	input				test_in_6;
	input				test_in_7;
	
	output [7:0]	test_out;
	

	assign	test_out[0] = test_in_0;
	assign	test_out[1] = test_in_1;
	//assign	test_out[2] = test_in_2;
	gclk_2_gpio gclk_2_gpio_2(
    .gclk_in(test_in_2), 
    .clk_out(test_out[2]), 
    .ce(1'b1)
    );
	assign	test_out[3] = test_in_3;
	assign	test_out[4] = test_in_4;
	assign	test_out[5] = test_in_5;
//	gclk_2_gpio gclk_2_gpio_5(
//    .gclk_in(test_in_5), 
//    .clk_out(test_out[5]), 
//    .ce(1'b1)
//    );
	assign	test_out[6] = test_in_6;
	//assign	test_out[7] = test_in_7;
	gclk_2_gpio gclk_2_gpio(
    .gclk_in(test_in_7), 
    .clk_out(test_out[7]), 
    .ce(1'b1)
    );
endmodule

