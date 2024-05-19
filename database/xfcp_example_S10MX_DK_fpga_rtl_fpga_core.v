// This program was cloned from: https://github.com/alexforencich/xfcp
// License: MIT License

/*

Copyright (c) 2014-2021 Alex Forencich

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

`timescale 1ns / 1ps

/*
 * FPGA core logic
 */
module fpga_core
(
    /*
     * Clock: 125 MHz
     * Synchronous reset
     */
    input  wire        clk,
    input  wire        rst,

    /*
     * GPIO
     */
    output wire [3:0]  user_led,

    /*
     * Ethernet: QSFP28
     */
    input  wire        qsfp0_tx_clk_1,
    input  wire        qsfp0_tx_rst_1,
    output wire [63:0] qsfp0_txd_1,
    output wire [7:0]  qsfp0_txc_1,
    input  wire        qsfp0_rx_clk_1,
    input  wire        qsfp0_rx_rst_1,
    input  wire [63:0] qsfp0_rxd_1,
    input  wire [7:0]  qsfp0_rxc_1,
    input  wire        qsfp0_tx_clk_2,
    input  wire        qsfp0_tx_rst_2,
    output wire [63:0] qsfp0_txd_2,
    output wire [7:0]  qsfp0_txc_2,
    input  wire        qsfp0_rx_clk_2,
    input  wire        qsfp0_rx_rst_2,
    input  wire [63:0] qsfp0_rxd_2,
    input  wire [7:0]  qsfp0_rxc_2,
    input  wire        qsfp0_tx_clk_3,
    input  wire        qsfp0_tx_rst_3,
    output wire [63:0] qsfp0_txd_3,
    output wire [7:0]  qsfp0_txc_3,
    input  wire        qsfp0_rx_clk_3,
    input  wire        qsfp0_rx_rst_3,
    input  wire [63:0] qsfp0_rxd_3,
    input  wire [7:0]  qsfp0_rxc_3,
    input  wire        qsfp0_tx_clk_4,
    input  wire        qsfp0_tx_rst_4,
    output wire [63:0] qsfp0_txd_4,
    output wire [7:0]  qsfp0_txc_4,
    input  wire        qsfp0_rx_clk_4,
    input  wire        qsfp0_rx_rst_4,
    input  wire [63:0] qsfp0_rxd_4,
    input  wire [7:0]  qsfp0_rxc_4,
    input  wire        qsfp1_tx_clk_1,
    input  wire        qsfp1_tx_rst_1,
    output wire [63:0] qsfp1_txd_1,
    output wire [7:0]  qsfp1_txc_1,
    input  wire        qsfp1_rx_clk_1,
    input  wire        qsfp1_rx_rst_1,
    input  wire [63:0] qsfp1_rxd_1,
    input  wire [7:0]  qsfp1_rxc_1,
    input  wire        qsfp1_tx_clk_2,
    input  wire        qsfp1_tx_rst_2,
    output wire [63:0] qsfp1_txd_2,
    output wire [7:0]  qsfp1_txc_2,
    input  wire        qsfp1_rx_clk_2,
    input  wire        qsfp1_rx_rst_2,
    input  wire [63:0] qsfp1_rxd_2,
    input  wire [7:0]  qsfp1_rxc_2,
    input  wire        qsfp1_tx_clk_3,
    input  wire        qsfp1_tx_rst_3,
    output wire [63:0] qsfp1_txd_3,
    output wire [7:0]  qsfp1_txc_3,
    input  wire        qsfp1_rx_clk_3,
    input  wire        qsfp1_rx_rst_3,
    input  wire [63:0] qsfp1_rxd_3,
    input  wire [7:0]  qsfp1_rxc_3,
    input  wire        qsfp1_tx_clk_4,
    input  wire        qsfp1_tx_rst_4,
    output wire [63:0] qsfp1_txd_4,
    output wire [7:0]  qsfp1_txc_4,
    input  wire        qsfp1_rx_clk_4,
    input  wire        qsfp1_rx_rst_4,
    input  wire [63:0] qsfp1_rxd_4,
    input  wire [7:0]  qsfp1_rxc_4
);

// XFCP Ethernet interface
wire [7:0] xfcp_udp_interface_down_tdata;
wire xfcp_udp_interface_down_tvalid;
wire xfcp_udp_interface_down_tready;
wire xfcp_udp_interface_down_tlast;
wire xfcp_udp_interface_down_tuser;

