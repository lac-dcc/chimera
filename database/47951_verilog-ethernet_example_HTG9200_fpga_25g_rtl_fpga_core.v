// This program was cloned from: https://github.com/alexforencich/verilog-ethernet
// License: MIT License

/*

Copyright (c) 2021 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * FPGA core logic
 */
module fpga_core
(
    /*
     * Clock: 156.25MHz
     * Synchronous reset
     */
    input  wire        clk,
    input  wire        rst,

    /*
     * GPIO
     */
    input  wire        btn,
    input  wire [7:0]  sw,
    output wire [7:0]  led,

    /*
     * UART: 115200 bps, 8N1
     */
    output wire        uart_rxd,
    input  wire        uart_txd,
    input  wire        uart_rts,
    output wire        uart_cts,
    output wire        uart_rst_n,
    output wire        uart_suspend_n,

    /*
     * Ethernet: QSFP28
     */
    input  wire        qsfp_1_tx_clk_1,
    input  wire        qsfp_1_tx_rst_1,
    output wire [63:0] qsfp_1_txd_1,
    output wire [7:0]  qsfp_1_txc_1,
    input  wire        qsfp_1_rx_clk_1,
    input  wire        qsfp_1_rx_rst_1,
    input  wire [63:0] qsfp_1_rxd_1,
    input  wire [7:0]  qsfp_1_rxc_1,
    input  wire        qsfp_1_tx_clk_2,
    input  wire        qsfp_1_tx_rst_2,
    output wire [63:0] qsfp_1_txd_2,
    output wire [7:0]  qsfp_1_txc_2,
    input  wire        qsfp_1_rx_clk_2,
    input  wire        qsfp_1_rx_rst_2,
    input  wire [63:0] qsfp_1_rxd_2,
    input  wire [7:0]  qsfp_1_rxc_2,
    input  wire        qsfp_1_tx_clk_3,
    input  wire        qsfp_1_tx_rst_3,
    output wire [63:0] qsfp_1_txd_3,
    output wire [7:0]  qsfp_1_txc_3,
    input  wire        qsfp_1_rx_clk_3,
    input  wire        qsfp_1_rx_rst_3,
    input  wire [63:0] qsfp_1_rxd_3,
    input  wire [7:0]  qsfp_1_rxc_3,
    input  wire        qsfp_1_tx_clk_4,
    input  wire        qsfp_1_tx_rst_4,
    output wire [63:0] qsfp_1_txd_4,
    output wire [7:0]  qsfp_1_txc_4,
    input  wire        qsfp_1_rx_clk_4,
    input  wire        qsfp_1_rx_rst_4,
    input  wire [63:0] qsfp_1_rxd_4,
    input  wire [7:0]  qsfp_1_rxc_4,
    input  wire        qsfp_2_tx_clk_1,
    input  wire        qsfp_2_tx_rst_1,
    output wire [63:0] qsfp_2_txd_1,
    output wire [7:0]  qsfp_2_txc_1,
    input  wire        qsfp_2_rx_clk_1,
    input  wire        qsfp_2_rx_rst_1,
    input  wire [63:0] qsfp_2_rxd_1,
    input  wire [7:0]  qsfp_2_rxc_1,
    input  wire        qsfp_2_tx_clk_2,
    input  wire        qsfp_2_tx_rst_2,
    output wire [63:0] qsfp_2_txd_2,
    output wire [7:0]  qsfp_2_txc_2,
    input  wire        qsfp_2_rx_clk_2,
    input  wire        qsfp_2_rx_rst_2,
    input  wire [63:0] qsfp_2_rxd_2,
    input  wire [7:0]  qsfp_2_rxc_2,
    input  wire        qsfp_2_tx_clk_3,
    input  wire        qsfp_2_tx_rst_3,
    output wire [63:0] qsfp_2_txd_3,
    output wire [7:0]  qsfp_2_txc_3,
    input  wire        qsfp_2_rx_clk_3,
    input  wire        qsfp_2_rx_rst_3,
    input  wire [63:0] qsfp_2_rxd_3,
    input  wire [7:0]  qsfp_2_rxc_3,
    input  wire        qsfp_2_tx_clk_4,
    input  wire        qsfp_2_tx_rst_4,
    output wire [63:0] qsfp_2_txd_4,
    output wire [7:0]  qsfp_2_txc_4,
    input  wire        qsfp_2_rx_clk_4,
    input  wire        qsfp_2_rx_rst_4,
    input  wire [63:0] qsfp_2_rxd_4,
    input  wire [7:0]  qsfp_2_rxc_4,
    input  wire        qsfp_3_tx_clk_1,
    input  wire        qsfp_3_tx_rst_1,
    output wire [63:0] qsfp_3_txd_1,
    output wire [7:0]  qsfp_3_txc_1,
    input  wire        qsfp_3_rx_clk_1,
    input  wire        qsfp_3_rx_rst_1,
    input  wire [63:0] qsfp_3_rxd_1,
    input  wire [7:0]  qsfp_3_rxc_1,
    input  wire        qsfp_3_tx_clk_2,
    input  wire        qsfp_3_tx_rst_2,
    output wire [63:0] qsfp_3_txd_2,
    output wire [7:0]  qsfp_3_txc_2,
    input  wire        qsfp_3_rx_clk_2,
    input  wire        qsfp_3_rx_rst_2,
    input  wire [63:0] qsfp_3_rxd_2,
    input  wire [7:0]  qsfp_3_rxc_2,
    input  wire        qsfp_3_tx_clk_3,
    input  wire        qsfp_3_tx_rst_3,
    output wire [63:0] qsfp_3_txd_3,
    output wire [7:0]  qsfp_3_txc_3,
    input  wire        qsfp_3_rx_clk_3,
    input  wire        qsfp_3_rx_rst_3,
    input  wire [63:0] qsfp_3_rxd_3,
    input  wire [7:0]  qsfp_3_rxc_3,
    input  wire        qsfp_3_tx_clk_4,
    input  wire        qsfp_3_tx_rst_4,
    output wire [63:0] qsfp_3_txd_4,
    output wire [7:0]  qsfp_3_txc_4,
    input  wire        qsfp_3_rx_clk_4,
    input  wire        qsfp_3_rx_rst_4,
    input  wire [63:0] qsfp_3_rxd_4,
    input  wire [7:0]  qsfp_3_rxc_4,
    input  wire        qsfp_4_tx_clk_1,
    input  wire        qsfp_4_tx_rst_1,
    output wire [63:0] qsfp_4_txd_1,
    output wire [7:0]  qsfp_4_txc_1,
    input  wire        qsfp_4_rx_clk_1,
    input  wire        qsfp_4_rx_rst_1,
    input  wire [63:0] qsfp_4_rxd_1,
    input  wire [7:0]  qsfp_4_rxc_1,
    input  wire        qsfp_4_tx_clk_2,
    input  wire        qsfp_4_tx_rst_2,
    output wire [63:0] qsfp_4_txd_2,
    output wire [7:0]  qsfp_4_txc_2,
    input  wire        qsfp_4_rx_clk_2,
    input  wire        qsfp_4_rx_rst_2,
    input  wire [63:0] qsfp_4_rxd_2,
    input  wire [7:0]  qsfp_4_rxc_2,
    input  wire        qsfp_4_tx_clk_3,
    input  wire        qsfp_4_tx_rst_3,
    output wire [63:0] qsfp_4_txd_3,
    output wire [7:0]  qsfp_4_txc_3,
    input  wire        qsfp_4_rx_clk_3,
    input  wire        qsfp_4_rx_rst_3,
    input  wire [63:0] qsfp_4_rxd_3,
    input  wire [7:0]  qsfp_4_rxc_3,
    input  wire        qsfp_4_tx_clk_4,
    input  wire        qsfp_4_tx_rst_4,
    output wire [63:0] qsfp_4_txd_4,
    output wire [7:0]  qsfp_4_txc_4,
    input  wire        qsfp_4_rx_clk_4,
    input  wire        qsfp_4_rx_rst_4,
    input  wire [63:0] qsfp_4_rxd_4,
    input  wire [7:0]  qsfp_4_rxc_4,
    input  wire        qsfp_5_tx_clk_1,
    input  wire        qsfp_5_tx_rst_1,
    output wire [63:0] qsfp_5_txd_1,
    output wire [7:0]  qsfp_5_txc_1,
    input  wire        qsfp_5_rx_clk_1,
    input  wire        qsfp_5_rx_rst_1,
    input  wire [63:0] qsfp_5_rxd_1,
    input  wire [7:0]  qsfp_5_rxc_1,
    input  wire        qsfp_5_tx_clk_2,
    input  wire        qsfp_5_tx_rst_2,
    output wire [63:0] qsfp_5_txd_2,
    output wire [7:0]  qsfp_5_txc_2,
    input  wire        qsfp_5_rx_clk_2,
    input  wire        qsfp_5_rx_rst_2,
    input  wire [63:0] qsfp_5_rxd_2,
    input  wire [7:0]  qsfp_5_rxc_2,
    input  wire        qsfp_5_tx_clk_3,
    input  wire        qsfp_5_tx_rst_3,
    output wire [63:0] qsfp_5_txd_3,
    output wire [7:0]  qsfp_5_txc_3,
    input  wire        qsfp_5_rx_clk_3,
    input  wire        qsfp_5_rx_rst_3,
    input  wire [63:0] qsfp_5_rxd_3,
    input  wire [7:0]  qsfp_5_rxc_3,
    input  wire        qsfp_5_tx_clk_4,
    input  wire        qsfp_5_tx_rst_4,
    output wire [63:0] qsfp_5_txd_4,
    output wire [7:0]  qsfp_5_txc_4,
    input  wire        qsfp_5_rx_clk_4,
    input  wire        qsfp_5_rx_rst_4,
    input  wire [63:0] qsfp_5_rxd_4,
    input  wire [7:0]  qsfp_5_rxc_4,
    input  wire        qsfp_6_tx_clk_1,
    input  wire        qsfp_6_tx_rst_1,
    output wire [63:0] qsfp_6_txd_1,
    output wire [7:0]  qsfp_6_txc_1,
    input  wire        qsfp_6_rx_clk_1,
    input  wire        qsfp_6_rx_rst_1,
    input  wire [63:0] qsfp_6_rxd_1,
    input  wire [7:0]  qsfp_6_rxc_1,
    input  wire        qsfp_6_tx_clk_2,
    input  wire        qsfp_6_tx_rst_2,
    output wire [63:0] qsfp_6_txd_2,
    output wire [7:0]  qsfp_6_txc_2,
    input  wire        qsfp_6_rx_clk_2,
    input  wire        qsfp_6_rx_rst_2,
    input  wire [63:0] qsfp_6_rxd_2,
    input  wire [7:0]  qsfp_6_rxc_2,
    input  wire        qsfp_6_tx_clk_3,
    input  wire        qsfp_6_tx_rst_3,
    output wire [63:0] qsfp_6_txd_3,
    output wire [7:0]  qsfp_6_txc_3,
    input  wire        qsfp_6_rx_clk_3,
    input  wire        qsfp_6_rx_rst_3,
    input  wire [63:0] qsfp_6_rxd_3,
    input  wire [7:0]  qsfp_6_rxc_3,
    input  wire        qsfp_6_tx_clk_4,
    input  wire        qsfp_6_tx_rst_4,
    output wire [63:0] qsfp_6_txd_4,
    output wire [7:0]  qsfp_6_txc_4,
    input  wire        qsfp_6_rx_clk_4,
    input  wire        qsfp_6_rx_rst_4,
    input  wire [63:0] qsfp_6_rxd_4,
    input  wire [7:0]  qsfp_6_rxc_4,
    input  wire        qsfp_7_tx_clk_1,
    input  wire        qsfp_7_tx_rst_1,
    output wire [63:0] qsfp_7_txd_1,
    output wire [7:0]  qsfp_7_txc_1,
    input  wire        qsfp_7_rx_clk_1,
    input  wire        qsfp_7_rx_rst_1,
    input  wire [63:0] qsfp_7_rxd_1,
    input  wire [7:0]  qsfp_7_rxc_1,
    input  wire        qsfp_7_tx_clk_2,
    input  wire        qsfp_7_tx_rst_2,
    output wire [63:0] qsfp_7_txd_2,
    output wire [7:0]  qsfp_7_txc_2,
    input  wire        qsfp_7_rx_clk_2,
    input  wire        qsfp_7_rx_rst_2,
    input  wire [63:0] qsfp_7_rxd_2,
    input  wire [7:0]  qsfp_7_rxc_2,
    input  wire        qsfp_7_tx_clk_3,
    input  wire        qsfp_7_tx_rst_3,
    output wire [63:0] qsfp_7_txd_3,
    output wire [7:0]  qsfp_7_txc_3,
    input  wire        qsfp_7_rx_clk_3,
    input  wire        qsfp_7_rx_rst_3,
    input  wire [63:0] qsfp_7_rxd_3,
    input  wire [7:0]  qsfp_7_rxc_3,
    input  wire        qsfp_7_tx_clk_4,
    input  wire        qsfp_7_tx_rst_4,
    output wire [63:0] qsfp_7_txd_4,
    output wire [7:0]  qsfp_7_txc_4,
    input  wire        qsfp_7_rx_clk_4,
    input  wire        qsfp_7_rx_rst_4,
    input  wire [63:0] qsfp_7_rxd_4,
    input  wire [7:0]  qsfp_7_rxc_4,
    input  wire        qsfp_8_tx_clk_1,
    input  wire        qsfp_8_tx_rst_1,
    output wire [63:0] qsfp_8_txd_1,
    output wire [7:0]  qsfp_8_txc_1,
    input  wire        qsfp_8_rx_clk_1,
    input  wire        qsfp_8_rx_rst_1,
    input  wire [63:0] qsfp_8_rxd_1,
    input  wire [7:0]  qsfp_8_rxc_1,
    input  wire        qsfp_8_tx_clk_2,
    input  wire        qsfp_8_tx_rst_2,
    output wire [63:0] qsfp_8_txd_2,
    output wire [7:0]  qsfp_8_txc_2,
    input  wire        qsfp_8_rx_clk_2,
    input  wire        qsfp_8_rx_rst_2,
    input  wire [63:0] qsfp_8_rxd_2,
    input  wire [7:0]  qsfp_8_rxc_2,
    input  wire        qsfp_8_tx_clk_3,
    input  wire        qsfp_8_tx_rst_3,
    output wire [63:0] qsfp_8_txd_3,
    output wire [7:0]  qsfp_8_txc_3,
    input  wire        qsfp_8_rx_clk_3,
    input  wire        qsfp_8_rx_rst_3,
    input  wire [63:0] qsfp_8_rxd_3,
    input  wire [7:0]  qsfp_8_rxc_3,
    input  wire        qsfp_8_tx_clk_4,
    input  wire        qsfp_8_tx_rst_4,
    output wire [63:0] qsfp_8_txd_4,
    output wire [7:0]  qsfp_8_txc_4,
    input  wire        qsfp_8_rx_clk_4,
    input  wire        qsfp_8_rx_rst_4,
    input  wire [63:0] qsfp_8_rxd_4,
    input  wire [7:0]  qsfp_8_rxc_4,
    input  wire        qsfp_9_tx_clk_1,
    input  wire        qsfp_9_tx_rst_1,
    output wire [63:0] qsfp_9_txd_1,
    output wire [7:0]  qsfp_9_txc_1,
    input  wire        qsfp_9_rx_clk_1,
    input  wire        qsfp_9_rx_rst_1,
    input  wire [63:0] qsfp_9_rxd_1,
    input  wire [7:0]  qsfp_9_rxc_1,
    input  wire        qsfp_9_tx_clk_2,
    input  wire        qsfp_9_tx_rst_2,
    output wire [63:0] qsfp_9_txd_2,
    output wire [7:0]  qsfp_9_txc_2,
    input  wire        qsfp_9_rx_clk_2,
    input  wire        qsfp_9_rx_rst_2,
    input  wire [63:0] qsfp_9_rxd_2,
    input  wire [7:0]  qsfp_9_rxc_2,
    input  wire        qsfp_9_tx_clk_3,
    input  wire        qsfp_9_tx_rst_3,
    output wire [63:0] qsfp_9_txd_3,
    output wire [7:0]  qsfp_9_txc_3,
    input  wire        qsfp_9_rx_clk_3,
    input  wire        qsfp_9_rx_rst_3,
    input  wire [63:0] qsfp_9_rxd_3,
    input  wire [7:0]  qsfp_9_rxc_3,
    input  wire        qsfp_9_tx_clk_4,
    input  wire        qsfp_9_tx_rst_4,
    output wire [63:0] qsfp_9_txd_4,
    output wire [7:0]  qsfp_9_txc_4,
    input  wire        qsfp_9_rx_clk_4,
    input  wire        qsfp_9_rx_rst_4,
    input  wire [63:0] qsfp_9_rxd_4,
    input  wire [7:0]  qsfp_9_rxc_4
);

