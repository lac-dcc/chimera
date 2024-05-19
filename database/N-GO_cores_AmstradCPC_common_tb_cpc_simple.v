// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:21:21 04/03/2017
// Design Name:   cpc
// Module Name:   D:/Users/rodriguj/Documents/zxspectrum/zxuno/repositorio/cores/amstrad_cpc/test2/v4/tb_cpc_simple.v
// Project Name:  cpc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cpc_simple;

	// Inputs
	reg ck16, ck32;
	reg reset_n;

	// Outputs
	wire red;
	wire red_oe;
	wire green;
	wire green_oe;
	wire blue;
	wire blue_oe;
	wire csync_pal, hsync_pal, vsync_pal;
	wire [20:0] sram_addr;
	wire sram_we_n;
  wire hsync, vsync;
  wire [2:0] r,g,b;

	// Bidirs
	wire [7:0] sram_data;

  wire [2:0] ri = (red_oe)? {red,red,red} : 3'd4;
  wire [2:0] gi = (green_oe)? {green,green,green} : 3'd4;
  wire [2:0] bi = (blue_oe)? {blue,blue,blue} : 3'd4;


	// Instantiate the Unit Under Test (UUT)
	cpc amstrad (
    .ck16(ck16),
    .pown_reset_n(reset_n),
    .red(red),
    .red_oe(red_oe),
    .green(green),
    .green_oe(green_oe),
    .blue(blue),
    .blue_oe(blue_oe),
    .hsync_pal(hsync_pal),
    .vsync_pal(vsync_pal),
    .csync_pal(csync_pal),
    .ear(1'b0),
    .audio_out_left(),
    .audio_out_right(),
    .clkps2(1'b1),
    .dataps2(1'b1),
    .sram_addr(sram_addr),
    .sram_data(sram_data),
    .sram_we_n(sram_we_n)
  );

  async_ram la_ram (
    .a(sram_addr[15:0]),
    .we_n(sram_we_n),
    .d(sram_data)
  );

	vga_scandoubler #(.CLKVIDEO(16000)) salida_vga (
		.clkvideo(ck16),
		.clkvga(ck32),
    .enable_scandoubling(1'b1),
    .disable_scaneffect(1'b1),
		.ri(ri),
		.gi(gi),
		.bi(bi),
		.hsync_ext_n(hsync_pal),
		.vsync_ext_n(vsync_pal),
    .csync_ext_n(csync_pal),
		.ro(r),
		.go(g),
		.bo(b),
		.hsync(hsync),
		.vsync(vsync)
   );	 


	initial begin
		// Initialize Inputs
		ck16 = 0;
    ck32 = 0;
		reset_n = 0;

		// Wait 100 ns for global reset to finish
		#1000;
    reset_n = 1;    
		// Add stimulus here

	end
  
  always begin
    ck16 = #(1000/32.0) ~ck16;
  end
  
  always begin
    ck32 = #(1000/64.0) ~ck32;
  end
  
      
endmodule

module async_ram (
  input wire [15:0] a,
  input wire we_n,
  inout wire [7:0] d
  );
  
  reg [7:0] mem[0:65535];
  assign d = (we_n)? mem[a] : 8'hZZ;
  always @* begin
    if (we_n == 1'b0)
      mem[a] = d;
  end
endmodule