wire [7:0] xfcp_udp_interface_up_tdata;
wire xfcp_udp_interface_up_tvalid;
wire xfcp_udp_interface_up_tready;
wire xfcp_udp_interface_up_tlast;
wire xfcp_udp_interface_up_tuser;

// AXI between MAC and Ethernet modules
wire [7:0] rx_eth_axis_tdata;
wire rx_eth_axis_tvalid;
wire rx_eth_axis_tready;
wire rx_eth_axis_tlast;
wire rx_eth_axis_tuser;

wire [7:0] tx_eth_axis_tdata;
wire tx_eth_axis_tvalid;
wire tx_eth_axis_tready;
wire tx_eth_axis_tlast;
wire tx_eth_axis_tuser;

// Configuration
wire [47:0] local_mac   = 48'h02_00_00_00_00_00;
wire [31:0] local_ip    = {8'd192, 8'd168, 8'd1,   8'd128};
wire [15:0] local_port  = 16'd14000;
wire [31:0] gateway_ip  = {8'd192, 8'd168, 8'd1,   8'd1};
wire [31:0] subnet_mask = {8'd255, 8'd255, 8'd255, 8'd0};

assign user_led = 0;

eth_mac_10g_fifo #(
    .AXIS_DATA_WIDTH(8),
    .AXIS_KEEP_ENABLE(0),
    .AXIS_KEEP_WIDTH(1),
    .ENABLE_PADDING(1),
    .ENABLE_DIC(1),
    .MIN_FRAME_LENGTH(64),
    .TX_FIFO_DEPTH(4096),
    .TX_FRAME_FIFO(1),
    .RX_FIFO_DEPTH(4096),
    .RX_FRAME_FIFO(1)
)
eth_mac_inst (
    .rx_clk(qsfp0_rx_clk_1),
    .rx_rst(qsfp0_rx_rst_1),
    .tx_clk(qsfp0_tx_clk_1),
    .tx_rst(qsfp0_tx_rst_1),
    .logic_clk(clk),
    .logic_rst(rst),

    .tx_axis_tdata(tx_eth_axis_tdata),
    .tx_axis_tkeep(1'b1),
    .tx_axis_tvalid(tx_eth_axis_tvalid),
    .tx_axis_tready(tx_eth_axis_tready),
    .tx_axis_tlast(tx_eth_axis_tlast),
    .tx_axis_tuser(tx_eth_axis_tuser),

    .rx_axis_tdata(rx_eth_axis_tdata),
    .rx_axis_tkeep(),
    .rx_axis_tvalid(rx_eth_axis_tvalid),
    .rx_axis_tready(rx_eth_axis_tready),
    .rx_axis_tlast(rx_eth_axis_tlast),
    .rx_axis_tuser(rx_eth_axis_tuser),

    .xgmii_rxd(qsfp0_rxd_1),
    .xgmii_rxc(qsfp0_rxc_1),
    .xgmii_txd(qsfp0_txd_1),
    .xgmii_txc(qsfp0_txc_1),

    .tx_fifo_overflow(),
    .tx_fifo_bad_frame(),
    .tx_fifo_good_frame(),
    .rx_error_bad_frame(),
    .rx_error_bad_fcs(),
    .rx_fifo_overflow(),
    .rx_fifo_bad_frame(),
    .rx_fifo_good_frame(),

    .ifg_delay(8'd12)
);

xfcp_interface_udp
xfcp_interface_udp_inst (
    .clk(clk),
    .rst(rst),
    .s_eth_axis_tdata(rx_eth_axis_tdata),
    .s_eth_axis_tvalid(rx_eth_axis_tvalid),
    .s_eth_axis_tready(rx_eth_axis_tready),
    .s_eth_axis_tlast(rx_eth_axis_tlast),
    .s_eth_axis_tuser(rx_eth_axis_tuser),
    .m_eth_axis_tdata(tx_eth_axis_tdata),
    .m_eth_axis_tvalid(tx_eth_axis_tvalid),
    .m_eth_axis_tready(tx_eth_axis_tready),
    .m_eth_axis_tlast(tx_eth_axis_tlast),
    .m_eth_axis_tuser(tx_eth_axis_tuser),
    .down_xfcp_in_tdata(xfcp_udp_interface_up_tdata),
    .down_xfcp_in_tvalid(xfcp_udp_interface_up_tvalid),
    .down_xfcp_in_tready(xfcp_udp_interface_up_tready),
    .down_xfcp_in_tlast(xfcp_udp_interface_up_tlast),
    .down_xfcp_in_tuser(xfcp_udp_interface_up_tuser),
    .down_xfcp_out_tdata(xfcp_udp_interface_down_tdata),
    .down_xfcp_out_tvalid(xfcp_udp_interface_down_tvalid),
    .down_xfcp_out_tready(xfcp_udp_interface_down_tready),
    .down_xfcp_out_tlast(xfcp_udp_interface_down_tlast),
    .down_xfcp_out_tuser(xfcp_udp_interface_down_tuser),
    .local_mac(local_mac),
    .local_ip(local_ip),
    .local_port(local_port),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask)
);

// XFCP 1x4 switch
wire [7:0] xfcp_switch_port_0_down_tdata;
wire xfcp_switch_port_0_down_tvalid;
wire xfcp_switch_port_0_down_tready;
wire xfcp_switch_port_0_down_tlast;
wire xfcp_switch_port_0_down_tuser;

wire [7:0] xfcp_switch_port_0_up_tdata;
wire xfcp_switch_port_0_up_tvalid;
wire xfcp_switch_port_0_up_tready;
wire xfcp_switch_port_0_up_tlast;
wire xfcp_switch_port_0_up_tuser;

wire [7:0] xfcp_switch_port_1_down_tdata;
wire xfcp_switch_port_1_down_tvalid;
wire xfcp_switch_port_1_down_tready;
wire xfcp_switch_port_1_down_tlast;
wire xfcp_switch_port_1_down_tuser;

wire [7:0] xfcp_switch_port_1_up_tdata;
wire xfcp_switch_port_1_up_tvalid;
wire xfcp_switch_port_1_up_tready;
wire xfcp_switch_port_1_up_tlast;
wire xfcp_switch_port_1_up_tuser;

wire [7:0] xfcp_switch_port_2_down_tdata;
wire xfcp_switch_port_2_down_tvalid;
wire xfcp_switch_port_2_down_tready;
wire xfcp_switch_port_2_down_tlast;
wire xfcp_switch_port_2_down_tuser;

wire [7:0] xfcp_switch_port_2_up_tdata;
wire xfcp_switch_port_2_up_tvalid;
wire xfcp_switch_port_2_up_tready;
wire xfcp_switch_port_2_up_tlast;
wire xfcp_switch_port_2_up_tuser;

wire [7:0] xfcp_switch_port_3_down_tdata;
wire xfcp_switch_port_3_down_tvalid;
wire xfcp_switch_port_3_down_tready;
wire xfcp_switch_port_3_down_tlast;
wire xfcp_switch_port_3_down_tuser;

wire [7:0] xfcp_switch_port_3_up_tdata;
wire xfcp_switch_port_3_up_tvalid;
wire xfcp_switch_port_3_up_tready;
wire xfcp_switch_port_3_up_tlast;
wire xfcp_switch_port_3_up_tuser;

xfcp_switch #(
    .PORTS(4),
    .XFCP_ID_TYPE(16'h0100),
    .XFCP_ID_STR("XFCP switch"),
    .XFCP_EXT_ID(0),
    .XFCP_EXT_ID_STR("S10MX DK")
)
xfcp_switch_inst (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(xfcp_udp_interface_down_tdata),
    .up_xfcp_in_tvalid(xfcp_udp_interface_down_tvalid),
    .up_xfcp_in_tready(xfcp_udp_interface_down_tready),
    .up_xfcp_in_tlast(xfcp_udp_interface_down_tlast),
    .up_xfcp_in_tuser(xfcp_udp_interface_down_tuser),
    .up_xfcp_out_tdata(xfcp_udp_interface_up_tdata),
    .up_xfcp_out_tvalid(xfcp_udp_interface_up_tvalid),
    .up_xfcp_out_tready(xfcp_udp_interface_up_tready),
    .up_xfcp_out_tlast(xfcp_udp_interface_up_tlast),
    .up_xfcp_out_tuser(xfcp_udp_interface_up_tuser),
    .down_xfcp_in_tdata(  {xfcp_switch_port_3_up_tdata,    xfcp_switch_port_2_up_tdata,    xfcp_switch_port_1_up_tdata,    xfcp_switch_port_0_up_tdata   }),
    .down_xfcp_in_tvalid( {xfcp_switch_port_3_up_tvalid,   xfcp_switch_port_2_up_tvalid,   xfcp_switch_port_1_up_tvalid,   xfcp_switch_port_0_up_tvalid  }),
    .down_xfcp_in_tready( {xfcp_switch_port_3_up_tready,   xfcp_switch_port_2_up_tready,   xfcp_switch_port_1_up_tready,   xfcp_switch_port_0_up_tready  }),
    .down_xfcp_in_tlast(  {xfcp_switch_port_3_up_tlast,    xfcp_switch_port_2_up_tlast,    xfcp_switch_port_1_up_tlast,    xfcp_switch_port_0_up_tlast   }),
    .down_xfcp_in_tuser(  {xfcp_switch_port_3_up_tuser,    xfcp_switch_port_2_up_tuser,    xfcp_switch_port_1_up_tuser,    xfcp_switch_port_0_up_tuser   }),
    .down_xfcp_out_tdata( {xfcp_switch_port_3_down_tdata,  xfcp_switch_port_2_down_tdata,  xfcp_switch_port_1_down_tdata,  xfcp_switch_port_0_down_tdata }),
    .down_xfcp_out_tvalid({xfcp_switch_port_3_down_tvalid, xfcp_switch_port_2_down_tvalid, xfcp_switch_port_1_down_tvalid, xfcp_switch_port_0_down_tvalid}),
    .down_xfcp_out_tready({xfcp_switch_port_3_down_tready, xfcp_switch_port_2_down_tready, xfcp_switch_port_1_down_tready, xfcp_switch_port_0_down_tready}),
    .down_xfcp_out_tlast( {xfcp_switch_port_3_down_tlast,  xfcp_switch_port_2_down_tlast,  xfcp_switch_port_1_down_tlast,  xfcp_switch_port_0_down_tlast }),
    .down_xfcp_out_tuser( {xfcp_switch_port_3_down_tuser,  xfcp_switch_port_2_down_tuser,  xfcp_switch_port_1_down_tuser,  xfcp_switch_port_0_down_tuser })
);

// XFCP WB RAM 0
wire [7:0] ram_0_wb_adr_i;
wire [31:0] ram_0_wb_dat_i;
wire [31:0] ram_0_wb_dat_o;
wire ram_0_wb_we_i;
wire [3:0] ram_0_wb_sel_i;
wire ram_0_wb_stb_i;
wire ram_0_wb_ack_o;
wire ram_0_wb_cyc_i;

xfcp_mod_wb #(
    .XFCP_ID_STR("XFCP RAM 0"),
    .COUNT_SIZE(16),
    .WB_DATA_WIDTH(32),
    .WB_ADDR_WIDTH(8),
    .WB_SELECT_WIDTH(4)
)
xfcp_mod_wb_ram_0 (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(xfcp_switch_port_0_down_tdata),
    .up_xfcp_in_tvalid(xfcp_switch_port_0_down_tvalid),
    .up_xfcp_in_tready(xfcp_switch_port_0_down_tready),
    .up_xfcp_in_tlast(xfcp_switch_port_0_down_tlast),
    .up_xfcp_in_tuser(xfcp_switch_port_0_down_tuser),
    .up_xfcp_out_tdata(xfcp_switch_port_0_up_tdata),
    .up_xfcp_out_tvalid(xfcp_switch_port_0_up_tvalid),
    .up_xfcp_out_tready(xfcp_switch_port_0_up_tready),
    .up_xfcp_out_tlast(xfcp_switch_port_0_up_tlast),
    .up_xfcp_out_tuser(xfcp_switch_port_0_up_tuser),
    .wb_adr_o(ram_0_wb_adr_i),
    .wb_dat_i(ram_0_wb_dat_o),
    .wb_dat_o(ram_0_wb_dat_i),
    .wb_we_o(ram_0_wb_we_i),
    .wb_sel_o(ram_0_wb_sel_i),
    .wb_stb_o(ram_0_wb_stb_i),
    .wb_ack_i(ram_0_wb_ack_o),
    .wb_err_i(1'b0),
    .wb_cyc_o(ram_0_wb_cyc_i)
);

wb_ram #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(8),
    .SELECT_WIDTH(4)
)
ram_0_inst (
    .clk(clk),
    .adr_i(ram_0_wb_adr_i),
    .dat_i(ram_0_wb_dat_i),
    .dat_o(ram_0_wb_dat_o),
    .we_i(ram_0_wb_we_i),
    .sel_i(ram_0_wb_sel_i),
    .stb_i(ram_0_wb_stb_i),
    .ack_o(ram_0_wb_ack_o),
    .cyc_i(ram_0_wb_cyc_i)
);