// AXI between MAC and Ethernet modules
wire [63:0] rx_axis_tdata;
wire [7:0] rx_axis_tkeep;
wire rx_axis_tvalid;
wire rx_axis_tready;
wire rx_axis_tlast;
wire rx_axis_tuser;

wire [63:0] tx_axis_tdata;
wire [7:0] tx_axis_tkeep;
wire tx_axis_tvalid;
wire tx_axis_tready;
wire tx_axis_tlast;
wire tx_axis_tuser;

// Ethernet frame between Ethernet modules and UDP stack
wire rx_eth_hdr_ready;
wire rx_eth_hdr_valid;
wire [47:0] rx_eth_dest_mac;
wire [47:0] rx_eth_src_mac;
wire [15:0] rx_eth_type;
wire [63:0] rx_eth_payload_axis_tdata;
wire [7:0] rx_eth_payload_axis_tkeep;
wire rx_eth_payload_axis_tvalid;
wire rx_eth_payload_axis_tready;
wire rx_eth_payload_axis_tlast;
wire rx_eth_payload_axis_tuser;

wire tx_eth_hdr_ready;
wire tx_eth_hdr_valid;
wire [47:0] tx_eth_dest_mac;
wire [47:0] tx_eth_src_mac;
wire [15:0] tx_eth_type;
wire [63:0] tx_eth_payload_axis_tdata;
wire [7:0] tx_eth_payload_axis_tkeep;
wire tx_eth_payload_axis_tvalid;
wire tx_eth_payload_axis_tready;
wire tx_eth_payload_axis_tlast;
wire tx_eth_payload_axis_tuser;

