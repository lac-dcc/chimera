//======================================================================
//
// npts_phys.v
// -----------
// This module contains the Xilinx 10G Ethernet PHY IPs.
//
//
// Author: Joachim Strombergson
//
// Copyright 2020-2022 Netnod AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module ntps_phys (
                  input wire           reset,

                  output wire          clk156,
                  output wire          areset_clk156,

                  input wire           mdc,
                  input wire           mdio_in,
                  output wire          mdio_out,

                  // Port 0.
                  input wire           xphy_refclk_n,
                  input wire           xphy_refclk_p,

                  input wire  [2 : 0]  xphy_config_0,
                  output wire [4 : 0]  xphy_status_0,
                  input wire           sfp_module_detect_n_0,
                  input wire           sfp_signal_lost_0,
                  input wire           sfp_tx_fault_0,
                  output wire          sfp_tx_disable_0,
                  input wire           xphy_rxp_0,
                  input wire           xphy_rxn_0,
                  output wire          xphy_txp_0,
                  output wire          xphy_txn_0,
                  input wire [63  : 0] xgmii_txd_0,
                  input wire [7   : 0] xgmii_txc_0,
                  output wire [63 : 0] xgmii_rxd_0,
                  output wire [7  : 0] xgmii_rxc_0,


                  // Port 1.
                  input wire  [2 : 0]  xphy_config_1,
                  output wire [4 : 0]  xphy_status_1,
                  input wire           sfp_module_detect_n_1,
                  input wire           sfp_signal_lost_1,
                  input wire           sfp_tx_fault_1,
                  output wire          sfp_tx_disable_1,
                  input wire           xphy_rxp_1,
                  input wire           xphy_rxn_1,
                  output wire          xphy_txp_1,
                  output wire          xphy_txn_1,
                  input wire  [63 : 0] xgmii_txd_1,
                  input wire  [7  : 0] xgmii_txc_1,
                  output wire [63 : 0] xgmii_rxd_1,
                  output wire [7  : 0] xgmii_rxc_1,


                  // Port 2.
                  input wire  [2 : 0]  xphy_config_2,
                  output wire [4 : 0]  xphy_status_2,
                  input wire           sfp_module_detect_n_2,
                  input wire           sfp_signal_lost_2,
                  input wire           sfp_tx_fault_2,
                  output wire          sfp_tx_disable_2,
                  input wire           xphy_rxp_2,
                  input wire           xphy_rxn_2,
                  output wire          xphy_txp_2,
                  output wire          xphy_txn_2,
                  input wire  [63 : 0] xgmii_txd_2,
                  input wire  [7  : 0] xgmii_txc_2,
                  output wire [63 : 0] xgmii_rxd_2,
                  output wire [7  : 0] xgmii_rxc_2,


                  // Port 3.
                  input wire  [2 : 0]  xphy_config_3,
                  output wire [4 : 0]  xphy_status_3,
                  input wire           sfp_module_detect_n_3,
                  input wire           sfp_signal_lost_3,
                  input wire           sfp_tx_fault_3,
                  output wire          sfp_tx_disable_3,
                  input wire           xphy_rxp_3,
                  input wire           xphy_rxn_3,
                  output wire          xphy_txp_3,
                  output wire          xphy_txn_3,
                  input wire  [63 : 0] xgmii_txd_3,
                  input wire  [7  : 0] xgmii_txc_3,
                  output wire [63 : 0] xgmii_rxd_3,
                  output wire [7  : 0] xgmii_rxc_3
                  );


  //----------------------------------------------------------------
  // Internal wires.
  //----------------------------------------------------------------
  // Shared signals. From phy0 to phy1..3.
  wire         gtrxreset;
  wire         gttxreset;
  wire         qplllock;
  wire         qplloutclk;
  wire         qplloutrefclk;
  wire         reset_counter_done;
  wire         txuserrdy;
  wire         txusrclk;
  wire         txusrclk2;

  // mdio wires just to resolve mdio_out muxing here.
  wire 	       mdio_out_0;
  wire 	       mdio_tri_0;
  wire 	       mdio_out_1;
  wire 	       mdio_tri_1;
  wire 	       mdio_out_2;
  wire 	       mdio_tri_2;
  wire 	       mdio_out_3;
  wire 	       mdio_tri_3;


  //----------------------------------------------------------------
  // Mux to merge mdio outputs from network paths
  //----------------------------------------------------------------
  assign mdio_out = (mdio_out_0 & ~mdio_tri_0) |
                    (mdio_out_1 & ~mdio_tri_1) |
                    (mdio_out_2 & ~mdio_tri_2) |
                    (mdio_out_3 & ~mdio_tri_3);


  //----------------------------------------------------------------
  // phy0
  // This is the instance of the master PHY that contains
  // clock generation etc.
  //----------------------------------------------------------------
  localparam [4:0] PRTAD_0 = 5'd0;

  wire          drp_gnt_0;
  wire          drp_req_0;
  wire          drp_den_o_0;
  wire          drp_dwe_o_0;
  wire [15 : 0] drp_daddr_o_0;
  wire [15 : 0] drp_di_o_0;
  wire          drp_drdy_o_0;
  wire [15 : 0] drp_drpdo_o_0;
  wire          drp_den_i_0;
  wire          drp_dwe_i_0;
  wire [15 : 0] drp_daddr_i_0;
  wire [15 : 0] drp_di_i_0;
  wire          drp_drdy_i_0;
  wire [15 : 0] drp_drpdo_i_0;
  wire          signal_detect_0;
  wire          tx_disable_if_0;
  wire [2 : 0]  pma_pmd_type_0;
  wire [7 : 0]  core_status_0;

  assign drp_gnt_0        = drp_req_0;
  assign drp_den_i_0      = drp_den_o_0;
  assign drp_dwe_i_0      = drp_dwe_o_0;
  assign drp_daddr_i_0    = drp_daddr_o_0;
  assign drp_di_i_0       = drp_di_o_0;
  assign drp_drdy_i_0     = drp_drdy_o_0;
  assign drp_drpdo_i_0    = drp_drpdo_o_0;
  assign signal_detect_0  = ~sfp_signal_lost_0;
  assign sfp_tx_disable_0 = tx_disable_if_0 | ~xphy_config_0[0];
  assign xphy_status_0[0] = qplllock;
  assign xphy_status_0[1] = ~sfp_module_detect_n_0;
  assign xphy_status_0[2] = signal_detect_0;
  assign xphy_status_0[3] = sfp_tx_fault_0;
  assign xphy_status_0[4] = core_status_0[0];

  assign pma_pmd_type_0   = xphy_config_0[2 : 1] == 2'b00 ? 3'b101 : // 10GBASE-ER
                            xphy_config_0[2 : 1] == 2'b01 ? 3'b110 : // 10GBASE-LR
                                                            3'b111;  // 10GBASE-SR


  ten_gig_eth_pcs_pma_ip_shared_logic_in_core phy0 (
    .refclk_n               (xphy_refclk_n),
    .refclk_p               (xphy_refclk_p),
    .coreclk_out            (clk156),
    .dclk                   (clk156),
    .rxrecclk_out           (),
    .txusrclk_out           (txusrclk),
    .txusrclk2_out          (txusrclk2),
    .reset                  (reset),
    .areset_datapathclk_out (areset_clk156),
    .gttxreset_out          (gttxreset),
    .gtrxreset_out          (gtrxreset),
    .txuserrdy_out          (txuserrdy),
    .qplllock_out           (qplllock),
    .qplloutclk_out         (qplloutclk),
    .qplloutrefclk_out      (qplloutrefclk),
    .reset_counter_done_out (reset_counter_done),

    .xgmii_txd              (xgmii_txd_0),
    .xgmii_txc              (xgmii_txc_0),
    .xgmii_rxd              (xgmii_rxd_0),
    .xgmii_rxc              (xgmii_rxc_0),
    .txp                    (xphy_txp_0),
    .txn                    (xphy_txn_0),
    .rxp                    (xphy_rxp_0),
    .rxn                    (xphy_rxn_0),

    .mdc                    (mdc),
    .mdio_in                (mdio_in),
    .mdio_out               (mdio_out_0),
    .mdio_tri               (mdio_tri_0),
    .prtad                  (PRTAD_0),

    .core_status            (core_status_0),
    .resetdone_out          (),
    .signal_detect          (signal_detect_0),
    .tx_fault               (sfp_tx_fault_0),
    .pma_pmd_type           (pma_pmd_type_0),
    .tx_disable             (tx_disable_if_0),

    .drp_req                (drp_req_0),
    .drp_gnt                (drp_gnt_0),
    .drp_den_o              (drp_den_o_0),
    .drp_dwe_o              (drp_dwe_o_0),
    .drp_daddr_o            (drp_daddr_o_0),
    .drp_di_o               (drp_di_o_0),
    .drp_drdy_o             (drp_drdy_o_0),
    .drp_drpdo_o            (drp_drpdo_o_0),
    .drp_den_i              (drp_den_i_0),
    .drp_dwe_i              (drp_dwe_i_0),
    .drp_daddr_i            (drp_daddr_i_0),
    .drp_di_i               (drp_di_i_0),
    .drp_drdy_i             (drp_drdy_i_0),
    .drp_drpdo_i            (drp_drpdo_i_0),

    .sim_speedup_control    (1'h0)
  );


  //----------------------------------------------------------------
  // phy1
  //----------------------------------------------------------------
  localparam [4:0] PRTAD_1 = 5'd1;

  wire          drp_gnt_1;
  wire          drp_req_1;
  wire          drp_den_o_1;
  wire          drp_dwe_o_1;
  wire [15 : 0] drp_daddr_o_1;
  wire [15 : 0] drp_di_o_1;
  wire          drp_drdy_o_1;
  wire [15 : 0] drp_drpdo_o_1;
  wire          drp_den_i_1;
  wire          drp_dwe_i_1;
  wire [15 : 0] drp_daddr_i_1;
  wire [15 : 0] drp_di_i_1;
  wire          drp_drdy_i_1;
  wire [15 : 0] drp_drpdo_i_1;
  wire          signal_detect_1;
  wire          tx_disable_if_1;
  wire [2 : 0]  pma_pmd_type_1;
  wire [7 : 0]  core_status_1;

  assign drp_gnt_1        = drp_req_1;
  assign drp_den_i_1      = drp_den_o_1;
  assign drp_dwe_i_1      = drp_dwe_o_1;
  assign drp_daddr_i_1    = drp_daddr_o_1;
  assign drp_di_i_1       = drp_di_o_1;
  assign drp_drdy_i_1     = drp_drdy_o_1;
  assign drp_drpdo_i_1    = drp_drpdo_o_1;
  assign signal_detect_1  = ~sfp_signal_lost_1;
  assign sfp_tx_disable_1 = tx_disable_if_1 | ~xphy_config_1[0];
  assign xphy_status_1[0] = qplllock;
  assign xphy_status_1[1] = ~sfp_module_detect_n_1;
  assign xphy_status_1[2] = signal_detect_1;
  assign xphy_status_1[3] = sfp_tx_fault_1;
  assign xphy_status_1[4] = core_status_1[0];

  assign pma_pmd_type_1   = xphy_config_1[2 : 1] == 2'b00 ? 3'b101 : // 10GBASE-ER
                            xphy_config_1[2 : 1] == 2'b01 ? 3'b110 : // 10GBASE-LR
                                                            3'b111;  // 10GBASE-SR


  ten_gig_eth_pcs_pma_ip phy1 (
    .coreclk             (clk156),
    .dclk                (clk156),
    .rxrecclk_out        (),
    .txusrclk            (txusrclk),
    .txusrclk2           (txusrclk2),
    .areset              (reset),
    .txoutclk            (),
    .areset_coreclk      (areset_clk156),
    .gttxreset           (gttxreset),
    .gtrxreset           (gtrxreset),
    .txuserrdy           (txuserrdy),
    .qplllock            (qplllock),
    .qplloutclk          (qplloutclk),
    .qplloutrefclk       (qplloutrefclk),
    .reset_counter_done  (reset_counter_done),

    .xgmii_txd           (xgmii_txd_1),
    .xgmii_txc           (xgmii_txc_1),
    .xgmii_rxd           (xgmii_rxd_1),
    .xgmii_rxc           (xgmii_rxc_1),
    .txp                 (xphy_txp_1),
    .txn                 (xphy_txn_1),
    .rxp                 (xphy_rxp_1),
    .rxn                 (xphy_rxn_1),

    .mdc                 (mdc),
    .mdio_in             (mdio_in),
    .mdio_out            (mdio_out_1),
    .mdio_tri            (mdio_tri_1),
    .prtad               (PRTAD_1),

    .core_status         (core_status_1),
    .pma_pmd_type        (pma_pmd_type_1),
    .tx_resetdone        (),
    .rx_resetdone        (),
    .signal_detect       (signal_detect_1),
    .tx_fault            (sfp_tx_fault_1),
    .tx_disable          (tx_disable_if_1),

    .drp_req             (drp_req_1),
    .drp_gnt             (drp_gnt_1),
    .drp_den_o           (drp_den_o_1),
    .drp_dwe_o           (drp_dwe_o_1),
    .drp_daddr_o         (drp_daddr_o_1),
    .drp_di_o            (drp_di_o_1),
    .drp_drdy_o          (drp_drdy_o_1),
    .drp_drpdo_o         (drp_drpdo_o_1),
    .drp_den_i           (drp_den_i_1),
    .drp_dwe_i           (drp_dwe_i_1),
    .drp_daddr_i         (drp_daddr_i_1),
    .drp_di_i            (drp_di_i_1),
    .drp_drdy_i          (drp_drdy_i_1),
    .drp_drpdo_i         (drp_drpdo_i_1),

    .sim_speedup_control (1'h0)
  );


  //----------------------------------------------------------------
  // phy2
  //----------------------------------------------------------------
  localparam [4:0] PRTAD_2 = 5'd2;

  wire          drp_gnt_2;
  wire          drp_req_2;
  wire          drp_den_o_2;
  wire          drp_dwe_o_2;
  wire [15 : 0] drp_daddr_o_2;
  wire [15 : 0] drp_di_o_2;
  wire          drp_drdy_o_2;
  wire [15 : 0] drp_drpdo_o_2;
  wire          drp_den_i_2;
  wire          drp_dwe_i_2;
  wire [15 : 0] drp_daddr_i_2;
  wire [15 : 0] drp_di_i_2;
  wire          drp_drdy_i_2;
  wire [15 : 0] drp_drpdo_i_2;
  wire          signal_detect_2;
  wire          tx_disable_if_2;
  wire [2 : 0]  pma_pmd_type_2;
  wire [7 : 0]  core_status_2;

  assign drp_gnt_2        = drp_req_2;
  assign drp_den_i_2      = drp_den_o_2;
  assign drp_dwe_i_2      = drp_dwe_o_2;
  assign drp_daddr_i_2    = drp_daddr_o_2;
  assign drp_di_i_2       = drp_di_o_2;
  assign drp_drdy_i_2     = drp_drdy_o_2;
  assign drp_drpdo_i_2    = drp_drpdo_o_2;
  assign signal_detect_2  = ~sfp_signal_lost_2;
  assign sfp_tx_disable_2 = tx_disable_if_2 | ~xphy_config_2[0];
  assign xphy_status_2[0] = qplllock;
  assign xphy_status_2[1] = ~sfp_module_detect_n_2;
  assign xphy_status_2[2] = signal_detect_2;
  assign xphy_status_2[3] = sfp_tx_fault_2;
  assign xphy_status_2[4] = core_status_2[0];

  assign pma_pmd_type_2   = xphy_config_2[2 : 1] == 2'b00 ? 3'b101 : // 10GBASE-ER
                            xphy_config_2[2 : 1] == 2'b01 ? 3'b110 : // 10GBASE-LR
                                                            3'b111;  // 10GBASE-SR


  ten_gig_eth_pcs_pma_ip phy2 (
    .coreclk             (clk156),
    .dclk                (clk156),
    .rxrecclk_out        (),
    .txusrclk            (txusrclk),
    .txusrclk2           (txusrclk2),
    .areset              (reset),
    .txoutclk            (),
    .areset_coreclk      (areset_clk156),
    .gttxreset           (gttxreset),
    .gtrxreset           (gtrxreset),
    .txuserrdy           (txuserrdy),
    .qplllock            (qplllock),
    .qplloutclk          (qplloutclk),
    .qplloutrefclk       (qplloutrefclk),
    .reset_counter_done  (reset_counter_done),

    .xgmii_txd           (xgmii_txd_2),
    .xgmii_txc           (xgmii_txc_2),
    .xgmii_rxd           (xgmii_rxd_2),
    .xgmii_rxc           (xgmii_rxc_2),
    .txp                 (xphy_txp_2),
    .txn                 (xphy_txn_2),
    .rxp                 (xphy_rxp_2),
    .rxn                 (xphy_rxn_2),

    .mdc                 (mdc),
    .mdio_in             (mdio_in),
    .mdio_out            (mdio_out_2),
    .mdio_tri            (mdio_tri_2),
    .prtad               (PRTAD_2),

    .core_status         (core_status_2),
    .pma_pmd_type        (pma_pmd_type_2),
    .tx_resetdone        (),
    .rx_resetdone        (),
    .signal_detect       (signal_detect_2),
    .tx_fault            (sfp_tx_fault_2),
    .tx_disable          (tx_disable_if_2),

    .drp_req             (drp_req_2),
    .drp_gnt             (drp_gnt_2),
    .drp_den_o           (drp_den_o_2),
    .drp_dwe_o           (drp_dwe_o_2),
    .drp_daddr_o         (drp_daddr_o_2),
    .drp_di_o            (drp_di_o_2),
    .drp_drdy_o          (drp_drdy_o_2),
    .drp_drpdo_o         (drp_drpdo_o_2),
    .drp_den_i           (drp_den_i_2),
    .drp_dwe_i           (drp_dwe_i_2),
    .drp_daddr_i         (drp_daddr_i_2),
    .drp_di_i            (drp_di_i_2),
    .drp_drdy_i          (drp_drdy_i_2),
    .drp_drpdo_i         (drp_drpdo_i_2),

    .sim_speedup_control (1'h0)
  );


  //----------------------------------------------------------------
  // phy3
  //----------------------------------------------------------------
  localparam [4:0] PRTAD_3 = 5'd3;

  wire          drp_gnt_3;
  wire          drp_req_3;
  wire          drp_den_o_3;
  wire          drp_dwe_o_3;
  wire [15 : 0] drp_daddr_o_3;
  wire [15 : 0] drp_di_o_3;
  wire          drp_drdy_o_3;
  wire [15 : 0] drp_drpdo_o_3;
  wire          drp_den_i_3;
  wire          drp_dwe_i_3;
  wire [15 : 0] drp_daddr_i_3;
  wire [15 : 0] drp_di_i_3;
  wire          drp_drdy_i_3;
  wire [15 : 0] drp_drpdo_i_3;
  wire          signal_detect_3;
  wire          tx_disable_if_3;
  wire [2 : 0]  pma_pmd_type_3;
  wire [7 : 0]  core_status_3;

  assign drp_gnt_3        = drp_req_3;
  assign drp_den_i_3      = drp_den_o_3;
  assign drp_dwe_i_3      = drp_dwe_o_3;
  assign drp_daddr_i_3    = drp_daddr_o_3;
  assign drp_di_i_3       = drp_di_o_3;
  assign drp_drdy_i_3     = drp_drdy_o_3;
  assign drp_drpdo_i_3    = drp_drpdo_o_3;
  assign signal_detect_3  = ~sfp_signal_lost_3;
  assign sfp_tx_disable_3 = tx_disable_if_3 | ~xphy_config_3[0];
  assign xphy_status_3[0] = qplllock;
  assign xphy_status_3[1] = ~sfp_module_detect_n_3;
  assign xphy_status_3[2] = signal_detect_3;
  assign xphy_status_3[3] = sfp_tx_fault_3;
  assign xphy_status_3[4] = core_status_3[0];

  assign pma_pmd_type_3   = xphy_config_3[2 : 1] == 2'b00 ? 3'b101 : // 10GBASE-ER
                            xphy_config_3[2 : 1] == 2'b01 ? 3'b110 : // 10GBASE-LR
                                                            3'b111;  // 10GBASE-SR


  ten_gig_eth_pcs_pma_ip phy3 (
    .coreclk             (clk156),
    .dclk                (clk156),
    .rxrecclk_out        (),
    .txusrclk            (txusrclk),
    .txusrclk2           (txusrclk2),
    .areset              (reset),
    .txoutclk            (),
    .areset_coreclk      (areset_clk156),
    .gttxreset           (gttxreset),
    .gtrxreset           (gtrxreset),
    .txuserrdy           (txuserrdy),
    .qplllock            (qplllock),
    .qplloutclk          (qplloutclk),
    .qplloutrefclk       (qplloutrefclk),
    .reset_counter_done  (reset_counter_done),

    .xgmii_txd           (xgmii_txd_3),
    .xgmii_txc           (xgmii_txc_3),
    .xgmii_rxd           (xgmii_rxd_3),
    .xgmii_rxc           (xgmii_rxc_3),
    .txp                 (xphy_txp_3),
    .txn                 (xphy_txn_3),
    .rxp                 (xphy_rxp_3),
    .rxn                 (xphy_rxn_3),

    .mdc                 (mdc),
    .mdio_in             (mdio_in),
    .mdio_out            (mdio_out_3),
    .mdio_tri            (mdio_tri_3),
    .prtad               (PRTAD_3),

    .core_status         (core_status_3),
    .pma_pmd_type        (pma_pmd_type_3),
    .tx_resetdone        (),
    .rx_resetdone        (),
    .signal_detect       (signal_detect_3),
    .tx_fault            (sfp_tx_fault_3),
    .tx_disable          (tx_disable_if_3),

    .drp_req             (drp_req_3),
    .drp_gnt             (drp_gnt_3),
    .drp_den_o           (drp_den_o_3),
    .drp_dwe_o           (drp_dwe_o_3),
    .drp_daddr_o         (drp_daddr_o_3),
    .drp_di_o            (drp_di_o_3),
    .drp_drdy_o          (drp_drdy_o_3),
    .drp_drpdo_o         (drp_drpdo_o_3),
    .drp_den_i           (drp_den_i_3),
    .drp_dwe_i           (drp_dwe_i_3),
    .drp_daddr_i         (drp_daddr_i_3),
    .drp_di_i            (drp_di_i_3),
    .drp_drdy_i          (drp_drdy_i_3),
    .drp_drpdo_i         (drp_drpdo_i_3),

    .sim_speedup_control (1'h0)
  );

endmodule // ntps_phys

`default_nettype wire

//======================================================================
// EOF ntps_phys.v
//======================================================================
