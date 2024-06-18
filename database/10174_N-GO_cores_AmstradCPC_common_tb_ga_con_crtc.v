// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:33:23 03/20/2017
// Design Name:   ga40010
// Module Name:   D:/Users/rodriguj/Documents/zxspectrum/zxuno/repositorio/cores/amstrad_cpc/ga40010/tb_ga_con_crtc.v
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

module tb_ga_con_crtc;

	// Inputs
	reg ck16;
	reg reset_n;
	reg a15;
	reg a14;
	reg mreq_n;
	reg iorq_n;
	reg m1_n;
	reg rd_n;

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

  // Wires
	wire vsync;
	wire hsync;
	wire dispen;
  wire [13:0] ma;
  wire [4:0] ra;
	wire [7:0] d;

  wire [15:0] ram_addr = {ma[13:12], ra[2:0], ma[9:0], cclk};

	// Instantiate the Unit Under Test (UUT)
	ga40010 ga (
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

  mc6845 crtc (
    .CLOCK(~cclk),
    .CLKEN(1'b1),
    .nRESET(reset_n),
    .ENABLE(1'b0),
    .R_nW(1'b1),
    .RS(1'b0),
    .DI(8'h00),
    .DO(),
    .VSYNC(vsync),
    .HSYNC(hsync),
    .DE(dispen),
    .CURSOR(),
    .LPSTB(1'b0),
    .MA(ma),
    .RA(ra)
	);

  vram_blade_warriors la_pantalla (
    .clk(ck16),
    .a(ram_addr[13:0]),
    .dout(d)
  );

	initial begin
		// Initialize Inputs
		ck16 = 0;
		reset_n = 0;
		a15 = 0;
		a14 = 1;
		mreq_n = 1;
		iorq_n = 1;
		m1_n = 1;
		rd_n = 1;

		// Wait 100 ns for global reset to finish
    #100;
    reset_n = 1;    
		// Add stimulus here

	end

  always begin
    ck16 = #31.25 ~ck16;
  end
  
  always begin
    @(negedge int_n);
    @(posedge phi_n);
    iorq_n = 0;
    m1_n = 0;
    repeat (5)
      @(posedge phi_n);
    iorq_n = 1;
    m1_n = 1;    
  end
endmodule