// XFCP WB RAM 1
wire [7:0] ram_1_wb_adr_i;
wire [31:0] ram_1_wb_dat_i;
wire [31:0] ram_1_wb_dat_o;
wire ram_1_wb_we_i;
wire [3:0] ram_1_wb_sel_i;
wire ram_1_wb_stb_i;
wire ram_1_wb_ack_o;
wire ram_1_wb_cyc_i;

xfcp_mod_wb #(
    .XFCP_ID_STR("XFCP RAM 1"),
    .COUNT_SIZE(16),
    .WB_DATA_WIDTH(32),
    .WB_ADDR_WIDTH(8),
    .WB_SELECT_WIDTH(4)
)
xfcp_mod_wb_ram_1 (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(xfcp_switch_port_1_down_tdata),
    .up_xfcp_in_tvalid(xfcp_switch_port_1_down_tvalid),
    .up_xfcp_in_tready(xfcp_switch_port_1_down_tready),
    .up_xfcp_in_tlast(xfcp_switch_port_1_down_tlast),
    .up_xfcp_in_tuser(xfcp_switch_port_1_down_tuser),
    .up_xfcp_out_tdata(xfcp_switch_port_1_up_tdata),
    .up_xfcp_out_tvalid(xfcp_switch_port_1_up_tvalid),
    .up_xfcp_out_tready(xfcp_switch_port_1_up_tready),
    .up_xfcp_out_tlast(xfcp_switch_port_1_up_tlast),
    .up_xfcp_out_tuser(xfcp_switch_port_1_up_tuser),
    .wb_adr_o(ram_1_wb_adr_i),
    .wb_dat_i(ram_1_wb_dat_o),
    .wb_dat_o(ram_1_wb_dat_i),
    .wb_we_o(ram_1_wb_we_i),
    .wb_sel_o(ram_1_wb_sel_i),
    .wb_stb_o(ram_1_wb_stb_i),
    .wb_ack_i(ram_1_wb_ack_o),
    .wb_err_i(1'b0),
    .wb_cyc_o(ram_1_wb_cyc_i)
);

wb_ram #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(8),
    .SELECT_WIDTH(4)
)
ram_1_inst (
    .clk(clk),
    .adr_i(ram_1_wb_adr_i),
    .dat_i(ram_1_wb_dat_i),
    .dat_o(ram_1_wb_dat_o),
    .we_i(ram_1_wb_we_i),
    .sel_i(ram_1_wb_sel_i),
    .stb_i(ram_1_wb_stb_i),
    .ack_o(ram_1_wb_ack_o),
    .cyc_i(ram_1_wb_cyc_i)
);

