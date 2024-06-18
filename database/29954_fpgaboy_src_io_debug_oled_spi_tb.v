// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

module oled_spi_tb;

	// Inputs
	reg clock;
	reg reset;
	reg shutdown;

	// Outputs
	wire cs;
	wire sdin;
	wire sclk;
	wire dc;
	wire res;
	wire vbatc;
	wire vddc;

	// Instantiate the Unit Under Test (UUT)
	oled_spi uut (
		.clock(clock), 
		.reset(reset), 
		.shutdown(shutdown), 
		.cs(cs), 
		.sdin(sdin), 
		.sclk(sclk), 
		.dc(dc), 
		.res(res), 
		.vbatc(vbatc), 
		.vddc(vddc)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		shutdown = 0;

		// Wait 100 ns for global reset to finish
		#100 reset = 0;
	end
  
  always begin
    #10 clock = !clock;
  end
      
endmodule