// IP frame connections
wire rx_ip_hdr_valid;
wire rx_ip_hdr_ready;
wire [47:0] rx_ip_eth_dest_mac;
wire [47:0] rx_ip_eth_src_mac;
wire [15:0] rx_ip_eth_type;
wire [3:0] rx_ip_version;
wire [3:0] rx_ip_ihl;
wire [5:0] rx_ip_dscp;
wire [1:0] rx_ip_ecn;
wire [15:0] rx_ip_length;
wire [15:0] rx_ip_identification;
wire [2:0] rx_ip_flags;
wire [12:0] rx_ip_fragment_offset;
wire [7:0] rx_ip_ttl;
wire [7:0] rx_ip_protocol;
wire [15:0] rx_ip_header_checksum;
wire [31:0] rx_ip_source_ip;
wire [31:0] rx_ip_dest_ip;
wire [63:0] rx_ip_payload_axis_tdata;
wire [7:0] rx_ip_payload_axis_tkeep;
wire rx_ip_payload_axis_tvalid;
wire rx_ip_payload_axis_tready;
wire rx_ip_payload_axis_tlast;
wire rx_ip_payload_axis_tuser;

wire tx_ip_hdr_valid;
wire tx_ip_hdr_ready;
wire [5:0] tx_ip_dscp;
wire [1:0] tx_ip_ecn;
wire [15:0] tx_ip_length;
wire [7:0] tx_ip_ttl;
wire [7:0] tx_ip_protocol;
wire [31:0] tx_ip_source_ip;
wire [31:0] tx_ip_dest_ip;
wire [63:0] tx_ip_payload_axis_tdata;
wire [7:0] tx_ip_payload_axis_tkeep;
wire tx_ip_payload_axis_tvalid;
wire tx_ip_payload_axis_tready;
wire tx_ip_payload_axis_tlast;
wire tx_ip_payload_axis_tuser;

