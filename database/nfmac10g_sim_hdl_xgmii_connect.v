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

module xgmii_connect (

    // Clks and resets
    input                    clk,
    input                    reset,
    input                    tx_dcm_locked,
    input                    rx_dcm_locked,

    // XGMII
    input        [63:0]      xgmii_txd,
    input        [7:0]       xgmii_txc,
    output       [63:0]      xgmii_rxd,
    output       [7:0]       xgmii_rxc,

    // Sim info
    output       [63:0]      pkts_detected,
    output       [63:0]      corrupted_pkts
    );

    //-------------------------------------------------------
    // Local clk
    //-------------------------------------------------------

    //-------------------------------------------------------
    // xgmii_corrupt
    //-------------------------------------------------------
    xgmii_corrupt xgmii_corrupt_mod (
        // Clks and resets
        .clk(clk),                                             // I
        .reset(reset),                                         // I
        .tx_dcm_locked(tx_dcm_locked),                         // I
        .rx_dcm_locked(rx_dcm_locked),                         // I
        // XGMII
        .xgmii_txd(xgmii_txd),                                 // I [63:0]
        .xgmii_txc(xgmii_txc),                                 // I [7:0]
        .xgmii_rxd(xgmii_rxd),                                 // O [63:0]
        .xgmii_rxc(xgmii_rxc),                                 // O [7:0]
        // Sim info
        .pkts_detected(pkts_detected),                         // O [63:0]
        .corrupted_pkts(corrupted_pkts)                        // O [63:0]
        );

    //-------------------------------------------------------
    // ifg_monitor
    //-------------------------------------------------------
    ifg_monitor # (
        .C_RX_LINK(0)
    ) tx_ifg_monitor_mod (
        // Clks and resets
        .clk(clk),                                             // I
        .reset(reset),                                         // I
        .dcm_locked(tx_dcm_locked),                            // I
        // XGMII
        .xgmii_d(xgmii_txd),                                   // I [63:0]
        .xgmii_c(xgmii_txc)                                    // I [7:0]
        );

endmodule // xgmii_connect

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////