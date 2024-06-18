// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:28:41 11/12/2015
// Design Name:   asic
// Module Name:   C:/Users/rodriguj/Documents/zxuno/cores/sam_coupe_spartan6/test5/tb_scandoubler.v
// Project Name:  samcoupe
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: asic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_scandoubler;

	// Inputs
	reg clk12;
	reg clk24;

	// Outputs
	wire [18:0] vramaddr;
	wire [18:0] cpuramaddr;
	wire hsync, vsync;
    // Audio and video
    wire [1:0] sam_r, sam_g, sam_b;
    wire sam_bright;
    
	 // scandoubler
	 wire hsync_pal, vsync_pal; 
	 wire [2:0] ri = {sam_r, sam_bright};
    wire [2:0] gi = {sam_g, sam_bright};
    wire [2:0] bi = {sam_b, sam_bright};
	 
	 wire [2:0] r, g, b;

	// Instantiate the Unit Under Test (UUT)
	asic el_asic (
		.clk(clk12), 
		.rst_n(1'b1), 
		.mreq_n(1'b1), 
		.iorq_n(1'b1), 
		.rd_n(1'b1), 
		.wr_n(1'b1), 
		.cpuaddr(16'h1234), 
		.data_from_cpu(8'h00), 
		.data_to_cpu(), 
		.data_enable_n(), 
		.wait_n(), 
		.vramaddr(), 
		.cpuramaddr(), 
		.data_from_ram(8'b10101011), 
		.ramwr_n(), 
		.romcs_n(), 
		.ramcs_n(), 
		.asic_is_using_ram(), 
		.ear(1'b1), 
		.mic(), 
		.beep(), 
		.keyboard(8'hFF), 
		.rdmsel(), 
		.disc1_n(), 
		.disc2_n(), 
		.r(sam_r), 
		.g(sam_g), 
		.b(sam_b), 
		.bright(sam_bright), 
		.csync(), 
		.hsync_pal(hsync_pal), 
		.vsync_pal(vsync_pal), 
		.int_n()
	);

	vga_scandoubler #(.CLKVIDEO(12000)) salida_vga (
		.clkvideo(clk12),
		.clkvga(clk24),
		.ri(ri),
		.gi(gi),
		.bi(bi),
		.hsync_ext_n(hsync_pal),
		.vsync_ext_n(vsync_pal),
		.ro(r),
		.go(g),
		.bo(b),
		.hsync(hsync),
		.vsync(vsync)
   );	 	 

	initial begin
		// Initialize Inputs
		clk12 = 1;
		clk24 = 1;

	end
	
	always begin
		clk24 = #(500/24.0) ~clk24;
	end
	
	always begin
		clk12 = #(500/12.0) ~clk12;
	end
      
endmodule

