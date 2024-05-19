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

// Moein Khazraee, 2019
// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * RPU interconnect between RPUs and rest of the system
 */
module rpu_intercon # (
    parameter DATA_WIDTH       = 64,
    parameter PORT_WIDTH       = 3,
    parameter CORE_ID_WIDTH    = 4,
    parameter DRAM_PORT        = 6,
    parameter SLOT_COUNT       = 16,
    parameter MSG_WIDTH        = 46,
    parameter BC_REGION_SIZE   = 4096,
    parameter STRB_WIDTH       = (DATA_WIDTH/8),
    parameter SLOT_WIDTH       = $clog2(SLOT_COUNT+1),
    parameter TAG_WIDTH        = (SLOT_WIDTH>5)? SLOT_WIDTH:5,
    parameter ID_TAG_WIDTH     = CORE_ID_WIDTH+TAG_WIDTH,

    parameter RECV_DESC_DEPTH  = SLOT_COUNT,
    parameter SEND_DESC_DEPTH  = SLOT_COUNT,
    parameter DRAM_DESC_DEPTH  = 16,
    parameter MSG_FIFO_DEPTH   = 16,

    parameter MAX_PKT_HDR_SIZE = 128,
    parameter SLOT_START_ADDR  = 16'h0,
    parameter SLOT_ADDR_STEP   = 16'h0400,
    parameter HDR_START_ADDR   = 16'h5C00,
    parameter DESC_START_ADDR  = 16'h5D00,

    parameter DATA_S_REG_TYPE  = 0,
    parameter DATA_M_REG_TYPE  = 2,
    parameter DRAM_M_REG_TYPE  = 0
)
(
    input  wire                     clk,
    input  wire                     rst,

    input  wire [CORE_ID_WIDTH-1:0] core_id,

    // ---------------- DATA CHANNEL --------------- //
    // Incoming data
    input  wire [DATA_WIDTH-1:0]    data_s_axis_tdata,
    input  wire [STRB_WIDTH-1:0]    data_s_axis_tkeep,
    input  wire                     data_s_axis_tvalid,
    output wire                     data_s_axis_tready,
    input  wire                     data_s_axis_tlast,
    input  wire [TAG_WIDTH-1:0]     data_s_axis_tdest,
    input  wire [PORT_WIDTH-1:0]    data_s_axis_tuser,

    // Outgoing data
    output wire [DATA_WIDTH-1:0]    data_m_axis_tdata,
    output wire [STRB_WIDTH-1:0]    data_m_axis_tkeep,
    output wire                     data_m_axis_tvalid,
    input  wire                     data_m_axis_tready,
    output wire                     data_m_axis_tlast,
    output wire [PORT_WIDTH-1:0]    data_m_axis_tdest,
    output wire [TAG_WIDTH-1:0]     data_m_axis_tuser,

    // ---------------- CTRL CHANNEL --------------- //
    // Incoming control
    input  wire [35:0]              ctrl_s_axis_tdata,
    input  wire                     ctrl_s_axis_tvalid,
    output wire                     ctrl_s_axis_tready,

    // Outgoing control
    output wire [35:0]              ctrl_m_axis_tdata,
    output wire                     ctrl_m_axis_tvalid,
    input  wire                     ctrl_m_axis_tready,

    // ------------ DRAM RD REQ CHANNEL ------------- //
    // Incoming DRAM request
    input  wire [31:0]              dram_s_axis_tdata,
    input  wire                     dram_s_axis_tvalid,
    output wire                     dram_s_axis_tready,
    input  wire                     dram_s_axis_tlast,

    // Outgoing DRAM request
    output wire [31:0]              dram_m_axis_tdata,
    output wire                     dram_m_axis_tvalid,
    input  wire                     dram_m_axis_tready,
    output wire                     dram_m_axis_tlast,

    // ------------- CORE MSG CHANNEL -------------- //
    // Core messages output
    output wire [MSG_WIDTH-1:0]     core_msg_out,
    output wire                     core_msg_out_valid,
    input  wire                     core_msg_out_ready,

    // Core messages input
    input  wire [MSG_WIDTH-1:0]     core_msg_in,
    input  wire [CORE_ID_WIDTH-1:0] core_msg_in_user,
    input  wire                     core_msg_in_valid,

    // ---------- STATUS READBACK CHANNEL ---------- //
    input  wire [3:0]               stat_addr,
    output reg  [31:0]              stat_data,

    // --------------------------------------------- //
    // ------- CONNECTION TO RISCV_BLOCK ----------- //
    // --------------------------------------------- //

    output wire                     core_reset,

    // DMA interface
    output wire                     dma_cmd_wr_en,
    output wire [25:0]              dma_cmd_wr_addr,
    output wire                     dma_cmd_hdr_wr_en,
    output wire [23:0]              dma_cmd_hdr_wr_addr,
    output wire [DATA_WIDTH-1:0]    dma_cmd_wr_data,
    output wire [STRB_WIDTH-1:0]    dma_cmd_wr_strb,
    output wire                     dma_cmd_wr_last,
    input  wire                     dma_cmd_wr_ready,

    output wire                     dma_cmd_rd_en,
    output wire [25:0]              dma_cmd_rd_addr,
    output wire                     dma_cmd_rd_last,
    input  wire                     dma_cmd_rd_ready,

    input  wire                     dma_rd_resp_valid,
    input  wire [DATA_WIDTH-1:0]    dma_rd_resp_data,
    output wire                     dma_rd_resp_ready,

    // Descriptor to/from core
    output wire [63:0]              in_desc,
    output wire                     in_desc_valid,
    input  wire                     in_desc_taken,

    input  wire [63:0]              out_desc,
    input  wire                     out_desc_2nd,
    input  wire                     out_desc_valid,
    output wire                     out_desc_ready,

    // Messages from the core
    input  wire [MSG_WIDTH-1:0]     bc_msg_out,
    input  wire                     bc_msg_out_valid,
    output wire                     bc_msg_out_ready,

    // Messages to the core
    output reg  [MSG_WIDTH-1:0]     bc_msg_in,
    output reg  [CORE_ID_WIDTH-1:0] bc_msg_in_user,
    output reg                      bc_msg_in_valid,

    // Status channel to core
    output reg  [31:0]              intercon_status_data,
    output reg  [2:0]               intercon_status_addr,

    // Status channel from core
    input  wire [31:0]              rpu_status_data,
    input  wire [2:0]               rpu_status_addr
);

wire rst_r;
sync_reset sync_rst_inst (
  .clk(clk),
  .rst(rst),
  .out(rst_r)
);

/////////////////////////////////////////////////////////////////////
////////////////// PARSING LOAD BALANCER COMMANDS ///////////////////
/////////////////////////////////////////////////////////////////////
reg  [35:0]           ctrl_s_axis_tdata_r;
reg                   ctrl_s_axis_tvalid_r;
reg  [SLOT_WIDTH-1:0] ctrl_in_slot_ptr;
wire                  ctrl_s_fifo_ready;

always @ (posedge clk) begin
  if (ctrl_s_axis_tvalid && ctrl_s_axis_tready) begin
    ctrl_s_axis_tdata_r  <= ctrl_s_axis_tdata;
    ctrl_in_slot_ptr     <= ctrl_s_axis_tdata[16+:SLOT_WIDTH];
  end
  ctrl_s_axis_tvalid_r <= ((ctrl_s_axis_tvalid && ctrl_s_axis_tready) ||
                           (ctrl_s_axis_tvalid_r && (!ctrl_s_axis_tready)));

  if (rst_r)
    ctrl_s_axis_tvalid_r <= 1'b0;
end

wire [3:0]  ctrl_cmd = ctrl_s_axis_tdata_r[35:32];

// Interrupts
reg core_reset_r;
reg core_poke_r;
reg core_evict_r;
reg in_desc_dupl_r;
reg inv_slot_int_r;
reg inv_desc_int_r;
reg recv_dram_tag_v_r;

