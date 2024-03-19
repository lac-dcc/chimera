//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2013 Xilinx, Inc. All rights reserved.
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
module network_path (    
    input                            txusrclk,
    input                            txusrclk2,
    output                           txclk322,
    input                            areset_refclk_bufh,
    input                            areset_clk156,
    input                            mmcm_locked_clk156,
    input                            gttxreset_txusrclk2,
    input                            gttxreset,
    input                            gtrxreset,
    input                            txuserrdy,
    input                            qplllock,
    input                            qplloutclk,
    input                            qplloutrefclk,
    input                            reset_counter_done,
    output                           txp,
    output                           txn,
    input                            rxp,
    input                            rxn,
    output                           tx_resetdone,
    
    input                            tx_fault,
    input                            signal_detect,
    input [4 : 0]                    prtad,

    output [7:0]                     xphy_status,
    input                            clk156, 
    input                            dclk, 
    input                            soft_reset, 
    output                           nw_rst_out, 
    input                            sys_rst,
    input [63:0]                     xgmii_txd,
    input [7:0]                      xgmii_txc,
    output [63:0]                    xgmii_rxd,
    output [7:0]                     xgmii_rxc,
    input                            polarity,	// macchan 0:rev1.1 1:rev1.0 board
    input                            sim_speedup_control
);

/*-------------------------------------------------------------------------*/

   // Signal declarations
   wire                           mdc;      
   wire                           mdio_in;
   wire                           mdio_out;
   wire                           mdio_tri;

   reg                             core_reset;
   reg                             core_reset_tmp;

  //-10GBASE-R PHY Specific signals

  wire                            rx_resetdone;
  wire                            resetdone;

  wire drp_gnt;
  wire drp_req;
  wire drp_den_o;                                   
  wire drp_dwe_o;
  wire [15 : 0] drp_daddr_o;                   
  wire [15 : 0] drp_di_o; 
  wire drp_drdy_o;                
  wire [15 : 0] drp_drpdo_o;
  wire drp_den_i;                                   
  wire drp_dwe_i;
  wire [15 : 0] drp_daddr_i;                   
  wire [15 : 0] drp_di_i; 
  wire drp_drdy_i;                
  wire [15 : 0] drp_drpdo_i;



  assign resetdone = tx_resetdone && rx_resetdone;
  assign  nw_rst_out = core_reset;

  always @(posedge sys_rst or posedge clk156)
  begin
    if(sys_rst)
    begin
      core_reset_tmp <= 1'b1;
      core_reset <= 1'b1;
    end
    else
    begin
      // Hold core in reset until everything else is ready...
      core_reset_tmp <= (!(resetdone) || sys_rst || tx_fault || !signal_detect);
      core_reset <= core_reset_tmp;
    end
  end     

  // If no arbitration is required on the GT DRP ports then connect REQ to GNT
  // and connect other signals i <= o;
  assign drp_gnt = drp_req;
  assign drp_den_i = drp_den_o;
  assign drp_dwe_i = drp_dwe_o;
  assign drp_daddr_i = drp_daddr_o;                   
  assign drp_di_i = drp_di_o;
  assign drp_drdy_i = drp_drdy_o;
  assign drp_drpdo_i = drp_drpdo_o;

ten_gig_eth_pcs_pma_ip  ten_gig_eth_pcs_pma_inst (
//     .clk156(clk156),
     .coreclk(clk156),
     .dclk(dclk),
     .txusrclk(txusrclk),
     .txusrclk2(txusrclk2),
     .areset(sys_rst),
//     .txclk322(txclk322),
     .txoutclk(txclk322),
     //.areset_refclk_bufh(areset_refclk_bufh),
//     .areset_clk156(areset_clk156),
     .areset_coreclk(areset_clk156),
     //.mmcm_locked_clk156(mmcm_locked_clk156),
     //.gttxreset_txusrclk2(gttxreset_txusrclk2),
     .gttxreset(gttxreset),
     .gtrxreset(gtrxreset),
     .sim_speedup_control(sim_speedup_control),     //macchan
     .txuserrdy(txuserrdy),
     .qplllock(qplllock),
     .qplloutclk(qplloutclk),
     .qplloutrefclk(qplloutrefclk),
     .reset_counter_done(reset_counter_done),
     .xgmii_txd(xgmii_txd),
     .xgmii_txc(xgmii_txc),
     .xgmii_rxd(xgmii_rxd),
     .xgmii_rxc(xgmii_rxc),
     .txp(txp),
     .txn(txn),
     .rxp(rxp),
     .rxn(rxn),
     .mdc(mdc),
     .mdio_in(mdio_out),
     .mdio_out(mdio_in),
     .mdio_tri(mdio_tri),
     .prtad(prtad),
     .core_status(xphy_status),
     .tx_resetdone(tx_resetdone),
     .rx_resetdone(rx_resetdone),
     .signal_detect(signal_detect),
     .tx_fault(tx_fault),
     .drp_req(drp_req),
     .drp_gnt(drp_gnt),
     .drp_den_o(drp_den_o),
     .drp_dwe_o(drp_dwe_o),
     .drp_daddr_o(drp_daddr_o),
     .drp_di_o(drp_di_o),
     .drp_drdy_o(drp_drdy_o),
     .drp_drpdo_o(drp_drpdo_o),
     .drp_den_i(drp_den_i),
     .drp_dwe_i(drp_dwe_i),
     .drp_daddr_i(drp_daddr_i),
     .drp_di_i(drp_di_i),
     .drp_drdy_i(drp_drdy_i),
     .drp_drpdo_i(drp_drpdo_i),

     .pma_pmd_type(3'b101),
     .tx_disable(),
     .gt0_txpolarity(polarity),	// macchan
     .gt0_rxpolarity(polarity),	// macchan
     .gt0_eyescanreset(),
     .gt0_eyescantrigger(),
     .gt0_rxcdrhold(),
     .gt0_txprbsforceerr(),
     .gt0_rxrate(),
     .gt0_txpmareset(),
     .gt0_rxpmareset(),
     .gt0_rxdfelpmreset(),
     .gt0_txprecursor(),
     .gt0_txpostcursor(),
     .gt0_txdiffctrl(),
     .gt0_rxlpmen(),
     .gt0_eyescandataerror(),
     .gt0_txbufstatus(),
     .gt0_txresetdone(),
     .gt0_rxresetdone(),
     .gt0_rxbufstatus(),
     .gt0_rxprbserr(),
     .gt0_dmonitorout()
 );

assign mdc = 1'h0;      
assign mdio_in = 1'h1;
//assign mdio_out = 1'h0;
//assign mdio_tri = 1'h1;

endmodule
