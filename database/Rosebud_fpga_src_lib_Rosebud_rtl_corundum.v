// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

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
module corundum #
(
    parameter IF_COUNT            = 2,
    parameter PORTS_PER_IF        = 1,
    parameter AXIL_DATA_WIDTH     = 32,
    parameter AXIL_STRB_WIDTH     = (AXIL_DATA_WIDTH/8),
    parameter AXIL_ADDR_WIDTH     = 24,
    parameter IF_AXIL_ADDR_WIDTH  = AXIL_ADDR_WIDTH-$clog2(IF_COUNT),
    parameter AXIL_CSR_ADDR_WIDTH = IF_AXIL_ADDR_WIDTH-5-$clog2((PORTS_PER_IF+3)/8),
    parameter AXIS_DATA_WIDTH     = 256,
    parameter AXIS_KEEP_WIDTH     = AXIS_DATA_WIDTH/8,
    parameter HOST_DMA_TAG_WIDTH  = 32,
    parameter PCIE_ADDR_WIDTH     = 64,
    parameter PCIE_DMA_TAG_WIDTH  = 16,
    parameter PCIE_DMA_LEN_WIDTH  = 16,
    parameter SEG_COUNT           = 4,
    parameter SEG_DATA_WIDTH      = 128,
    parameter SEG_ADDR_WIDTH      = 12,
    parameter SEG_BE_WIDTH        = SEG_DATA_WIDTH/8,
    parameter RAM_ADDR_WIDTH      = SEG_ADDR_WIDTH+$clog2(SEG_COUNT)
                                    +$clog2(SEG_BE_WIDTH),
    parameter RAM_PIPELINE        = 4,
    parameter IF_RAM_SEL_WIDTH    = PORTS_PER_IF > 1 ? $clog2(PORTS_PER_IF) : 1,
    parameter RAM_SEL_WIDTH       = $clog2(IF_COUNT)+IF_RAM_SEL_WIDTH+1
)
(
    input  wire                                             pcie_clk,
    input  wire                                             pcie_rst,

    // DMA descriptors (ctrl)
    output wire [PCIE_ADDR_WIDTH-1:0]                       pcie_ctrl_dma_read_desc_pcie_addr,
    output wire [RAM_SEL_WIDTH-2:0]                         pcie_ctrl_dma_read_desc_ram_sel,
    output wire [RAM_ADDR_WIDTH-1:0]                        pcie_ctrl_dma_read_desc_ram_addr,
    output wire [PCIE_DMA_LEN_WIDTH-1:0]                    pcie_ctrl_dma_read_desc_len,
    output wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_ctrl_dma_read_desc_tag,
    output wire                                             pcie_ctrl_dma_read_desc_valid,
    input  wire                                             pcie_ctrl_dma_read_desc_ready,

    input  wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_ctrl_dma_read_desc_status_tag,
    input  wire                                             pcie_ctrl_dma_read_desc_status_valid,

    output wire [PCIE_ADDR_WIDTH-1:0]                       pcie_ctrl_dma_write_desc_pcie_addr,
    output wire [RAM_SEL_WIDTH-2:0]                         pcie_ctrl_dma_write_desc_ram_sel,
    output wire [RAM_ADDR_WIDTH-1:0]                        pcie_ctrl_dma_write_desc_ram_addr,
    output wire [PCIE_DMA_LEN_WIDTH-1:0]                    pcie_ctrl_dma_write_desc_len,
    output wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_ctrl_dma_write_desc_tag,
    output wire                                             pcie_ctrl_dma_write_desc_valid,
    input  wire                                             pcie_ctrl_dma_write_desc_ready,

    input  wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_ctrl_dma_write_desc_status_tag,
    input  wire                                             pcie_ctrl_dma_write_desc_status_valid,

    // DMA descriptors (data)
    output wire [PCIE_ADDR_WIDTH-1:0]                       pcie_data_dma_read_desc_pcie_addr,
    output wire [RAM_SEL_WIDTH-2:0]                         pcie_data_dma_read_desc_ram_sel,
    output wire [RAM_ADDR_WIDTH-1:0]                        pcie_data_dma_read_desc_ram_addr,
    output wire [PCIE_DMA_LEN_WIDTH-1:0]                    pcie_data_dma_read_desc_len,
    output wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_data_dma_read_desc_tag,
    output wire                                             pcie_data_dma_read_desc_valid,
    input  wire                                             pcie_data_dma_read_desc_ready,

    input  wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_data_dma_read_desc_status_tag,
    input  wire                                             pcie_data_dma_read_desc_status_valid,

    output wire [PCIE_ADDR_WIDTH-1:0]                       pcie_data_dma_write_desc_pcie_addr,
    output wire [RAM_SEL_WIDTH-2:0]                         pcie_data_dma_write_desc_ram_sel,
    output wire [RAM_ADDR_WIDTH-1:0]                        pcie_data_dma_write_desc_ram_addr,
    output wire [PCIE_DMA_LEN_WIDTH-1:0]                    pcie_data_dma_write_desc_len,
    output wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_data_dma_write_desc_tag,
    output wire                                             pcie_data_dma_write_desc_valid,
    input  wire                                             pcie_data_dma_write_desc_ready,

    input  wire [PCIE_DMA_TAG_WIDTH-1:0]                    pcie_data_dma_write_desc_status_tag,
    input  wire                                             pcie_data_dma_write_desc_status_valid,

    // Memory ports (ctrl)
    input  wire [SEG_COUNT*(RAM_SEL_WIDTH-1)-1:0]           ctrl_dma_ram_wr_cmd_sel,
    input  wire [SEG_COUNT*SEG_BE_WIDTH-1:0]                ctrl_dma_ram_wr_cmd_be,
    input  wire [SEG_COUNT*SEG_ADDR_WIDTH-1:0]              ctrl_dma_ram_wr_cmd_addr,
    input  wire [SEG_COUNT*SEG_DATA_WIDTH-1:0]              ctrl_dma_ram_wr_cmd_data,
    input  wire [SEG_COUNT-1:0]                             ctrl_dma_ram_wr_cmd_valid,
    output wire [SEG_COUNT-1:0]                             ctrl_dma_ram_wr_cmd_ready,
    output wire [SEG_COUNT-1:0]                             ctrl_dma_ram_wr_done,

    input  wire [SEG_COUNT*(RAM_SEL_WIDTH-1)-1:0]           ctrl_dma_ram_rd_cmd_sel,
    input  wire [SEG_COUNT*SEG_ADDR_WIDTH-1:0]              ctrl_dma_ram_rd_cmd_addr,
    input  wire [SEG_COUNT-1:0]                             ctrl_dma_ram_rd_cmd_valid,
    output wire [SEG_COUNT-1:0]                             ctrl_dma_ram_rd_cmd_ready,
    output wire [SEG_COUNT*SEG_DATA_WIDTH-1:0]              ctrl_dma_ram_rd_resp_data,
    output wire [SEG_COUNT-1:0]                             ctrl_dma_ram_rd_resp_valid,
    input  wire [SEG_COUNT-1:0]                             ctrl_dma_ram_rd_resp_ready,

    // Memory ports (data)
    input  wire [SEG_COUNT*(RAM_SEL_WIDTH-1)-1:0]           data_dma_ram_wr_cmd_sel,
    input  wire [SEG_COUNT*SEG_BE_WIDTH-1:0]                data_dma_ram_wr_cmd_be,
    input  wire [SEG_COUNT*SEG_ADDR_WIDTH-1:0]              data_dma_ram_wr_cmd_addr,
    input  wire [SEG_COUNT*SEG_DATA_WIDTH-1:0]              data_dma_ram_wr_cmd_data,
    input  wire [SEG_COUNT-1:0]                             data_dma_ram_wr_cmd_valid,
    output wire [SEG_COUNT-1:0]                             data_dma_ram_wr_cmd_ready,
    output wire [SEG_COUNT-1:0]                             data_dma_ram_wr_done,

    input  wire [SEG_COUNT*(RAM_SEL_WIDTH-1)-1:0]           data_dma_ram_rd_cmd_sel,
    input  wire [SEG_COUNT*SEG_ADDR_WIDTH-1:0]              data_dma_ram_rd_cmd_addr,
    input  wire [SEG_COUNT-1:0]                             data_dma_ram_rd_cmd_valid,
    output wire [SEG_COUNT-1:0]                             data_dma_ram_rd_cmd_ready,
    output wire [SEG_COUNT*SEG_DATA_WIDTH-1:0]              data_dma_ram_rd_resp_data,
    output wire [SEG_COUNT-1:0]                             data_dma_ram_rd_resp_valid,
    input  wire [SEG_COUNT-1:0]                             data_dma_ram_rd_resp_ready,

    // Virtual MACs
    output wire [IF_COUNT*PORTS_PER_IF*AXIS_DATA_WIDTH-1:0] tx_axis_tdata,
    output wire [IF_COUNT*PORTS_PER_IF*AXIS_KEEP_WIDTH-1:0] tx_axis_tkeep,
    output wire [IF_COUNT*PORTS_PER_IF-1:0]                 tx_axis_tvalid,
    input  wire [IF_COUNT*PORTS_PER_IF-1:0]                 tx_axis_tready,
    output wire [IF_COUNT*PORTS_PER_IF-1:0]                 tx_axis_tlast,
    output wire [IF_COUNT*PORTS_PER_IF-1:0]                 tx_axis_tuser,

    input  wire [IF_COUNT*PORTS_PER_IF*AXIS_DATA_WIDTH-1:0] rx_axis_tdata,
    input  wire [IF_COUNT*PORTS_PER_IF*AXIS_KEEP_WIDTH-1:0] rx_axis_tkeep,
    input  wire [IF_COUNT*PORTS_PER_IF-1:0]                 rx_axis_tvalid,
    output wire [IF_COUNT*PORTS_PER_IF-1:0]                 rx_axis_tready,
    input  wire [IF_COUNT*PORTS_PER_IF-1:0]                 rx_axis_tlast,
    input  wire [IF_COUNT*PORTS_PER_IF-1:0]                 rx_axis_tuser,

    // AXI lite input
    input  wire [AXIL_ADDR_WIDTH-1:0]                       axil_pcie_awaddr,
    input  wire [2:0]                                       axil_pcie_awprot,
    input  wire                                             axil_pcie_awvalid,
    output wire                                             axil_pcie_awready,
    input  wire [AXIL_DATA_WIDTH-1:0]                       axil_pcie_wdata,
    input  wire [AXIL_STRB_WIDTH-1:0]                       axil_pcie_wstrb,
    input  wire                                             axil_pcie_wvalid,
    output wire                                             axil_pcie_wready,
    output wire [1:0]                                       axil_pcie_bresp,
    output wire                                             axil_pcie_bvalid,
    input  wire                                             axil_pcie_bready,
    input  wire [AXIL_ADDR_WIDTH-1:0]                       axil_pcie_araddr,
    input  wire [2:0]                                       axil_pcie_arprot,
    input  wire                                             axil_pcie_arvalid,
    output wire                                             axil_pcie_arready,
    output wire [AXIL_DATA_WIDTH-1:0]                       axil_pcie_rdata,
    output wire [1:0]                                       axil_pcie_rresp,
    output wire                                             axil_pcie_rvalid,
    input  wire                                             axil_pcie_rready,

    // AXI lite output
    output wire [AXIL_CSR_ADDR_WIDTH-1:0]                   axil_ctrl_awaddr,
    output wire [2:0]                                       axil_ctrl_awprot,
    output wire                                             axil_ctrl_awvalid,
    input  wire                                             axil_ctrl_awready,
    output wire [AXIL_DATA_WIDTH-1:0]                       axil_ctrl_wdata,
    output wire [AXIL_STRB_WIDTH-1:0]                       axil_ctrl_wstrb,
    output wire                                             axil_ctrl_wvalid,
    input  wire                                             axil_ctrl_wready,
    input  wire [1:0]                                       axil_ctrl_bresp,
    input  wire                                             axil_ctrl_bvalid,
    output wire                                             axil_ctrl_bready,
    output wire [AXIL_CSR_ADDR_WIDTH-1:0]                   axil_ctrl_araddr,
    output wire [2:0]                                       axil_ctrl_arprot,
    output wire                                             axil_ctrl_arvalid,
    input  wire                                             axil_ctrl_arready,
    input  wire [AXIL_DATA_WIDTH-1:0]                       axil_ctrl_rdata,
    input  wire [1:0]                                       axil_ctrl_rresp,
    input  wire                                             axil_ctrl_rvalid,
    output wire                                             axil_ctrl_rready,

    output wire [31:0]                                      msi_irq
);

