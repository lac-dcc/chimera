//-
// Copyright (c) 2015 Noa Zilberman
// All rights reserved.
//
// This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
//  File:
//        top_tb.v
//
//  Module:
//        top
//
//  Author: Noa Zilberman
//
//  Description:
//        reference nic top module
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//

`timescale 1ns / 100ps

 module top_tb # (
  parameter          PL_SIM_FAST_LINK_TRAINING           = "TRUE",      // Simulation Speedup
  parameter          C_DATA_WIDTH                        = 512,         // RX/TX interface data width
  parameter          KEEP_WIDTH                          = C_DATA_WIDTH / 32,
  parameter  integer USER_CLK2_FREQ                 = 4,
  parameter          REF_CLK_FREQ                   = 0,           // 0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz
  parameter          AXISTEN_IF_RQ_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_CC_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_CQ_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_RC_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_ENABLE_CLIENT_TAG   = 0,
  parameter          AXISTEN_IF_RQ_PARITY_CHECK     = 0,
  parameter          AXISTEN_IF_CC_PARITY_CHECK     = 0,
  parameter          AXISTEN_IF_MC_RX_STRADDLE      = 0,
  parameter          AXISTEN_IF_ENABLE_RX_MSG_INTFC = 0,
  parameter   [17:0] AXISTEN_IF_ENABLE_MSG_ROUTE    = 18'h2FFFF
) (

);

   parameter PCIE_PERIOD = 4.0;
   parameter XPHY_PERIOD = 6.4;
   parameter real CORE_PERIOD = 2.9;
 
   localparam  TCQ                                 = 1;
   localparam  BAR0AXI                             = 32'h40000000;
   localparam  BAR1AXI                             = 32'h10000000;
   localparam  BAR2AXI                             = 32'h20000000;
   localparam  BAR3AXI                             = 32'h30000000;
   localparam  BAR4AXI                             = 32'h40000000;
   localparam  BAR5AXI                             = 32'h50000000;
   localparam  BAR0SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR1SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR2SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR3SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR4SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR5SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  throttle_percent                    = 50;
 
 reg       sys_reset_n; 

  reg                                       sys_clk;
  wire sys_clkp,sys_clkn;
  reg                                       xphy_clk;
  wire xphy_refclk_p,xphy_refclk_n;
  reg                                       clk_ref;
  wire clk_ref_p,clk_ref_n;
  //----------------------------------------------------------------------------------------------------------------//
  // axis interface                                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//

 
 
 top_sim # (
    .PL_SIM_FAST_LINK_TRAINING       (PL_SIM_FAST_LINK_TRAINING        ),
    .C_DATA_WIDTH                    (C_DATA_WIDTH                     ),
    .KEEP_WIDTH                      (KEEP_WIDTH                       ),
    .USER_CLK2_FREQ                  (USER_CLK2_FREQ                   ),
    .REF_CLK_FREQ                    (REF_CLK_FREQ                     ),
    .AXISTEN_IF_RQ_ALIGNMENT_MODE    (AXISTEN_IF_RQ_ALIGNMENT_MODE     ),
    .AXISTEN_IF_CC_ALIGNMENT_MODE    (AXISTEN_IF_CC_ALIGNMENT_MODE     ),
    .AXISTEN_IF_CQ_ALIGNMENT_MODE    (AXISTEN_IF_CQ_ALIGNMENT_MODE     ),
    .AXISTEN_IF_RC_ALIGNMENT_MODE    (AXISTEN_IF_RC_ALIGNMENT_MODE     ),
    .AXISTEN_IF_ENABLE_CLIENT_TAG    (AXISTEN_IF_ENABLE_CLIENT_TAG     ),
    .AXISTEN_IF_RQ_PARITY_CHECK      (AXISTEN_IF_RQ_PARITY_CHECK       ),
    .AXISTEN_IF_CC_PARITY_CHECK      (AXISTEN_IF_CC_PARITY_CHECK       ),
    .AXISTEN_IF_MC_RX_STRADDLE       (AXISTEN_IF_MC_RX_STRADDLE        ),
    .AXISTEN_IF_ENABLE_RX_MSG_INTFC  (AXISTEN_IF_ENABLE_RX_MSG_INTFC   ),
    .AXISTEN_IF_ENABLE_MSG_ROUTE     (AXISTEN_IF_ENABLE_MSG_ROUTE      )
  ) top_sim (
  
  //PCI Express
    .pcie_rxn(pcie_7x_mgt_rxn),
    .pcie_rxp(pcie_7x_mgt_rxp),
    .pcie_txn(pcie_7x_mgt_txn),
    .pcie_txp(pcie_7x_mgt_txp),
  //10G Interface
  
    .qsfp0_rxp(rxp),
    .qsfp0_rxn(rxn),
    .qsfp0_txp(txp),
    .qsfp0_txn(txn),
    
  // PCIe Clock
    .pci_clk_p(sys_clkp),
    .pci_clk_n(sys_clkn),
    
    //200MHz Clock
    .fpga_sysclk_p(clk_ref_p),
    .fpga_sysclk_n(clk_ref_n),
    
    // 156.25 MHz clock in
    .qsfp_refclk_p (xphy_refclk_p),
    .qsfp_refclk_n (xphy_refclk_n),
        
    .sys_reset_n(sys_reset_n)
  );
    
//Reset handling
 // Important! polarity here is opposite the one in the actual design
   initial begin 
    sys_reset_n = 1'b0;
    #(CORE_PERIOD * 200);
    sys_reset_n = 1'b1;
    $display("Reset Deasserted");
   end

//Clock generation
   initial begin
      sys_clk = 1'b0;
      #(PCIE_PERIOD/2);
      forever
         #(PCIE_PERIOD/2) sys_clk = ~sys_clk;
   end 

   assign sys_clkp = sys_clk;
   assign sys_clkn = ~sys_clk; 
   
   
    initial begin
      xphy_clk = 1'b0;
      #(XPHY_PERIOD/2);
      forever
         #(XPHY_PERIOD/2) xphy_clk = ~xphy_clk;
   end 

   assign xphy_refclk_p = xphy_clk;
   assign xphy_refclk_n = ~xphy_clk; 
   
 initial begin
   clk_ref = 1'b0;
   #(CORE_PERIOD/2);
   forever
      #(CORE_PERIOD/2) clk_ref = ~clk_ref;
end 

assign clk_ref_p = clk_ref;
assign clk_ref_n = ~clk_ref; 

endmodule
