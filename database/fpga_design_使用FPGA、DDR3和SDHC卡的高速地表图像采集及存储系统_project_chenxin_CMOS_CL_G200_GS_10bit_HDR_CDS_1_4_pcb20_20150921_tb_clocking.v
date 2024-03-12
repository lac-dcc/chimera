`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:48:19 12/12/2014
// Design Name:   clocking
// Module Name:   E:/working/Project/G200/Program/GVISION200/tb_clocking.v
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

module tb_clocking;

	// Inputs
	reg clk_25M;
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
	wire clk_rxg_x2;
	wire rx_strobe;
	wire clk_txg;
	wire clk_txio;
	wire tx_strobe;

	// Instantiate the Unit Under Test (UUT)
	clocking uut (
		.clk_25M(clk_25M), 
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
		.clk_rxg_x2(clk_rxg_x2), 
		.rx_strobe(rx_strobe), 
		.clk_txg(clk_txg), 
		.clk_txio(clk_txio), 
		.tx_strobe(tx_strobe)
	);

	initial begin
		// Initialize Inputs
		clk_25M = 0;
		rst_n = 0;
		clk_main_out = 0;
		clk_ddr_p = 0;
		clk_ddr_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #100 rst_n = 1;
		// Add stimulus here
		
	end
		
		always # 20 clk_25M = ~clk_25M;
		always # 20 clk_main_out = ~clk_main_out;
      
endmodule