// Debug signlas
reg [31:0] host_debug_l,   host_debug_h;
reg        host_debug_l_v, host_debug_h_v;

wire int_valid = core_poke_r    || core_evict_r   ||  //these 2 can be removed and reset based on SM
                 in_desc_dupl_r || inv_slot_int_r ||
                 inv_desc_int_r || recv_dram_tag_v_r;

always @ (posedge clk) begin
  core_poke_r  <= 1'b0;
  core_evict_r <= 1'b0;

  host_debug_l_v <= host_debug_l_v && int_valid;
  host_debug_h_v <= host_debug_h_v && (int_valid || host_debug_l_v);

  if (ctrl_s_axis_tvalid_r)
    case(ctrl_cmd) // We always accept commands with 1 in MSB
      4'h8: begin
        host_debug_l   <= ctrl_s_axis_tdata_r[31:0];
        host_debug_l_v <= 1'b1;
      end
      4'h9: begin
        host_debug_h   <= ctrl_s_axis_tdata_r[31:0];
        host_debug_h_v <= 1'b1;
      end
      4'hC: core_poke_r  <= ctrl_s_axis_tdata_r[0];
      4'hD: core_evict_r <= ctrl_s_axis_tdata_r[0];
      4'hF: core_reset_r <= ctrl_s_axis_tdata_r[0];
    endcase

  if (rst_r) begin
      core_reset_r   <= 1'b1;
      core_poke_r    <= 1'b0;
      core_evict_r   <= 1'b0;
      host_debug_l_v <= 1'b0;
      host_debug_h_v <= 1'b0;
  end
end

assign core_reset = core_reset_r;

// It can become blocking for interrupt messages, but anyways it can
// become blocking in the switch if there are 2 messages for the FIFO
// back to back, and this FIFO almost always has room based on number
// of slots.
assign ctrl_s_axis_tready = ctrl_s_fifo_ready;

/////////////////////////////////////////////////////////////////////
/////////////////////// DECODE CORE STATUS //////////////////////////
/////////////////////////////////////////////////////////////////////

// Internal lookup table for slot addresses
localparam HDR_ADDR_BITS = $clog2(MAX_PKT_HDR_SIZE);
localparam HDR_MSB_WIDTH = 24-HDR_ADDR_BITS;

reg [24:0]              slot_addr_lut         [1:SLOT_COUNT];
reg [HDR_MSB_WIDTH-1:0] slot_hdr_addr_msb_lut [1:SLOT_COUNT];
// reg [23:0]              slot_desc_addr_lut    [1:SLOT_COUNT];

// Default values for slot addr table
integer j;
initial begin
  for (j=1;j<=SLOT_COUNT;j=j+1) begin
    slot_addr_lut[j]         = SLOT_START_ADDR + ((j-1)*SLOT_ADDR_STEP);
    slot_hdr_addr_msb_lut[j] = (HDR_START_ADDR>>$clog2(MAX_PKT_HDR_SIZE)) + (j-1);
    // slot_desc_addr_lut[j]    = DESC_START_ADDR + ((j-1)*16);
  end
end

wire [SLOT_WIDTH-1:0] slot_wr_ptr   = rpu_status_data[24+:SLOT_WIDTH];
wire                  slot_for_hdr  = rpu_status_data[31]; // && !rpu_status_data[30];
// wire                  slot_for_desc = rpu_status_data[31] &&  rpu_status_data[30];
// Slot header goes to data mem and packet to packet mem,
// So MSB of slot_wr_addr is determined by being header or not.
wire [24:0]           slot_wr_addr = {~rpu_status_data[31], rpu_status_data[23:0]};

reg [31:0] core_stat_reg, core_debug_l, core_debug_h;
reg [15:0] lb_tag_len;

always @ (posedge clk) begin
  case (rpu_status_addr)
    3'd0: core_stat_reg <= rpu_status_data;
    3'd1:
      if (slot_for_hdr)
        slot_hdr_addr_msb_lut[slot_wr_ptr] <= slot_wr_addr[24:HDR_ADDR_BITS];
      //else if (slot_for_desc)
      //  slot_desc_addr_lut[slot_wr_ptr]    <= slot_wr_addr[23:0];
      else
        slot_addr_lut        [slot_wr_ptr] <= slot_wr_addr;
    3'd2: core_debug_l  <= rpu_status_data;
    3'd3: core_debug_h  <= rpu_status_data;
    3'd4: lb_tag_len    <= rpu_status_data[15:0];
    default: begin end
  endcase

  if (rst_r) begin
    core_stat_reg <= 32'd0;
    lb_tag_len    <= 16'd0;
  end
end

/////////////////////////////////////////////////////////////////////
////////////////// GENERATE INTERCONNECT STATUS /////////////////////
/////////////////////////////////////////////////////////////////////
wire [7:0]  max_slot_count = SLOT_COUNT;
wire [15:0] bc_region_size = BC_REGION_SIZE;

reg [4:0] recv_dram_tag_r;

reg [1:0] intercon_status_state;
localparam INFO     = 2'b00;
localparam TIMER_L  = 2'b01;
localparam TIMER_H  = 2'b10;
localparam DEFAULT  = 2'b11;

