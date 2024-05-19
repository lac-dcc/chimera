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

`resetall
`timescale 1ns / 1ps
`default_nettype none

module pcie_cont_write # (
  // PCIe Parameters
  parameter HOST_DMA_TAG_WIDTH   = 32,
  parameter PCIE_ADDR_WIDTH      = 64,
  parameter PCIE_RAM_ADDR_WIDTH  = 32,
  parameter PCIE_SLOT_COUNT      = 16,
  parameter PCIE_SLOT_WIDTH      = $clog2(PCIE_SLOT_COUNT),
  parameter PCIE_DMA_TAG_WIDTH   = PCIE_SLOT_WIDTH,
  parameter PCIE_DMA_LEN_WIDTH   = 16,
  // RAM parameters, default for PCI_AXIS_WIDTH of 256
  parameter SEG_COUNT            = 4,
  parameter SEG_DATA_WIDTH       = 128,
  parameter RAM_SIZE             = 2**15,
  parameter SEG_ADDR_WIDTH       = $clog2((RAM_SIZE/SEG_COUNT)/8),
  parameter SEG_BE_WIDTH         = SEG_DATA_WIDTH/8,
  parameter RAM_ADDR_WIDTH       = SEG_ADDR_WIDTH+$clog2(SEG_COUNT)
                                   +$clog2(SEG_BE_WIDTH),
  parameter RAM_PIPELINE         = 2,
  // CORE parameters
  parameter CORE_COUNT           = 16,
  parameter CORE_WIDTH           = $clog2(CORE_COUNT),
  parameter CORE_ADDR_WIDTH      = 16,
  parameter AXIS_DATA_WIDTH      = 128,
  parameter AXIS_KEEP_WIDTH      = 16,
  parameter AXIS_TAG_WIDTH       = 9
) (
  input  wire                                pcie_clk,
  input  wire                                pcie_rst,
  input  wire                                dma_enable,

  // Read descriptor request from host
  input  wire [PCIE_ADDR_WIDTH-1:0]          host_dma_write_desc_pcie_addr,
  input  wire [PCIE_RAM_ADDR_WIDTH-1:0]      host_dma_write_desc_ram_addr,
  input  wire [PCIE_DMA_LEN_WIDTH-1:0]       host_dma_write_desc_len,
  input  wire [HOST_DMA_TAG_WIDTH-1:0]       host_dma_write_desc_tag,
  input  wire                                host_dma_write_desc_valid,
  output wire                                host_dma_write_desc_ready,

  output wire [HOST_DMA_TAG_WIDTH-1:0]       host_dma_write_desc_status_tag,
  output wire                                host_dma_write_desc_status_valid,

  // Read request asking from cores
  output wire [127:0]                        cores_ctrl_m_tdata,
  output wire                                cores_ctrl_m_tvalid,
  output wire [CORE_WIDTH-1:0]               cores_ctrl_m_tdest,
  input  wire                                cores_ctrl_m_tready,

  // Data from cores
  input  wire [AXIS_DATA_WIDTH-1:0]          cores_tx_tdata,
  input  wire [AXIS_KEEP_WIDTH-1:0]          cores_tx_tkeep,
  input  wire [AXIS_TAG_WIDTH-1:0]           cores_tx_tuser,
  input  wire                                cores_tx_tvalid,
  output wire                                cores_tx_tready,
  input  wire                                cores_tx_tlast,

  // Write connection to PCIE DMA
  output wire [PCIE_ADDR_WIDTH-1:0]          pcie_dma_write_desc_pcie_addr,
  output wire [RAM_ADDR_WIDTH-1:0]           pcie_dma_write_desc_ram_addr,
  output wire [PCIE_DMA_LEN_WIDTH-1:0]       pcie_dma_write_desc_len,
  output wire [PCIE_DMA_TAG_WIDTH-1:0]       pcie_dma_write_desc_tag,
  output wire                                pcie_dma_write_desc_valid,
  input  wire                                pcie_dma_write_desc_ready,

  input  wire [PCIE_DMA_TAG_WIDTH-1:0]       pcie_dma_write_desc_status_tag,
  input  wire                                pcie_dma_write_desc_status_valid,

  input  wire [SEG_COUNT*SEG_ADDR_WIDTH-1:0] dma_ram_rd_cmd_addr,
  input  wire [SEG_COUNT-1:0]                dma_ram_rd_cmd_valid,
  output wire [SEG_COUNT-1:0]                dma_ram_rd_cmd_ready,
  output wire [SEG_COUNT*SEG_DATA_WIDTH-1:0] dma_ram_rd_resp_data,
  output wire [SEG_COUNT-1:0]                dma_ram_rd_resp_valid,
  input  wire [SEG_COUNT-1:0]                dma_ram_rd_resp_ready
);

localparam TAG_WIDTH_DIFF = PCIE_DMA_TAG_WIDTH - PCIE_SLOT_WIDTH;

// Removing PCIe address header
wire [AXIS_DATA_WIDTH-1:0] axis_write_data_tdata;
wire [AXIS_KEEP_WIDTH-1:0] axis_write_data_tkeep;
wire                       axis_write_data_tvalid;
wire                       axis_write_data_tready;
wire                       axis_write_data_tlast;
wire [AXIS_TAG_WIDTH-1:0]  axis_write_data_tuser;

wire [63:0] tx_header;

header_remover # (
  .DATA_WIDTH(AXIS_DATA_WIDTH),
  .HDR_WIDTH(64),
  .USER_WIDTH(AXIS_TAG_WIDTH),
  .ALWAYS_HDR(1)
) tx_header_remover (
  .clk(pcie_clk),
  .rst(pcie_rst),
  .has_header(1'b1),

  .s_axis_tdata (cores_tx_tdata),
  .s_axis_tkeep (cores_tx_tkeep),
  .s_axis_tdest (8'd0),
  .s_axis_tuser (cores_tx_tuser),
  .s_axis_tlast (cores_tx_tlast),
  .s_axis_tvalid(cores_tx_tvalid),
  .s_axis_tready(cores_tx_tready),

  .header(tx_header),
  .header_valid(),

  .m_axis_tdata (axis_write_data_tdata),
  .m_axis_tkeep (axis_write_data_tkeep),
  .m_axis_tdest (),
  .m_axis_tuser (axis_write_data_tuser),
  .m_axis_tlast (axis_write_data_tlast),
  .m_axis_tvalid(axis_write_data_tvalid),
  .m_axis_tready(axis_write_data_tready)

);


// Internal wires
reg  [PCIE_ADDR_WIDTH-1:0]    pcie_dma_write_desc_pcie_addr_r;
reg  [RAM_ADDR_WIDTH-1:0]     pcie_dma_write_desc_ram_addr_r;
reg  [PCIE_DMA_LEN_WIDTH-1:0] pcie_dma_write_desc_len_r;
reg  [PCIE_DMA_TAG_WIDTH-1:0] pcie_dma_write_desc_tag_r;
reg                           pcie_dma_write_desc_valid_r;
wire                          pcie_dma_write_desc_ready_r;

wire [RAM_ADDR_WIDTH-1:0]     axis_write_desc_addr;
wire [PCIE_DMA_LEN_WIDTH-1:0] axis_write_desc_len;
wire [PCIE_SLOT_WIDTH-1:0]    axis_write_desc_tag;
wire                          axis_write_desc_valid;
wire                          axis_write_desc_ready;
wire [PCIE_DMA_LEN_WIDTH-1:0] axis_write_desc_status_len;
wire [PCIE_SLOT_WIDTH-1:0]    axis_write_desc_status_tag;
wire [PCIE_DMA_TAG_WIDTH-1:0] axis_write_desc_status_tag_t;
wire [AXIS_TAG_WIDTH-1:0]     axis_write_desc_status_user;
wire                          axis_write_desc_status_valid;

reg  [HOST_DMA_TAG_WIDTH-1:0] host_dma_write_desc_status_tag_r;
reg                           host_dma_write_desc_status_valid_r;

reg  [127:0]                  cores_ctrl_m_tdata_r;
reg                           cores_ctrl_m_tvalid_r;
reg  [CORE_WIDTH-1:0]         cores_ctrl_m_tdest_r;

// Internal bookkeepings
reg [HOST_DMA_TAG_WIDTH-1:0] tx_pcie_tag [0:CORE_COUNT-1];
reg [CORE_COUNT-1:0]         tx_pcie_tag_v;

reg [PCIE_ADDR_WIDTH-1:0]    tx_pcie_addr [0:PCIE_SLOT_COUNT-1];
reg [AXIS_TAG_WIDTH-1:0]     tx_core_tag  [0:PCIE_SLOT_COUNT-1];

reg  [PCIE_SLOT_COUNT-1:0]   tx_slot;
reg  [PCIE_SLOT_WIDTH-1:0]   selected_tx_slot;
reg  [PCIE_SLOT_COUNT-1:0]   selected_tx_slot_1hot;
wire                         selected_tx_slot_v;
reg  [PCIE_SLOT_WIDTH-1:0]   last_tx_slot;
reg                          last_tx_slot_v;

wire [CORE_WIDTH-1:0] host_wr_dest_core =
    host_dma_write_desc_ram_addr[CORE_ADDR_WIDTH +: CORE_WIDTH];

wire [CORE_WIDTH-1:0]                tx_done_core_id =
    tx_core_tag[pcie_dma_write_desc_status_tag][AXIS_TAG_WIDTH-1:AXIS_TAG_WIDTH-CORE_WIDTH];

wire [AXIS_TAG_WIDTH-CORE_WIDTH-1:0] tx_done_core_tag =
    tx_core_tag[pcie_dma_write_desc_status_tag][AXIS_TAG_WIDTH-CORE_WIDTH-1:0];

integer i;

always@(*) begin
  selected_tx_slot      = {PCIE_SLOT_WIDTH{1'b0}};
  selected_tx_slot_1hot = {PCIE_SLOT_COUNT{1'b0}};
  for (i=PCIE_SLOT_COUNT-1;i>=0;i=i-1)
    if (tx_slot[i]) begin
      selected_tx_slot      = i;
      selected_tx_slot_1hot = 1 << i;
    end
end

assign selected_tx_slot_v = |tx_slot;

always @ (posedge pcie_clk) begin

  // Forwarding host write request to the corresponding core, and saving PCIe tag per core
  if (host_dma_write_desc_valid && host_dma_write_desc_ready) begin
    // PORT field in descriptor gets overriden by RPU interconnect, and TAG field is 0
    cores_ctrl_m_tdata_r                         <= 128'd0;
    cores_ctrl_m_tdata_r[127:64]                 <= host_dma_write_desc_pcie_addr;
    cores_ctrl_m_tdata_r[31+CORE_ADDR_WIDTH:32]  <= host_dma_write_desc_ram_addr[CORE_ADDR_WIDTH-1:0];
    cores_ctrl_m_tdata_r[PCIE_DMA_LEN_WIDTH-1:0] <= host_dma_write_desc_len;
    cores_ctrl_m_tdest_r                         <= host_wr_dest_core;
    cores_ctrl_m_tvalid_r                        <= 1'b1;
    tx_pcie_tag[host_wr_dest_core]               <= host_dma_write_desc_tag;
    tx_pcie_tag_v[host_wr_dest_core]             <= 1'b1;
  end else begin
    cores_ctrl_m_tvalid_r                        <= 1'b0;
  end

  if (axis_write_desc_valid && axis_write_desc_ready) begin
    last_tx_slot          <= selected_tx_slot;
    last_tx_slot_v        <= 1'b1;
  end

  if (last_tx_slot_v && axis_write_data_tvalid) begin
    tx_pcie_addr[last_tx_slot] <= tx_header;
    last_tx_slot_v             <= 1'b0;
  end

  // No need to check pcie_dma_write_desc_ready since we have enough space in FIFO,
  // limited by slot count from previous step
  if (axis_write_desc_status_valid) begin
    pcie_dma_write_desc_pcie_addr_r         <= tx_pcie_addr[axis_write_desc_status_tag];
    pcie_dma_write_desc_ram_addr_r          <= {axis_write_desc_status_tag,11'd0};
    pcie_dma_write_desc_len_r               <= axis_write_desc_status_len;
    pcie_dma_write_desc_tag_r               <= axis_write_desc_status_tag;
    pcie_dma_write_desc_valid_r             <= 1'b1;
    tx_core_tag[axis_write_desc_status_tag] <= axis_write_desc_status_user;
  end else begin
    pcie_dma_write_desc_valid_r             <= 1'b0;
  end

  if (pcie_dma_write_desc_status_valid && (tx_done_core_tag==0)) begin
    host_dma_write_desc_status_tag_r   <= tx_pcie_tag[tx_done_core_id];
    host_dma_write_desc_status_valid_r <= tx_pcie_tag_v[tx_done_core_id];
    tx_pcie_tag_v[tx_done_core_id]     <= 1'b0;
  end

  // tx_done_core_tag can be used to notify the core with ID of tx_done_core_id

  if ((axis_write_desc_valid && axis_write_desc_ready) && pcie_dma_write_desc_status_valid)
    tx_slot <= (tx_slot & (~selected_tx_slot_1hot))
                | ({{(PCIE_SLOT_COUNT-1){1'b0}},1'b1} << pcie_dma_write_desc_status_tag);
  else if (axis_write_desc_valid && axis_write_desc_ready)
    tx_slot <= tx_slot & (~selected_tx_slot_1hot);
  else if (pcie_dma_write_desc_status_valid)
    tx_slot <= tx_slot | ({{(PCIE_SLOT_COUNT-1){1'b0}},1'b1} << pcie_dma_write_desc_status_tag);

  if (pcie_rst) begin
    tx_slot                            <= {PCIE_SLOT_COUNT{1'b1}};
    tx_pcie_tag_v                      <= {CORE_COUNT{1'b0}};
    cores_ctrl_m_tvalid_r              <= 1'b0;
    last_tx_slot_v                     <= 1'b0;
    pcie_dma_write_desc_valid_r        <= 1'b0;
    host_dma_write_desc_status_valid_r <= 1'b0;
  end
end

assign host_dma_write_desc_status_tag   = host_dma_write_desc_status_tag_r;
assign host_dma_write_desc_status_valid = host_dma_write_desc_status_valid_r;

assign axis_write_desc_addr  = {selected_tx_slot,11'd0};
assign axis_write_desc_len   = 16'd2048;
assign axis_write_desc_tag   = selected_tx_slot;
assign axis_write_desc_valid = selected_tx_slot_v;

// We can accept one read out per core (at least for now).
assign cores_ctrl_m_tdata        = cores_ctrl_m_tdata_r;
assign cores_ctrl_m_tvalid       = cores_ctrl_m_tvalid_r;
assign cores_ctrl_m_tdest        = cores_ctrl_m_tdest_r;
assign host_dma_write_desc_ready = cores_ctrl_m_tready && (tx_pcie_tag_v[host_wr_dest_core]==1'b0);

// Scratchpad for reordering from PCIe
wire [SEG_COUNT*SEG_BE_WIDTH-1:0]    dma_ram_wr_cmd_be_int;
wire [SEG_COUNT*SEG_ADDR_WIDTH-1:0]  dma_ram_wr_cmd_addr_int;
wire [SEG_COUNT*SEG_DATA_WIDTH-1:0]  dma_ram_wr_cmd_data_int;
wire [SEG_COUNT-1:0]                 dma_ram_wr_cmd_valid_int;
wire [SEG_COUNT-1:0]                 dma_ram_wr_cmd_ready_int;
wire [SEG_COUNT-1:0]                 dma_ram_wr_done_int;

dma_psdpram #(
    .SIZE(RAM_SIZE),
    .SEG_COUNT(SEG_COUNT),
    .SEG_DATA_WIDTH(SEG_DATA_WIDTH),
    .SEG_ADDR_WIDTH(SEG_ADDR_WIDTH),
    .SEG_BE_WIDTH(SEG_BE_WIDTH),
    .PIPELINE(RAM_PIPELINE)
)
dma_psdpram_rx_inst (
    .clk(pcie_clk),
    .rst(pcie_rst),

    .wr_cmd_be(dma_ram_wr_cmd_be_int),
    .wr_cmd_addr(dma_ram_wr_cmd_addr_int),
    .wr_cmd_data(dma_ram_wr_cmd_data_int),
    .wr_cmd_valid(dma_ram_wr_cmd_valid_int),
    .wr_cmd_ready(dma_ram_wr_cmd_ready_int),
    .wr_done(dma_ram_wr_done_int),

    .rd_cmd_addr(dma_ram_rd_cmd_addr),
    .rd_cmd_valid(dma_ram_rd_cmd_valid),
    .rd_cmd_ready(dma_ram_rd_cmd_ready),
    .rd_resp_data(dma_ram_rd_resp_data),
    .rd_resp_valid(dma_ram_rd_resp_valid),
    .rd_resp_ready(dma_ram_rd_resp_ready)
);

dma_client_axis_sink #(
    .SEG_COUNT(SEG_COUNT),
    .SEG_DATA_WIDTH(SEG_DATA_WIDTH),
    .SEG_ADDR_WIDTH(SEG_ADDR_WIDTH),
    .SEG_BE_WIDTH(SEG_BE_WIDTH),
    .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
    .AXIS_DATA_WIDTH(AXIS_DATA_WIDTH),
    .AXIS_KEEP_ENABLE(AXIS_KEEP_WIDTH > 1),
    .AXIS_KEEP_WIDTH(AXIS_KEEP_WIDTH),
    .AXIS_LAST_ENABLE(1),
    .AXIS_ID_ENABLE(0),
    .AXIS_DEST_ENABLE(0),
    .AXIS_USER_ENABLE(1),
    .AXIS_USER_WIDTH(AXIS_TAG_WIDTH),
    .LEN_WIDTH(PCIE_DMA_LEN_WIDTH),
    .TAG_WIDTH(PCIE_DMA_TAG_WIDTH)
)
dma_client_axis_sink_inst (
    .clk(pcie_clk),
    .rst(pcie_rst),

    /*
     * DMA write descriptor input
     */
    .s_axis_write_desc_ram_addr(axis_write_desc_addr),
    .s_axis_write_desc_len     (axis_write_desc_len),
    .s_axis_write_desc_tag     ({{TAG_WIDTH_DIFF{1'b0}}, axis_write_desc_tag}),
    .s_axis_write_desc_valid   (axis_write_desc_valid),
    .s_axis_write_desc_ready   (axis_write_desc_ready),

    /*
     * DMA write descriptor status output
     */
    .m_axis_write_desc_status_len  (axis_write_desc_status_len),
    .m_axis_write_desc_status_tag  (axis_write_desc_status_tag_t),
    .m_axis_write_desc_status_id   (),
    .m_axis_write_desc_status_dest (),
    .m_axis_write_desc_status_user (axis_write_desc_status_user),
    .m_axis_write_desc_status_error(),
    .m_axis_write_desc_status_valid(axis_write_desc_status_valid),

    /*
     * AXI stream write data input
     */
    .s_axis_write_data_tdata (axis_write_data_tdata),
    .s_axis_write_data_tkeep (axis_write_data_tkeep),
    .s_axis_write_data_tvalid(axis_write_data_tvalid),
    .s_axis_write_data_tready(axis_write_data_tready),
    .s_axis_write_data_tlast (axis_write_data_tlast),
    .s_axis_write_data_tid   (),
    .s_axis_write_data_tdest (8'd0),
    .s_axis_write_data_tuser (axis_write_data_tuser),

    /*
     * RAM interface
     */
    .ram_wr_cmd_be(dma_ram_wr_cmd_be_int),
    .ram_wr_cmd_addr(dma_ram_wr_cmd_addr_int),
    .ram_wr_cmd_data(dma_ram_wr_cmd_data_int),
    .ram_wr_cmd_valid(dma_ram_wr_cmd_valid_int),
    .ram_wr_cmd_ready(dma_ram_wr_cmd_ready_int),
    .ram_wr_done(dma_ram_wr_done_int),

    /*
     * Configuration
     */
    .enable(dma_enable),
    .abort(1'b0)
);

assign axis_write_desc_status_tag = axis_write_desc_status_tag_t[PCIE_SLOT_WIDTH-1:0];

// Descriptor FIFO
basic_fifo # (
  .DEPTH(1<<PCIE_SLOT_WIDTH),
  .DATA_WIDTH(PCIE_ADDR_WIDTH+RAM_ADDR_WIDTH+
              PCIE_DMA_LEN_WIDTH+PCIE_DMA_TAG_WIDTH)
) pcie_dma_write_desc_fifo (
  .clk(pcie_clk),
  .rst(pcie_rst),
  .clear(1'b0),

  .din_valid(pcie_dma_write_desc_valid_r),
  .din(     {pcie_dma_write_desc_pcie_addr_r,
             pcie_dma_write_desc_ram_addr_r,
             pcie_dma_write_desc_len_r,
             pcie_dma_write_desc_tag_r}),
  .din_ready(pcie_dma_write_desc_ready_r),

  .dout_valid(pcie_dma_write_desc_valid),
  .dout(     {pcie_dma_write_desc_pcie_addr,
              pcie_dma_write_desc_ram_addr,
              pcie_dma_write_desc_len,
              pcie_dma_write_desc_tag}),
  .dout_ready(pcie_dma_write_desc_ready),

  .item_count(),
  .full(),
  .empty()
);

endmodule

`resetall
