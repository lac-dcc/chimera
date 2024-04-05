`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:21:37 12/02/2014
// Design Name:   clocking
// Module Name:   E:/working/Project/G200/Program/GVISION200/tb_clock.v
// Project Name:  GVISION200
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clocking
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_clock;

	// Inputs
	reg clk_50M;
	reg rst_n;
	reg clk_main_out;
	reg clk_ddr_p;
	reg clk_ddr_n;

	// Outputs
	wire clk_main;
	wire clk_sdr_p;
	wire clk_sdr_n;
	wire rst_sys_n;
	wire clk_sys;
	wire clk_col;
	wire clk_rxg;
	wire clk_rxio;
	wire clk_txg;
	wire clk_txio;
	wire tx_strobe;

	// Instantiate the Unit Under Test (UUT)
	clocking uut (
		.clk_50M(clk_50M), 
		.rst_n(rst_n), 
		.clk_main(clk_main), 
		.clk_sdr_p(clk_sdr_p), 
		.clk_sdr_n(clk_sdr_n), 
		.clk_main_out(clk_main_out), 
		.clk_ddr_p(clk_ddr_p), 
		.clk_ddr_n(clk_ddr_n), 
		.rst_sys_n(rst_sys_n), 
		.clk_sys(clk_sys), 
		.clk_col(clk_col), 
		.clk_rxg(clk_rxg), 
		.clk_rxio(clk_rxio), 
		.clk_txg(clk_txg), 
		.clk_txio(clk_txio), 
		.tx_strobe(tx_strobe)
	);

	initial begin
		// Initialize Inputs
		clk_50M = 0;
		rst_n = 0;
		clk_main_out = 0;
		clk_ddr_p = 0;
		clk_ddr_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	always #10 clk_50M=~clk_50M;
      
endmodule