wire [31:0] ints_status = {10'd0, recv_dram_tag_v_r, in_desc_dupl_r,
                           inv_slot_int_r, inv_desc_int_r, core_poke_r,
                           core_evict_r, 11'd0, recv_dram_tag_r};

localparam SD_ITEM_WIDTH   = $clog2(SEND_DESC_DEPTH)+1;
localparam DRAM_ITEM_WIDTH = $clog2(DRAM_DESC_DEPTH)+1;
localparam MSG_ITEM_WIDTH  = $clog2(MSG_FIFO_DEPTH)+1;

wire [SD_ITEM_WIDTH-1:0]   send_data_items;
wire [DRAM_ITEM_WIDTH-1:0] dram_send_items;
wire [DRAM_ITEM_WIDTH-1:0] dram_req_items;
wire [MSG_ITEM_WIDTH-1:0]  core_msg_items;

wire [31:0] fifo_occupancy = {{(8-MSG_ITEM_WIDTH){1'b0}},  core_msg_items,
                              {(8-DRAM_ITEM_WIDTH){1'b0}}, dram_req_items,
                              {(8-DRAM_ITEM_WIDTH){1'b0}}, dram_send_items,
                              {(8-SD_ITEM_WIDTH){1'b0}},   send_data_items};
// Globally synced timer
reg [63:0] timer;
reg [31:0] timer_h_r; // To avoid overflow corruption
always @ (posedge clk)
  if (rst_r)
    timer <= 64'd0;
  else
    timer <= timer + 64'd1;

// data for next state is loaded to be registered
// There are 3 initial steps after reset and then
// stays in default state, sending 4 type of statuses
// with different priorities
always @ (posedge clk) begin
  timer_h_r <= timer[63:32];

  case (intercon_status_state)
    INFO: begin
      intercon_status_state <= TIMER_L;
      intercon_status_addr  <= 3'b001;
      intercon_status_data  <= timer[31:0];
    end
    TIMER_L: begin
      intercon_status_state <= TIMER_H;
      intercon_status_addr  <= 3'b010;
      intercon_status_data  <= timer_h_r;
    end
    TIMER_H: begin
      intercon_status_state <= DEFAULT;
      intercon_status_addr  <= 3'b011;
      intercon_status_data  <= ints_status;
    end
    DEFAULT: begin
      intercon_status_state <= DEFAULT;
      if (int_valid) begin
        intercon_status_data  <= ints_status;
        intercon_status_addr  <= 3'b011;
      end else if (host_debug_l_v) begin
        intercon_status_data  <= host_debug_l;
        intercon_status_addr  <= 3'b100;
      end else if (host_debug_h_v) begin
        intercon_status_data  <= host_debug_h;
        intercon_status_addr  <= 3'b101;
      end else begin
        intercon_status_data  <= ints_status;
        intercon_status_addr  <= 3'b110;
      end
    end
  endcase

  if (rst || core_reset) begin
    intercon_status_state <= INFO;
    intercon_status_addr  <= 3'b000;
    intercon_status_data  <= {{(8-CORE_ID_WIDTH){1'b0}}, core_id,
                             max_slot_count, bc_region_size};
  end
end

/////////////////////////////////////////////////////////////////////
/////////// EXTRACTING BASE ADDR FROM/FOR INCOMING DATA /////////////
/////////////////////////////////////////////////////////////////////

// Pipeline register to load from slot LUT or packet header
wire [DATA_WIDTH-1:0] data_s_axis_tdata_r;
wire [STRB_WIDTH-1:0] data_s_axis_tkeep_r;
wire                  data_s_axis_tvalid_r;
wire                  data_s_axis_tready_r;
wire                  data_s_axis_tlast_r;
wire [TAG_WIDTH-1:0]  data_s_axis_tdest_r;
wire [PORT_WIDTH-1:0] data_s_axis_tuser_r;

wire [DATA_WIDTH-1:0] s_axis_tdata;
wire [STRB_WIDTH-1:0] s_axis_tkeep;
wire                  s_axis_tvalid;
wire                  s_axis_tready;
wire                  s_axis_tlast;
wire [TAG_WIDTH-1:0]  s_axis_tdest;
wire [PORT_WIDTH-1:0] s_axis_tuser;

// register input data
axis_register # (
    .DATA_WIDTH(DATA_WIDTH),
    .KEEP_ENABLE(1),
    .KEEP_WIDTH(STRB_WIDTH),
    .LAST_ENABLE(1),
    .ID_ENABLE(0),
    .DEST_ENABLE(1),
    .DEST_WIDTH(TAG_WIDTH),
    .USER_ENABLE(1),
    .USER_WIDTH(PORT_WIDTH),
    .REG_TYPE(DATA_S_REG_TYPE)
) data_s_reg_inst (
    .clk(clk),
    .rst(rst_r),
    // AXI input
    .s_axis_tdata (data_s_axis_tdata),
    .s_axis_tkeep (data_s_axis_tkeep),
    .s_axis_tvalid(data_s_axis_tvalid),
    .s_axis_tready(data_s_axis_tready),
    .s_axis_tlast (data_s_axis_tlast),
    .s_axis_tid   (8'd0),
    .s_axis_tdest (data_s_axis_tdest),
    .s_axis_tuser (data_s_axis_tuser),
    // AXI output
    .m_axis_tdata (data_s_axis_tdata_r),
    .m_axis_tkeep (data_s_axis_tkeep_r),
    .m_axis_tvalid(data_s_axis_tvalid_r),
    .m_axis_tready(data_s_axis_tready_r),
    .m_axis_tlast (data_s_axis_tlast_r),
    .m_axis_tid   (),
    .m_axis_tdest (data_s_axis_tdest_r),
    .m_axis_tuser (data_s_axis_tuser_r)
);

wire [PORT_WIDTH-1:0] dram_port = DRAM_PORT;
wire [63:0]           incoming_hdr;
wire                  incoming_hdr_v;

header_remover # (
  .DATA_WIDTH(DATA_WIDTH),
  .HDR_WIDTH(64),
  .DEST_WIDTH(TAG_WIDTH),
  .USER_WIDTH(PORT_WIDTH)
) dram_header_remover (
  .clk(clk),
  .rst(rst_r),

  .has_header   (data_s_axis_tuser_r==dram_port),

  .s_axis_tdata (data_s_axis_tdata_r),
  .s_axis_tkeep (data_s_axis_tkeep_r),
  .s_axis_tdest (data_s_axis_tdest_r),
  .s_axis_tuser (data_s_axis_tuser_r),
  .s_axis_tlast (data_s_axis_tlast_r),
  .s_axis_tvalid(data_s_axis_tvalid_r),
  .s_axis_tready(data_s_axis_tready_r),

  .header       (incoming_hdr),
  .header_valid (incoming_hdr_v),

  .m_axis_tdata (s_axis_tdata),
  .m_axis_tkeep (s_axis_tkeep),
  .m_axis_tdest (s_axis_tdest),
  .m_axis_tuser (s_axis_tuser),
  .m_axis_tlast (s_axis_tlast),
  .m_axis_tvalid(s_axis_tvalid),
  .m_axis_tready(s_axis_tready)
);

wire [24:0]              slot_addr;
// wire [23:0]              slot_desc_addr;
wire [HDR_MSB_WIDTH-1:0] slot_hdr_msb;
wire [25:0]              s_base_addr;

wire [SLOT_WIDTH-1:0] s_slot_ptr    = s_axis_tdest[SLOT_WIDTH-1:0];
wire [25:0]           s_header_addr = incoming_hdr[32 +: 26];

// We want to use LUTS instead of BRAM or REGS
assign slot_addr      = slot_addr_lut        [s_slot_ptr];
assign slot_hdr_msb   = slot_hdr_addr_msb_lut[s_slot_ptr];
// assign slot_desc_addr = slot_desc_addr_lut   [s_slot_ptr];
assign s_base_addr    = incoming_hdr_v ? s_header_addr : {1'b0,slot_addr};

/////////////////////////////////////////////////////////////////////
//////////// ATTACHING DRAM ADDR TO OUTGOING DRAM DATA //////////////
/////////////////////////////////////////////////////////////////////
wire [DATA_WIDTH-1:0] m_axis_tdata;
wire [STRB_WIDTH-1:0] m_axis_tkeep;
wire                  m_axis_tvalid;
wire                  m_axis_tready;
wire                  m_axis_tlast;
wire [PORT_WIDTH-1:0] m_axis_tdest;
wire [TAG_WIDTH-1:0]  m_axis_tuser;

wire [DATA_WIDTH-1:0] data_m_axis_tdata_n;
wire [STRB_WIDTH-1:0] data_m_axis_tkeep_n;
wire                  data_m_axis_tvalid_n;
wire                  data_m_axis_tready_n;
wire                  data_m_axis_tlast_n;
wire [PORT_WIDTH-1:0] data_m_axis_tdest_n;
wire [TAG_WIDTH-1:0]  data_m_axis_tuser_n;

reg  [63:0]  m_header_r;
reg          m_header_v;
wire         m_header_ready;

wire [127:0] dram_wr_desc;
wire         dram_wr_valid;
wire         dram_wr_ready;

wire ctrl_in_valid, ctrl_in_ready;
wire [ID_TAG_WIDTH+64:0] ctrl_in_desc;

always @ (posedge clk)
  if (dram_wr_valid && dram_wr_ready)
    m_header_r <= dram_wr_desc[127:64];
  else if (ctrl_in_valid && ctrl_in_desc[64+ID_TAG_WIDTH] && ctrl_in_ready)
    m_header_r <= {{(64-ID_TAG_WIDTH){1'b0}},ctrl_in_desc[63+ID_TAG_WIDTH:64]};

// Can get 1 cycle more efficient while output DMA is getting initialized
always @ (posedge clk)
  if (rst_r)
    m_header_v <= 1'b0;
  else if ((dram_wr_valid && dram_wr_ready)||
           (ctrl_in_valid && ctrl_in_desc[64+ID_TAG_WIDTH] && ctrl_in_ready))
    m_header_v <= 1'b1;
  else if (m_header_ready)
    m_header_v <= 1'b0;

header_adder # (
  .DATA_WIDTH(DATA_WIDTH),
  .HDR_WIDTH(64),
  .DEST_WIDTH(PORT_WIDTH),
  .USER_WIDTH(TAG_WIDTH)
) dram_loopback_hdr (
  .clk(clk),
  .rst(rst_r),

  .s_axis_tdata (m_axis_tdata),
  .s_axis_tkeep (m_axis_tkeep),
  .s_axis_tdest (m_axis_tdest),
  .s_axis_tuser (m_axis_tuser),
  .s_axis_tlast (m_axis_tlast),
  .s_axis_tvalid(m_axis_tvalid),
  .s_axis_tready(m_axis_tready),

  .header      (m_header_r),
  .header_valid(m_header_v),
  .header_ready(m_header_ready),

  .m_axis_tdata (data_m_axis_tdata_n),
  .m_axis_tkeep (data_m_axis_tkeep_n),
  .m_axis_tdest (data_m_axis_tdest_n),
  .m_axis_tuser (data_m_axis_tuser_n),
  .m_axis_tlast (data_m_axis_tlast_n),
  .m_axis_tvalid(data_m_axis_tvalid_n),
  .m_axis_tready(data_m_axis_tready_n)
);

// register output data
axis_register # (
    .DATA_WIDTH(DATA_WIDTH),
    .KEEP_ENABLE(1),
    .KEEP_WIDTH(STRB_WIDTH),
    .LAST_ENABLE(1),
    .ID_ENABLE(0),
    .DEST_ENABLE(1),
    .DEST_WIDTH(PORT_WIDTH),
    .USER_ENABLE(1),
    .USER_WIDTH(TAG_WIDTH),
    .REG_TYPE(DATA_M_REG_TYPE)
) data_m_reg_inst (
    .clk(clk),
    .rst(rst_r),
    // AXI input
    .s_axis_tdata (data_m_axis_tdata_n),
    .s_axis_tkeep (data_m_axis_tkeep_n),
    .s_axis_tvalid(data_m_axis_tvalid_n),
    .s_axis_tready(data_m_axis_tready_n),
    .s_axis_tlast (data_m_axis_tlast_n),
    .s_axis_tid   (8'd0),
    .s_axis_tdest (data_m_axis_tdest_n),
    .s_axis_tuser (data_m_axis_tuser_n),
    // AXI output
    .m_axis_tdata (data_m_axis_tdata),
    .m_axis_tkeep (data_m_axis_tkeep),
    .m_axis_tvalid(data_m_axis_tvalid),
    .m_axis_tready(data_m_axis_tready),
    .m_axis_tlast (data_m_axis_tlast),
    .m_axis_tid   (),
    .m_axis_tdest (data_m_axis_tdest),
    .m_axis_tuser (data_m_axis_tuser)
);

/////////////////////////////////////////////////////////////////////
/////////// AXIS TO NATIVE MEM INTERFACE WITH DESCRIPTORS ///////////
/////////////////////////////////////////////////////////////////////
wire                   dma_cmd_rd_en_n;
wire                   pkt_sent;

wire                   recv_desc_valid;
wire                   recv_desc_ready;
wire                   recv_desc_fifo_ready;
wire [15:0]            recv_desc_len;
wire [TAG_WIDTH-1:0]   recv_desc_tdest;
wire [PORT_WIDTH-1:0]  recv_desc_tuser;
wire [25:0]            recv_desc_addr;
// wire [23:0]            recv_desc_desc_addr;

wire [63:0] send_desc;
wire send_desc_valid, send_desc_ready;

// We deassert read request if read results cannot be accepted,
// similar to adding a bobble into pipe
assign dma_cmd_rd_en = dma_cmd_rd_en_n && dma_rd_resp_ready;

axis_dma # (
  .DATA_WIDTH     (DATA_WIDTH),
  .ADDR_WIDTH     (26),
  .LEN_WIDTH      (16),
  .DEST_WIDTH_IN  (TAG_WIDTH),
  .USER_WIDTH_IN  (PORT_WIDTH),
  .DEST_WIDTH_OUT (PORT_WIDTH),
  .USER_WIDTH_OUT (TAG_WIDTH),
  .MAX_PKT_HDR_SIZE(MAX_PKT_HDR_SIZE),
  .HDR_MSB_WIDTH  (HDR_MSB_WIDTH),
  .HDR_ADDR_WIDTH (24)
) axis_dma_inst (
  .clk(clk),
  .rst(rst_r),

  .s_axis_tdata (s_axis_tdata),
  .s_axis_tkeep (s_axis_tkeep),
  .s_axis_tvalid(s_axis_tvalid),
  .s_axis_tready(s_axis_tready),
  .s_axis_tlast (s_axis_tlast),
  .s_axis_tdest (s_axis_tdest),
  .s_axis_tuser (s_axis_tuser),

  .wr_base_addr (s_base_addr),
  .hdr_wr_addr_msb(slot_hdr_msb),
  // .slot_desc_addr (slot_desc_addr),
  .hdr_en(!incoming_hdr_v),

  .m_axis_tdata (m_axis_tdata),
  .m_axis_tkeep (m_axis_tkeep),
  .m_axis_tvalid(m_axis_tvalid),
  .m_axis_tready(m_axis_tready),
  .m_axis_tlast (m_axis_tlast),
  .m_axis_tdest (m_axis_tdest),
  .m_axis_tuser (m_axis_tuser),

  .mem_wr_en   (dma_cmd_wr_en),
  .mem_wr_strb (dma_cmd_wr_strb),
  .mem_wr_addr (dma_cmd_wr_addr),
  .mem_wr_data (dma_cmd_wr_data),
  .mem_wr_last (dma_cmd_wr_last),
  .mem_wr_ready(dma_cmd_wr_ready),

  .mem_hdr_wr_en(dma_cmd_hdr_wr_en),
  .mem_hdr_wr_addr(dma_cmd_hdr_wr_addr),

  .mem_rd_en        (dma_cmd_rd_en_n),
  .mem_rd_addr      (dma_cmd_rd_addr),
  .mem_rd_last      (dma_cmd_rd_last),
  .mem_rd_ready     (dma_cmd_rd_ready && dma_rd_resp_ready),
  .mem_rd_data      (dma_rd_resp_data),
  .mem_rd_data_v    (dma_rd_resp_valid),
  .mem_rd_data_ready(dma_rd_resp_ready),

  .recv_desc_valid(recv_desc_valid),
  .recv_desc_ready(recv_desc_ready),
  .recv_desc_len  (recv_desc_len),
  .recv_desc_tdest(recv_desc_tdest),
  .recv_desc_tuser(recv_desc_tuser),
  .recv_desc_addr (recv_desc_addr),
  // .recv_desc_desc_addr(recv_desc_desc_addr),

  .send_desc_valid(send_desc_valid),
  .send_desc_ready(send_desc_ready),
  .send_desc_addr({1'b0,send_desc[32+:25]}),
  .send_desc_len(send_desc[15:0]),
  .send_desc_tdest(send_desc[PORT_WIDTH+23:24]),
  .send_desc_tuser(send_desc[TAG_WIDTH+15:16]),

  .pkt_sent       (pkt_sent)

);

/////////////////////////////////////////////////////////////////////
/////////////////// DATA IN DESCRIPTOR FIFO /////////////////////////
/////////////////////////////////////////////////////////////////////
// A desc FIFO for received data
wire [63:0] recv_desc = {6'd0,recv_desc_addr,
                        {(8-PORT_WIDTH){1'b0}},recv_desc_tuser,
                        {(8-SLOT_WIDTH){1'b0}},recv_desc_tdest[SLOT_WIDTH-1:0],
                        recv_desc_len};

wire recv_from_dram = recv_desc_valid && (recv_desc_tuser==dram_port);
wire recv_tag_zero  = recv_desc_valid && (recv_desc_tdest=={TAG_WIDTH{1'b0}});

wire        in_desc_valid_n;
wire [63:0] in_desc_n;
wire        in_desc_ready_n;

basic_fifo # (
  .DEPTH(RECV_DESC_DEPTH),
  .DATA_WIDTH(64)
) recvd_data_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(1'b0),

  .din_valid(recv_desc_valid && (!recv_from_dram) && (!recv_tag_zero)),
  .din(recv_desc),
  .din_ready(recv_desc_fifo_ready),

  .dout_valid(in_desc_valid_n),
  .dout(in_desc_n),
  .dout_ready(in_desc_ready_n),

  .item_count(),
  .full(),
  .empty()
);

wire       recv_dram_tag_fifo_ready = 1'b1;

always @ (posedge clk) begin
  recv_dram_tag_r     <= recv_desc_tdest[4:0];
  recv_dram_tag_v_r   <= recv_desc_valid && recv_from_dram && (!recv_tag_zero);
  if (rst_r)
    recv_dram_tag_v_r <= 1'b0;
end

assign recv_desc_ready = (recv_desc_fifo_ready && (!recv_from_dram))  ||
                         (recv_from_dram && recv_dram_tag_fifo_ready) ||
                         recv_tag_zero;
/////////////////////////////////////////////////////////////////////
//////////// PARSING CORE DESCRIPTOR AND FIFOS PER TYPE /////////////
/////////////////////////////////////////////////////////////////////
wire [3:0] out_desc_type = out_desc[63:60];

// out_desc type is valid when out_desc_2nd is not asserted
wire core_data_wr =  (out_desc_type == 4'd0)  && (!out_desc_2nd);
wire core_ctrl_wr = ((out_desc_type == 4'd1)  ||
                     (out_desc_type == 4'd2)  ||
                     (out_desc_type == 4'd3)) && (!out_desc_2nd);
wire core_dram_wr =  (out_desc_type == 4'd4)  && (!out_desc_2nd);
wire core_dram_rd =  (out_desc_type == 4'd5)  && (!out_desc_2nd);

reg out_desc_err;

reg [63:0] out_desc_r;
reg core_dram_wr_r;
reg core_dram_rd_r;

// Handlign 2 cycle DRAM descs
always @ (posedge clk) begin
  if (out_desc_valid && out_desc_ready) begin
    if (core_dram_wr) // Override to DRAM port
      out_desc_r <= {out_desc[63:24+PORT_WIDTH],
                     dram_port, out_desc[23:0]};
    else
      out_desc_r <= out_desc;

    // Second cycle of dram desc core_dram_wr/rd are 0
    core_dram_wr_r <= core_dram_wr;
    core_dram_rd_r <= core_dram_rd;
  end
  if (rst) begin
    core_dram_wr_r <= 1'b0;
    core_dram_rd_r <= 1'b0;
  end
end

// A desc FIFO for send data from core
wire core_data_wr_ready;
wire core_data_wr_valid_f, core_data_wr_ready_f;
wire [63:0] core_data_wr_desc_f;

basic_fifo # (
  .DEPTH(SEND_DESC_DEPTH),
  .DATA_WIDTH(64)
) send_data_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(core_reset),

  .din_valid(out_desc_valid && core_data_wr),
  .din(out_desc),
  .din_ready(core_data_wr_ready),

  .dout_valid(core_data_wr_valid_f),
  .dout(core_data_wr_desc_f),
  .dout_ready(core_data_wr_ready_f),

  .item_count(send_data_items),
  .full(),
  .empty()
);

// A desc FIFO for msgs to LB
wire core_ctrl_wr_ready;

wire core_ctrl_wr_valid_f, core_ctrl_wr_ready_f;
wire [63:0] core_ctrl_wr_desc_f;

basic_fifo # (
  .DEPTH(SEND_DESC_DEPTH),
  .DATA_WIDTH(64)
) send_ctrl_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(core_reset),

  .din_valid(out_desc_valid && core_ctrl_wr),
  .din(out_desc),
  .din_ready(core_ctrl_wr_ready),

  .dout_valid(core_ctrl_wr_valid_f),
  .dout(core_ctrl_wr_desc_f),
  .dout_ready(core_ctrl_wr_ready_f),

  .item_count(),
  .full(),
  .empty()
);

// A register to look up the send adddress based on slot
reg  [24:0]           send_slot_addr [1:SLOT_COUNT];
reg  [15:0]           send_slot_len  [1:SLOT_COUNT];
wire [SLOT_WIDTH-1:0] ctrl_out_slot_ptr = core_ctrl_wr_desc_f[16 +: SLOT_WIDTH];

always @ (posedge clk)
  if (core_ctrl_wr_valid_f && core_ctrl_wr_ready_f) begin
    send_slot_addr [ctrl_out_slot_ptr] <= core_ctrl_wr_desc_f[32+:25];
    send_slot_len  [ctrl_out_slot_ptr] <= core_ctrl_wr_desc_f[15:0];
  end

// A FIFO for dram write requests
wire core_dram_wr_ready;
wire core_dram_wr_valid_f, core_dram_wr_ready_f;
wire [127:0] core_dram_wr_desc_f;

basic_fifo # (
  .DEPTH(DRAM_DESC_DEPTH),
  .DATA_WIDTH(128)
) dram_send_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(core_reset),

  .din_valid(out_desc_valid && core_dram_wr_r),
  .din({out_desc, out_desc_r}),
  .din_ready(core_dram_wr_ready),

  .dout_valid(core_dram_wr_valid_f),
  .dout(core_dram_wr_desc_f),
  .dout_ready(core_dram_wr_ready_f),

  .item_count(dram_send_items),
  .full(),
  .empty()
);

// A desc FIFO for dram read msgs
wire core_dram_rd_ready;
wire core_dram_rd_valid_f, core_dram_rd_ready_f;
wire [127:0] core_dram_rd_desc_f;

basic_fifo # (
  .DEPTH(DRAM_DESC_DEPTH),
  .DATA_WIDTH(128)
) send_dram_ctrl_fifo (
  .clk(clk),
  // After core reset no need to get the DRAM data anymore
  .rst(rst_r),
  .clear(core_reset_r),

  .din_valid(out_desc_valid && core_dram_rd_r),
  .din({out_desc, out_desc_r}),
  .din_ready(core_dram_rd_ready),

  .dout_valid(core_dram_rd_valid_f),
  .dout(core_dram_rd_desc_f),
  .dout_ready(core_dram_rd_ready_f),

  .item_count(dram_req_items),
  .full(),
  .empty()
);

// For 2 cycle DRAM messages, we check the FIFO in the first cycle,
// so no need to check when receiving second part.
assign out_desc_ready = (core_data_wr_ready && core_data_wr) ||
                        (core_ctrl_wr_ready && core_ctrl_wr) ||
                        (core_dram_wr_ready && core_dram_wr) ||
                        (core_dram_rd_ready && core_dram_rd) ||
                        (out_desc_2nd) ||
                        (out_desc_type > 4'd5); // Ignore msg

/////////////////////////////////////////////////////////////////////
////////////////// INCOMING CTRL DESCRIPTOR FIFO ////////////////////
///////////////////// PKT SENT DESCRIPTOR FIFO //////////////////////
//////////////// DRAM READ REQUEST PARSER AND FIFO //////////////////
/////////////////////////////////////////////////////////////////////

wire [24:0] ctrl_send_addr   = send_slot_addr[ctrl_in_slot_ptr];
wire [15:0] ctrl_lp_send_len = send_slot_len [ctrl_in_slot_ptr];

wire ctrl_desc_cmd = (ctrl_cmd == 4'h0) || (ctrl_cmd == 4'h1);
wire [ID_TAG_WIDTH+64:0] parsed_ctrl_desc = (ctrl_cmd==4'd1) ?
              {1'b1,ctrl_s_axis_tdata_r[ID_TAG_WIDTH-1:0],7'd0, ctrl_send_addr,
               ctrl_s_axis_tdata_r[31:16], ctrl_lp_send_len} :
              {1'b0,{(ID_TAG_WIDTH+7){1'b0}}, ctrl_send_addr,ctrl_s_axis_tdata_r[31:0]};

// A desc FIFO for send data based on LB message

basic_fifo # (
  .DEPTH(RECV_DESC_DEPTH),
  .DATA_WIDTH(64+ID_TAG_WIDTH+1)
) recvd_ctrl_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(1'b0), // core reset itself comes on this channel

  .din_valid(ctrl_s_axis_tvalid_r && ctrl_desc_cmd),
  .din(parsed_ctrl_desc),
  .din_ready(ctrl_s_fifo_ready),

  .dout_valid(ctrl_in_valid),
  .dout(ctrl_in_desc),
  .dout_ready(ctrl_in_ready),

  .item_count(),
  .full(),
  .empty()
);

/////////////////////////////////////////////////////////////////////

// Latch the output descriptor and send it to controller when
// it is transmitted
wire pkt_sent_ready; // should always be ready
(* KEEP = "TRUE" *) reg [63:0] latched_send_desc;

always @ (posedge clk)
    if (send_desc_valid && send_desc_ready)
        latched_send_desc <= send_desc;

wire pkt_sent_is_dram = (latched_send_desc[PORT_WIDTH+23:24]==dram_port);

// A FIFO for outgoing control messages
wire pkt_sent_valid_f, pkt_sent_ready_f;
wire [63:0] pkt_sent_desc_f;

basic_fifo # (
  .DEPTH(SEND_DESC_DEPTH),
  .DATA_WIDTH(64)
) pkt_sent_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(core_reset_r), // can be 1'b0

  .din_valid(pkt_sent && (!pkt_sent_is_dram)),
  .din(latched_send_desc),
  .din_ready(pkt_sent_ready),

  .dout_valid(pkt_sent_valid_f),
  .dout(pkt_sent_desc_f),
  .dout_ready(pkt_sent_ready_f),

  .item_count(),
  .full(),
  .empty()
);

/////////////////////////////////////////////////////////////////////
reg        dram_req_valid;
wire       dram_req_ready;
reg [31:0] dram_req_3, dram_req_2, dram_req_1, dram_req_0;

// A desc FIFO for send dram based on dram read message
wire dram_in_valid, dram_in_ready;
wire [127:0] dram_in_desc;

basic_fifo # (
  .DEPTH(DRAM_DESC_DEPTH),
  .DATA_WIDTH(128)
) recvd_dram_rd_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(1'b0),

  .din_valid(dram_req_valid),
  .din({dram_req_3, dram_req_2, dram_req_1, dram_req_0}),
  .din_ready(dram_req_ready),

  .dout_valid(dram_in_valid),
  .dout(dram_in_desc),
  .dout_ready(dram_in_ready),

  .item_count(),
  .full(),
  .empty()
);

/////////////////////////////////////////////////////////////////////
///////////////// DRAM DESCRIPTOR WIDTH CHANGE //////////////////////
/////////////////////////////////////////////////////////////////////

// For DRAM descriptor the first word is descriptor followed by DRAM address
reg [2:0] dram_req_state;  // 0 to 3 for each 32-bit word, 4 for error

// Incoming dram desc
always @ (posedge clk) begin
  dram_req_valid <= 1'b0;

  if (dram_s_axis_tvalid && dram_req_ready)
    if (dram_s_axis_tlast)
      case (dram_req_state)
        3'd0: begin
          dram_req_state <= 3'd4;
        end
        3'd1: begin
          dram_req_state <= 3'd4;
        end
        3'd2: begin
          dram_req_state <= 3'd4;
        end
        3'd3: begin
          dram_req_3     <= dram_s_axis_tdata;
          dram_req_valid <= 1'b1;
          dram_req_state <= 3'd0;
        end
        3'd4: begin
          dram_req_state <= 3'd0; // Ignored the bad req
        end
        default: begin end
      endcase
    else
      case (dram_req_state)
        3'd0: begin
          // Overriding dram port and setting the tag to 0
          dram_req_0     <= {{(8-PORT_WIDTH){1'b0}}, dram_port,
                             8'd0, dram_s_axis_tdata[15:0]};
          dram_req_state <= 3'd1;
        end
        3'd1: begin
          dram_req_1     <= dram_s_axis_tdata;
          dram_req_state <= 3'd2;
        end
        3'd2: begin
          dram_req_2     <= dram_s_axis_tdata;
          dram_req_state <= 3'd3;
        end
        3'd3: begin
          dram_req_state <= 3'd4;
        end
        3'd4: begin
          dram_req_state <= 3'd4; // Stay in error state until tlast
        end
        default: begin end
      endcase

  if (rst_r) begin
    dram_req_valid <= 1'b0;
    dram_req_state <= 3'd0;
  end
end

assign dram_s_axis_tready = dram_req_ready;

// Outgoing dram desc
reg  [31:0] dram_m_axis_tdata_n;
wire        dram_m_axis_tvalid_n;
wire        dram_m_axis_tready_n;
wire        dram_m_axis_tlast_n;
reg  [2:0]  send_dram_rd_state; // 0 is idle, 1-2-3-4 each part

always @ (posedge clk) begin
  if (core_dram_rd_valid_f)
    case (send_dram_rd_state)
      3'd0: send_dram_rd_state <= 3'd1;
      3'd1: if (dram_m_axis_tready_n) send_dram_rd_state <= 3'd2;
      3'd2: if (dram_m_axis_tready_n) send_dram_rd_state <= 3'd3;
      3'd3: if (dram_m_axis_tready_n) send_dram_rd_state <= 3'd4;
      3'd4: if (dram_m_axis_tready_n) send_dram_rd_state <= 3'd0;
      default: send_dram_rd_state <= 3'd0; // Should not happen
    endcase

  if (rst_r)
    send_dram_rd_state <= 3'd0;
end

always @ (*)
  case (send_dram_rd_state)
    3'd1:    dram_m_axis_tdata_n = core_dram_rd_desc_f[31:0];
    3'd2:    dram_m_axis_tdata_n = core_dram_rd_desc_f[63:32];
    3'd3:    dram_m_axis_tdata_n = core_dram_rd_desc_f[95:64];
    3'd4:    dram_m_axis_tdata_n = core_dram_rd_desc_f[127:96];
    default: dram_m_axis_tdata_n = core_dram_rd_desc_f[31:0];
  endcase

assign dram_m_axis_tvalid_n = (send_dram_rd_state != 3'd0);
assign dram_m_axis_tlast_n  = (send_dram_rd_state == 3'd4);
assign core_dram_rd_ready_f = (send_dram_rd_state == 3'd4) && dram_m_axis_tready_n;

// register output dram data
axis_register # (
    .DATA_WIDTH(32),
    .KEEP_ENABLE(0),
    .LAST_ENABLE(1),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(0),
    .REG_TYPE(DRAM_M_REG_TYPE)
) dram_m_reg_inst (
    .clk(clk),
    .rst(rst_r),
    // AXI input
    .s_axis_tdata (dram_m_axis_tdata_n),
    .s_axis_tkeep (4'd0),
    .s_axis_tvalid(dram_m_axis_tvalid_n),
    .s_axis_tready(dram_m_axis_tready_n),
    .s_axis_tlast (dram_m_axis_tlast_n),
    .s_axis_tid   (8'd0),
    .s_axis_tdest (8'd0),
    .s_axis_tuser (1'd0),
    // AXI output
    .m_axis_tdata (dram_m_axis_tdata),
    .m_axis_tkeep (),
    .m_axis_tvalid(dram_m_axis_tvalid),
    .m_axis_tready(dram_m_axis_tready),
    .m_axis_tlast (dram_m_axis_tlast),
    .m_axis_tid   (),
    .m_axis_tdest (),
    .m_axis_tuser ()
);

/////////////////////////////////////////////////////////////////////
/////////////////////////// ARBITERS ////////////////////////////////
/////////////////////////////////////////////////////////////////////

// Data out arbiter between core direct send data and LB message
// Priority to messages from the LB
wire [63:0] send_pkt_desc;
wire send_pkt_valid, send_pkt_ready;

wire   data_select          = ctrl_in_valid;
assign send_pkt_valid       = ctrl_in_valid || core_data_wr_valid_f;
assign send_pkt_desc        = data_select ? ctrl_in_desc[63:0] : core_data_wr_desc_f;
assign core_data_wr_ready_f = send_pkt_ready && (!data_select);
assign ctrl_in_ready        = send_pkt_ready &&   data_select ;

// DRAM request out arbiter between DRAM request and core write.
// Priority to core write.
wire   dram_select   = core_dram_wr_valid_f;
assign dram_wr_valid = core_dram_wr_valid_f || dram_in_valid;
assign dram_wr_desc  = dram_select ? core_dram_wr_desc_f : dram_in_desc;

assign core_dram_wr_ready_f =   dram_select  && core_dram_wr_valid_f && dram_wr_ready;
assign dram_in_ready        = (!dram_select) && dram_in_valid && dram_wr_ready;

// Arbiter between packets and DRAM out data, round robin
reg dram_next_selection_r;
always @ (posedge clk)
  if (rst_r)
    dram_next_selection_r <= 1'b0;
  else if (dram_wr_valid && dram_wr_ready)
    dram_next_selection_r <= 1'b0;
  else if (send_pkt_valid && send_pkt_ready)
    dram_next_selection_r <= 1'b1;

reg dram_out_select;
always @ (*)
  if (!dram_wr_valid)
    dram_out_select = 1'b0;
  else if (!send_pkt_valid)
    dram_out_select = 1'b1;
  else
    dram_out_select = dram_next_selection_r;

assign dram_wr_ready   = dram_wr_valid && dram_out_select && send_desc_ready;
assign send_pkt_ready  = send_pkt_valid && !dram_out_select && send_desc_ready && pkt_sent_ready;
assign send_desc       = dram_out_select ? dram_wr_desc[63:0] : send_pkt_desc;
assign send_desc_valid = dram_wr_valid || (send_pkt_valid && pkt_sent_ready);

// CTRL out arbiter between packet sent and core message to LB
// Priority to releasing a desc
wire [63:0] ctrl_out_data;
wire ctrl_out_valid, ctrl_out_ready;

wire   ctrl_select          = pkt_sent_valid_f;
assign ctrl_out_valid       = pkt_sent_valid_f || core_ctrl_wr_valid_f;
assign ctrl_out_data        = ctrl_select ? pkt_sent_desc_f : core_ctrl_wr_desc_f;
assign core_ctrl_wr_ready_f = ctrl_out_ready && (!ctrl_select);
assign pkt_sent_ready_f     = ctrl_out_ready &&   ctrl_select ;

// Latching the output to deal with the next stage valid/ready
reg [35:0] ctrl_m_axis_tdata_r;
reg        ctrl_m_axis_tvalid_r;

always @ (posedge clk) begin
  if (ctrl_out_valid && (!ctrl_m_axis_tvalid_r || ctrl_m_axis_tready)) begin
    ctrl_m_axis_tdata_r  <= {ctrl_out_data[63:60], ctrl_out_data[31:0]};
    ctrl_m_axis_tvalid_r <= 1'b1;
  end else if (ctrl_m_axis_tready && !ctrl_out_valid) begin
    ctrl_m_axis_tvalid_r <= 1'b0;
  end
  if (rst_r) begin
    ctrl_m_axis_tvalid_r <= 1'b0;
    ctrl_m_axis_tdata_r  <= 36'd0;
  end
end

assign ctrl_m_axis_tvalid = ctrl_m_axis_tvalid_r;
assign ctrl_m_axis_tdata  = ctrl_m_axis_tdata_r;
assign ctrl_out_ready     = (!ctrl_m_axis_tvalid_r) || ctrl_m_axis_tready;

/////////////////////////////////////////////////////////////////////
/////////////////////// BROADCAST MESSAGING /////////////////////////
/////////////////////////////////////////////////////////////////////

// Deassert write for the sender core.
// Later grouping can be implemented as well in the fpga_core module
always @ (posedge clk) begin
  bc_msg_in       <= core_msg_in;
  bc_msg_in_user  <= core_msg_in_user;
  bc_msg_in_valid <= core_msg_in_valid && (core_msg_in_user!=core_id);
  if (rst_r)
    bc_msg_in_valid <= 1'b0;
end

basic_fifo # (
  .DEPTH(MSG_FIFO_DEPTH),
  .DATA_WIDTH(MSG_WIDTH)
) core_msg_out_fifo (
  .clk(clk),
  .rst(rst_r),
  .clear(core_reset_r),

  .din_valid(bc_msg_out_valid),
  .din(bc_msg_out),
  .din_ready(bc_msg_out_ready),

  .dout_valid(core_msg_out_valid),
  .dout(core_msg_out),
  .dout_ready(core_msg_out_ready),

  .item_count(core_msg_items),
  .full(),
  .empty()
);

///////////////////////////////////////////////////////////////////////////
//////////////////////// ACTIVE SLOTS STATE/// ////////////////////////////
///////////////////////////////////////////////////////////////////////////
// Non-DRAM related output descs
wire done_w_slot = ((out_desc_type == 4'd0) ||
                    (out_desc_type == 4'd1) ||
                    (out_desc_type == 4'd2)) &&
                    (!out_desc_2nd) &&
                    out_desc_valid && out_desc_ready;

// A set of registers for better timing
(* KEEP = "TRUE" *) reg [SLOT_WIDTH-1:0] out_desc_slot_r;
(* KEEP = "TRUE" *) reg                  done_w_slot_r;

always @ (posedge clk) begin
  out_desc_slot_r <= out_desc[16+:SLOT_WIDTH];
  done_w_slot_r   <= done_w_slot;
  if (rst_r)
    done_w_slot_r <= 1'b0;
end

reg [SLOT_COUNT:1] slots_in_prog;
reg [SLOT_COUNT:1] slots_to_send;
reg [SLOT_COUNT:1] override_in_slot_err;
reg [SLOT_COUNT:1] override_out_slot_err;
reg [SLOT_COUNT:1] invalid_out_slot_err;

wire [SLOT_WIDTH-1:0] in_desc_slot_n  = in_desc_n[16+:SLOT_WIDTH];
wire [SLOT_WIDTH-1:0] pkt_sent_slot_f = pkt_sent_desc_f[16+:SLOT_WIDTH];

always @ (posedge clk) begin
  if (in_desc_valid_n && in_desc_ready_n)
    slots_in_prog[in_desc_slot_n]  <= 1'b1;
  if (done_w_slot_r)
    slots_in_prog[out_desc_slot_r] <= 1'b0;

  if (pkt_sent_valid_f && pkt_sent_ready_f)
    slots_to_send[pkt_sent_slot_f] <= 1'b0;
  if (done_w_slot_r)
    slots_to_send[out_desc_slot_r] <= 1'b1;

  if (rst_r || core_reset_r) begin
    slots_in_prog <= {SLOT_COUNT{1'b0}};
    slots_to_send <= {SLOT_COUNT{1'b0}};
  end
end

/////////////////////////////////////////////////////////////////////
///////////////////////// ERROR CATCHING ////////////////////////////
/////////////////////////////////////////////////////////////////////

always @ (posedge clk) begin
  // Drop on the fly packet if slot is already in the interconnect
  // and interrupt the core
  in_desc_dupl_r  <= 1'b0;
  // Single cycle interrupts to the core
  inv_slot_int_r  <= 1'b0;

  if (in_desc_valid_n && in_desc_ready_n &&
                (slots_to_send[in_desc_slot_n] ||
                 slots_in_prog[in_desc_slot_n])) begin
    override_in_slot_err [in_desc_slot_n] <= 1'b1;
    in_desc_dupl_r                        <= 1'b1;
  end

  if (done_w_slot_r && (out_desc_slot_r!=0) && !slots_in_prog[out_desc_slot_r]) begin
    invalid_out_slot_err [out_desc_slot_r] <= 1'b1;
    out_desc_err                           <= 1'b1;
    inv_slot_int_r                         <= 1'b1;
  end

  if (done_w_slot_r && (out_desc_slot_r!=0) && slots_to_send[out_desc_slot_r]) begin
    override_out_slot_err[out_desc_slot_r] <= 1'b1;
    out_desc_err                           <= 1'b1;
  end

  if (rst_r || core_reset_r) begin
    override_in_slot_err  <= {SLOT_COUNT{1'b0}};
    override_out_slot_err <= {SLOT_COUNT{1'b0}};
    invalid_out_slot_err  <= {SLOT_COUNT{1'b0}};
    in_desc_dupl_r        <= 1'b0;
    out_desc_err          <= 1'b0;
    inv_slot_int_r        <= 1'b0;
  end
end

reg invalid_out_desc;
always @ (posedge clk) begin
  inv_desc_int_r <= 1'b0;
  if (rst_r || core_reset_r)
    invalid_out_desc <= 1'b0;
  else if ((out_desc_type>4'd5) && out_desc_valid
            && (!out_desc_2nd)) begin
    invalid_out_desc <= 1'b1;
    inv_desc_int_r <= 1'b1; // single cycle signal
  end
end

// One pipeline register to handle in_desc drop and apply offset
reg         in_desc_valid_r;
reg  [63:0] in_desc_r;

wire [31:0] in_desc_addr_adj = in_desc_n[63:32] + lb_tag_len;
wire [15:0] in_desc_len_adj  = in_desc_n[15:0]  - lb_tag_len;

always @ (posedge clk) begin
  if (in_desc_valid_n && in_desc_ready_n) begin
    in_desc_valid_r <= 1'b1;
    in_desc_r       <= {in_desc_addr_adj, in_desc_n[31:16], in_desc_len_adj};
  end else if (in_desc_taken || in_desc_dupl_r) begin
    in_desc_valid_r <= 1'b0;
  end

  if (rst_r) begin
    in_desc_valid_r <= 1'b0;
  end
end

assign in_desc_ready_n = in_desc_taken || in_desc_dupl_r || !in_desc_valid_r;
assign in_desc_valid   = in_desc_valid_r && !in_desc_dupl_r;
assign in_desc         = in_desc_r;

/////////////////////////////////////////////////////////////////////
//////////////////////// STAT COLLECTION ////////////////////////////
/////////////////////////////////////////////////////////////////////
wire [31:0] incoming_byte_count, incoming_frame_count, incoming_stall_count;
wire [31:0] outgoing_byte_count, outgoing_frame_count, outgoing_stall_count;

(* KEEP = "TRUE" *) reg [STRB_WIDTH-1:0] data_s_axis_tkeep_mon;
(* KEEP = "TRUE" *) reg                  data_s_axis_tvalid_mon;
(* KEEP = "TRUE" *) reg                  data_s_axis_tready_mon;
(* KEEP = "TRUE" *) reg                  data_s_axis_tlast_mon;

(* KEEP = "TRUE" *) reg [STRB_WIDTH-1:0] data_m_axis_tkeep_mon;
(* KEEP = "TRUE" *) reg                  data_m_axis_tvalid_mon;
(* KEEP = "TRUE" *) reg                  data_m_axis_tready_mon;
(* KEEP = "TRUE" *) reg                  data_m_axis_tlast_mon;

always @ (posedge clk) begin
  data_s_axis_tkeep_mon  <= data_s_axis_tkeep;
  data_s_axis_tvalid_mon <= data_s_axis_tvalid;
  data_s_axis_tready_mon <= data_s_axis_tready;
  data_s_axis_tlast_mon  <= data_s_axis_tlast;
  data_m_axis_tkeep_mon  <= data_m_axis_tkeep;
  data_m_axis_tvalid_mon <= data_m_axis_tvalid;
  data_m_axis_tready_mon <= data_m_axis_tready;
  data_m_axis_tlast_mon  <= data_m_axis_tlast;

  if (rst_r) begin
    data_s_axis_tvalid_mon <= 1'b0;
    data_m_axis_tvalid_mon <= 1'b0;
  end
end

axis_stat # (
  .KEEP_WIDTH(STRB_WIDTH),
  .KEEP_ENABLE(1),
  .BYTE_COUNT_WIDTH (32),
  .FRAME_COUNT_WIDTH(32)
) incoming_stat_inst (
  .clk(clk),
  .rst(rst_r),
  .clear(1'b0),

  .monitor_axis_tkeep (data_s_axis_tkeep_mon),
  .monitor_axis_tvalid(data_s_axis_tvalid_mon),
  .monitor_axis_tready(data_s_axis_tready_mon),
  .monitor_axis_tlast (data_s_axis_tlast_mon),
  .monitor_drop_pulse (1'b0),

  .byte_count(incoming_byte_count),
  .frame_count(incoming_frame_count),
  .drop_count(),
  .stall_count(incoming_stall_count)
);

axis_stat # (
  .KEEP_WIDTH(STRB_WIDTH),
  .KEEP_ENABLE(1),
  .BYTE_COUNT_WIDTH (32),
  .FRAME_COUNT_WIDTH(32)
) outgoing_stat_inst (
  .clk(clk),
  .rst(rst_r),
  .clear(1'b0),

  .monitor_axis_tkeep (data_m_axis_tkeep_mon),
  .monitor_axis_tvalid(data_m_axis_tvalid_mon),
  .monitor_axis_tready(data_m_axis_tready_mon),
  .monitor_axis_tlast (data_m_axis_tlast_mon),
  .monitor_drop_pulse (1'b0),

  .byte_count(outgoing_byte_count),
  .frame_count(outgoing_frame_count),
  .drop_count(),
  .stall_count(outgoing_stall_count)
);

// Debug readback words
wire [31:0] intercon_errs = {14'd0, out_desc_err, invalid_out_desc,
          5'd0, !recv_desc_fifo_ready, !ctrl_s_fifo_ready, !dram_req_ready,
          2'd0, !core_data_wr_ready,   !core_ctrl_wr_ready, !core_dram_wr_ready,
                !core_dram_rd_ready,   !pkt_sent_ready,     !bc_msg_out_ready};

reg [3:0] stat_addr_r;

always @ (posedge clk) begin
  stat_addr_r <= stat_addr;

  case (stat_addr_r)
    4'h0: stat_data <= incoming_byte_count;
    4'h1: stat_data <= incoming_frame_count;
    4'h2: stat_data <= incoming_stall_count;
    4'h3: stat_data <= outgoing_byte_count;
    4'h4: stat_data <= outgoing_frame_count;
    4'h5: stat_data <= outgoing_stall_count;
    4'h6: stat_data <= core_debug_l;
    4'h7: stat_data <= core_debug_h;
    4'h8: stat_data <= core_stat_reg;
    4'h9: stat_data <= intercon_errs;
    4'hA: stat_data <= {{(32-SLOT_COUNT){1'b0}}, slots_in_prog};
    4'hB: stat_data <= {{(32-SLOT_COUNT){1'b0}}, slots_to_send};
    4'hC: stat_data <= {{(32-SLOT_COUNT){1'b0}}, override_in_slot_err};
    4'hD: stat_data <= {{(32-SLOT_COUNT){1'b0}}, override_out_slot_err};
    4'hE: stat_data <= {{(32-SLOT_COUNT){1'b0}}, invalid_out_slot_err};
    4'hF: stat_data <= 32'd0;
  endcase
end

endmodule

`resetall
