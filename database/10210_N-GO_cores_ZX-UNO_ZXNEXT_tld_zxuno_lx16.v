// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ns
`default_nettype none


//    This file is part of the ZXUNO Spectrum core. 
//    Creation date is 02:28:18 2014-02-06 by Miguel Angel Rodriguez Jodar
//    (c)2014-2020 ZXUNO association.
//    ZXUNO official repository: http://svn.zxuno.com/svn/zxuno
//    Username: guest   Password: zxuno
//    Github repository for this core: https://github.com/mcleod-ideafix/zxuno_spectrum_core
//
//    ZXUNO Spectrum core is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    ZXUNO Spectrum core is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with the ZXUNO Spectrum core.  If not, see <https://www.gnu.org/licenses/>.
//
//    Any distributed copy of this file must keep this notice intact.
//    
//    8/10/2020 Port to ZX NEXT by Fernando Mosquera - Benitoss

module tld_zxdos_lx16 (
   input wire clk50mhz,

   output wire [2:0] r,
   output wire [2:0] g,
   output wire [2:0] b,
   output wire hsync,
   output wire vsync,
   input wire ear,
   inout wire clkps2,
   inout wire dataps2,
   inout wire mouseclk,
   inout wire mousedata,
   output wire audio_out_left,
   output wire audio_out_right,

   //output wire midi_out,
   //input wire clkbd,
   //input wire wsbd,
   //input wire dabd,    

   //output wire uart_tx,
   //input wire uart_rx,
   //output wire uart_rts,
   //output wire uart_reset,

   //output wire stdn,
   //output wire stdnb,
   
   output wire [18:0] sram_addr,
   inout wire [7:0] sram_data,
   output wire sram_we_n,
   output wire [3:0] ram_ce_n_o,
   
   output wire flash_cs_n,
   output wire flash_clk,
   output wire flash_mosi,
   input wire flash_miso,

//   input wire joy_data,
//   output wire joy_clk,
//   output wire joy_load_n,

   input wire  joyup,
   input wire  joydown,
   input wire  joyleft,
   input wire  joyright,
   input wire  joyfire,
   output wire joyp7_o,
   input wire  joyfire2,
   output wire joysel_o,

  // Matrix keyboard
   output wire   [7:0]keyb_row_o, 
   input wire    [6:0]keyb_col_i,

   output wire sd_cs_n,    
   output wire sd_clk,     
   output wire sd_mosi,    
   input wire sd_miso,

   output wire flashled,
   output wire sdled
   );

   wire sysclk;
   wire [2:0] pll_frequency_option;
   
   clock_generator relojes_maestros
   (// Clock in ports
    .CLK_IN1            (clk50mhz),
    .pll_option         (pll_frequency_option),
    // Clock out ports
    .sysclk             (sysclk)
    );

   wire [2:0] ri, gi, bi, ro, go, bo;
   wire hsync_pal, vsync_pal, csync_pal;
   wire vga_enable, scanlines_enable;
   wire clk14en_tovga;
   
   wire joy1up, joy1down, joy1left, joy1right, joy1fire1, joy1fire2;
   wire joy2up, joy2down, joy2left, joy2right, joy2fire1, joy2fire2;

   wire [20:0] sram_addr_int;
   assign sram_addr = sram_addr_int[18:0];
  	
//   joydecoder decodificador_joysticks (
//    .clk(sysclk),
//    .joy_data(joy_data),
//    .joy_latch_megadrive(1'b1),
//    .joy_clk(joy_clk),
//    .joy_load_n(joy_load_n),
//    .joy1up(joy1up),
//    .joy1down(joy1down),
//    .joy1left(joy1left),
//    .joy1right(joy1right),
//    .joy1fire1(joy1fire1),
//    .joy1fire2(joy1fire2),
//    .joy1fire3(),
//    .joy1start(),
//    .joy2up(joy2up),
//    .joy2down(joy2down),
//    .joy2left(joy2left),
//    .joy2right(joy2right),
//    .joy2fire1(joy2fire1),
//    .joy2fire2(joy2fire2),
//    .joy2fire3(),
//    .joy2start()    
//   );   

   zxuno #(.FPGA_MODEL(3'b010), .MASTERCLK(28000000)) la_maquina (
    .sysclk(sysclk),
    .power_on_reset_n(1'b1),  // sólo para simulación. Para implementacion, dejar a 1
    .r(ri),
    .g(gi),
    .b(bi),
    .hsync(hsync_pal),
    .vsync(vsync_pal),
    .csync(csync_pal),
    .clkps2(clkps2),
    .dataps2(dataps2),
    .ear_ext(~ear),  // negada porque el hardware tiene un transistor inversor
    .audio_out_left(audio_out_left),
    .audio_out_right(audio_out_right),
    
    .midi_out(),
    .clkbd(1'b0),
    .wsbd(1'b0),
    .dabd(1'b0),
    
    .uart_tx(),
    .uart_rx(1'b1),
    .uart_rts(),

    .sram_addr(sram_addr_int),
    .sram_data(sram_data),
    .sram_we_n(sram_we_n),
    
    .flash_cs_n(flash_cs_n),
    .flash_clk(flash_clk),
    .flash_di(flash_mosi),
    .flash_do(flash_miso),
    
    .sd_cs_n(sd_cs_n),
    .sd_clk(sd_clk),
    .sd_mosi(sd_mosi),
    .sd_miso(sd_miso),
    
     .joy1up    (joy1_i[0]),
    .joy1down  (joy1_i[1]),
    .joy1left  (joy1_i[2]),
    .joy1right (joy1_i[3]),
    .joy1fire1 (joy1_i[4]),
    .joy1fire2 (joy1_i[5]),    
	 
    .joy2up    (joy2_i[0]),
    .joy2down  (joy2_i[1]),
    .joy2left  (joy2_i[2]),
    .joy2right (joy2_i[3]),
    .joy2fire1 (joy2_i[4]),
    .joy2fire2 (joy2_i[5]),   

    .mouseclk(mouseclk),
    .mousedata(mousedata),
    
    .clk14en_tovga(clk14en_tovga),
    .vga_enable(vga_enable),
    .scanlines_enable(scanlines_enable),
    .freq_option(pll_frequency_option),
    
    .ad724_xtal(),
    .ad724_mode(),
    .ad724_enable_gencolorclk()
    );

	vga_scandoubler #(.CLKVIDEO(14000)) salida_vga (
		.clk(sysclk),
    .clkcolor4x(1'b1),
    .clk14en(clk14en_tovga),
    .enable_scandoubling(vga_enable),
    .disable_scaneffect(~scanlines_enable),
		.ri(ri),
		.gi(gi),
		.bi(bi),
		.hsync_ext_n(hsync_pal),
		.vsync_ext_n(vsync_pal),
    .csync_ext_n(csync_pal),
		.ro(ro),
		.go(go),
		.bo(bo),
		.hsync(hsync),
		.vsync(vsync)
   );	 
   
	assign ram_ce_n_o = 4'b1110;    
   assign flashled = flash_cs_n;
   assign sdled = sd_cs_n;
   //assign uart_reset = 1'bz;
   
//   assign r = {ro, ro};
//   assign g = {go, go};
//   assign b = {bo, bo};
   
	assign r = ro;
   assign g = go;
   assign b = bo;
   
	//	-- joystick multiplex
   reg joysel_s;
   reg  [5:0] joy1_s;
	reg  [5:0] joy2_s;
	wire [5:0] joy1_i;
	wire [5:0] joy2_i;	
	
	
	wire  [4:0]membrane_col;
   wire  [7:0]membrane_rows;
	wire [6:0]keyb_col_i_0;
   wire [6:0]keyb_col_i_q;
	
	reg  [7:0]keyb_row;
	assign keyb_row_o = keyb_row;
	reg reset_poweron;
	
  always @ (posedge sysclk) begin
      if (membrane_rows[0] == 1'b0)
         keyb_row[0] <= 1'b0;
      else 			 
			keyb_row[0] <= 1'bZ;
		if (membrane_rows[1] == 1'b0)
         keyb_row[1] <= 1'b0;
      else 			 
			keyb_row[1] <= 1'bZ;
		if (membrane_rows[2] == 1'b0)
         keyb_row[2]<= 1'b0;
      else 			 
			keyb_row[2] <= 1'bZ;
		if (membrane_rows[3] == 1'b0)
         keyb_row[3] <= 1'b0;
      else 			 
			keyb_row[3] <= 1'bZ;
		if (membrane_rows[4] == 1'b0)
         keyb_row[4] <= 1'b0;
      else 			 
			keyb_row[4] <= 1'bZ;
		if (membrane_rows[5] == 1'b0)
         keyb_row[5] <= 1'b0;
      else 			 
			keyb_row[5] <= 1'bZ;
		if (membrane_rows[6] == 1'b0)
         keyb_row[6] <= 1'b0;
      else 			 
			keyb_row[6] <= 1'bZ;
		if (membrane_rows[7] == 1'b0)
         keyb_row[7] <= 1'b0;
      else 			 
			keyb_row[7] <= 1'bZ;
  end
	
	
	// Divisor de relojes
  reg [8:0] delay_count;
  reg CLK_28_MEMBRANE_EN;
  wire ena_x;
  
  always @ (posedge sysclk) begin
      delay_count <= delay_count + 1'b1;       
  end
  
  //complete scan every 2.5 scanlines (0.018ms per row)
  always @ (posedge sysclk) begin
		if (delay_count == {1'b1, 8'hFF})
			CLK_28_MEMBRANE_EN <= 1'b1; 
		else
		   CLK_28_MEMBRANE_EN <= 1'b0;
  end 
    
	assign ena_x = delay_count[5];  // clk a 28/ 2^6 = 437.5 Khz 
		
	always @(posedge ena_x) begin
	   joysel_s = ~joysel_s;
		if (joysel_s==1'b1) 
		     joy1_s <= {joyfire2, joyfire, joyright, joyleft, joydown, joyup};
		else  
			  joy2_s <= {joyfire2, joyfire, joyright, joyleft, joydown, joyup};
	end
	
 assign joyp7_o  = 1'bz;
 assign joysel_o = joysel_s;
//  assign joysel_o = 1'b0;
 assign joy1_i = joy1_s; 
 assign joy2_i = joy2_s;
//  assign joy1_i = {joyfire2, joyfire, joyright, joyleft, joydown, joyup}; //6'b111111;
//  assign joy2_i = 6'b111111;


 // Matrix keyboard
   
//   always @ (negedge sysclk) begin
//         keyb_col_i_0 <= keyb_col_i;
//   end
//   
//   always @ (posedge sysclk) begin
//         keyb_col_i_q <= keyb_col_i_0;
//   end


endmodule