// Queue manager parameters (interface)
localparam EVENT_QUEUE_OP_TABLE_SIZE = 32;
localparam TX_QUEUE_OP_TABLE_SIZE = 32;
localparam RX_QUEUE_OP_TABLE_SIZE = 32;
localparam TX_CPL_QUEUE_OP_TABLE_SIZE = TX_QUEUE_OP_TABLE_SIZE;
localparam RX_CPL_QUEUE_OP_TABLE_SIZE = RX_QUEUE_OP_TABLE_SIZE;
localparam TX_QUEUE_INDEX_WIDTH = 8;
localparam RX_QUEUE_INDEX_WIDTH = 8;
localparam TX_CPL_QUEUE_INDEX_WIDTH = TX_QUEUE_INDEX_WIDTH;
localparam RX_CPL_QUEUE_INDEX_WIDTH = RX_QUEUE_INDEX_WIDTH;
localparam EVENT_QUEUE_PIPELINE = 3;
localparam TX_QUEUE_PIPELINE = 3;
localparam RX_QUEUE_PIPELINE = 3;
localparam TX_CPL_QUEUE_PIPELINE = TX_QUEUE_PIPELINE;
localparam RX_CPL_QUEUE_PIPELINE = RX_QUEUE_PIPELINE;

// TX and RX engine parameters (port)
localparam TX_DESC_TABLE_SIZE = 32;
localparam TX_PKT_TABLE_SIZE  = 32;
localparam RX_DESC_TABLE_SIZE = 32;
localparam RX_PKT_TABLE_SIZE  = 32;

// Scheduler parameters (port)
localparam TX_SCHEDULER = "RR";
localparam TX_SCHEDULER_OP_TABLE_SIZE = TX_DESC_TABLE_SIZE;
localparam TX_SCHEDULER_PIPELINE = TX_QUEUE_PIPELINE;
localparam TDMA_INDEX_WIDTH = 6;

// Interface parameters (port)
localparam TX_CHECKSUM_ENABLE = 1;
localparam RX_RSS_ENABLE = 1;
localparam RX_HASH_ENABLE = 1;
localparam RX_CHECKSUM_ENABLE = 1;
localparam ENABLE_PADDING = 1;
localparam ENABLE_DIC = 1;
localparam MIN_FRAME_LENGTH = 64;
localparam MAX_TX_SIZE = 16384; // 2048;
localparam MAX_RX_SIZE = 16384; // 2048;

// PCIe DMA parameters
localparam TX_RAM_SIZE = TX_PKT_TABLE_SIZE*MAX_TX_SIZE;
localparam RX_RAM_SIZE = RX_PKT_TABLE_SIZE*MAX_RX_SIZE;

// parameter sizing helpers
function [31:0] w_32(input [31:0] val);
    w_32 = val;
endfunction

// AXIL distribution and aggregation among interfaces
wire [IF_COUNT*AXIL_ADDR_WIDTH-1:0] axil_if_awaddr;
wire [IF_COUNT*3-1:0]               axil_if_awprot;
wire [IF_COUNT-1:0]                 axil_if_awvalid;
wire [IF_COUNT-1:0]                 axil_if_awready;
wire [IF_COUNT*AXIL_DATA_WIDTH-1:0] axil_if_wdata;
wire [IF_COUNT*AXIL_STRB_WIDTH-1:0] axil_if_wstrb;
wire [IF_COUNT-1:0]                 axil_if_wvalid;
wire [IF_COUNT-1:0]                 axil_if_wready;
wire [IF_COUNT*2-1:0]               axil_if_bresp;
wire [IF_COUNT-1:0]                 axil_if_bvalid;
wire [IF_COUNT-1:0]                 axil_if_bready;
wire [IF_COUNT*AXIL_ADDR_WIDTH-1:0] axil_if_araddr;
wire [IF_COUNT*3-1:0]               axil_if_arprot;
wire [IF_COUNT-1:0]                 axil_if_arvalid;
wire [IF_COUNT-1:0]                 axil_if_arready;
wire [IF_COUNT*AXIL_DATA_WIDTH-1:0] axil_if_rdata;
wire [IF_COUNT*2-1:0]               axil_if_rresp;
wire [IF_COUNT-1:0]                 axil_if_rvalid;
wire [IF_COUNT-1:0]                 axil_if_rready;

wire [IF_COUNT*AXIL_CSR_ADDR_WIDTH-1:0] axil_if_csr_awaddr;
wire [IF_COUNT*IF_AXIL_ADDR_WIDTH-1:0]  axis_if_csr_awaddr_t;
wire [IF_COUNT*3-1:0]                   axil_if_csr_awprot;
wire [IF_COUNT-1:0]                     axil_if_csr_awvalid;
wire [IF_COUNT-1:0]                     axil_if_csr_awready;
wire [IF_COUNT*AXIL_DATA_WIDTH-1:0]     axil_if_csr_wdata;
wire [IF_COUNT*AXIL_STRB_WIDTH-1:0]     axil_if_csr_wstrb;
wire [IF_COUNT-1:0]                     axil_if_csr_wvalid;
wire [IF_COUNT-1:0]                     axil_if_csr_wready;
wire [IF_COUNT*2-1:0]                   axil_if_csr_bresp;
wire [IF_COUNT-1:0]                     axil_if_csr_bvalid;
wire [IF_COUNT-1:0]                     axil_if_csr_bready;
wire [IF_COUNT*AXIL_CSR_ADDR_WIDTH-1:0] axil_if_csr_araddr;
wire [IF_COUNT*IF_AXIL_ADDR_WIDTH-1:0]  axis_if_csr_araddr_t;
wire [IF_COUNT*3-1:0]                   axil_if_csr_arprot;
wire [IF_COUNT-1:0]                     axil_if_csr_arvalid;
wire [IF_COUNT-1:0]                     axil_if_csr_arready;
wire [IF_COUNT*AXIL_DATA_WIDTH-1:0]     axil_if_csr_rdata;
wire [IF_COUNT*2-1:0]                   axil_if_csr_rresp;
wire [IF_COUNT-1:0]                     axil_if_csr_rvalid;
wire [IF_COUNT-1:0]                     axil_if_csr_rready;

