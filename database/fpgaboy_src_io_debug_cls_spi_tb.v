// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:25:47 05/08/2012
// Design Name:   cls_spi
// Module Name:   G:/Projects/s6atlystest/cls_spi_tb.v
// Project Name:  s6atlystest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cls_spi
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cls_spi_tb;

	// Inputs
	reg clock;
	reg reset;
	reg [31:0] data;
	reg miso;

	// Outputs
	wire ss;
	wire mosi;
	wire sclk;

	// Instantiate the Unit Under Test (UUT)
	cls_spi uut (
		.clock(clock), 
		.reset(reset), 
		.data(data), 
		.ss(ss), 
		.mosi(mosi), 
		.miso(miso), 
		.sclk(sclk)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		data = 32'h89ABCDEF;
		miso = 0;

		// Wait 100 ns for global reset to finish
		#100 reset = 0;
	end
  
  always begin
    #10 clock = !clock;
  end
      
endmodule