// UDP frame connections
wire rx_udp_hdr_valid;
wire rx_udp_hdr_ready;
wire [47:0] rx_udp_eth_dest_mac;
wire [47:0] rx_udp_eth_src_mac;
wire [15:0] rx_udp_eth_type;
wire [3:0] rx_udp_ip_version;
wire [3:0] rx_udp_ip_ihl;
wire [5:0] rx_udp_ip_dscp;
wire [1:0] rx_udp_ip_ecn;
wire [15:0] rx_udp_ip_length;
wire [15:0] rx_udp_ip_identification;
wire [2:0] rx_udp_ip_flags;
wire [12:0] rx_udp_ip_fragment_offset;
wire [7:0] rx_udp_ip_ttl;
wire [7:0] rx_udp_ip_protocol;
wire [15:0] rx_udp_ip_header_checksum;
wire [31:0] rx_udp_ip_source_ip;
wire [31:0] rx_udp_ip_dest_ip;
wire [15:0] rx_udp_source_port;
wire [15:0] rx_udp_dest_port;
wire [15:0] rx_udp_length;
wire [15:0] rx_udp_checksum;
wire [63:0] rx_udp_payload_axis_tdata;
wire [7:0] rx_udp_payload_axis_tkeep;
wire rx_udp_payload_axis_tvalid;
wire rx_udp_payload_axis_tready;
wire rx_udp_payload_axis_tlast;
wire rx_udp_payload_axis_tuser;