axil_interconnect #(
    .DATA_WIDTH(AXIL_DATA_WIDTH),
    .ADDR_WIDTH(AXIL_ADDR_WIDTH),
    .S_COUNT(1),
    .M_COUNT(IF_COUNT),
    .M_BASE_ADDR(0),
    .M_ADDR_WIDTH({IF_COUNT{w_32(IF_AXIL_ADDR_WIDTH)}}),
    .M_CONNECT_READ({IF_COUNT{1'b1}}),
    .M_CONNECT_WRITE({IF_COUNT{1'b1}})
)
axil_interconnect_inst (
    .clk(pcie_clk),
    .rst(pcie_rst),
    .s_axil_awaddr(axil_pcie_awaddr),
    .s_axil_awprot(axil_pcie_awprot),
    .s_axil_awvalid(axil_pcie_awvalid),
    .s_axil_awready(axil_pcie_awready),
    .s_axil_wdata(axil_pcie_wdata),
    .s_axil_wstrb(axil_pcie_wstrb),
    .s_axil_wvalid(axil_pcie_wvalid),
    .s_axil_wready(axil_pcie_wready),
    .s_axil_bresp(axil_pcie_bresp),
    .s_axil_bvalid(axil_pcie_bvalid),
    .s_axil_bready(axil_pcie_bready),
    .s_axil_araddr(axil_pcie_araddr),
    .s_axil_arprot(axil_pcie_arprot),
    .s_axil_arvalid(axil_pcie_arvalid),
    .s_axil_arready(axil_pcie_arready),
    .s_axil_rdata(axil_pcie_rdata),
    .s_axil_rresp(axil_pcie_rresp),
    .s_axil_rvalid(axil_pcie_rvalid),
    .s_axil_rready(axil_pcie_rready),
    .m_axil_awaddr(axil_if_awaddr),
    .m_axil_awprot(axil_if_awprot),
    .m_axil_awvalid(axil_if_awvalid),
    .m_axil_awready(axil_if_awready),
    .m_axil_wdata(axil_if_wdata),
    .m_axil_wstrb(axil_if_wstrb),
    .m_axil_wvalid(axil_if_wvalid),
    .m_axil_wready(axil_if_wready),
    .m_axil_bresp(axil_if_bresp),
    .m_axil_bvalid(axil_if_bvalid),
    .m_axil_bready(axil_if_bready),
    .m_axil_araddr(axil_if_araddr),
    .m_axil_arprot(axil_if_arprot),
    .m_axil_arvalid(axil_if_arvalid),
    .m_axil_arready(axil_if_arready),
    .m_axil_rdata(axil_if_rdata),
    .m_axil_rresp(axil_if_rresp),
    .m_axil_rvalid(axil_if_rvalid),
    .m_axil_rready(axil_if_rready)
);

axil_interconnect #(
    .DATA_WIDTH(AXIL_DATA_WIDTH),
    .ADDR_WIDTH(AXIL_CSR_ADDR_WIDTH),
    .S_COUNT(IF_COUNT),
    .M_COUNT(1),
    .M_BASE_ADDR(0),
    .M_ADDR_WIDTH({w_32(AXIL_CSR_ADDR_WIDTH-1)}),
    .M_CONNECT_READ({1{{IF_COUNT{1'b1}}}}),
    .M_CONNECT_WRITE({1{{IF_COUNT{1'b1}}}})
)
axil_ctrl_interconnect_inst (
    .clk(pcie_clk),
    .rst(pcie_rst),
    .s_axil_awaddr(axil_if_csr_awaddr),
    .s_axil_awprot(axil_if_csr_awprot),
    .s_axil_awvalid(axil_if_csr_awvalid),
    .s_axil_awready(axil_if_csr_awready),
    .s_axil_wdata(axil_if_csr_wdata),
    .s_axil_wstrb(axil_if_csr_wstrb),
    .s_axil_wvalid(axil_if_csr_wvalid),
    .s_axil_wready(axil_if_csr_wready),
    .s_axil_bresp(axil_if_csr_bresp),
    .s_axil_bvalid(axil_if_csr_bvalid),
    .s_axil_bready(axil_if_csr_bready),
    .s_axil_araddr(axil_if_csr_araddr),
    .s_axil_arprot(axil_if_csr_arprot),
    .s_axil_arvalid(axil_if_csr_arvalid),
    .s_axil_arready(axil_if_csr_arready),
    .s_axil_rdata(axil_if_csr_rdata),
    .s_axil_rresp(axil_if_csr_rresp),
    .s_axil_rvalid(axil_if_csr_rvalid),
    .s_axil_rready(axil_if_csr_rready),
    .m_axil_awaddr(axil_ctrl_awaddr),
    .m_axil_awprot(axil_ctrl_awprot),
    .m_axil_awvalid(axil_ctrl_awvalid),
    .m_axil_awready(axil_ctrl_awready),
    .m_axil_wdata(axil_ctrl_wdata),
    .m_axil_wstrb(axil_ctrl_wstrb),
    .m_axil_wvalid(axil_ctrl_wvalid),
    .m_axil_wready(axil_ctrl_wready),
    .m_axil_bresp(axil_ctrl_bresp),
    .m_axil_bvalid(axil_ctrl_bvalid),
    .m_axil_bready(axil_ctrl_bready),
    .m_axil_araddr(axil_ctrl_araddr),
    .m_axil_arprot(axil_ctrl_arprot),
    .m_axil_arvalid(axil_ctrl_arvalid),
    .m_axil_arready(axil_ctrl_arready),
    .m_axil_rdata(axil_ctrl_rdata),
    .m_axil_rresp(axil_ctrl_rresp),
    .m_axil_rvalid(axil_ctrl_rvalid),
    .m_axil_rready(axil_ctrl_rready)
);

// DMA connections
localparam IF_PCIE_DMA_TAG_WIDTH = PCIE_DMA_TAG_WIDTH-$clog2(IF_COUNT);

wire [IF_COUNT*PCIE_ADDR_WIDTH-1:0]        if_pcie_ctrl_dma_read_desc_pcie_addr;
wire [IF_COUNT*IF_RAM_SEL_WIDTH-1:0]       if_pcie_ctrl_dma_read_desc_ram_sel;
wire [IF_COUNT*RAM_ADDR_WIDTH-1:0]         if_pcie_ctrl_dma_read_desc_ram_addr;
wire [IF_COUNT*PCIE_DMA_LEN_WIDTH-1:0]     if_pcie_ctrl_dma_read_desc_len;
wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_ctrl_dma_read_desc_tag;
wire [IF_COUNT-1:0]                        if_pcie_ctrl_dma_read_desc_valid;
wire [IF_COUNT-1:0]                        if_pcie_ctrl_dma_read_desc_ready;

wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_ctrl_dma_read_desc_status_tag;
wire [IF_COUNT-1:0]                        if_pcie_ctrl_dma_read_desc_status_valid;

wire [IF_COUNT*PCIE_ADDR_WIDTH-1:0]        if_pcie_ctrl_dma_write_desc_pcie_addr;
wire [IF_COUNT*IF_RAM_SEL_WIDTH-1:0]       if_pcie_ctrl_dma_write_desc_ram_sel;
wire [IF_COUNT*RAM_ADDR_WIDTH-1:0]         if_pcie_ctrl_dma_write_desc_ram_addr;
wire [IF_COUNT*PCIE_DMA_LEN_WIDTH-1:0]     if_pcie_ctrl_dma_write_desc_len;
wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_ctrl_dma_write_desc_tag;
wire [IF_COUNT-1:0]                        if_pcie_ctrl_dma_write_desc_valid;
wire [IF_COUNT-1:0]                        if_pcie_ctrl_dma_write_desc_ready;

wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_ctrl_dma_write_desc_status_tag;
wire [IF_COUNT-1:0]                        if_pcie_ctrl_dma_write_desc_status_valid;

wire [IF_COUNT*PCIE_ADDR_WIDTH-1:0]        if_pcie_data_dma_read_desc_pcie_addr;
wire [IF_COUNT*IF_RAM_SEL_WIDTH-1:0]       if_pcie_data_dma_read_desc_ram_sel;
wire [IF_COUNT*RAM_ADDR_WIDTH-1:0]         if_pcie_data_dma_read_desc_ram_addr;
wire [IF_COUNT*PCIE_DMA_LEN_WIDTH-1:0]     if_pcie_data_dma_read_desc_len;
wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_data_dma_read_desc_tag;
wire [IF_COUNT-1:0]                        if_pcie_data_dma_read_desc_valid;
wire [IF_COUNT-1:0]                        if_pcie_data_dma_read_desc_ready;

wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_data_dma_read_desc_status_tag;
wire [IF_COUNT-1:0]                        if_pcie_data_dma_read_desc_status_valid;

wire [IF_COUNT*PCIE_ADDR_WIDTH-1:0]        if_pcie_data_dma_write_desc_pcie_addr;
wire [IF_COUNT*IF_RAM_SEL_WIDTH-1:0]       if_pcie_data_dma_write_desc_ram_sel;
wire [IF_COUNT*RAM_ADDR_WIDTH-1:0]         if_pcie_data_dma_write_desc_ram_addr;
wire [IF_COUNT*PCIE_DMA_LEN_WIDTH-1:0]     if_pcie_data_dma_write_desc_len;
wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_data_dma_write_desc_tag;
wire [IF_COUNT-1:0]                        if_pcie_data_dma_write_desc_valid;
wire [IF_COUNT-1:0]                        if_pcie_data_dma_write_desc_ready;

wire [IF_COUNT*IF_PCIE_DMA_TAG_WIDTH-1:0]  if_pcie_data_dma_write_desc_status_tag;
wire [IF_COUNT-1:0]                        if_pcie_data_dma_write_desc_status_valid;

wire [IF_COUNT*SEG_COUNT*IF_RAM_SEL_WIDTH-1:0] if_ctrl_dma_ram_wr_cmd_sel;
wire [IF_COUNT*SEG_COUNT*SEG_BE_WIDTH-1:0]     if_ctrl_dma_ram_wr_cmd_be;
wire [IF_COUNT*SEG_COUNT*SEG_ADDR_WIDTH-1:0]   if_ctrl_dma_ram_wr_cmd_addr;
wire [IF_COUNT*SEG_COUNT*SEG_DATA_WIDTH-1:0]   if_ctrl_dma_ram_wr_cmd_data;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_wr_cmd_valid;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_wr_cmd_ready;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_wr_done;
wire [IF_COUNT*SEG_COUNT*IF_RAM_SEL_WIDTH-1:0] if_ctrl_dma_ram_rd_cmd_sel;
wire [IF_COUNT*SEG_COUNT*SEG_ADDR_WIDTH-1:0]   if_ctrl_dma_ram_rd_cmd_addr;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_rd_cmd_valid;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_rd_cmd_ready;
wire [IF_COUNT*SEG_COUNT*SEG_DATA_WIDTH-1:0]   if_ctrl_dma_ram_rd_resp_data;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_rd_resp_valid;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_ctrl_dma_ram_rd_resp_ready;

wire [IF_COUNT*SEG_COUNT*IF_RAM_SEL_WIDTH-1:0] if_data_dma_ram_wr_cmd_sel;
wire [IF_COUNT*SEG_COUNT*SEG_BE_WIDTH-1:0]     if_data_dma_ram_wr_cmd_be;
wire [IF_COUNT*SEG_COUNT*SEG_ADDR_WIDTH-1:0]   if_data_dma_ram_wr_cmd_addr;
wire [IF_COUNT*SEG_COUNT*SEG_DATA_WIDTH-1:0]   if_data_dma_ram_wr_cmd_data;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_wr_cmd_valid;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_wr_cmd_ready;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_wr_done;
wire [IF_COUNT*SEG_COUNT*IF_RAM_SEL_WIDTH-1:0] if_data_dma_ram_rd_cmd_sel;
wire [IF_COUNT*SEG_COUNT*SEG_ADDR_WIDTH-1:0]   if_data_dma_ram_rd_cmd_addr;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_rd_cmd_valid;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_rd_cmd_ready;
wire [IF_COUNT*SEG_COUNT*SEG_DATA_WIDTH-1:0]   if_data_dma_ram_rd_resp_data;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_rd_resp_valid;
wire [IF_COUNT*SEG_COUNT-1:0]                  if_data_dma_ram_rd_resp_ready;

if (IF_COUNT > 1) begin

    dma_if_mux #
    (
        .PORTS(IF_COUNT),
        .SEG_COUNT(SEG_COUNT),
        .SEG_DATA_WIDTH(SEG_DATA_WIDTH),
        .SEG_ADDR_WIDTH(SEG_ADDR_WIDTH),
        .SEG_BE_WIDTH(SEG_BE_WIDTH),
        .S_RAM_SEL_WIDTH(IF_RAM_SEL_WIDTH),
        .M_RAM_SEL_WIDTH(RAM_SEL_WIDTH-1),
        .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
        .DMA_ADDR_WIDTH(PCIE_ADDR_WIDTH),
        .LEN_WIDTH(PCIE_DMA_LEN_WIDTH),
        .S_TAG_WIDTH(IF_PCIE_DMA_TAG_WIDTH),
        .M_TAG_WIDTH(PCIE_DMA_TAG_WIDTH),
        .ARB_TYPE("ROUND_ROBIN"),
        .LSB_HIGH_PRIORITY(1)
    )
    dma_if_mux_ctrl_inst (
        .clk(pcie_clk),
        .rst(pcie_rst),

        /*
         * Read descriptor output (to DMA interface)
         */
        .m_axis_read_desc_dma_addr(pcie_ctrl_dma_read_desc_pcie_addr),
        .m_axis_read_desc_ram_sel(pcie_ctrl_dma_read_desc_ram_sel),
        .m_axis_read_desc_ram_addr(pcie_ctrl_dma_read_desc_ram_addr),
        .m_axis_read_desc_len(pcie_ctrl_dma_read_desc_len),
        .m_axis_read_desc_tag(pcie_ctrl_dma_read_desc_tag),
        .m_axis_read_desc_valid(pcie_ctrl_dma_read_desc_valid),
        .m_axis_read_desc_ready(pcie_ctrl_dma_read_desc_ready),

        /*
         * Read descriptor status input (from DMA interface)
         */
        .s_axis_read_desc_status_tag(pcie_ctrl_dma_read_desc_status_tag),
        .s_axis_read_desc_status_error(4'd0),
        .s_axis_read_desc_status_valid(pcie_ctrl_dma_read_desc_status_valid),

        /*
         * Read descriptor input
         */
        .s_axis_read_desc_dma_addr(if_pcie_ctrl_dma_read_desc_pcie_addr),
        .s_axis_read_desc_ram_sel(if_pcie_ctrl_dma_read_desc_ram_sel),
        .s_axis_read_desc_ram_addr(if_pcie_ctrl_dma_read_desc_ram_addr),
        .s_axis_read_desc_len(if_pcie_ctrl_dma_read_desc_len),
        .s_axis_read_desc_tag(if_pcie_ctrl_dma_read_desc_tag),
        .s_axis_read_desc_valid(if_pcie_ctrl_dma_read_desc_valid),
        .s_axis_read_desc_ready(if_pcie_ctrl_dma_read_desc_ready),

        /*
         * Read descriptor status output
         */
        .m_axis_read_desc_status_tag(if_pcie_ctrl_dma_read_desc_status_tag),
        .m_axis_read_desc_status_error(),
        .m_axis_read_desc_status_valid(if_pcie_ctrl_dma_read_desc_status_valid),

        /*
         * Write descriptor output (to DMA interface)
         */
        .m_axis_write_desc_dma_addr(pcie_ctrl_dma_write_desc_pcie_addr),
        .m_axis_write_desc_ram_sel(pcie_ctrl_dma_write_desc_ram_sel),
        .m_axis_write_desc_ram_addr(pcie_ctrl_dma_write_desc_ram_addr),
        .m_axis_write_desc_imm(),
        .m_axis_write_desc_imm_en(),
        .m_axis_write_desc_len(pcie_ctrl_dma_write_desc_len),
        .m_axis_write_desc_tag(pcie_ctrl_dma_write_desc_tag),
        .m_axis_write_desc_valid(pcie_ctrl_dma_write_desc_valid),
        .m_axis_write_desc_ready(pcie_ctrl_dma_write_desc_ready),

        /*
         * Write descriptor status input (from DMA interface)
         */
        .s_axis_write_desc_status_tag(pcie_ctrl_dma_write_desc_status_tag),
        .s_axis_write_desc_status_error(4'd0),
        .s_axis_write_desc_status_valid(pcie_ctrl_dma_write_desc_status_valid),

        /*
         * Write descriptor input
         */
        .s_axis_write_desc_dma_addr(if_pcie_ctrl_dma_write_desc_pcie_addr),
        .s_axis_write_desc_ram_sel(if_pcie_ctrl_dma_write_desc_ram_sel),
        .s_axis_write_desc_ram_addr(if_pcie_ctrl_dma_write_desc_ram_addr),
        .s_axis_write_desc_imm     ({(IF_COUNT*32){1'b0}}),
        .s_axis_write_desc_imm_en  ({IF_COUNT{1'b0}}),
        .s_axis_write_desc_len(if_pcie_ctrl_dma_write_desc_len),
        .s_axis_write_desc_tag(if_pcie_ctrl_dma_write_desc_tag),
        .s_axis_write_desc_valid(if_pcie_ctrl_dma_write_desc_valid),
        .s_axis_write_desc_ready(if_pcie_ctrl_dma_write_desc_ready),

        /*
         * Write descriptor status output
         */
        .m_axis_write_desc_status_tag(if_pcie_ctrl_dma_write_desc_status_tag),
        .m_axis_write_desc_status_error(),
        .m_axis_write_desc_status_valid(if_pcie_ctrl_dma_write_desc_status_valid),

        /*
         * RAM interface (from DMA interface)
         */
        .if_ram_wr_cmd_sel(ctrl_dma_ram_wr_cmd_sel),
        .if_ram_wr_cmd_be(ctrl_dma_ram_wr_cmd_be),
        .if_ram_wr_cmd_addr(ctrl_dma_ram_wr_cmd_addr),
        .if_ram_wr_cmd_data(ctrl_dma_ram_wr_cmd_data),
        .if_ram_wr_cmd_valid(ctrl_dma_ram_wr_cmd_valid),
        .if_ram_wr_cmd_ready(ctrl_dma_ram_wr_cmd_ready),
        .if_ram_wr_done(ctrl_dma_ram_wr_done),
        .if_ram_rd_cmd_sel(ctrl_dma_ram_rd_cmd_sel),
        .if_ram_rd_cmd_addr(ctrl_dma_ram_rd_cmd_addr),
        .if_ram_rd_cmd_valid(ctrl_dma_ram_rd_cmd_valid),
        .if_ram_rd_cmd_ready(ctrl_dma_ram_rd_cmd_ready),
        .if_ram_rd_resp_data(ctrl_dma_ram_rd_resp_data),
        .if_ram_rd_resp_valid(ctrl_dma_ram_rd_resp_valid),
        .if_ram_rd_resp_ready(ctrl_dma_ram_rd_resp_ready),

        /*
         * RAM interface
         */
        .ram_wr_cmd_sel(if_ctrl_dma_ram_wr_cmd_sel),
        .ram_wr_cmd_be(if_ctrl_dma_ram_wr_cmd_be),
        .ram_wr_cmd_addr(if_ctrl_dma_ram_wr_cmd_addr),
        .ram_wr_cmd_data(if_ctrl_dma_ram_wr_cmd_data),
        .ram_wr_cmd_valid(if_ctrl_dma_ram_wr_cmd_valid),
        .ram_wr_cmd_ready(if_ctrl_dma_ram_wr_cmd_ready),
        .ram_wr_done(if_ctrl_dma_ram_wr_done),
        .ram_rd_cmd_sel(if_ctrl_dma_ram_rd_cmd_sel),
        .ram_rd_cmd_addr(if_ctrl_dma_ram_rd_cmd_addr),
        .ram_rd_cmd_valid(if_ctrl_dma_ram_rd_cmd_valid),
        .ram_rd_cmd_ready(if_ctrl_dma_ram_rd_cmd_ready),
        .ram_rd_resp_data(if_ctrl_dma_ram_rd_resp_data),
        .ram_rd_resp_valid(if_ctrl_dma_ram_rd_resp_valid),
        .ram_rd_resp_ready(if_ctrl_dma_ram_rd_resp_ready)
    );

    dma_if_mux #
    (
        .PORTS(IF_COUNT),
        .SEG_COUNT(SEG_COUNT),
        .SEG_DATA_WIDTH(SEG_DATA_WIDTH),
        .SEG_ADDR_WIDTH(SEG_ADDR_WIDTH),
        .SEG_BE_WIDTH(SEG_BE_WIDTH),
        .S_RAM_SEL_WIDTH(IF_RAM_SEL_WIDTH),
        .M_RAM_SEL_WIDTH(RAM_SEL_WIDTH-1),
        .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
        .DMA_ADDR_WIDTH(PCIE_ADDR_WIDTH),
        .LEN_WIDTH(PCIE_DMA_LEN_WIDTH),
        .S_TAG_WIDTH(IF_PCIE_DMA_TAG_WIDTH),
        .M_TAG_WIDTH(PCIE_DMA_TAG_WIDTH),
        .ARB_TYPE("ROUND_ROBIN"),
        .LSB_HIGH_PRIORITY(1)
    )
    dma_if_mux_data_inst (
        .clk(pcie_clk),
        .rst(pcie_rst),

        /*
         * Read descriptor output (to DMA interface)
         */
        .m_axis_read_desc_dma_addr(pcie_data_dma_read_desc_pcie_addr),
        .m_axis_read_desc_ram_sel(pcie_data_dma_read_desc_ram_sel),
        .m_axis_read_desc_ram_addr(pcie_data_dma_read_desc_ram_addr),
        .m_axis_read_desc_len(pcie_data_dma_read_desc_len),
        .m_axis_read_desc_tag(pcie_data_dma_read_desc_tag),
        .m_axis_read_desc_valid(pcie_data_dma_read_desc_valid),
        .m_axis_read_desc_ready(pcie_data_dma_read_desc_ready),

        /*
         * Read descriptor status input (from DMA interface)
         */
        .s_axis_read_desc_status_tag(pcie_data_dma_read_desc_status_tag),
        .s_axis_read_desc_status_error(4'd0),
        .s_axis_read_desc_status_valid(pcie_data_dma_read_desc_status_valid),

        /*
         * Read descriptor input
         */
        .s_axis_read_desc_dma_addr(if_pcie_data_dma_read_desc_pcie_addr),
        .s_axis_read_desc_ram_sel(if_pcie_data_dma_read_desc_ram_sel),
        .s_axis_read_desc_ram_addr(if_pcie_data_dma_read_desc_ram_addr),
        .s_axis_read_desc_len(if_pcie_data_dma_read_desc_len),
        .s_axis_read_desc_tag(if_pcie_data_dma_read_desc_tag),
        .s_axis_read_desc_valid(if_pcie_data_dma_read_desc_valid),
        .s_axis_read_desc_ready(if_pcie_data_dma_read_desc_ready),

        /*
         * Read descriptor status output
         */
        .m_axis_read_desc_status_tag(if_pcie_data_dma_read_desc_status_tag),
        .m_axis_read_desc_status_error(),
        .m_axis_read_desc_status_valid(if_pcie_data_dma_read_desc_status_valid),

        /*
         * Write descriptor output (to DMA interface)
         */
        .m_axis_write_desc_dma_addr(pcie_data_dma_write_desc_pcie_addr),
        .m_axis_write_desc_ram_sel(pcie_data_dma_write_desc_ram_sel),
        .m_axis_write_desc_ram_addr(pcie_data_dma_write_desc_ram_addr),
        .m_axis_write_desc_imm(),
        .m_axis_write_desc_imm_en(),
        .m_axis_write_desc_len(pcie_data_dma_write_desc_len),
        .m_axis_write_desc_tag(pcie_data_dma_write_desc_tag),
        .m_axis_write_desc_valid(pcie_data_dma_write_desc_valid),
        .m_axis_write_desc_ready(pcie_data_dma_write_desc_ready),

        /*
         * Write descriptor status input (from DMA interface)
         */
        .s_axis_write_desc_status_tag(pcie_data_dma_write_desc_status_tag),
        .s_axis_write_desc_status_error(4'd0),
        .s_axis_write_desc_status_valid(pcie_data_dma_write_desc_status_valid),

        /*
         * Write descriptor input
         */
        .s_axis_write_desc_dma_addr(if_pcie_data_dma_write_desc_pcie_addr),
        .s_axis_write_desc_ram_sel(if_pcie_data_dma_write_desc_ram_sel),
        .s_axis_write_desc_ram_addr(if_pcie_data_dma_write_desc_ram_addr),
        .s_axis_write_desc_imm     ({(IF_COUNT*32){1'b0}}),
        .s_axis_write_desc_imm_en  ({IF_COUNT{1'b0}}),
        .s_axis_write_desc_len(if_pcie_data_dma_write_desc_len),
        .s_axis_write_desc_tag(if_pcie_data_dma_write_desc_tag),
        .s_axis_write_desc_valid(if_pcie_data_dma_write_desc_valid),
        .s_axis_write_desc_ready(if_pcie_data_dma_write_desc_ready),

        /*
         * Write descriptor status output
         */
        .m_axis_write_desc_status_tag(if_pcie_data_dma_write_desc_status_tag),
        .m_axis_write_desc_status_error(),
        .m_axis_write_desc_status_valid(if_pcie_data_dma_write_desc_status_valid),

        /*
         * RAM interface (from DMA interface)
         */
        .if_ram_wr_cmd_sel(data_dma_ram_wr_cmd_sel),
        .if_ram_wr_cmd_be(data_dma_ram_wr_cmd_be),
        .if_ram_wr_cmd_addr(data_dma_ram_wr_cmd_addr),
        .if_ram_wr_cmd_data(data_dma_ram_wr_cmd_data),
        .if_ram_wr_cmd_valid(data_dma_ram_wr_cmd_valid),
        .if_ram_wr_cmd_ready(data_dma_ram_wr_cmd_ready),
        .if_ram_wr_done(data_dma_ram_wr_done),
        .if_ram_rd_cmd_sel(data_dma_ram_rd_cmd_sel),
        .if_ram_rd_cmd_addr(data_dma_ram_rd_cmd_addr),
        .if_ram_rd_cmd_valid(data_dma_ram_rd_cmd_valid),
        .if_ram_rd_cmd_ready(data_dma_ram_rd_cmd_ready),
        .if_ram_rd_resp_data(data_dma_ram_rd_resp_data),
        .if_ram_rd_resp_valid(data_dma_ram_rd_resp_valid),
        .if_ram_rd_resp_ready(data_dma_ram_rd_resp_ready),

        /*
         * RAM interface
         */
        .ram_wr_cmd_sel(if_data_dma_ram_wr_cmd_sel),
        .ram_wr_cmd_be(if_data_dma_ram_wr_cmd_be),
        .ram_wr_cmd_addr(if_data_dma_ram_wr_cmd_addr),
        .ram_wr_cmd_data(if_data_dma_ram_wr_cmd_data),
        .ram_wr_cmd_valid(if_data_dma_ram_wr_cmd_valid),
        .ram_wr_cmd_ready(if_data_dma_ram_wr_cmd_ready),
        .ram_wr_done(if_data_dma_ram_wr_done),
        .ram_rd_cmd_sel(if_data_dma_ram_rd_cmd_sel),
        .ram_rd_cmd_addr(if_data_dma_ram_rd_cmd_addr),
        .ram_rd_cmd_valid(if_data_dma_ram_rd_cmd_valid),
        .ram_rd_cmd_ready(if_data_dma_ram_rd_cmd_ready),
        .ram_rd_resp_data(if_data_dma_ram_rd_resp_data),
        .ram_rd_resp_valid(if_data_dma_ram_rd_resp_valid),
        .ram_rd_resp_ready(if_data_dma_ram_rd_resp_ready)
    );

end else begin

    assign pcie_ctrl_dma_read_desc_pcie_addr = if_pcie_ctrl_dma_read_desc_pcie_addr;
    assign pcie_ctrl_dma_read_desc_ram_sel = if_pcie_ctrl_dma_read_desc_ram_sel;
    assign pcie_ctrl_dma_read_desc_ram_addr = if_pcie_ctrl_dma_read_desc_ram_addr;
    assign pcie_ctrl_dma_read_desc_len = if_pcie_ctrl_dma_read_desc_len;
    assign pcie_ctrl_dma_read_desc_tag = if_pcie_ctrl_dma_read_desc_tag;
    assign pcie_ctrl_dma_read_desc_valid = if_pcie_ctrl_dma_read_desc_valid;
    assign if_pcie_ctrl_dma_read_desc_ready = pcie_ctrl_dma_read_desc_ready;

    assign if_pcie_ctrl_dma_read_desc_status_tag = pcie_ctrl_dma_read_desc_status_tag;
    assign if_pcie_ctrl_dma_read_desc_status_valid = pcie_ctrl_dma_read_desc_status_valid;

    assign pcie_ctrl_dma_write_desc_pcie_addr = if_pcie_ctrl_dma_write_desc_pcie_addr;
    assign pcie_ctrl_dma_write_desc_ram_sel = if_pcie_ctrl_dma_write_desc_ram_sel;
    assign pcie_ctrl_dma_write_desc_ram_addr = if_pcie_ctrl_dma_write_desc_ram_addr;
    assign pcie_ctrl_dma_write_desc_len = if_pcie_ctrl_dma_write_desc_len;
    assign pcie_ctrl_dma_write_desc_tag = if_pcie_ctrl_dma_write_desc_tag;
    assign pcie_ctrl_dma_write_desc_valid = if_pcie_ctrl_dma_write_desc_valid;
    assign if_pcie_ctrl_dma_write_desc_ready = pcie_ctrl_dma_write_desc_ready;

    assign if_pcie_ctrl_dma_write_desc_status_tag = pcie_ctrl_dma_write_desc_status_tag;
    assign if_pcie_ctrl_dma_write_desc_status_valid = pcie_ctrl_dma_write_desc_status_valid;

    assign if_ctrl_dma_ram_wr_cmd_sel = ctrl_dma_ram_wr_cmd_sel;
    assign if_ctrl_dma_ram_wr_cmd_be = ctrl_dma_ram_wr_cmd_be;
    assign if_ctrl_dma_ram_wr_cmd_addr = ctrl_dma_ram_wr_cmd_addr;
    assign if_ctrl_dma_ram_wr_cmd_data = ctrl_dma_ram_wr_cmd_data;
    assign if_ctrl_dma_ram_wr_cmd_valid = ctrl_dma_ram_wr_cmd_valid;
    assign ctrl_dma_ram_wr_cmd_ready = if_ctrl_dma_ram_wr_cmd_ready;
    assign ctrl_dma_ram_wr_done = if_ctrl_dma_ram_wr_done;
    assign if_ctrl_dma_ram_rd_cmd_sel = ctrl_dma_ram_rd_cmd_sel;
    assign if_ctrl_dma_ram_rd_cmd_addr = ctrl_dma_ram_rd_cmd_addr;
    assign if_ctrl_dma_ram_rd_cmd_valid = ctrl_dma_ram_rd_cmd_valid;
    assign ctrl_dma_ram_rd_cmd_ready = if_ctrl_dma_ram_rd_cmd_ready;
    assign ctrl_dma_ram_rd_resp_data = if_ctrl_dma_ram_rd_resp_data;
    assign ctrl_dma_ram_rd_resp_valid = if_ctrl_dma_ram_rd_resp_valid;
    assign if_ctrl_dma_ram_rd_resp_ready = ctrl_dma_ram_rd_resp_ready;

    assign pcie_data_dma_read_desc_pcie_addr = if_pcie_data_dma_read_desc_pcie_addr;
    assign pcie_data_dma_read_desc_ram_sel = if_pcie_data_dma_read_desc_ram_sel;
    assign pcie_data_dma_read_desc_ram_addr = if_pcie_data_dma_read_desc_ram_addr;
    assign pcie_data_dma_read_desc_len = if_pcie_data_dma_read_desc_len;
    assign pcie_data_dma_read_desc_tag = if_pcie_data_dma_read_desc_tag;
    assign pcie_data_dma_read_desc_valid = if_pcie_data_dma_read_desc_valid;
    assign if_pcie_data_dma_read_desc_ready = pcie_data_dma_read_desc_ready;

    assign if_pcie_data_dma_read_desc_status_tag = pcie_data_dma_read_desc_status_tag;
    assign if_pcie_data_dma_read_desc_status_valid = pcie_data_dma_read_desc_status_valid;

    assign pcie_data_dma_write_desc_pcie_addr = if_pcie_data_dma_write_desc_pcie_addr;
    assign pcie_data_dma_write_desc_ram_sel = if_pcie_data_dma_write_desc_ram_sel;
    assign pcie_data_dma_write_desc_ram_addr = if_pcie_data_dma_write_desc_ram_addr;
    assign pcie_data_dma_write_desc_len = if_pcie_data_dma_write_desc_len;
    assign pcie_data_dma_write_desc_tag = if_pcie_data_dma_write_desc_tag;
    assign pcie_data_dma_write_desc_valid = if_pcie_data_dma_write_desc_valid;
    assign if_pcie_data_dma_write_desc_ready = pcie_data_dma_write_desc_ready;

    assign if_pcie_data_dma_write_desc_status_tag = pcie_data_dma_write_desc_status_tag;
    assign if_pcie_data_dma_write_desc_status_valid = pcie_data_dma_write_desc_status_valid;

    assign if_data_dma_ram_wr_cmd_sel = data_dma_ram_wr_cmd_sel;
    assign if_data_dma_ram_wr_cmd_be = data_dma_ram_wr_cmd_be;
    assign if_data_dma_ram_wr_cmd_addr = data_dma_ram_wr_cmd_addr;
    assign if_data_dma_ram_wr_cmd_data = data_dma_ram_wr_cmd_data;
    assign if_data_dma_ram_wr_cmd_valid = data_dma_ram_wr_cmd_valid;
    assign data_dma_ram_wr_cmd_ready = if_data_dma_ram_wr_cmd_ready;
    assign data_dma_ram_wr_done = if_data_dma_ram_wr_done;
    assign if_data_dma_ram_rd_cmd_sel = data_dma_ram_rd_cmd_sel;
    assign if_data_dma_ram_rd_cmd_addr = data_dma_ram_rd_cmd_addr;
    assign if_data_dma_ram_rd_cmd_valid = data_dma_ram_rd_cmd_valid;
    assign data_dma_ram_rd_cmd_ready = if_data_dma_ram_rd_cmd_ready;
    assign data_dma_ram_rd_resp_data = if_data_dma_ram_rd_resp_data;
    assign data_dma_ram_rd_resp_valid = if_data_dma_ram_rd_resp_valid;
    assign if_data_dma_ram_rd_resp_ready = data_dma_ram_rd_resp_ready;

end

wire [IF_COUNT*32-1:0] if_msi_irq;

generate
    genvar m, n;

    case (IF_COUNT)
        1: assign msi_irq = if_msi_irq[0*32+:32];
        2: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32];
        3: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32] | if_msi_irq[2*32+:32];
        4: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32] | if_msi_irq[2*32+:32] |
                            if_msi_irq[3*32+:32];
        5: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32] | if_msi_irq[2*32+:32] |
                            if_msi_irq[3*32+:32] | if_msi_irq[4*32+:32];
        6: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32] | if_msi_irq[2*32+:32] |
                            if_msi_irq[3*32+:32] | if_msi_irq[4*32+:32] | if_msi_irq[5*32+:32];
        7: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32] | if_msi_irq[2*32+:32] |
                            if_msi_irq[3*32+:32] | if_msi_irq[4*32+:32] | if_msi_irq[5*32+:32] |
                            if_msi_irq[6*32+:32];
        8: assign msi_irq = if_msi_irq[0*32+:32] | if_msi_irq[1*32+:32] | if_msi_irq[2*32+:32] |
                            if_msi_irq[3*32+:32] | if_msi_irq[4*32+:32] | if_msi_irq[5*32+:32] |
                            if_msi_irq[6*32+:32] | if_msi_irq[7*32+:32];
    endcase

    for (n = 0; n < IF_COUNT; n = n + 1) begin : iface

        mqnic_interface #(
            .PORTS(PORTS_PER_IF),
            .DMA_ADDR_WIDTH(PCIE_ADDR_WIDTH),
            .DMA_LEN_WIDTH(PCIE_DMA_LEN_WIDTH),
            .DMA_TAG_WIDTH(IF_PCIE_DMA_TAG_WIDTH),
            .EVENT_QUEUE_OP_TABLE_SIZE(EVENT_QUEUE_OP_TABLE_SIZE),
            .TX_QUEUE_OP_TABLE_SIZE(TX_QUEUE_OP_TABLE_SIZE),
            .RX_QUEUE_OP_TABLE_SIZE(RX_QUEUE_OP_TABLE_SIZE),
            .TX_CPL_QUEUE_OP_TABLE_SIZE(TX_CPL_QUEUE_OP_TABLE_SIZE),
            .RX_CPL_QUEUE_OP_TABLE_SIZE(RX_CPL_QUEUE_OP_TABLE_SIZE),
            .TX_QUEUE_INDEX_WIDTH(TX_QUEUE_INDEX_WIDTH),
            .RX_QUEUE_INDEX_WIDTH(RX_QUEUE_INDEX_WIDTH),
            .TX_CPL_QUEUE_INDEX_WIDTH(TX_CPL_QUEUE_INDEX_WIDTH),
            .RX_CPL_QUEUE_INDEX_WIDTH(RX_CPL_QUEUE_INDEX_WIDTH),
            .EVENT_QUEUE_PIPELINE(EVENT_QUEUE_PIPELINE),
            .TX_QUEUE_PIPELINE(TX_QUEUE_PIPELINE),
            .RX_QUEUE_PIPELINE(RX_QUEUE_PIPELINE),
            .TX_CPL_QUEUE_PIPELINE(TX_CPL_QUEUE_PIPELINE),
            .RX_CPL_QUEUE_PIPELINE(RX_CPL_QUEUE_PIPELINE),
            .TX_DESC_TABLE_SIZE(TX_DESC_TABLE_SIZE),
            .TX_PKT_TABLE_SIZE(TX_PKT_TABLE_SIZE),
            .RX_DESC_TABLE_SIZE(RX_DESC_TABLE_SIZE),
            .RX_PKT_TABLE_SIZE(RX_PKT_TABLE_SIZE),
            .TX_SCHEDULER(TX_SCHEDULER),
            .TX_SCHEDULER_OP_TABLE_SIZE(TX_SCHEDULER_OP_TABLE_SIZE),
            .TX_SCHEDULER_PIPELINE(TX_SCHEDULER_PIPELINE),
            .TDMA_INDEX_WIDTH(TDMA_INDEX_WIDTH),
            .INT_WIDTH(8),
            .QUEUE_PTR_WIDTH(16),
            .LOG_QUEUE_SIZE_WIDTH(4),
            .PTP_TS_ENABLE(0),
            .PTP_TS_WIDTH(96),
            .TX_CHECKSUM_ENABLE(TX_CHECKSUM_ENABLE),
            .RX_RSS_ENABLE(RX_RSS_ENABLE),
            .RX_HASH_ENABLE(RX_HASH_ENABLE),
            .RX_CHECKSUM_ENABLE(RX_CHECKSUM_ENABLE),
            .AXIL_DATA_WIDTH(AXIL_DATA_WIDTH),
            .AXIL_ADDR_WIDTH(IF_AXIL_ADDR_WIDTH),
            .AXIL_STRB_WIDTH(AXIL_STRB_WIDTH),
            .SEG_COUNT(SEG_COUNT),
            .SEG_DATA_WIDTH(SEG_DATA_WIDTH),
            .SEG_ADDR_WIDTH(SEG_ADDR_WIDTH),
            .SEG_BE_WIDTH(SEG_BE_WIDTH),
            .RAM_SEL_WIDTH(IF_RAM_SEL_WIDTH),
            .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
            .RAM_PIPELINE(RAM_PIPELINE),
            .AXIS_DATA_WIDTH(AXIS_DATA_WIDTH),
            .AXIS_KEEP_WIDTH(AXIS_KEEP_WIDTH),
            .MAX_TX_SIZE(MAX_TX_SIZE),
            .MAX_RX_SIZE(MAX_RX_SIZE),
            .TX_RAM_SIZE(TX_RAM_SIZE),
            .RX_RAM_SIZE(RX_RAM_SIZE)
        )
        interface_inst (
            .clk(pcie_clk),
            .rst(pcie_rst),

            /*
             * DMA read descriptor output (control)
             */
            .m_axis_ctrl_dma_read_desc_dma_addr(if_pcie_ctrl_dma_read_desc_pcie_addr[n*PCIE_ADDR_WIDTH +: PCIE_ADDR_WIDTH]),
            .m_axis_ctrl_dma_read_desc_ram_sel(if_pcie_ctrl_dma_read_desc_ram_sel[n*IF_RAM_SEL_WIDTH +: IF_RAM_SEL_WIDTH]),
            .m_axis_ctrl_dma_read_desc_ram_addr(if_pcie_ctrl_dma_read_desc_ram_addr[n*RAM_ADDR_WIDTH +: RAM_ADDR_WIDTH]),
            .m_axis_ctrl_dma_read_desc_len(if_pcie_ctrl_dma_read_desc_len[n*PCIE_DMA_LEN_WIDTH +: PCIE_DMA_LEN_WIDTH]),
            .m_axis_ctrl_dma_read_desc_tag(if_pcie_ctrl_dma_read_desc_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .m_axis_ctrl_dma_read_desc_valid(if_pcie_ctrl_dma_read_desc_valid[n]),
            .m_axis_ctrl_dma_read_desc_ready(if_pcie_ctrl_dma_read_desc_ready[n]),

            /*
             * DMA read descriptor status input (control)
             */
            .s_axis_ctrl_dma_read_desc_status_tag(if_pcie_ctrl_dma_read_desc_status_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .s_axis_ctrl_dma_read_desc_status_valid(if_pcie_ctrl_dma_read_desc_status_valid[n]),

            /*
             * DMA write descriptor output (control)
             */
            .m_axis_ctrl_dma_write_desc_dma_addr(if_pcie_ctrl_dma_write_desc_pcie_addr[n*PCIE_ADDR_WIDTH +: PCIE_ADDR_WIDTH]),
            .m_axis_ctrl_dma_write_desc_ram_sel(if_pcie_ctrl_dma_write_desc_ram_sel[n*IF_RAM_SEL_WIDTH +: IF_RAM_SEL_WIDTH]),
            .m_axis_ctrl_dma_write_desc_ram_addr(if_pcie_ctrl_dma_write_desc_ram_addr[n*RAM_ADDR_WIDTH +: RAM_ADDR_WIDTH]),
            .m_axis_ctrl_dma_write_desc_len(if_pcie_ctrl_dma_write_desc_len[n*PCIE_DMA_LEN_WIDTH +: PCIE_DMA_LEN_WIDTH]),
            .m_axis_ctrl_dma_write_desc_tag(if_pcie_ctrl_dma_write_desc_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .m_axis_ctrl_dma_write_desc_valid(if_pcie_ctrl_dma_write_desc_valid[n]),
            .m_axis_ctrl_dma_write_desc_ready(if_pcie_ctrl_dma_write_desc_ready[n]),

            /*
             * DMA write descriptor status input (control)
             */
            .s_axis_ctrl_dma_write_desc_status_tag(if_pcie_ctrl_dma_write_desc_status_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .s_axis_ctrl_dma_write_desc_status_valid(if_pcie_ctrl_dma_write_desc_status_valid[n]),

            /*
             * DMA read descriptor output (data)
             */
            .m_axis_data_dma_read_desc_dma_addr(if_pcie_data_dma_read_desc_pcie_addr[n*PCIE_ADDR_WIDTH +: PCIE_ADDR_WIDTH]),
            .m_axis_data_dma_read_desc_ram_sel(if_pcie_data_dma_read_desc_ram_sel[n*IF_RAM_SEL_WIDTH +: IF_RAM_SEL_WIDTH]),
            .m_axis_data_dma_read_desc_ram_addr(if_pcie_data_dma_read_desc_ram_addr[n*RAM_ADDR_WIDTH +: RAM_ADDR_WIDTH]),
            .m_axis_data_dma_read_desc_len(if_pcie_data_dma_read_desc_len[n*PCIE_DMA_LEN_WIDTH +: PCIE_DMA_LEN_WIDTH]),
            .m_axis_data_dma_read_desc_tag(if_pcie_data_dma_read_desc_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .m_axis_data_dma_read_desc_valid(if_pcie_data_dma_read_desc_valid[n]),
            .m_axis_data_dma_read_desc_ready(if_pcie_data_dma_read_desc_ready[n]),

            /*
             * DMA read descriptor status input (data)
             */
            .s_axis_data_dma_read_desc_status_tag(if_pcie_data_dma_read_desc_status_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .s_axis_data_dma_read_desc_status_valid(if_pcie_data_dma_read_desc_status_valid[n]),

            /*
             * DMA write descriptor output (data)
             */
            .m_axis_data_dma_write_desc_dma_addr(if_pcie_data_dma_write_desc_pcie_addr[n*PCIE_ADDR_WIDTH +: PCIE_ADDR_WIDTH]),
            .m_axis_data_dma_write_desc_ram_sel(if_pcie_data_dma_write_desc_ram_sel[n*IF_RAM_SEL_WIDTH +: IF_RAM_SEL_WIDTH]),
            .m_axis_data_dma_write_desc_ram_addr(if_pcie_data_dma_write_desc_ram_addr[n*RAM_ADDR_WIDTH +: RAM_ADDR_WIDTH]),
            .m_axis_data_dma_write_desc_len(if_pcie_data_dma_write_desc_len[n*PCIE_DMA_LEN_WIDTH +: PCIE_DMA_LEN_WIDTH]),
            .m_axis_data_dma_write_desc_tag(if_pcie_data_dma_write_desc_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .m_axis_data_dma_write_desc_valid(if_pcie_data_dma_write_desc_valid[n]),
            .m_axis_data_dma_write_desc_ready(if_pcie_data_dma_write_desc_ready[n]),

            /*
             * DMA write descriptor status input (data)
             */
            .s_axis_data_dma_write_desc_status_tag(if_pcie_data_dma_write_desc_status_tag[n*IF_PCIE_DMA_TAG_WIDTH +: IF_PCIE_DMA_TAG_WIDTH]),
            .s_axis_data_dma_write_desc_status_valid(if_pcie_data_dma_write_desc_status_valid[n]),

            /*
             * AXI-Lite slave interface
             */
            .s_axil_awaddr(axil_if_awaddr[n*AXIL_ADDR_WIDTH +: AXIL_ADDR_WIDTH]),
            .s_axil_awprot(axil_if_awprot[n*3 +: 3]),
            .s_axil_awvalid(axil_if_awvalid[n]),
            .s_axil_awready(axil_if_awready[n]),
            .s_axil_wdata(axil_if_wdata[n*AXIL_DATA_WIDTH +: AXIL_DATA_WIDTH]),
            .s_axil_wstrb(axil_if_wstrb[n*AXIL_STRB_WIDTH +: AXIL_STRB_WIDTH]),
            .s_axil_wvalid(axil_if_wvalid[n]),
            .s_axil_wready(axil_if_wready[n]),
            .s_axil_bresp(axil_if_bresp[n*2 +: 2]),
            .s_axil_bvalid(axil_if_bvalid[n]),
            .s_axil_bready(axil_if_bready[n]),
            .s_axil_araddr(axil_if_araddr[n*AXIL_ADDR_WIDTH +: AXIL_ADDR_WIDTH]),
            .s_axil_arprot(axil_if_arprot[n*3 +: 3]),
            .s_axil_arvalid(axil_if_arvalid[n]),
            .s_axil_arready(axil_if_arready[n]),
            .s_axil_rdata(axil_if_rdata[n*AXIL_DATA_WIDTH +: AXIL_DATA_WIDTH]),
            .s_axil_rresp(axil_if_rresp[n*2 +: 2]),
            .s_axil_rvalid(axil_if_rvalid[n]),
            .s_axil_rready(axil_if_rready[n]),

            /*
             * AXI-Lite master interface (passthrough for NIC control and status)
             */
            .m_axil_csr_awaddr(axis_if_csr_awaddr_t[n*IF_AXIL_ADDR_WIDTH +: IF_AXIL_ADDR_WIDTH]),
            .m_axil_csr_awprot(axil_if_csr_awprot[n*3 +: 3]),
            .m_axil_csr_awvalid(axil_if_csr_awvalid[n]),
            .m_axil_csr_awready(axil_if_csr_awready[n]),
            .m_axil_csr_wdata(axil_if_csr_wdata[n*AXIL_DATA_WIDTH +: AXIL_DATA_WIDTH]),
            .m_axil_csr_wstrb(axil_if_csr_wstrb[n*AXIL_STRB_WIDTH +: AXIL_STRB_WIDTH]),
            .m_axil_csr_wvalid(axil_if_csr_wvalid[n]),
            .m_axil_csr_wready(axil_if_csr_wready[n]),
            .m_axil_csr_bresp(axil_if_csr_bresp[n*2 +: 2]),
            .m_axil_csr_bvalid(axil_if_csr_bvalid[n]),
            .m_axil_csr_bready(axil_if_csr_bready[n]),
            .m_axil_csr_araddr(axis_if_csr_araddr_t[n*IF_AXIL_ADDR_WIDTH +: IF_AXIL_ADDR_WIDTH]),
            .m_axil_csr_arprot(axil_if_csr_arprot[n*3 +: 3]),
            .m_axil_csr_arvalid(axil_if_csr_arvalid[n]),
            .m_axil_csr_arready(axil_if_csr_arready[n]),
            .m_axil_csr_rdata(axil_if_csr_rdata[n*AXIL_DATA_WIDTH +: AXIL_DATA_WIDTH]),
            .m_axil_csr_rresp(axil_if_csr_rresp[n*2 +: 2]),
            .m_axil_csr_rvalid(axil_if_csr_rvalid[n]),
            .m_axil_csr_rready(axil_if_csr_rready[n]),

            /*
             * RAM interface (control)
             */
            .ctrl_dma_ram_wr_cmd_sel(if_ctrl_dma_ram_wr_cmd_sel[SEG_COUNT*IF_RAM_SEL_WIDTH*n +: SEG_COUNT*IF_RAM_SEL_WIDTH]),
            .ctrl_dma_ram_wr_cmd_be(if_ctrl_dma_ram_wr_cmd_be[SEG_COUNT*SEG_BE_WIDTH*n +: SEG_COUNT*SEG_BE_WIDTH]),
            .ctrl_dma_ram_wr_cmd_addr(if_ctrl_dma_ram_wr_cmd_addr[SEG_COUNT*SEG_ADDR_WIDTH*n +: SEG_COUNT*SEG_ADDR_WIDTH]),
            .ctrl_dma_ram_wr_cmd_data(if_ctrl_dma_ram_wr_cmd_data[SEG_COUNT*SEG_DATA_WIDTH*n +: SEG_COUNT*SEG_DATA_WIDTH]),
            .ctrl_dma_ram_wr_cmd_valid(if_ctrl_dma_ram_wr_cmd_valid[SEG_COUNT*n +: SEG_COUNT]),
            .ctrl_dma_ram_wr_cmd_ready(if_ctrl_dma_ram_wr_cmd_ready[SEG_COUNT*n +: SEG_COUNT]),
            .ctrl_dma_ram_wr_done(if_ctrl_dma_ram_wr_done[SEG_COUNT*n +: SEG_COUNT]),
            .ctrl_dma_ram_rd_cmd_sel(if_ctrl_dma_ram_rd_cmd_sel[SEG_COUNT*IF_RAM_SEL_WIDTH*n +: SEG_COUNT*IF_RAM_SEL_WIDTH]),
            .ctrl_dma_ram_rd_cmd_addr(if_ctrl_dma_ram_rd_cmd_addr[SEG_COUNT*SEG_ADDR_WIDTH*n +: SEG_COUNT*SEG_ADDR_WIDTH]),
            .ctrl_dma_ram_rd_cmd_valid(if_ctrl_dma_ram_rd_cmd_valid[SEG_COUNT*n +: SEG_COUNT]),
            .ctrl_dma_ram_rd_cmd_ready(if_ctrl_dma_ram_rd_cmd_ready[SEG_COUNT*n +: SEG_COUNT]),
            .ctrl_dma_ram_rd_resp_data(if_ctrl_dma_ram_rd_resp_data[SEG_COUNT*SEG_DATA_WIDTH*n +: SEG_COUNT*SEG_DATA_WIDTH]),
            .ctrl_dma_ram_rd_resp_valid(if_ctrl_dma_ram_rd_resp_valid[SEG_COUNT*n +: SEG_COUNT]),
            .ctrl_dma_ram_rd_resp_ready(if_ctrl_dma_ram_rd_resp_ready[SEG_COUNT*n +: SEG_COUNT]),

            /*
             * RAM interface (data)
             */
            .data_dma_ram_wr_cmd_sel(if_data_dma_ram_wr_cmd_sel[SEG_COUNT*IF_RAM_SEL_WIDTH*n +: SEG_COUNT*IF_RAM_SEL_WIDTH]),
            .data_dma_ram_wr_cmd_be(if_data_dma_ram_wr_cmd_be[SEG_COUNT*SEG_BE_WIDTH*n +: SEG_COUNT*SEG_BE_WIDTH]),
            .data_dma_ram_wr_cmd_addr(if_data_dma_ram_wr_cmd_addr[SEG_COUNT*SEG_ADDR_WIDTH*n +: SEG_COUNT*SEG_ADDR_WIDTH]),
            .data_dma_ram_wr_cmd_data(if_data_dma_ram_wr_cmd_data[SEG_COUNT*SEG_DATA_WIDTH*n +: SEG_COUNT*SEG_DATA_WIDTH]),
            .data_dma_ram_wr_cmd_valid(if_data_dma_ram_wr_cmd_valid[SEG_COUNT*n +: SEG_COUNT]),
            .data_dma_ram_wr_cmd_ready(if_data_dma_ram_wr_cmd_ready[SEG_COUNT*n +: SEG_COUNT]),
            .data_dma_ram_wr_done(if_data_dma_ram_wr_done[SEG_COUNT*n +: SEG_COUNT]),
            .data_dma_ram_rd_cmd_sel(if_data_dma_ram_rd_cmd_sel[SEG_COUNT*IF_RAM_SEL_WIDTH*n +: SEG_COUNT*IF_RAM_SEL_WIDTH]),
            .data_dma_ram_rd_cmd_addr(if_data_dma_ram_rd_cmd_addr[SEG_COUNT*SEG_ADDR_WIDTH*n +: SEG_COUNT*SEG_ADDR_WIDTH]),
            .data_dma_ram_rd_cmd_valid(if_data_dma_ram_rd_cmd_valid[SEG_COUNT*n +: SEG_COUNT]),
            .data_dma_ram_rd_cmd_ready(if_data_dma_ram_rd_cmd_ready[SEG_COUNT*n +: SEG_COUNT]),
            .data_dma_ram_rd_resp_data(if_data_dma_ram_rd_resp_data[SEG_COUNT*SEG_DATA_WIDTH*n +: SEG_COUNT*SEG_DATA_WIDTH]),
            .data_dma_ram_rd_resp_valid(if_data_dma_ram_rd_resp_valid[SEG_COUNT*n +: SEG_COUNT]),
            .data_dma_ram_rd_resp_ready(if_data_dma_ram_rd_resp_ready[SEG_COUNT*n +: SEG_COUNT]),

            /*
             * Transmit data output
             */
            .tx_axis_tdata(tx_axis_tdata[PORTS_PER_IF*AXIS_DATA_WIDTH*n +: PORTS_PER_IF*AXIS_DATA_WIDTH]),
            .tx_axis_tkeep(tx_axis_tkeep[PORTS_PER_IF*AXIS_KEEP_WIDTH*n +: PORTS_PER_IF*AXIS_KEEP_WIDTH]),
            .tx_axis_tvalid(tx_axis_tvalid[PORTS_PER_IF*n +: PORTS_PER_IF]),
            .tx_axis_tready(tx_axis_tready[PORTS_PER_IF*n +: PORTS_PER_IF]),
            .tx_axis_tlast(tx_axis_tlast[PORTS_PER_IF*n +: PORTS_PER_IF]),
            .tx_axis_tuser(tx_axis_tuser[PORTS_PER_IF*n +: PORTS_PER_IF]),

            /*
             * Transmit timestamp input
             */
            .s_axis_tx_ptp_ts_96(96'd0),
            .s_axis_tx_ptp_ts_valid(1'b0),
            .s_axis_tx_ptp_ts_ready(),

            /*
             * Receive data input
             */
            .rx_axis_tdata(rx_axis_tdata[PORTS_PER_IF*AXIS_DATA_WIDTH*n +: PORTS_PER_IF*AXIS_DATA_WIDTH]),
            .rx_axis_tkeep(rx_axis_tkeep[PORTS_PER_IF*AXIS_KEEP_WIDTH*n +: PORTS_PER_IF*AXIS_KEEP_WIDTH]),
            .rx_axis_tvalid(rx_axis_tvalid[PORTS_PER_IF*n +: PORTS_PER_IF]),
            .rx_axis_tready(rx_axis_tready[PORTS_PER_IF*n +: PORTS_PER_IF]),
            .rx_axis_tlast(rx_axis_tlast[PORTS_PER_IF*n +: PORTS_PER_IF]),
            .rx_axis_tuser(rx_axis_tuser[PORTS_PER_IF*n +: PORTS_PER_IF]),

            /*
             * Receive timestamp input
             */
            .s_axis_rx_ptp_ts_96(96'd0),
            .s_axis_rx_ptp_ts_valid(1'b0),
            .s_axis_rx_ptp_ts_ready(),

            /*
             * PTP clock
             */
            .ptp_ts_96(96'd0),
            .ptp_ts_step(1'b0),

            /*
             * MSI interrupts
             */
            .msi_irq(if_msi_irq[n*32 +: 32])
        );

        assign axil_if_csr_awaddr[n*AXIL_CSR_ADDR_WIDTH +: AXIL_CSR_ADDR_WIDTH] =
                   axis_if_csr_awaddr_t[n*IF_AXIL_ADDR_WIDTH +: AXIL_CSR_ADDR_WIDTH];
        assign axil_if_csr_araddr[n*AXIL_CSR_ADDR_WIDTH +: AXIL_CSR_ADDR_WIDTH] =
                   axis_if_csr_araddr_t[n*IF_AXIL_ADDR_WIDTH +: AXIL_CSR_ADDR_WIDTH];
    end

endgenerate

endmodule

`resetall
