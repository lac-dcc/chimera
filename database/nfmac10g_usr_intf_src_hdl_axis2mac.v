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

module axis2mac # (
    parameter AW = 9
    ) (

    // MAC Tx
    input                    m_axis_mac_aclk,
    input                    m_axis_mac_aresetn,
    output       [63:0]      m_axis_mac_tdata,
    output       [7:0]       m_axis_mac_tkeep,
    output                   m_axis_mac_tvalid,
    output                   m_axis_mac_tlast,
    output                   m_axis_mac_tuser,
    input                    m_axis_mac_tready,

    // Usr Tx
    input                    s_axis_aclk,
    input                    s_axis_aresetn,
    input        [63:0]      s_axis_tdata,
    input        [7:0]       s_axis_tkeep,
    input                    s_axis_tvalid,
    input                    s_axis_tlast,
    output                   s_axis_tready
    );

    localparam DW = 72; // tdata+tkeep

    //-------------------------------------------------------
    // Local axis2mac
    //-------------------------------------------------------
    wire                     mac_clk;
    wire                     mac_rst;
    wire                     usr_clk;
    wire                     usr_rst;

    //-------------------------------------------------------
    // Local ibuf2mac
    //-------------------------------------------------------
    wire         [AW:0]      committed_cons;

    //-------------------------------------------------------
    // Local ibuf
    //-------------------------------------------------------
    wire         [AW-1:0]    wr_addr;
    wire         [DW-1:0]    wr_data;
    wire         [AW-1:0]    rd_addr;
    wire         [DW-1:0]    rd_data;

    //-------------------------------------------------------
    // Local prod_sync
    //-------------------------------------------------------
    wire         [AW:0]      committed_prod_sync;

    //-------------------------------------------------------
    // Local cons_sync
    //-------------------------------------------------------
    wire         [AW:0]      committed_cons_sync;

    //-------------------------------------------------------
    // Local axis2ibuf
    //-------------------------------------------------------
    wire         [AW:0]      committed_prod;

    //-------------------------------------------------------
    // assigns
    //-------------------------------------------------------
    assign mac_clk = m_axis_mac_aclk;
    assign mac_rst = ~m_axis_mac_aresetn;
    assign usr_clk = s_axis_aclk;
    assign usr_rst = ~s_axis_aresetn;

    //-------------------------------------------------------
    // ibuf2mac
    //-------------------------------------------------------
    ibuf2mac #(
        .AW(AW),
        .DW(DW)
    ) ibuf2mac_mod (
        .clk(mac_clk),                                         // I
        .rst(mac_rst),                                         // I
        // MAC tx
        .tdat(m_axis_mac_tdata),                               // O [63:0]
        .tkep(m_axis_mac_tkeep),                               // O [7:0]
        .tval(m_axis_mac_tvalid),                              // O
        .tlst(m_axis_mac_tlast),                               // O
        .tusr(m_axis_mac_tuser),                               // O
        .trdy(m_axis_mac_tready),                              // I
        // ibuf
        .rd_addr(rd_addr),                                     // O [AW-1:0]
        .rd_data(rd_data),                                     // I [DW-1:0]
        // bwd logic
        .committed_cons(committed_cons),                       // O [AW:0]
        .committed_prod(committed_prod_sync)                   // I [AW:0]
        );

    //-------------------------------------------------------
    // ibuf
    //-------------------------------------------------------
    xge_ibuf #(
        .AW(AW),
        .DW(DW)
    ) ibuf_mod (
        .a(wr_addr),                                           // I [AW-1:0]
        .d(wr_data),                                           // I [DW-1:0]
        .dpra(rd_addr),                                        // I [AW-1:0]
        .clk(usr_clk),                                         // I 
        .qdpo_clk(mac_clk),                                    // I
        .qdpo(rd_data)                                         // O [DW-1:0]
        );

    //-------------------------------------------------------
    // prod_sync
    //-------------------------------------------------------
    xge_sync_type0 #(
        .W(AW+1)
    ) prod_sync_mod (
        .clk_out(mac_clk),                                     // I
        .rst_out(mac_rst),                                     // I
        .clk_in(usr_clk),                                      // I
        .rst_in(usr_rst),                                      // I
        .in(committed_prod),                                   // I [AW:0]
        .out(committed_prod_sync)                              // O [AW:0]
        );

    //-------------------------------------------------------
    // cons_sync
    //-------------------------------------------------------
    xge_sync_type1 #(
        .W(AW+1)
    ) cons_sync_mod (
        .clk_out(usr_clk),                                     // I
        .rst_out(usr_rst),                                     // I
        .clk_in(mac_clk),                                      // I
        .rst_in(mac_rst),                                      // I
        .in(committed_cons),                                   // I [AW:0]
        .out(committed_cons_sync)                              // O [AW:0]
        );

    //-------------------------------------------------------
    // axis2ibuf
    //-------------------------------------------------------
    axis2ibuf #(
        .AW(AW),
        .DW(DW)
    ) axis2ibuf_mod (
        .clk(usr_clk),                                         // I
        .rst(usr_rst),                                         // I
        // Usr Tx
        .tdat(s_axis_tdata),                                   // I [63:0]
        .tkep(s_axis_tkeep),                                   // I [7:0]
        .tval(s_axis_tvalid),                                  // I
        .tlst(s_axis_tlast),                                   // I
        .trdy(s_axis_tready),                                  // O
        // ibuf2mac
        .committed_prod(committed_prod),                       // O [AW:0]
        .committed_cons(committed_cons_sync),                  // I [AW:0]
        // ibuf
        .wr_addr(wr_addr),                                     // O [AW-1:0]
        .wr_data(wr_data)                                      // O [DW-1:0]
        );

endmodule // axis2mac

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////