wire tx_udp_hdr_valid;
wire tx_udp_hdr_ready;
wire [5:0] tx_udp_ip_dscp;
wire [1:0] tx_udp_ip_ecn;
wire [7:0] tx_udp_ip_ttl;
wire [31:0] tx_udp_ip_source_ip;
wire [31:0] tx_udp_ip_dest_ip;
wire [15:0] tx_udp_source_port;
wire [15:0] tx_udp_dest_port;
wire [15:0] tx_udp_length;
wire [15:0] tx_udp_checksum;
wire [63:0] tx_udp_payload_axis_tdata;
wire [7:0] tx_udp_payload_axis_tkeep;
wire tx_udp_payload_axis_tvalid;
wire tx_udp_payload_axis_tready;
wire tx_udp_payload_axis_tlast;
wire tx_udp_payload_axis_tuser;

wire [63:0] rx_fifo_udp_payload_axis_tdata;
wire [7:0] rx_fifo_udp_payload_axis_tkeep;
wire rx_fifo_udp_payload_axis_tvalid;
wire rx_fifo_udp_payload_axis_tready;
wire rx_fifo_udp_payload_axis_tlast;
wire rx_fifo_udp_payload_axis_tuser;

wire [63:0] tx_fifo_udp_payload_axis_tdata;
wire [7:0] tx_fifo_udp_payload_axis_tkeep;
wire tx_fifo_udp_payload_axis_tvalid;
wire tx_fifo_udp_payload_axis_tready;
wire tx_fifo_udp_payload_axis_tlast;
wire tx_fifo_udp_payload_axis_tuser;

// Configuration
wire [47:0] local_mac   = 48'h02_00_00_00_00_00;
wire [31:0] local_ip    = {8'd192, 8'd168, 8'd1,   8'd128};
wire [31:0] gateway_ip  = {8'd192, 8'd168, 8'd1,   8'd1};
wire [31:0] subnet_mask = {8'd255, 8'd255, 8'd255, 8'd0};

// IP ports not used
assign rx_ip_hdr_ready = 1;
assign rx_ip_payload_axis_tready = 1;

assign tx_ip_hdr_valid = 0;
assign tx_ip_dscp = 0;
assign tx_ip_ecn = 0;
assign tx_ip_length = 0;
assign tx_ip_ttl = 0;
assign tx_ip_protocol = 0;
assign tx_ip_source_ip = 0;
assign tx_ip_dest_ip = 0;
assign tx_ip_payload_axis_tdata = 0;
assign tx_ip_payload_axis_tkeep = 0;
assign tx_ip_payload_axis_tvalid = 0;
assign tx_ip_payload_axis_tlast = 0;
assign tx_ip_payload_axis_tuser = 0;

// Loop back UDP
wire match_cond = rx_udp_dest_port == 1234;
wire no_match = !match_cond;

reg match_cond_reg = 0;
reg no_match_reg = 0;

always @(posedge clk) begin
    if (rst) begin
        match_cond_reg <= 0;
        no_match_reg <= 0;
    end else begin
        if (rx_udp_payload_axis_tvalid) begin
            if ((!match_cond_reg && !no_match_reg) ||
                (rx_udp_payload_axis_tvalid && rx_udp_payload_axis_tready && rx_udp_payload_axis_tlast)) begin
                match_cond_reg <= match_cond;
                no_match_reg <= no_match;
            end
        end else begin
            match_cond_reg <= 0;
            no_match_reg <= 0;
        end
    end
end

assign tx_udp_hdr_valid = rx_udp_hdr_valid && match_cond;
assign rx_udp_hdr_ready = (tx_eth_hdr_ready && match_cond) || no_match;
assign tx_udp_ip_dscp = 0;
assign tx_udp_ip_ecn = 0;
assign tx_udp_ip_ttl = 64;
assign tx_udp_ip_source_ip = local_ip;
assign tx_udp_ip_dest_ip = rx_udp_ip_source_ip;
assign tx_udp_source_port = rx_udp_dest_port;
assign tx_udp_dest_port = rx_udp_source_port;
assign tx_udp_length = rx_udp_length;
assign tx_udp_checksum = 0;

assign tx_udp_payload_axis_tdata = tx_fifo_udp_payload_axis_tdata;
assign tx_udp_payload_axis_tkeep = tx_fifo_udp_payload_axis_tkeep;
assign tx_udp_payload_axis_tvalid = tx_fifo_udp_payload_axis_tvalid;
assign tx_fifo_udp_payload_axis_tready = tx_udp_payload_axis_tready;
assign tx_udp_payload_axis_tlast = tx_fifo_udp_payload_axis_tlast;
assign tx_udp_payload_axis_tuser = tx_fifo_udp_payload_axis_tuser;

assign rx_fifo_udp_payload_axis_tdata = rx_udp_payload_axis_tdata;
assign rx_fifo_udp_payload_axis_tkeep = rx_udp_payload_axis_tkeep;
assign rx_fifo_udp_payload_axis_tvalid = rx_udp_payload_axis_tvalid && match_cond_reg;
assign rx_udp_payload_axis_tready = (rx_fifo_udp_payload_axis_tready && match_cond_reg) || no_match_reg;
assign rx_fifo_udp_payload_axis_tlast = rx_udp_payload_axis_tlast;
assign rx_fifo_udp_payload_axis_tuser = rx_udp_payload_axis_tuser;

// Place first payload byte onto LEDs
reg valid_last = 0;
reg [7:0] led_reg = 0;

always @(posedge clk) begin
    if (rst) begin
        led_reg <= 0;
    end else begin
        valid_last <= tx_udp_payload_axis_tvalid;
        if (tx_udp_payload_axis_tvalid && !valid_last) begin
            led_reg <= tx_udp_payload_axis_tdata;
        end
    end
end

assign led = led_reg;

assign uart_rxd = 1'b1;
assign uart_cts = 1'b1;
assign uart_rst_n = 1'b1;
assign uart_suspend_n = 1'b1;

