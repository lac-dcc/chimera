// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
module led_test_tb;
	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [3:0] led;

	// Instantiate the Unit Under Test (UUT)
	led_test uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
          rst_n = 1;        
		// Add stimulus here
         #2000;
         $stop;
	 end
   
    always #10 clk = ~ clk; //产生50MHz时钟源′
   
endmodule

