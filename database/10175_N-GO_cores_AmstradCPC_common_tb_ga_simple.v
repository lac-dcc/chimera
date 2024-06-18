// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:20 03/17/2017
// Design Name:   ga40010
// Module Name:   D:/Users/rodriguj/Documents/zxspectrum/zxuno/repositorio/cores/amstrad_cpc/ga40010/tb_ga_simple.v
// Project Name:  ga40010
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ga40010
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ga_simple;

	// Inputs
	reg ck16;
	reg reset_n;
	reg a15;
	reg a14;
	reg mreq_n;
	reg iorq_n;
	reg m1_n;
	reg rd_n;
	reg vsync;
	reg hsync;
	reg dispen;

	// Outputs
	wire phi_n;
	wire ready;
	wire int_n;
	wire cclk;
	wire en224_n;
	wire cpu_n;
	wire romen_n;
	wire ramrd_n;
	wire ras_n;
	wire cas_n;
	wire casad_n;
	wire mwe_n;
	wire sync_n;
	wire red;
	wire red_oe;
	wire green;
	wire green_oe;
	wire blue;
	wire blue_oe;

	// Bidirs
	wire [7:0] d;

	// Instantiate the Unit Under Test (UUT)
	ga40010 uut (
		.ck16(ck16), 
		.reset_n(reset_n), 
		.a15(a15), 
		.a14(a14), 
		.mreq_n(mreq_n), 
		.iorq_n(iorq_n), 
		.m1_n(m1_n), 
		.rd_n(rd_n), 
		.phi_n(phi_n), 
		.ready(ready), 
		.int_n(int_n), 
		.d(d), 
		.vsync(vsync), 
		.hsync(hsync), 
		.dispen(dispen), 
		.cclk(cclk), 
		.en224_n(en224_n), 
		.cpu_n(cpu_n), 
		.romen_n(romen_n), 
		.ramrd_n(ramrd_n), 
		.ras_n(ras_n), 
		.cas_n(cas_n), 
		.casad_n(casad_n), 
		.mwe_n(mwe_n), 
		.sync_n(sync_n), 
		.red(red), 
		.red_oe(red_oe), 
		.green(green), 
		.green_oe(green_oe), 
		.blue(blue), 
		.blue_oe(blue_oe)
	);

	initial begin
		// Initialize Inputs
		ck16 = 0;
		reset_n = 0;
		a15 = 0;
		a14 = 1;
		mreq_n = 0;
		iorq_n = 1;
		m1_n = 0;
		rd_n = 0;
		vsync = 0;
		hsync = 0;
		dispen = 0;

		// Wait 100 ns for global reset to finish
    #100;
    reset_n = 1;    
		// Add stimulus here

	end

  always begin
    ck16 = #(1000/32) ~ck16;
  end      
endmodule

