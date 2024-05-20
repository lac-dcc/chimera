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

module test_rpu;

parameter INIT_ROMS        = 1;

parameter DATA_WIDTH       = 128;
parameter CTRL_WIDTH       = 32+4; //DON'T CHANGE
parameter DRAM_WIDTH       = 32;   //DON'T CHANGE

parameter CORE_WIDTH       = 4;
parameter PORT_WIDTH       = 3;
parameter DRAM_PORT        = 4;
parameter SLOT_COUNT       = 16;

parameter STRB_WIDTH       = DATA_WIDTH/8;
parameter SLOT_WIDTH       = $clog2(SLOT_COUNT+1);
parameter TAG_WIDTH        = (SLOT_WIDTH>5)? SLOT_WIDTH:5;
parameter ID_TAG_WIDTH     = CORE_WIDTH+TAG_WIDTH;

parameter IMEM_SIZE        = 65536;
parameter PMEM_SIZE        = 1048576;
parameter DMEM_SIZE        = 32768;
parameter BC_REGION_SIZE   = 8192;
parameter SLOW_M_B_LINES   = 4096;
parameter FAST_M_B_LINES   = 1024;
parameter BC_START_ADDR    = 32'h00800000+DMEM_SIZE-BC_REGION_SIZE;
parameter CORE_MSG_WIDTH   = 32+4+$clog2(BC_REGION_SIZE)-2;

parameter RECV_DESC_DEPTH  = SLOT_COUNT;
parameter SEND_DESC_DEPTH  = SLOT_COUNT;
parameter DRAM_DESC_DEPTH  = 8;
parameter MSG_FIFO_DEPTH   = 16;
parameter SLOT_START_ADDR  = 16'h0;
parameter SLOT_ADDR_STEP   = 22'h004000;
parameter HDR_START_ADDR   = 22'h104000;
parameter MAX_PKT_HDR_SIZE = 128;

// Testbench signals
reg                       clk;
reg                       rst;
reg  [DATA_WIDTH-1:0]     data_s_axis_tdata;
reg  [STRB_WIDTH-1:0]     data_s_axis_tkeep;
reg                       data_s_axis_tvalid;
wire                      data_s_axis_tready;
reg                       data_s_axis_tlast;
reg  [TAG_WIDTH-1:0]      data_s_axis_tdest;
reg  [PORT_WIDTH-1:0]     data_s_axis_tuser;

wire [DATA_WIDTH-1:0]     data_m_axis_tdata;
wire [STRB_WIDTH-1:0]     data_m_axis_tkeep;
wire                      data_m_axis_tvalid;
reg                       data_m_axis_tready;
wire                      data_m_axis_tlast;
wire [PORT_WIDTH-1:0]     data_m_axis_tdest;
wire [ID_TAG_WIDTH-1:0]   data_m_axis_tuser;

reg  [CTRL_WIDTH-1:0]     ctrl_s_axis_tdata;
reg                       ctrl_s_axis_tvalid;
wire                      ctrl_s_axis_tready;

wire [CTRL_WIDTH-1:0]     ctrl_m_axis_tdata;
wire                      ctrl_m_axis_tvalid;
reg                       ctrl_m_axis_tready;

reg  [DRAM_WIDTH-1:0]     dram_s_axis_tdata;
reg                       dram_s_axis_tvalid;
wire                      dram_s_axis_tready;
reg                       dram_s_axis_tlast;

wire [DRAM_WIDTH-1:0]     dram_m_axis_tdata;
wire                      dram_m_axis_tvalid;
reg                       dram_m_axis_tready;
wire                      dram_m_axis_tlast;

wire [CORE_MSG_WIDTH-1:0] core_msg_out_tdata;
wire                      core_msg_out_tvalid;
reg                       core_msg_out_tready;

reg  [CORE_MSG_WIDTH-1:0] core_msg_in_tdata;
reg  [CORE_WIDTH-1:0]     core_msg_in_tuser;
reg                       core_msg_in_tvalid;

reg  [3:0]                core_stat_addr;
wire [31:0]               core_stat_data;


// Internal wires
wire                      core_reset;

wire                      dma_cmd_wr_en;
wire [25:0]               dma_cmd_wr_addr;
wire                      dma_cmd_hdr_wr_en;
wire [23:0]               dma_cmd_hdr_wr_addr;
wire [DATA_WIDTH-1:0]     dma_cmd_wr_data;
wire [STRB_WIDTH-1:0]     dma_cmd_wr_strb;
wire                      dma_cmd_wr_last;
wire                      dma_cmd_wr_ready;
wire                      dma_cmd_rd_en;
wire [25:0]               dma_cmd_rd_addr;
wire                      dma_cmd_rd_last;
wire                      dma_cmd_rd_ready;
wire                      dma_rd_resp_valid;
wire [DATA_WIDTH-1:0]     dma_rd_resp_data;
wire                      dma_rd_resp_ready;

