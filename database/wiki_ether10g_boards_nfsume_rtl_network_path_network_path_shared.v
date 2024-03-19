//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information of Xilinx, Inc.
// and is protected under U.S. and international copyright and other
// intellectual property laws.
//
// DISCLAIMER
//
// This disclaimer is not a license and does not grant any rights to the
// materials distributed herewith. Except as otherwise provided in a valid
// license issued to you by Xilinx, and to the maximum extent permitted by
// applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
// FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
// IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
// MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
// and (2) Xilinx shall not be liable (whether in contract or tort, including
// negligence, or under any other theory of liability) for any loss or damage
// of any kind or nature related to, arising under or in connection with these
// materials, including for any direct, or any indirect, special, incidental,
// or consequential loss or damage (including loss of data, profits, goodwill,
// or any type of loss or damage suffered as a result of any action brought by
// a third party) even if such damage or loss was reasonably foreseeable or
// Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
//
// Xilinx products are not designed or intended to be fail-safe, or for use in
// any application requiring fail-safe performance, such as life-support or
// safety devices or systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any other
// applications that could lead to death, personal injury, or severe property
// or environmental damage (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and liability of any use of
// Xilinx products in Critical Applications, subject only to applicable laws
// and regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
// AT ALL TIMES.

`timescale 1ps / 1ps

(* CORE_GENERATION_INFO = "network_path_shared,network_path_shared_v1_3,{x_ipproduct=Vivado2014.3,v7_xt_conn_trd=2014.3}" *)
module network_path_shared (   
//`ifdef USE_XPHY  
    input                            xphy_refclk_n,
    input                            xphy_refclk_p,
    output                           xphy_txp, 
    output                           xphy_txn, 
    input                            xphy_rxp, 
    input                            xphy_rxn, 
    output                           txusrclk, 
    output                           txusrclk2, 
//-Shared reset signals
    output                           areset_clk156,
    output                           gttxreset,   
    output                           gtrxreset,   
    output                           txuserrdy,
    output                           qplllock,
    output                           qplloutclk,
    output                           qplloutrefclk,
    output                           reset_counter_done,
    output                           tx_resetdone, 
    input [63 : 0]                   xgmii_txd,
    input [7 : 0]                    xgmii_txc,
    output [63 : 0]                  xgmii_rxd,
    output [7 : 0]                   xgmii_rxc,
    input                            tx_fault,
    input                            signal_detect,
    input [4 : 0]                    prtad,
    input [7:0]                      tx_ifg_delay,
    output                           xphy_tx_disable, 

    output [7:0]                     xphy_status,
    output                           clk156, 
    input                            dclk,
    input                            sys_rst,
    input                            sim_speedup_control
);


   // Signal declarations
   wire                           mdc;      
   wire                           mdio_in;
   wire                           mdio_out;


   wire                           rx_statistics_valid;
   wire [29:0]                    rx_statistics_vector;

  wire  xphy_resetdone;

  wire                                      drp_gnt;
  wire                                      drp_req;
  wire                                      drp_den_o;                                   
  wire                                      drp_dwe_o;
  wire [15 : 0]                             drp_daddr_o;                   
  wire [15 : 0]                             drp_di_o; 
  wire                                      drp_drdy_o;                
  wire [15 : 0]                             drp_drpdo_o;
  wire                                      drp_den_i;                                   
  wire                                      drp_dwe_i;
  wire [15 : 0]                             drp_daddr_i;                   
  wire [15 : 0]                             drp_di_i; 
  wire                                      drp_drdy_i;                
  wire [15 : 0]                             drp_drpdo_i;


  assign tx_resetdone = xphy_resetdone;
  // If no arbitration is required on the GT DRP ports then connect REQ to GNT
  // and connect other signals i <= o;
  assign drp_gnt = drp_req;
  assign drp_den_i = drp_den_o;
  assign drp_dwe_i = drp_dwe_o;
  assign drp_daddr_i = drp_daddr_o;                   
  assign drp_di_i = drp_di_o;
  assign drp_drdy_i = drp_drdy_o;
  assign drp_drpdo_i = drp_drpdo_o;
  
  ten_gig_eth_pcs_pma_ip_shared_logic_in_core ten_gig_eth_pcs_pma_inst (
      .refclk_n               (xphy_refclk_n),
      .refclk_p               (xphy_refclk_p),
      .coreclk_out        (clk156), 
      .dclk                   (dclk),
      .txusrclk_out           (txusrclk),
      .txusrclk2_out          (txusrclk2),
      .reset                  (sys_rst),
      .areset_datapathclk_out (areset_clk156),
      .gttxreset_out          (gttxreset),
      .gtrxreset_out          (gtrxreset),
      .txuserrdy_out          (txuserrdy),
      .qplllock_out           (qplllock),
      .qplloutclk_out         (qplloutclk),
      .qplloutrefclk_out      (qplloutrefclk),
      .reset_counter_done_out (reset_counter_done),
      .xgmii_txd              (xgmii_txd),
      .xgmii_txc              (xgmii_txc),
      .xgmii_rxd              (xgmii_rxd),
      .xgmii_rxc              (xgmii_rxc),
      .txp                    (xphy_txp),    
      .txn                    (xphy_txn),    
      .rxp                    (xphy_rxp),    
      .rxn                    (xphy_rxn),    
      .mdc                    (mdc),
      .mdio_in                (mdio_out),
      .mdio_out               (mdio_in),
      .mdio_tri               (),                 
      .prtad                  (prtad),
      .core_status            (xphy_status), 
      .resetdone_out          (xphy_resetdone), 
      .signal_detect          (signal_detect),  
      .tx_fault               (tx_fault),
      .drp_req                (drp_req),
      .drp_gnt                (drp_gnt),
      .drp_den_o              (drp_den_o),
      .drp_dwe_o              (drp_dwe_o),
      .drp_daddr_o            (drp_daddr_o),
      .drp_di_o               (drp_di_o),
      .drp_drdy_o             (drp_drdy_o),
      .drp_drpdo_o            (drp_drpdo_o),
      .drp_den_i              (drp_den_i),
      .drp_dwe_i              (drp_dwe_i),
      .drp_daddr_i            (drp_daddr_i),
      .drp_di_i               (drp_di_i),
      .drp_drdy_i             (drp_drdy_i),
      .drp_drpdo_i            (drp_drpdo_i),
      .pma_pmd_type           (3'b101),
      .tx_disable             (xphy_tx_disable),
      .sim_speedup_control    (sim_speedup_control)
    );

endmodule
