/*
 *
 * Clock, reset generation unit for s3adsp1800 board
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

`include "orpsoc-defines.v"
`include "synthesis-defines.v"

module clkgen
  (
   // Main clocks in, depending on board
   sys_clk_i,

   // Wishbone clock and reset out  
   wb_clk_o,
   wb_rst_o,

   // JTAG clock
`ifdef JTAG_DEBUG
   tck_pad_i,
   dbg_tck_o,
`endif      
   // Main memory clocks
`ifdef XILINX_DDR2
   clk133_o,
`endif

   // Asynchronous, active low reset in
   rst_n_pad_i
   
   );

   input  sys_clk_i;

   output wb_rst_o;
   output wb_clk_o;

`ifdef JTAG_DEBUG
   input  tck_pad_i;
   output dbg_tck_o;
`endif      
   
`ifdef XILINX_DDR2
   output clk133_o;
`endif

   // Asynchronous, active low reset (pushbutton, typically)
   input  rst_n_pad_i;
   
   // First, deal with the asychronous reset
   wire   async_rst;
   wire   async_rst_n;

   // Xilinx synthesis tools appear cluey enough to instantiate buffers when and
   // where they're needed, so we do simple assigns for this tech.
   assign async_rst_n = rst_n_pad_i;   

   // Everyone likes active-high reset signals...
   assign async_rst = ~async_rst_n;
   
   
`ifdef JTAG_DEBUG   
   assign dbg_tck_o = tck_pad_i;
`endif

   //
   // Declare synchronous reset wires here
   //
   
   // An active-low synchronous reset signal (usually a PLL lock signal)
   wire   sync_rst_n;

   // An active-low synchronous reset from ethernet PLL
   wire   sync_eth_rst_n;

   // IBUF for sys_clk_i
   wire   sys_clk;
   IBUFG ibufg0
     (.I(sys_clk_i), .O(sys_clk));
   
   
   /* DCM0 wires */
   wire 	   dcm0_clk0_prebufg, dcm0_clk0;
   wire 	   dcm0_clkfx_prebufg, dcm0_clkfx;
   wire 	   dcm0_clkdv_prebufg, dcm0_clkdv;
   wire 	   dcm0_locked;

    
   /* DCM providing main system/Wishbone clock */
   DCM_SP #( .CLK_FEEDBACK("1X"), 
	     // 125 / 5 = 25 MHz
	     .CLKDV_DIVIDE(5),
	     // 125 * 2/8 = 31.25Mhz
	     .CLKFX_DIVIDE(8), 
             .CLKFX_MULTIPLY(2),
	     // Clkin = 125 Mhz
	     .CLKIN_PERIOD(8.000), 
	     .CLKIN_DIVIDE_BY_2("FALSE"), 
             .CLKOUT_PHASE_SHIFT("NONE"), .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), 
             .DFS_FREQUENCY_MODE("LOW"), .DLL_FREQUENCY_MODE("LOW"), 
             .DUTY_CYCLE_CORRECTION("TRUE"), .FACTORY_JF(16'hC080), 
             .PHASE_SHIFT(0), .STARTUP_WAIT("FALSE") ) 
   DCM_SP_INST 
     (
      .CLKFB(dcm0_clk0), 
      .CLKIN(sys_clk), 
      .DSSEN(1'b0), 
      .PSCLK(1'b0), 
      .PSEN(1'b0), 
      .PSINCDEC(1'b0), 
      .RST(1'b0), 
      .CLKDV(dcm0_clkdv_prebufg), 
      .CLKFX(dcm0_clkfx_prebufg), 
      .CLKFX180(), 
      .CLK0(dcm0_clk0_prebufg), 
      .CLK2X(), 
      .CLK2X180(), 
      .CLK90(), 
      .CLK180(), 
      .CLK270(), 
      .LOCKED(dcm0_locked), 
      .PSDONE(), 
      .STATUS());

   BUFG dcm0_clk0_bufg
     (// Outputs
      .O                                 (dcm0_clk0),
      // Inputs
      .I                                 (dcm0_clk0_prebufg));

   BUFG dcm0_clkfx_bufg
     (// Outputs
      .O                                 (dcm0_clkfx),
      // Inputs
      .I                                 (dcm0_clkfx_prebufg));

   BUFG dcm0_clkdv_bufg
     (// Outputs
      .O                                 (dcm0_clkdv),
      // Inputs
      .I                                 (dcm0_clkdv_prebufg));

   assign wb_clk_o = dcm0_clkdv;
   assign sync_rst_n = dcm0_locked;

 `ifdef XILINX_DDR2
   assign clk133_o = dcm0_clk0; // 125 MHz for now
 `endif
   
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
   

 `ifdef XILINX_DDR2
   /*
   // Reset generation for DDR2 controller
   reg [15:0] 	   ddr2_if_rst_shr;
   always @(posedge ddr2_if_clk_o or posedge async_rst)
     if (async_rst)
       ddr2_if_rst_shr <= 16'hffff;
     else
       ddr2_if_rst_shr <= {ddr2_if_rst_shr[14:0], ~(sync_rst_n)};
   
   assign ddr2_if_rst_o = ddr2_if_rst_shr[15];   
    */
`endif   
   
   
endmodule // clkgen