assign qsfp_1_txd_2 = 64'h0707070707070707;
assign qsfp_1_txc_2 = 8'hff;
assign qsfp_1_txd_3 = 64'h0707070707070707;
assign qsfp_1_txc_3 = 8'hff;
assign qsfp_1_txd_4 = 64'h0707070707070707;
assign qsfp_1_txc_4 = 8'hff;

assign qsfp_2_txd_1 = 64'h0707070707070707;
assign qsfp_2_txc_1 = 8'hff;
assign qsfp_2_txd_2 = 64'h0707070707070707;
assign qsfp_2_txc_2 = 8'hff;
assign qsfp_2_txd_3 = 64'h0707070707070707;
assign qsfp_2_txc_3 = 8'hff;
assign qsfp_2_txd_4 = 64'h0707070707070707;
assign qsfp_2_txc_4 = 8'hff;

assign qsfp_3_txd_1 = 64'h0707070707070707;
assign qsfp_3_txc_1 = 8'hff;
assign qsfp_3_txd_2 = 64'h0707070707070707;
assign qsfp_3_txc_2 = 8'hff;
assign qsfp_3_txd_3 = 64'h0707070707070707;
assign qsfp_3_txc_3 = 8'hff;
assign qsfp_3_txd_4 = 64'h0707070707070707;
assign qsfp_3_txc_4 = 8'hff;

assign qsfp_4_txd_1 = 64'h0707070707070707;
assign qsfp_4_txc_1 = 8'hff;
assign qsfp_4_txd_2 = 64'h0707070707070707;
assign qsfp_4_txc_2 = 8'hff;
assign qsfp_4_txd_3 = 64'h0707070707070707;
assign qsfp_4_txc_3 = 8'hff;
assign qsfp_4_txd_4 = 64'h0707070707070707;
assign qsfp_4_txc_4 = 8'hff;

assign qsfp_5_txd_1 = 64'h0707070707070707;
assign qsfp_5_txc_1 = 8'hff;
assign qsfp_5_txd_2 = 64'h0707070707070707;
assign qsfp_5_txc_2 = 8'hff;
assign qsfp_5_txd_3 = 64'h0707070707070707;
assign qsfp_5_txc_3 = 8'hff;
assign qsfp_5_txd_4 = 64'h0707070707070707;
assign qsfp_5_txc_4 = 8'hff;

assign qsfp_6_txd_1 = 64'h0707070707070707;
assign qsfp_6_txc_1 = 8'hff;
assign qsfp_6_txd_2 = 64'h0707070707070707;
assign qsfp_6_txc_2 = 8'hff;
assign qsfp_6_txd_3 = 64'h0707070707070707;
assign qsfp_6_txc_3 = 8'hff;
assign qsfp_6_txd_4 = 64'h0707070707070707;
assign qsfp_6_txc_4 = 8'hff;

assign qsfp_7_txd_1 = 64'h0707070707070707;
assign qsfp_7_txc_1 = 8'hff;
assign qsfp_7_txd_2 = 64'h0707070707070707;
assign qsfp_7_txc_2 = 8'hff;
assign qsfp_7_txd_3 = 64'h0707070707070707;
assign qsfp_7_txc_3 = 8'hff;
assign qsfp_7_txd_4 = 64'h0707070707070707;
assign qsfp_7_txc_4 = 8'hff;

assign qsfp_8_txd_1 = 64'h0707070707070707;
assign qsfp_8_txc_1 = 8'hff;
assign qsfp_8_txd_2 = 64'h0707070707070707;
assign qsfp_8_txc_2 = 8'hff;
assign qsfp_8_txd_3 = 64'h0707070707070707;
assign qsfp_8_txc_3 = 8'hff;
assign qsfp_8_txd_4 = 64'h0707070707070707;
assign qsfp_8_txc_4 = 8'hff;

assign qsfp_9_txd_1 = 64'h0707070707070707;
assign qsfp_9_txc_1 = 8'hff;
assign qsfp_9_txd_2 = 64'h0707070707070707;
assign qsfp_9_txc_2 = 8'hff;
assign qsfp_9_txd_3 = 64'h0707070707070707;
assign qsfp_9_txc_3 = 8'hff;
assign qsfp_9_txd_4 = 64'h0707070707070707;
assign qsfp_9_txc_4 = 8'hff;

