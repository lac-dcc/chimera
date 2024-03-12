//
// Copyright (c) 2016 University of Cambridge All rights reserved.
//
// Author: Marco Forconesi
//
// This software was developed with the support of 
// Prof. Gustavo Sutter and Prof. Sergio Lopez-Buedo and
// University of Cambridge Computer Laboratory NetFPGA team.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more
// contributor license agreements.  See the NOTICE file distributed with this
// work for additional information regarding copyright ownership.  NetFPGA
// licenses this file to you under the NetFPGA Hardware-Software License,
// Version 1.0 (the "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//`default_nettype none

module nf_axi_10g_ethernet # (
    parameter C_SHARED_BLOCK = 0,
    parameter C_TX_SUBSYS_EN = 1,
    parameter C_RX_SUBSYS_EN = 1
    ) (

    // Clks and resets
    input                    refclk_p,
    input                    refclk_n,
    input                    reset,
    input                    areset,
    
    input                    dclk,
    input                    clk156,
    output                   clk156_out,
    input                    areset_clk156,
    output                   areset_clk156_out,

    // GT clk and resets
    output                   tx_resetdone,
    output                   rx_resetdone,
    input                    reset_counter_done,
    input                    qplllock,
    input                    qplloutclk,
    input                    qplloutrefclk,
    output                   txclk322,
    output                   resetdone,
    output                   reset_counter_done_out,
    output                   qplllock_out,
    output                   qplloutclk_out,
    output                   qplloutrefclk_out,
    input                    txusrclk,
    input                    txusrclk2,
    input                    gttxreset,
    input                    gtrxreset,
    input                    txuserrdy,
    output                   txusrclk_out,
    output                   txusrclk2_out,
    output                   gttxreset_out,
    output                   gtrxreset_out,
    output                   txuserrdy_out,

    // Flow control
    input        [7:0]       tx_ifg_delay,
    input        [15:0]      s_axis_pause_tdata,
    input                    s_axis_pause_tvalid,

    // PCS/PMA conf and status vectors
    output       [7:0]       pcspma_status,
    input                    sim_speedup_control,
    input        [535:0]     pcs_pma_configuration_vector,
    output       [447:0]     pcs_pma_status_vector,

    // SFP control and indications
    input                    signal_detect,
    input                    tx_fault,
    output                   tx_disable,

    // Mac conf and status vectors
    input        [79:0]      mac_tx_configuration_vector,
    input        [79:0]      mac_rx_configuration_vector,
    output       [1:0]       mac_status_vector,

    // Statistic Vector Signals
    output       [25:0]      tx_statistics_vector,
    output                   tx_statistics_valid,
    output       [29:0]      rx_statistics_vector,
    output                   rx_statistics_valid,

    // Serial I/O
    output                   txp,
    output                   txn,
    input                    rxp,
    input                    rxn,

    // Tx AXIS
    input                    tx_axis_aresetn,
    input        [63:0]      s_axis_tx_tdata,
    input        [7:0]       s_axis_tx_tkeep,
    input                    s_axis_tx_tvalid,
    output                   s_axis_tx_tready,
    input                    s_axis_tx_tlast,
    input        [0:0]       s_axis_tx_tuser,

    // Rx AXIS
    input                    rx_axis_aresetn,
    output       [63:0]      m_axis_rx_tdata,
    output       [7:0]       m_axis_rx_tkeep,
    output                   m_axis_rx_tvalid,
    output                   m_axis_rx_tlast,
    output       [0:0]       m_axis_rx_tuser
    );

    //-------------------------------------------------------
    // Local clk and resets
    //-------------------------------------------------------
    wire                     clk156_i;
    wire                     areset_clk156_i;
    wire                     qplllock_i;

    //-------------------------------------------------------
    // Local PCS/PMA
    //-------------------------------------------------------
    // XGMII
    wire         [63:0]      xgmii_txd;
    wire         [7:0]       xgmii_txc;
    wire         [63:0]      xgmii_rxd;
    wire         [7:0]       xgmii_rxc;
    // DRP
    wire                     drp_req;
    wire                     drp_den_o;
    wire                     drp_dwe_o;
    wire         [15:0]      drp_daddr_o;
    wire         [15:0]      drp_di_o;
    wire                     drp_drdy_o;
    wire         [15:0]      drp_drpdo_o;


    //-------------------------------------------------------
    // assigns
    //-------------------------------------------------------
    assign tx_statistics_vector = 'b0;
    assign tx_statistics_valid = 'b0;
    assign rx_statistics_vector = 'b0;
    assign rx_statistics_valid = 'b0;

    // Conditional assings
    generate if (C_SHARED_BLOCK == 1) begin
        assign clk156_i = clk156_out;
        assign areset_clk156_i = areset_clk156_out;
        assign qplllock_i = qplllock_out;
    end
    else begin // C_SHARED_BLOCK
        assign clk156_i = clk156;
        assign areset_clk156_i = areset_clk156;
        assign qplllock_i = qplllock;
    end endgenerate

    //-------------------------------------------------------
    // PCS/PMA version 6.0
    //-------------------------------------------------------
    generate if (C_SHARED_BLOCK == 1) begin
    ten_gig_eth_pcs_pma_shared pcs_pma_mod (
        .refclk_p(refclk_p),                                   // I
        .refclk_n(refclk_n),                                   // I
        .reset(reset),                                         // I
        .resetdone_out(resetdone),                             // O
        .reset_counter_done_out(reset_counter_done_out),       // O
        .coreclk_out(clk156_out),                              // O
        .dclk(clk156_out),                                     // I
        .txp(txp),                                             // O
        .txn(txn),                                             // O
        .rxp(rxp),                                             // I
        .rxn(rxn),                                             // I
        .sim_speedup_control(sim_speedup_control),             // I
        .areset_datapathclk_out(areset_clk156_out),            // O
        .configuration_vector(pcs_pma_configuration_vector),   // I [535:0]
        .signal_detect(signal_detect),                         // I
        .tx_fault(tx_fault),                                   // I
        .tx_disable(tx_disable),                               // O
        .pma_pmd_type(3'b111),                                 // I [2:0] 10GBASE-SR (see man)
        .qplllock_out(qplllock_out),                           // O
        .qplloutclk_out(qplloutclk_out),                       // O
        .qplloutrefclk_out(qplloutrefclk_out),                 // O
        .txusrclk_out(txusrclk_out),                           // O
        .txusrclk2_out(txusrclk2_out),                         // O
        .gttxreset_out(gttxreset_out),                         // O
        .gtrxreset_out(gtrxreset_out),                         // O
        .txuserrdy_out(txuserrdy_out),                         // O
        // XGMII
        .xgmii_txd(xgmii_txd),                                 // I [63:0]
        .xgmii_txc(xgmii_txc),                                 // I [7:0]
        .xgmii_rxd(xgmii_rxd),                                 // O [63:0]
        .xgmii_rxc(xgmii_rxc),                                 // O [7:0]
        // DRP
        .drp_req(drp_req),                                     // O
        .drp_gnt(drp_req),                                     // I
        .drp_den_o(drp_den_o),                                 // O
        .drp_den_i(drp_den_o),                                 // I
        .drp_dwe_o(drp_dwe_o),                                 // O
        .drp_dwe_i(drp_dwe_o),                                 // I
        .drp_daddr_o(drp_daddr_o),                             // O [15:0]
        .drp_daddr_i(drp_daddr_o),                             // I [15:0]
        .drp_di_o(drp_di_o),                                   // O [15:0]
        .drp_di_i(drp_di_o),                                   // I [15:0]
        .drp_drdy_o(drp_drdy_o),                               // O
        .drp_drdy_i(drp_drdy_o),                               // I
        .drp_drpdo_o(drp_drpdo_o),                             // O [15:0]
        .drp_drpdo_i(drp_drpdo_o)                              // I [15:0]
        );
    end
    else begin // C_SHARED_BLOCK
    ten_gig_eth_pcs_pma_nonshared pcs_pma_mod (
        .areset(areset),                                       // I
        .tx_resetdone(tx_resetdone),                           // O
        .rx_resetdone(rx_resetdone),                           // O
        .reset_counter_done(reset_counter_done),               // I
        .coreclk(clk156),                                      // I
        .dclk(clk156_out),                                     // I
        .txp(txp),                                             // O
        .txn(txn),                                             // O
        .rxp(rxp),                                             // I
        .rxn(rxn),                                             // I
        .sim_speedup_control(sim_speedup_control),             // I
        .areset_coreclk(areset_clk156),                        // I
        .configuration_vector(pcs_pma_configuration_vector),   // I [535:0]
        .signal_detect(signal_detect),                         // I
        .tx_fault(tx_fault),                                   // I
        .tx_disable(tx_disable),                               // O
        .pma_pmd_type(3'b111),                                 // I [2:0] 10GBASE-SR (see man)
        .qplllock(qplllock),                                   // I
        .qplloutclk(qplloutclk),                               // I
        .qplloutrefclk(qplloutrefclk),                         // I
        .txoutclk(txclk322),                                   // O
        .txusrclk(txusrclk),                                   // I
        .txusrclk2(txusrclk2),                                 // I
        .gttxreset(gttxreset),                                 // I
        .gtrxreset(gtrxreset),                                 // I
        .txuserrdy(txuserrdy),                                 // O
        // XGMII
        .xgmii_txd(xgmii_txd),                                 // I [63:0]
        .xgmii_txc(xgmii_txc),                                 // I [7:0]
        .xgmii_rxd(xgmii_rxd),                                 // O [63:0]
        .xgmii_rxc(xgmii_rxc),                                 // O [7:0]
        // DRP
        .drp_req(drp_req),                                     // O
        .drp_gnt(drp_req),                                     // I
        .drp_den_o(drp_den_o),                                 // O
        .drp_den_i(drp_den_o),                                 // I
        .drp_dwe_o(drp_dwe_o),                                 // O
        .drp_dwe_i(drp_dwe_o),                                 // I
        .drp_daddr_o(drp_daddr_o),                             // O [15:0]
        .drp_daddr_i(drp_daddr_o),                             // I [15:0]
        .drp_di_o(drp_di_o),                                   // O [15:0]
        .drp_di_i(drp_di_o),                                   // I [15:0]
        .drp_drdy_o(drp_drdy_o),                               // O
        .drp_drdy_i(drp_drdy_o),                               // I
        .drp_drpdo_o(drp_drpdo_o),                             // O [15:0]
        .drp_drpdo_i(drp_drpdo_o)                              // I [15:0]
        );
    end endgenerate

    //-------------------------------------------------------
    // MAC
    //-------------------------------------------------------
    nfmac10g # (
        .C_TX_SUBSYS_EN(C_TX_SUBSYS_EN),
        .C_RX_SUBSYS_EN(C_RX_SUBSYS_EN)
    ) mac_mod (
        .tx_clk0(clk156_i),                                    // I
        .rx_clk0(clk156_i),                                    // I
        .reset(areset_clk156_i),                               // I
        .tx_dcm_locked(qplllock_i),                            // I
        .rx_dcm_locked(qplllock_i),                            // I
        // Others
        .tx_ifg_delay(tx_ifg_delay),                           // I [7:0]
        .pause_val(s_axis_pause_tdata),                        // I [15:0]
        .pause_req(s_axis_pause_tvalid),                       // I
        // Conf vectors
        .tx_configuration_vector(mac_tx_configuration_vector), // I [79:0]
        .rx_configuration_vector(mac_rx_configuration_vector), // I [79:0]
        // XGMII
        .xgmii_txd(xgmii_txd),                                 // O [63:0]
        .xgmii_txc(xgmii_txc),                                 // O [7:0]
        .xgmii_rxd(xgmii_rxd),                                 // I [63:0]
        .xgmii_rxc(xgmii_rxc),                                 // I [7:0]
        // Tx AXI
        .tx_axis_aresetn(tx_axis_aresetn),                     // I
        .tx_axis_tdata(s_axis_tx_tdata),                       // I [63:0]
        .tx_axis_tkeep(s_axis_tx_tkeep),                       // I [7:0]
        .tx_axis_tready(s_axis_tx_tready),                     // O
        .tx_axis_tvalid(s_axis_tx_tvalid),                     // I
        .tx_axis_tlast(s_axis_tx_tlast),                       // I
        .tx_axis_tuser(s_axis_tx_tuser),                       // I [0:0]
        // Rx AXI
        .rx_axis_aresetn(rx_axis_aresetn),                     // I
        .rx_axis_tdata(m_axis_rx_tdata),                       // O [63:0]
        .rx_axis_tkeep(m_axis_rx_tkeep),                       // O [7:0]
        .rx_axis_tvalid(m_axis_rx_tvalid),                     // O
        .rx_axis_tlast(m_axis_rx_tlast),                       // O
        .rx_axis_tuser(m_axis_rx_tuser)                        // O
        );

endmodule // nf_axi_10g_ethernet

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////