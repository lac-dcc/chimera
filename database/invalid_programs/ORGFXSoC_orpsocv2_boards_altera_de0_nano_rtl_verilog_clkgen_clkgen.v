/*
 *
 * Clock, reset generation unit
 * 
 * Implements clock generation according to design defines
 * 
 */
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009, 2010 Authors and OPENCORES.ORG           ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "orpsoc-defines.v"
`include "synthesis-defines.v"

module clkgen
  (
   // Main clocks in, depending on board
   sys_clk_pad_i,

   // Wishbone clock and reset out  
   wb_clk_o,
   wb_rst_o,

   // JTAG clock
`ifdef GENERIC_JTAG_TAP
   tck_pad_i,
   dbg_tck_o,
`endif      
   // Main memory clocks
`ifdef VERSATILE_SDRAM
   sdram_clk_o,
   sdram_rst_o,
`endif
   // Peripheral clocks
`ifdef ETH_CLK
   eth_clk_pad_i,
   eth_clk_o,
   eth_rst_o,
 `endif

`ifdef USB_CLK
   usb_clk_o,
`endif

`ifdef VGA0
   vga0_clk_o,
`endif

   // Asynchronous, active low reset in
   rst_n_pad_i
   
   );

   input sys_clk_pad_i;

   output wb_rst_o;
   output wb_clk_o;

`ifdef GENERIC_JTAG_TAP
   input  tck_pad_i;
   output dbg_tck_o;
`endif      
   
`ifdef VERSATILE_SDRAM
   output sdram_clk_o;
   output sdram_rst_o;
`endif

`ifdef ETH_CLK
   input  eth_clk_pad_i;
   output eth_clk_o;
   output eth_rst_o;
`endif
   
`ifdef USB_CLK
   output usb_clk_o;
`endif

`ifdef VGA0
   output vga0_clk_o;
`endif

   // Asynchronous, active low reset (pushbutton, typically)
   input  rst_n_pad_i;
   
   // First, deal with the asychronous reset
   wire   async_rst;
   wire   async_rst_n;

   assign async_rst_n  = rst_n_pad_i;
   
   // Everyone likes active-high reset signals...
   assign async_rst = ~async_rst_n;
   
   
`ifdef GENERIC_JTAG_TAP
   assign  dbg_tck_o = tck_pad_i;
`endif

   //
   // Declare synchronous reset wires here
   //
   
   // An active-low synchronous reset signal (usually a PLL lock signal)
   wire   sync_rst_n;

   // An active-low synchronous reset from ethernet PLL
   wire   sync_eth_rst_n;
   
 
   wire   pll_lock;

   pll pll0 
   (
    .areset (async_rst),
    .inclk0 (sys_clk_pad_i),
`ifdef VERSATILE_SDRAM      
    .c0     (sdram_clk_o),
`else
    .c0     (),
`endif      
    .c1     (wb_clk_o),
`ifdef VGA0
    .c2     (vga0_clk_o),
`else
    .c2     (),
`endif    
    .locked (pll_lock)
   );
   
   assign sync_rst_n = pll_lock;

   //
   // Reset generation
   //
   //
            

   // Reset generation for wishbone
   reg [15:0] 	   wb_rst_shr;
   always @(posedge wb_clk_o or posedge async_rst)
     if (async_rst)
       wb_rst_shr <= 16'hffff;
     else
       wb_rst_shr <= {wb_rst_shr[14:0], ~(sync_rst_n)};
   
   assign wb_rst_o = wb_rst_shr[15];
   

   
`ifdef VERSATILE_SDRAM   
   // Reset generation for SDRAM controller
   reg [15:0] 	   sdram_rst_shr;
   always @(posedge sdram_clk_o or posedge async_rst)
     if (async_rst)
       sdram_rst_shr <= 16'hffff;
     else
       sdram_rst_shr <= {sdram_rst_shr[14:0], ~(sync_rst_n)};
   
   assign sdram_rst_o = sdram_rst_shr[15];
`endif //  `ifdef VERSATILE_SDRAM

`ifdef ETH_CLK
   // Reset generation for ethernet SMII
   reg [15:0] 	   eth_rst_shr;
   always @(posedge eth_clk_o or posedge async_rst)
     if (async_rst)
       eth_rst_shr <= 16'hffff;
     else
       eth_rst_shr <= {eth_rst_shr[14:0], ~(sync_eth_rst_n)};
   
   assign eth_rst_o = eth_rst_shr[15];
`endif //  `ifdef ETH_CLK
   
endmodule // clkgen