eth_mac_10g_fifo #(
    .ENABLE_PADDING(1),
    .ENABLE_DIC(1),
    .MIN_FRAME_LENGTH(64),
    .TX_FIFO_DEPTH(4096),
    .TX_FRAME_FIFO(1),
    .RX_FIFO_DEPTH(4096),
    .RX_FRAME_FIFO(1)
)
eth_mac_10g_fifo_inst (
    .rx_clk(qsfp_1_rx_clk_1),
    .rx_rst(qsfp_1_rx_rst_1),
    .tx_clk(qsfp_1_tx_clk_1),
    .tx_rst(qsfp_1_tx_rst_1),
    .logic_clk(clk),
    .logic_rst(rst),

    .tx_axis_tdata(tx_axis_tdata),
    .tx_axis_tkeep(tx_axis_tkeep),
    .tx_axis_tvalid(tx_axis_tvalid),
    .tx_axis_tready(tx_axis_tready),
    .tx_axis_tlast(tx_axis_tlast),
    .tx_axis_tuser(tx_axis_tuser),

    .rx_axis_tdata(rx_axis_tdata),
    .rx_axis_tkeep(rx_axis_tkeep),
    .rx_axis_tvalid(rx_axis_tvalid),
    .rx_axis_tready(rx_axis_tready),
    .rx_axis_tlast(rx_axis_tlast),
    .rx_axis_tuser(rx_axis_tuser),

    .xgmii_rxd(qsfp_1_rxd_1),
    .xgmii_rxc(qsfp_1_rxc_1),
    .xgmii_txd(qsfp_1_txd_1),
    .xgmii_txc(qsfp_1_txc_1),

    .tx_fifo_overflow(),
    .tx_fifo_bad_frame(),
    .tx_fifo_good_frame(),
    .rx_error_bad_frame(),
    .rx_error_bad_fcs(),
    .rx_fifo_overflow(),
    .rx_fifo_bad_frame(),
    .rx_fifo_good_frame(),

    .cfg_ifg(8'd12),
    .cfg_tx_enable(1'b1),
    .cfg_rx_enable(1'b1)
);

eth_axis_rx #(
    .DATA_WIDTH(64)
)
eth_axis_rx_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(rx_axis_tdata),
    .s_axis_tkeep(rx_axis_tkeep),
    .s_axis_tvalid(rx_axis_tvalid),
    .s_axis_tready(rx_axis_tready),
    .s_axis_tlast(rx_axis_tlast),
    .s_axis_tuser(rx_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(rx_eth_hdr_valid),
    .m_eth_hdr_ready(rx_eth_hdr_ready),
    .m_eth_dest_mac(rx_eth_dest_mac),
    .m_eth_src_mac(rx_eth_src_mac),
    .m_eth_type(rx_eth_type),
    .m_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tkeep(rx_eth_payload_axis_tkeep),
    .m_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Status signals
    .busy(),
    .error_header_early_termination()
);

eth_axis_tx #(
    .DATA_WIDTH(64)
)
eth_axis_tx_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(tx_eth_hdr_valid),
    .s_eth_hdr_ready(tx_eth_hdr_ready),
    .s_eth_dest_mac(tx_eth_dest_mac),
    .s_eth_src_mac(tx_eth_src_mac),
    .s_eth_type(tx_eth_type),
    .s_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tkeep(tx_eth_payload_axis_tkeep),
    .s_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // AXI output
    .m_axis_tdata(tx_axis_tdata),
    .m_axis_tkeep(tx_axis_tkeep),
    .m_axis_tvalid(tx_axis_tvalid),
    .m_axis_tready(tx_axis_tready),
    .m_axis_tlast(tx_axis_tlast),
    .m_axis_tuser(tx_axis_tuser),
    // Status signals
    .busy()
);

