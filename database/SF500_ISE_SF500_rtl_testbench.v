// This program was cloned from: https://github.com/jbilander/SF500
// License: Creative Commons Attribution Share Alike 4.0 International

`timescale 1ns / 1ps

module testbench;

	//localparam real CPU_CLKDV = 3.0/2.0;
	parameter real CLK_PERIOD = 140;
	parameter real CLK_MULTIPLIER = 2;

	// Inputs
	reg SW1;
	reg C7M;
	reg C14M;
	reg RESET_n;
	reg CFGIN_n;
	reg VPA_n;
	reg [2:0] FC;
	reg AS_CPU_n;
	reg DTACK_MB_n;

	// Outputs
	wire CFGOUT_n;
	wire CLKCPU;
	wire E;
	wire VMA_n;

	// Bidirs
	wire DTACK_CPU_n;

	// Instantiate the Unit Under Test (UUT)
	main_top uut (
		.SW1(SW1), 
		.C7M(C7M), 
		.C14M(C14M), 
		.RESET_n(RESET_n), 
		.CFGIN_n(CFGIN_n), 
		.VPA_n(VPA_n), 
		.FC(FC), 
		.AS_CPU_n(AS_CPU_n), 
		.DTACK_MB_n(DTACK_MB_n), 
		.CFGOUT_n(CFGOUT_n), 
		.CLKCPU(CLKCPU), 
		.E(E), 
		.VMA_n(VMA_n), 
		.DTACK_CPU_n(DTACK_CPU_n)
	);

	initial begin
		// Initialize Inputs
		SW1 = 1;
		C7M = 0;
		C14M = 0;
		RESET_n = 1;
		CFGIN_n = 0;
		VPA_n = 0;
		FC = 0;
		AS_CPU_n = 0;
		DTACK_MB_n = 1;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
	
	always #(CLK_PERIOD) C7M <= ~C7M;
	always #(CLK_PERIOD / CLK_MULTIPLIER) C14M = ~C14M;
      
endmodule