wire [63:0]               in_desc;
wire                      in_desc_valid;
wire                      in_desc_taken;
wire [63:0]               out_desc;
wire                      out_desc_2nd;
wire                      out_desc_valid;
wire                      out_desc_ready;

wire [CORE_MSG_WIDTH-1:0] bc_msg_out;
wire                      bc_msg_out_valid;
wire                      bc_msg_out_ready;
wire [CORE_MSG_WIDTH-1:0] bc_msg_in;
wire                      bc_msg_in_valid;

wire [31:0]               intercon_status_data;
wire [2:0]                intercon_status_addr;
wire [31:0]               rpu_status_data;
wire [2:0]                rpu_status_addr;

rpu_intercon #(
    .DATA_WIDTH(DATA_WIDTH),
    .SLOT_COUNT(SLOT_COUNT),
    .RECV_DESC_DEPTH(RECV_DESC_DEPTH),
    .SEND_DESC_DEPTH(SEND_DESC_DEPTH),
    .DRAM_DESC_DEPTH(DRAM_DESC_DEPTH),
    .MSG_FIFO_DEPTH(MSG_FIFO_DEPTH),
    .PORT_WIDTH(PORT_WIDTH),
    .CORE_ID_WIDTH(CORE_WIDTH),
    .BC_REGION_SIZE(BC_REGION_SIZE),
    .MSG_WIDTH(CORE_MSG_WIDTH),
    .MAX_PKT_HDR_SIZE(MAX_PKT_HDR_SIZE),
    .SLOT_START_ADDR(SLOT_START_ADDR),
    .SLOT_ADDR_STEP(SLOT_ADDR_STEP),
    .HDR_START_ADDR(HDR_START_ADDR),
    .DRAM_PORT(DRAM_PORT),
    .DATA_S_REG_TYPE(2),
    .DATA_M_REG_TYPE(2),
    .DRAM_M_REG_TYPE(2)
) rpu_intercon_inst (
    .clk(clk),
    .rst(rst),

    .core_id({CORE_WIDTH{1'b0}}),
    // ---------------- DATA CHANNEL --------------- //
    // Incoming data
    .data_s_axis_tdata(data_s_axis_tdata),
    .data_s_axis_tkeep(data_s_axis_tkeep),
    .data_s_axis_tvalid(data_s_axis_tvalid),
    .data_s_axis_tready(data_s_axis_tready),
    .data_s_axis_tlast(data_s_axis_tlast),
    .data_s_axis_tdest(data_s_axis_tdest),
    .data_s_axis_tuser(data_s_axis_tuser),

    // Outgoing data
    .data_m_axis_tdata(data_m_axis_tdata),
    .data_m_axis_tkeep(data_m_axis_tkeep),
    .data_m_axis_tvalid(data_m_axis_tvalid),
    .data_m_axis_tready(data_m_axis_tready),
    .data_m_axis_tlast(data_m_axis_tlast),
    .data_m_axis_tdest(data_m_axis_tdest),
    .data_m_axis_tuser(data_m_axis_tuser[TAG_WIDTH-1:0]),

    // ---------------- CTRL CHANNEL --------------- //
    // Incoming control
    .ctrl_s_axis_tdata(ctrl_s_axis_tdata),
    .ctrl_s_axis_tvalid(ctrl_s_axis_tvalid),
    .ctrl_s_axis_tready(ctrl_s_axis_tready),

    // Outgoing control
    .ctrl_m_axis_tdata(ctrl_m_axis_tdata),
    .ctrl_m_axis_tvalid(ctrl_m_axis_tvalid),
    .ctrl_m_axis_tready(ctrl_m_axis_tready),

    // ------------ DRAM RD REQ CHANNEL ------------- //
    // Incoming DRAM request
    .dram_s_axis_tdata(dram_s_axis_tdata),
    .dram_s_axis_tvalid(dram_s_axis_tvalid),
    .dram_s_axis_tready(dram_s_axis_tready),
    .dram_s_axis_tlast(dram_s_axis_tlast),

    // Outgoing DRAM request
    .dram_m_axis_tdata(dram_m_axis_tdata),
    .dram_m_axis_tvalid(dram_m_axis_tvalid),
    .dram_m_axis_tready(dram_m_axis_tready),
    .dram_m_axis_tlast(dram_m_axis_tlast),

    // ------------- CORE MSG CHANNEL -------------- //
    // Core messages output
    .core_msg_out(core_msg_out_tdata),
    .core_msg_out_valid(core_msg_out_tvalid),
    .core_msg_out_ready(core_msg_out_tready),

    // Core messages input
    .core_msg_in(core_msg_in_tdata),
    .core_msg_in_user(core_msg_in_tuser),
    .core_msg_in_valid(core_msg_in_tvalid),

    // ---------- STATUS READBACK CHANNEL ---------- //
    .stat_addr(core_stat_addr),
    .stat_data(core_stat_data),

    // --------------------------------------------- //
    // ------- CONNECTION TO RISCV_BLOCK ----------- //
    // --------------------------------------------- //

    .core_reset(core_reset),

    .dma_cmd_wr_en(dma_cmd_wr_en),
    .dma_cmd_wr_addr(dma_cmd_wr_addr),
    .dma_cmd_hdr_wr_en(dma_cmd_hdr_wr_en),
    .dma_cmd_hdr_wr_addr(dma_cmd_hdr_wr_addr),
    .dma_cmd_wr_data(dma_cmd_wr_data),
    .dma_cmd_wr_strb(dma_cmd_wr_strb),
    .dma_cmd_wr_last(dma_cmd_wr_last),
    .dma_cmd_wr_ready(dma_cmd_wr_ready),
    .dma_cmd_rd_en(dma_cmd_rd_en),
    .dma_cmd_rd_addr(dma_cmd_rd_addr),
    .dma_cmd_rd_last(dma_cmd_rd_last),
    .dma_cmd_rd_ready(dma_cmd_rd_ready),
    .dma_rd_resp_valid(dma_rd_resp_valid),
    .dma_rd_resp_data(dma_rd_resp_data),
    .dma_rd_resp_ready(dma_rd_resp_ready),

    .in_desc(in_desc),
    .in_desc_valid(in_desc_valid),
    .in_desc_taken(in_desc_taken),
    .out_desc(out_desc),
    .out_desc_2nd(out_desc_2nd),
    .out_desc_valid(out_desc_valid),
    .out_desc_ready(out_desc_ready),

    .bc_msg_out(bc_msg_out),
    .bc_msg_out_valid(bc_msg_out_valid),
    .bc_msg_out_ready(bc_msg_out_ready),
    .bc_msg_in(bc_msg_in),
    .bc_msg_in_user(),
    .bc_msg_in_valid(bc_msg_in_valid),

    .intercon_status_data(intercon_status_data),
    .intercon_status_addr(intercon_status_addr),
    .rpu_status_data(rpu_status_data),
    .rpu_status_addr(rpu_status_addr)
);

rpu_PR UUT (
    .clk(clk),
    .rst(rst),
    .core_reset(core_reset),

    .dma_cmd_wr_en(dma_cmd_wr_en),
    .dma_cmd_wr_addr(dma_cmd_wr_addr),
    .dma_cmd_hdr_wr_en(dma_cmd_hdr_wr_en),
    .dma_cmd_hdr_wr_addr(dma_cmd_hdr_wr_addr),
    .dma_cmd_wr_data(dma_cmd_wr_data),
    .dma_cmd_wr_strb(dma_cmd_wr_strb),
    .dma_cmd_wr_last(dma_cmd_wr_last),
    .dma_cmd_wr_ready(dma_cmd_wr_ready),
    .dma_cmd_rd_en(dma_cmd_rd_en),
    .dma_cmd_rd_addr(dma_cmd_rd_addr),
    .dma_cmd_rd_last(dma_cmd_rd_last),
    .dma_cmd_rd_ready(dma_cmd_rd_ready),
    .dma_rd_resp_valid(dma_rd_resp_valid),
    .dma_rd_resp_data(dma_rd_resp_data),
    .dma_rd_resp_ready(dma_rd_resp_ready),

    .in_desc(in_desc),
    .in_desc_valid(in_desc_valid),
    .in_desc_taken(in_desc_taken),
    .out_desc(out_desc),
    .out_desc_2nd(out_desc_2nd),
    .out_desc_valid(out_desc_valid),
    .out_desc_ready(out_desc_ready),

    .bc_msg_out(bc_msg_out),
    .bc_msg_out_valid(bc_msg_out_valid),
    .bc_msg_out_ready(bc_msg_out_ready),
    .bc_msg_in(bc_msg_in),
    .bc_msg_in_valid(bc_msg_in_valid),

    .intercon_status_data(intercon_status_data),
    .intercon_status_addr(intercon_status_addr),
    .rpu_status_data(rpu_status_data),
    .rpu_status_addr(rpu_status_addr)
);

initial begin
  $dumpfile ("sim_build/test_rpu.fst");
  $dumpvars (0,test_rpu);
  if (INIT_ROMS) begin
    `include "init_roms.v"
  end
  #1;
end

endmodule

`resetall