udp_complete_64
udp_complete_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(rx_eth_hdr_valid),
    .s_eth_hdr_ready(rx_eth_hdr_ready),
    .s_eth_dest_mac(rx_eth_dest_mac),
    .s_eth_src_mac(rx_eth_src_mac),
    .s_eth_type(rx_eth_type),
    .s_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tkeep(rx_eth_payload_axis_tkeep),
    .s_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(tx_eth_hdr_valid),
    .m_eth_hdr_ready(tx_eth_hdr_ready),
    .m_eth_dest_mac(tx_eth_dest_mac),
    .m_eth_src_mac(tx_eth_src_mac),
    .m_eth_type(tx_eth_type),
    .m_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tkeep(tx_eth_payload_axis_tkeep),
    .m_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // IP frame input
    .s_ip_hdr_valid(tx_ip_hdr_valid),
    .s_ip_hdr_ready(tx_ip_hdr_ready),
    .s_ip_dscp(tx_ip_dscp),
    .s_ip_ecn(tx_ip_ecn),
    .s_ip_length(tx_ip_length),
    .s_ip_ttl(tx_ip_ttl),
    .s_ip_protocol(tx_ip_protocol),
    .s_ip_source_ip(tx_ip_source_ip),
    .s_ip_dest_ip(tx_ip_dest_ip),
    .s_ip_payload_axis_tdata(tx_ip_payload_axis_tdata),
    .s_ip_payload_axis_tkeep(tx_ip_payload_axis_tkeep),
    .s_ip_payload_axis_tvalid(tx_ip_payload_axis_tvalid),
    .s_ip_payload_axis_tready(tx_ip_payload_axis_tready),
    .s_ip_payload_axis_tlast(tx_ip_payload_axis_tlast),
    .s_ip_payload_axis_tuser(tx_ip_payload_axis_tuser),
    // IP frame output
    .m_ip_hdr_valid(rx_ip_hdr_valid),
    .m_ip_hdr_ready(rx_ip_hdr_ready),
    .m_ip_eth_dest_mac(rx_ip_eth_dest_mac),
    .m_ip_eth_src_mac(rx_ip_eth_src_mac),
    .m_ip_eth_type(rx_ip_eth_type),
    .m_ip_version(rx_ip_version),
    .m_ip_ihl(rx_ip_ihl),
    .m_ip_dscp(rx_ip_dscp),
    .m_ip_ecn(rx_ip_ecn),
    .m_ip_length(rx_ip_length),
    .m_ip_identification(rx_ip_identification),
    .m_ip_flags(rx_ip_flags),
    .m_ip_fragment_offset(rx_ip_fragment_offset),
    .m_ip_ttl(rx_ip_ttl),
    .m_ip_protocol(rx_ip_protocol),
    .m_ip_header_checksum(rx_ip_header_checksum),
    .m_ip_source_ip(rx_ip_source_ip),
    .m_ip_dest_ip(rx_ip_dest_ip),
    .m_ip_payload_axis_tdata(rx_ip_payload_axis_tdata),
    .m_ip_payload_axis_tkeep(rx_ip_payload_axis_tkeep),
    .m_ip_payload_axis_tvalid(rx_ip_payload_axis_tvalid),
    .m_ip_payload_axis_tready(rx_ip_payload_axis_tready),
    .m_ip_payload_axis_tlast(rx_ip_payload_axis_tlast),
    .m_ip_payload_axis_tuser(rx_ip_payload_axis_tuser),
    // UDP frame input
    .s_udp_hdr_valid(tx_udp_hdr_valid),
    .s_udp_hdr_ready(tx_udp_hdr_ready),
    .s_udp_ip_dscp(tx_udp_ip_dscp),
    .s_udp_ip_ecn(tx_udp_ip_ecn),
    .s_udp_ip_ttl(tx_udp_ip_ttl),
    .s_udp_ip_source_ip(tx_udp_ip_source_ip),
    .s_udp_ip_dest_ip(tx_udp_ip_dest_ip),
    .s_udp_source_port(tx_udp_source_port),
    .s_udp_dest_port(tx_udp_dest_port),
    .s_udp_length(tx_udp_length),
    .s_udp_checksum(tx_udp_checksum),
    .s_udp_payload_axis_tdata(tx_udp_payload_axis_tdata),
    .s_udp_payload_axis_tkeep(tx_udp_payload_axis_tkeep),
    .s_udp_payload_axis_tvalid(tx_udp_payload_axis_tvalid),
    .s_udp_payload_axis_tready(tx_udp_payload_axis_tready),
    .s_udp_payload_axis_tlast(tx_udp_payload_axis_tlast),
    .s_udp_payload_axis_tuser(tx_udp_payload_axis_tuser),
    // UDP frame output
    .m_udp_hdr_valid(rx_udp_hdr_valid),
    .m_udp_hdr_ready(rx_udp_hdr_ready),
    .m_udp_eth_dest_mac(rx_udp_eth_dest_mac),
    .m_udp_eth_src_mac(rx_udp_eth_src_mac),
    .m_udp_eth_type(rx_udp_eth_type),
    .m_udp_ip_version(rx_udp_ip_version),
    .m_udp_ip_ihl(rx_udp_ip_ihl),
    .m_udp_ip_dscp(rx_udp_ip_dscp),
    .m_udp_ip_ecn(rx_udp_ip_ecn),
    .m_udp_ip_length(rx_udp_ip_length),
    .m_udp_ip_identification(rx_udp_ip_identification),
    .m_udp_ip_flags(rx_udp_ip_flags),
    .m_udp_ip_fragment_offset(rx_udp_ip_fragment_offset),
    .m_udp_ip_ttl(rx_udp_ip_ttl),
    .m_udp_ip_protocol(rx_udp_ip_protocol),
    .m_udp_ip_header_checksum(rx_udp_ip_header_checksum),
    .m_udp_ip_source_ip(rx_udp_ip_source_ip),
    .m_udp_ip_dest_ip(rx_udp_ip_dest_ip),
    .m_udp_source_port(rx_udp_source_port),
    .m_udp_dest_port(rx_udp_dest_port),
    .m_udp_length(rx_udp_length),
    .m_udp_checksum(rx_udp_checksum),
    .m_udp_payload_axis_tdata(rx_udp_payload_axis_tdata),
    .m_udp_payload_axis_tkeep(rx_udp_payload_axis_tkeep),
    .m_udp_payload_axis_tvalid(rx_udp_payload_axis_tvalid),
    .m_udp_payload_axis_tready(rx_udp_payload_axis_tready),
    .m_udp_payload_axis_tlast(rx_udp_payload_axis_tlast),
    .m_udp_payload_axis_tuser(rx_udp_payload_axis_tuser),
    // Status signals
    .ip_rx_busy(),
    .ip_tx_busy(),
    .udp_rx_busy(),
    .udp_tx_busy(),
    .ip_rx_error_header_early_termination(),
    .ip_rx_error_payload_early_termination(),
    .ip_rx_error_invalid_header(),
    .ip_rx_error_invalid_checksum(),
    .ip_tx_error_payload_early_termination(),
    .ip_tx_error_arp_failed(),
    .udp_rx_error_header_early_termination(),
    .udp_rx_error_payload_early_termination(),
    .udp_tx_error_payload_early_termination(),
    // Configuration
    .local_mac(local_mac),
    .local_ip(local_ip),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask),
    .clear_arp_cache(1'b0)
);

axis_fifo #(
    .DEPTH(8192),
    .DATA_WIDTH(64),
    .KEEP_ENABLE(1),
    .KEEP_WIDTH(8),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(1),
    .FRAME_FIFO(0)
)
udp_payload_fifo (
    .clk(clk),
    .rst(rst),

    // AXI input
    .s_axis_tdata(rx_fifo_udp_payload_axis_tdata),
    .s_axis_tkeep(rx_fifo_udp_payload_axis_tkeep),
    .s_axis_tvalid(rx_fifo_udp_payload_axis_tvalid),
    .s_axis_tready(rx_fifo_udp_payload_axis_tready),
    .s_axis_tlast(rx_fifo_udp_payload_axis_tlast),
    .s_axis_tid(0),
    .s_axis_tdest(0),
    .s_axis_tuser(rx_fifo_udp_payload_axis_tuser),

    // AXI output
    .m_axis_tdata(tx_fifo_udp_payload_axis_tdata),
    .m_axis_tkeep(tx_fifo_udp_payload_axis_tkeep),
    .m_axis_tvalid(tx_fifo_udp_payload_axis_tvalid),
    .m_axis_tready(tx_fifo_udp_payload_axis_tready),
    .m_axis_tlast(tx_fifo_udp_payload_axis_tlast),
    .m_axis_tid(),
    .m_axis_tdest(),
    .m_axis_tuser(tx_fifo_udp_payload_axis_tuser),

    // Status
    .status_overflow(),
    .status_bad_frame(),
    .status_good_frame()
);

endmodule

`resetall
