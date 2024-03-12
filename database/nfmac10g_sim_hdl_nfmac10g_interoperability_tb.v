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
`timescale 1ns / 100ps
//`default_nettype none
`define tx nfmac10g
`define rx xilinx_mac

module nfmac10g_interoperability_tb (

    );

    // localparam
    localparam CLK_PERIOD = 6.4;
    localparam RST_ASSERTED = CLK_PERIOD * 20;
    localparam TX_AXIS_ARESETN_ASSERTED = CLK_PERIOD * 20;
    localparam RX_AXIS_ARESETN_ASSERTED = CLK_PERIOD * 20;
    localparam TX_DCM_LOCKED_ASSERTED = CLK_PERIOD * 20;
    localparam RX_DCM_LOCKED_ASSERTED = CLK_PERIOD * 20;

    //-------------------------------------------------------
    // Local clk
    //-------------------------------------------------------
    reg                      clk;
    reg                      rst;
    reg                      tx_dcm_locked;
    reg                      rx_dcm_locked;
    reg                      tx_axis_aresetn;
    reg                      rx_axis_aresetn;

    //-------------------------------------------------------
    // Local nfmac10g
    //-------------------------------------------------------
    // AXIs Tx
    wire         [63:0]      tx_axis_tdata;
    wire         [7:0]       tx_axis_tkeep;
    wire                     tx_axis_tvalid;
    wire                     tx_axis_tready;
    wire                     tx_axis_tlast;
    wire         [0:0]       tx_axis_tuser;
    // AXIs Rx
    wire         [63:0]      rx_axis_tdata;
    wire         [7:0]       rx_axis_tkeep;
    wire                     rx_axis_tvalid;
    wire                     rx_axis_tlast;
    wire         [0:0]       rx_axis_tuser;
    // XGMII
    wire         [63:0]      xgmii_txd;
    wire         [7:0]       xgmii_txc;
    wire         [63:0]      xgmii_rxd;
    wire         [7:0]       xgmii_rxc;

    //-------------------------------------------------------
    // Local stim_axis_tx
    //-------------------------------------------------------
    wire                     input_pkts_done;
    wire         [63:0]      aborted_pkts;
    wire         [63:0]      pushed_pkts;

    //-------------------------------------------------------
    // Local xgmii_connect
    //-------------------------------------------------------
    wire         [63:0]      xgmii_pkts_detected;
    wire         [63:0]      xgmii_corrupted_pkts;

    //-------------------------------------------------------
    // stim_axis_tx
    //-------------------------------------------------------
    stim_axis_tx stim_axis_tx_mod (
        // Clks and resets
        .clk(clk),                                             // I
        .reset(rst),                                           // I
        .tx_dcm_locked(tx_dcm_locked),                         // I
        .rx_dcm_locked(rx_dcm_locked),                         // I
        // Tx AXIS
        .tx_axis_aresetn(tx_axis_aresetn),                     // I
        .tx_axis_tdata(tx_axis_tdata),                         // O [63:0]
        .tx_axis_tkeep(tx_axis_tkeep),                         // O [7:0]
        .tx_axis_tvalid(tx_axis_tvalid),                       // O
        .tx_axis_tready(tx_axis_tready),                       // I
        .tx_axis_tlast(tx_axis_tlast),                         // O
        .tx_axis_tuser(tx_axis_tuser),                         // O [0:0]
        // Sim info
        .input_pkts_done(input_pkts_done),                     // O
        .aborted_pkts(aborted_pkts),                           // O [63:0]
        .pushed_pkts(pushed_pkts)                              // O [63:0]
        );

    //-------------------------------------------------------
    // Tx MAC
    //-------------------------------------------------------
    `tx tx_mac_mod (
        // Clks and resets
        .tx_clk0(clk),                                         // I
        .rx_clk0(clk),                                         // I
        .reset(rst),                                           // I
        .tx_dcm_locked(tx_dcm_locked),                         // I
        .rx_dcm_locked(rx_dcm_locked),                         // I
        // Flow control
        .tx_ifg_delay(8'b0),                                   // I
        .pause_val(16'b0),                                     // I
        .pause_req(1'b0),                                      // I
        // Conf vectors
        .tx_configuration_vector({69'b0,1'b1,8'b0,2'b10}),     // I
        .rx_configuration_vector({78'b0,2'b10}),               // I
        // XGMII
        .xgmii_txd(xgmii_txd),                                 // O [63:0]
        .xgmii_txc(xgmii_txc),                                 // O [7:0]
        .xgmii_rxd(),                                          // I [63:0]
        .xgmii_rxc(),                                          // I [7:0]
        // Tx AXIS
        .tx_axis_aresetn(tx_axis_aresetn),                     // I
        .tx_axis_tdata(tx_axis_tdata),                         // I [63:0]
        .tx_axis_tkeep(tx_axis_tkeep),                         // I [7:0]
        .tx_axis_tvalid(tx_axis_tvalid),                       // I
        .tx_axis_tready(tx_axis_tready),                       // O
        .tx_axis_tlast(tx_axis_tlast),                         // I
        .tx_axis_tuser(tx_axis_tuser),                         // I [0:0]
        // Rx AXIS
        .rx_axis_aresetn(rx_axis_aresetn),                     // I
        .rx_axis_tdata(),                                      // O [63:0]
        .rx_axis_tkeep(),                                      // O [7:0]
        .rx_axis_tvalid(),                                     // O
        .rx_axis_tlast(),                                      // O
        .rx_axis_tuser()                                       // O [0:0]
        );

    //-------------------------------------------------------
    // xgmii_connect
    //-------------------------------------------------------
    xgmii_connect xgmii_connect_mod (
        // Clks and resets
        .clk(clk),                                             // I
        .reset(rst),                                           // I
        .tx_dcm_locked(tx_dcm_locked),                         // I
        .rx_dcm_locked(rx_dcm_locked),                         // I
        // XGMII
        .xgmii_txd(xgmii_txd),                                 // I [63:0]
        .xgmii_txc(xgmii_txc),                                 // I [7:0]
        .xgmii_rxd(xgmii_rxd),                                 // O [63:0]
        .xgmii_rxc(xgmii_rxc),                                 // O [7:0]
        // Sim info
        .pkts_detected(xgmii_pkts_detected),                   // O [63:0]
        .corrupted_pkts(xgmii_corrupted_pkts)                  // O [63:0]
        );

    //-------------------------------------------------------
    // Rx MAC
    //-------------------------------------------------------
    `rx rx_mac_mod (
        // Clks and resets
        .tx_clk0(clk),                                         // I
        .rx_clk0(clk),                                         // I
        .reset(rst),                                           // I
        .tx_dcm_locked(tx_dcm_locked),                         // I
        .rx_dcm_locked(rx_dcm_locked),                         // I
        // Flow control
        .tx_ifg_delay(8'b0),                                   // I
        .pause_val(16'b0),                                     // I
        .pause_req(1'b0),                                      // I
        // Conf vectors
        .tx_configuration_vector({69'b0,1'b1,8'b0,2'b10}),     // I
        .rx_configuration_vector({78'b0,2'b10}),               // I
        // XGMII
        .xgmii_txd(),                                          // O [63:0]
        .xgmii_txc(),                                          // O [7:0]
        .xgmii_rxd(xgmii_rxd),                                 // I [63:0]
        .xgmii_rxc(xgmii_rxc),                                 // I [7:0]
        // Tx AXIS
        .tx_axis_aresetn(tx_axis_aresetn),                     // I
        .tx_axis_tdata('b0),                                   // I [63:0]
        .tx_axis_tkeep('b0),                                   // I [7:0]
        .tx_axis_tvalid('b0),                                  // I
        .tx_axis_tready(),                                     // O
        .tx_axis_tlast('b0),                                   // I
        .tx_axis_tuser('b0),                                   // I [0:0]
        // Rx AXIS
        .rx_axis_aresetn(rx_axis_aresetn),                     // I
        .rx_axis_tdata(rx_axis_tdata),                         // O [63:0]
        .rx_axis_tkeep(rx_axis_tkeep),                         // O [7:0]
        .rx_axis_tvalid(rx_axis_tvalid),                       // O
        .rx_axis_tlast(rx_axis_tlast),                         // O
        .rx_axis_tuser(rx_axis_tuser)                          // O [0:0]
        );

    //-------------------------------------------------------
    // out_chk_rx
    //-------------------------------------------------------
    out_chk_rx out_chk_rx_mod (
        // Clks and resets
        .clk(clk),                                             // I
        .reset(rst),                                           // I
        .tx_dcm_locked(tx_dcm_locked),                         // I
        .rx_dcm_locked(rx_dcm_locked),                         // I
        // Tx AXIS
        .rx_axis_aresetn(tx_axis_aresetn),                     // I
        .rx_axis_tdata(rx_axis_tdata),                         // I [63:0]
        .rx_axis_tkeep(rx_axis_tkeep),                         // I [7:0]
        .rx_axis_tvalid(rx_axis_tvalid),                       // I
        .rx_axis_tlast(rx_axis_tlast),                         // I
        .rx_axis_tuser(rx_axis_tuser),                         // I [0:0]
        // Sim info, stim_axis_tx
        .input_pkts_done(input_pkts_done),                     // I
        .aborted_pkts(aborted_pkts),                           // I [63:0]
        .pushed_pkts(pushed_pkts),                             // I [63:0]
        // Sim info, xgmii_connect
        .pkts_detected(xgmii_pkts_detected),                   // I [63:0]
        .corrupted_pkts(xgmii_corrupted_pkts)                  // I [63:0]
        );

    //-------------------------------------------------------
    // Test
    //-------------------------------------------------------
    initial begin
        clk = 0;
        rst = 1;
        tx_dcm_locked = 0;
        rx_dcm_locked = 0;
        tx_axis_aresetn = 0;
        rx_axis_aresetn = 0;
    end

    always
        #(CLK_PERIOD/2) clk = ~clk;

    always
        #RST_ASSERTED rst = 0;

    always
        #TX_DCM_LOCKED_ASSERTED tx_dcm_locked = 1;

    always
        #RX_DCM_LOCKED_ASSERTED rx_dcm_locked = 1;

    always
        #TX_AXIS_ARESETN_ASSERTED tx_axis_aresetn = 1;

    always
        #RX_AXIS_ARESETN_ASSERTED rx_axis_aresetn = 1;

endmodule // nfmac10g_interoperability_tb

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////