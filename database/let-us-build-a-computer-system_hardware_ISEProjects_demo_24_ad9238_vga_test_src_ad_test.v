// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:12:59 09/09/2017
// Design Name:   ad9226_sample
// Module Name:   C:/Xilinx/14.7/ISE_DS/SysGen/project/ad9226_vga_test/ad_test.v
// Project Name:  ad9226_vga_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ad9226_sample
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ad_test;

	// Inputs
	reg adc_clk;
	reg rst;
	reg [11:0] adc_data;

	// Outputs
	wire adc_buf_wr;
	wire [11:0] adc_buf_addr;
	wire [7:0] adc_buf_data;
	wire [7:0] adc_data_narrow;
	wire [7:0] adc_data_narrow_d0;

	// Instantiate the Unit Under Test (UUT)
	ad9226_sample uut (
		.adc_clk(adc_clk), 
		.rst(rst), 
		.adc_data(adc_data), 
		.adc_buf_wr(adc_buf_wr), 
		.adc_buf_addr(adc_buf_addr), 
		.adc_buf_data(adc_buf_data), 
		.adc_data_narrow(adc_data_narrow), 
		.adc_data_narrow_d0(adc_data_narrow_d0)
	);

	initial begin
		// Initialize Inputs
		adc_clk = 0;
		rst = 0;
		adc_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