// XFCP WB RAM 2
wire [7:0] ram_2_wb_adr_i;
wire [31:0] ram_2_wb_dat_i;
wire [31:0] ram_2_wb_dat_o;
wire ram_2_wb_we_i;
wire [3:0] ram_2_wb_sel_i;
wire ram_2_wb_stb_i;
wire ram_2_wb_ack_o;
wire ram_2_wb_cyc_i;

xfcp_mod_wb #(
    .XFCP_ID_STR("XFCP RAM 2"),
    .COUNT_SIZE(16),
    .WB_DATA_WIDTH(32),
    .WB_ADDR_WIDTH(8),
    .WB_SELECT_WIDTH(4)
)
xfcp_mod_wb_ram_2 (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(xfcp_switch_port_2_down_tdata),
    .up_xfcp_in_tvalid(xfcp_switch_port_2_down_tvalid),
    .up_xfcp_in_tready(xfcp_switch_port_2_down_tready),
    .up_xfcp_in_tlast(xfcp_switch_port_2_down_tlast),
    .up_xfcp_in_tuser(xfcp_switch_port_2_down_tuser),
    .up_xfcp_out_tdata(xfcp_switch_port_2_up_tdata),
    .up_xfcp_out_tvalid(xfcp_switch_port_2_up_tvalid),
    .up_xfcp_out_tready(xfcp_switch_port_2_up_tready),
    .up_xfcp_out_tlast(xfcp_switch_port_2_up_tlast),
    .up_xfcp_out_tuser(xfcp_switch_port_2_up_tuser),
    .wb_adr_o(ram_2_wb_adr_i),
    .wb_dat_i(ram_2_wb_dat_o),
    .wb_dat_o(ram_2_wb_dat_i),
    .wb_we_o(ram_2_wb_we_i),
    .wb_sel_o(ram_2_wb_sel_i),
    .wb_stb_o(ram_2_wb_stb_i),
    .wb_ack_i(ram_2_wb_ack_o),
    .wb_err_i(1'b0),
    .wb_cyc_o(ram_2_wb_cyc_i)
);

wb_ram #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(8),
    .SELECT_WIDTH(4)
)
ram_2_inst (
    .clk(clk),
    .adr_i(ram_2_wb_adr_i),
    .dat_i(ram_2_wb_dat_i),
    .dat_o(ram_2_wb_dat_o),
    .we_i(ram_2_wb_we_i),
    .sel_i(ram_2_wb_sel_i),
    .stb_i(ram_2_wb_stb_i),
    .ack_o(ram_2_wb_ack_o),
    .cyc_i(ram_2_wb_cyc_i)
);

// XFCP WB RAM 3
wire [7:0] ram_3_wb_adr_i;
wire [31:0] ram_3_wb_dat_i;
wire [31:0] ram_3_wb_dat_o;
wire ram_3_wb_we_i;
wire [3:0] ram_3_wb_sel_i;
wire ram_3_wb_stb_i;
wire ram_3_wb_ack_o;
wire ram_3_wb_cyc_i;

xfcp_mod_wb #(
    .XFCP_ID_STR("XFCP RAM 3"),
    .COUNT_SIZE(16),
    .WB_DATA_WIDTH(32),
    .WB_ADDR_WIDTH(8),
    .WB_SELECT_WIDTH(4)
)
xfcp_mod_wb_ram_3 (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(xfcp_switch_port_3_down_tdata),
    .up_xfcp_in_tvalid(xfcp_switch_port_3_down_tvalid),
    .up_xfcp_in_tready(xfcp_switch_port_3_down_tready),
    .up_xfcp_in_tlast(xfcp_switch_port_3_down_tlast),
    .up_xfcp_in_tuser(xfcp_switch_port_3_down_tuser),
    .up_xfcp_out_tdata(xfcp_switch_port_3_up_tdata),
    .up_xfcp_out_tvalid(xfcp_switch_port_3_up_tvalid),
    .up_xfcp_out_tready(xfcp_switch_port_3_up_tready),
    .up_xfcp_out_tlast(xfcp_switch_port_3_up_tlast),
    .up_xfcp_out_tuser(xfcp_switch_port_3_up_tuser),
    .wb_adr_o(ram_3_wb_adr_i),
    .wb_dat_i(ram_3_wb_dat_o),
    .wb_dat_o(ram_3_wb_dat_i),
    .wb_we_o(ram_3_wb_we_i),
    .wb_sel_o(ram_3_wb_sel_i),
    .wb_stb_o(ram_3_wb_stb_i),
    .wb_ack_i(ram_3_wb_ack_o),
    .wb_err_i(1'b0),
    .wb_cyc_o(ram_3_wb_cyc_i)
);

wb_ram #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(8),
    .SELECT_WIDTH(4)
)
ram_3_inst (
    .clk(clk),
    .adr_i(ram_3_wb_adr_i),
    .dat_i(ram_3_wb_dat_i),
    .dat_o(ram_3_wb_dat_o),
    .we_i(ram_3_wb_we_i),
    .sel_i(ram_3_wb_sel_i),
    .stb_i(ram_3_wb_stb_i),
    .ack_o(ram_3_wb_ack_o),
    .cyc_i(ram_3_wb_cyc_i)
);

endmodule
