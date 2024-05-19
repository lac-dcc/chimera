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

module rpu # (
  parameter DATA_WIDTH      = 128,
  parameter STRB_WIDTH      = (DATA_WIDTH/8),
  parameter IMEM_SIZE       = 65536,
  parameter PMEM_SIZE       = 1048576,
  parameter DMEM_SIZE       = 32768,
  parameter BC_REGION_SIZE  = 4048,
  parameter BC_START_ADDR   = 32'h00800000+DMEM_SIZE-BC_REGION_SIZE,
  parameter MSG_ADDR_WIDTH  = $clog2(BC_REGION_SIZE)-2,
  parameter MSG_WIDTH       = 32+4+MSG_ADDR_WIDTH,
  parameter ACC_ROM_EN      = 0,
  parameter AROM_ADDR_WIDTH = 1,
  parameter AROM_DATA_WIDTH = 1,
  parameter SLOW_M_B_LINES  = 4096,
  parameter FAST_M_B_LINES  = 1024,
  parameter CORE_ID_WIDTH   = 4,
  parameter SLOT_COUNT      = 16,
  parameter ADD_PMEM_RD_REG = 0
) (
  input  wire                     clk,
  input  wire                     rst,
  input  wire                     core_reset,

  // DMA interface
  input  wire                     dma_cmd_wr_en,
  input  wire [25:0]              dma_cmd_wr_addr,
  input  wire                     dma_cmd_hdr_wr_en,
  input  wire [23:0]              dma_cmd_hdr_wr_addr,
  input  wire [DATA_WIDTH-1:0]    dma_cmd_wr_data,
  input  wire [STRB_WIDTH-1:0]    dma_cmd_wr_strb,
  input  wire                     dma_cmd_wr_last,
  output wire                     dma_cmd_wr_ready,

  input  wire                     dma_cmd_rd_en,
  input  wire [25:0]              dma_cmd_rd_addr,
  input  wire                     dma_cmd_rd_last,
  output wire                     dma_cmd_rd_ready,

  output wire                     dma_rd_resp_valid,
  output wire [DATA_WIDTH-1:0]    dma_rd_resp_data,
  input  wire                     dma_rd_resp_ready,

  // Descriptor to/from core
  input  wire [63:0]              in_desc,
  input  wire                     in_desc_valid,
  output wire                     in_desc_taken,

  output wire [63:0]              out_desc,
  output wire                     out_desc_2nd,
  output wire                     out_desc_valid,
  input  wire                     out_desc_ready,

  // Broadcast messages
  input  wire [MSG_WIDTH-1:0]     bc_msg_in,
  input  wire                     bc_msg_in_valid,
  output wire [MSG_WIDTH-1:0]     bc_msg_out,
  output wire                     bc_msg_out_valid,
  input  wire                     bc_msg_out_ready,

  // Status channel to core
  input  wire [31:0]              intercon_status_data,
  input  wire [2:0]               intercon_status_addr,

  // Status channel from core
  output wire [31:0]              rpu_status_data,
  output wire [2:0]               rpu_status_addr
);

// Internal paramaters
localparam PMEM_ADDR_WIDTH = $clog2(PMEM_SIZE);
localparam DMEM_ADDR_WIDTH = $clog2(DMEM_SIZE);
localparam ACC_ADDR_WIDTH  = $clog2(SLOW_M_B_LINES);
localparam PMEM_SEL_BITS   = PMEM_ADDR_WIDTH-$clog2(STRB_WIDTH)
                             -1-$clog2(SLOW_M_B_LINES);
localparam ACC_MEM_BLOCKS  = 2**PMEM_SEL_BITS;

///////////////////////////////////////////////////////////////////////////
//////////////////////////// RISCV CORE ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////
wire        core_dmem_en;
wire        core_pmem_en;
wire        core_exio_en;
wire        core_mem_wen;
wire        core_mem_ready;
wire [3:0]  core_mem_strb;
wire        core_mem_swap;
wire [24:0] core_mem_addr;
wire [31:0] core_mem_wr_data;
wire [31:0] core_mem_rd_data;
wire        core_mem_rd_valid;
wire        core_mem_bc_block;

wire [31:0] core_dmem_rd_data;
wire        core_dmem_rd_valid;
wire [31:0] core_exio_rd_data;
wire        core_exio_rd_valid;

wire        core_imem_ren;
wire [24:0] core_imem_addr;
wire [31:0] core_imem_rd_data;
wire        core_imem_rd_valid;

wire [15:0] bc_region_size;
wire [7:0]  core_id;
wire [7:0]  max_slot_count;

wire [7:0]  send_data_items;
wire [7:0]  dram_send_items;
wire [7:0]  dram_req_items;
wire [7:0]  core_msg_items;

wire [63:0] debug_in;
wire [63:0] timer;

wire [4:0]  recv_dram_tag;
wire        recv_dram_tag_v;

wire        evict_int;
wire        evict_int_ack;
wire        poke_int;
wire        poke_int_ack;
wire        dupl_slot_int;
wire        dupl_slot_int_ack;
wire        inv_slot_int;
wire        inv_slot_int_ack;
wire        inv_desc_int;
wire        inv_desc_int_ack;

wire [31:0] slot_wr_data;
wire        slot_wr_valid;
wire        slot_wr_ready;

wire [15:0] lb_tag_len;
wire        tag_len_wr_valid;

wire [63:0] debug_out;
wire        debug_out_l_valid;
wire        debug_out_h_valid;

wire [7:0]  core_errors;
wire        ready_to_evict;
wire [7:0]  mem_fifo_fulls;

wire [63:0] core_desc_hdr;
wire [63:0] core_desc_dram_addr;
wire        core_desc_ready;
wire        core_desc_valid;

wire [SLOT_COUNT:1] slots_in_prog;

wire [DMEM_ADDR_WIDTH-1:0] bc_msg_addr;
wire                       bc_msg_valid;

wire ext_io_err, ext_io_err_ack;

// Select read data from memory or external IO
assign core_mem_rd_data  = core_exio_rd_valid ?  core_exio_rd_data : core_dmem_rd_data;
assign core_mem_rd_valid = core_exio_rd_valid || core_dmem_rd_valid;

// Block write if broadcast message requires blocking
assign core_mem_ready = !core_mem_bc_block;

riscvcore #(
  .IMEM_SIZE(IMEM_SIZE),
  .DMEM_SIZE(DMEM_SIZE),
  .PMEM_SIZE(PMEM_SIZE),
  .PMEM_SEG_SIZE(PMEM_SIZE/ACC_MEM_BLOCKS),
  .PMEM_SEG_COUNT(ACC_MEM_BLOCKS)
) core (
  .clk(clk),
  .rst(core_reset),

  .dmem_en(core_dmem_en),
  .pmem_en(core_pmem_en),
  .exio_en(core_exio_en),
  .mem_wen(core_mem_wen),
  .mem_ready(core_mem_ready),
  .mem_swap(core_mem_swap),
  .mem_strb(core_mem_strb),
  .mem_addr(core_mem_addr),
  .mem_wr_data(core_mem_wr_data),
  .mem_rd_data(core_mem_rd_data),
  .mem_rd_valid(core_mem_rd_valid),

  .imem_ren(core_imem_ren),
  .imem_addr(core_imem_addr),
  .imem_rd_data(core_imem_rd_data),
  .imem_rd_valid(core_imem_rd_valid),

  .in_desc(in_desc),
  .in_desc_valid(in_desc_valid),
  .in_desc_taken(in_desc_taken),

  .out_desc(core_desc_hdr),
  .out_desc_dram_addr(core_desc_dram_addr),
  .out_desc_valid(core_desc_valid),
  .out_desc_ready(core_desc_ready),

  .active_slots({{(32-SLOT_COUNT){1'b0}},slots_in_prog}),
  .bc_region_size(bc_region_size),
  .core_id(core_id),
  .max_slot_count(max_slot_count),
  .debug_in(debug_in),
  .timer(timer),

  .send_data_items(send_data_items),
  .dram_send_items(dram_send_items),
  .dram_req_items(dram_req_items),
  .core_msg_items(core_msg_items),

  .core_msg_ready(bc_msg_out_ready),
  .bc_msg_in_addr(bc_msg_addr),
  .bc_msg_in_valid(bc_msg_valid),

  .slot_wr_data(slot_wr_data),
  .slot_wr_valid(slot_wr_valid),
  .slot_wr_ready(slot_wr_ready),
  .lb_tag_len(lb_tag_len),
  .tag_len_wr_valid(tag_len_wr_valid),
  .debug_out(debug_out),
  .debug_out_l_valid(debug_out_l_valid),
  .debug_out_h_valid(debug_out_h_valid),
  .core_errors(core_errors),
  .ready_to_evict(ready_to_evict),

  .ext_io_err(ext_io_err),
  .ext_io_err_ack(ext_io_err_ack),

  .evict_int(evict_int),
  .evict_int_ack(evict_int_ack),
  .poke_int(poke_int),
  .poke_int_ack(poke_int_ack),
  .dupl_slot_int(dupl_slot_int),
  .dupl_slot_int_ack(dupl_slot_int_ack),
  .inv_slot_int(inv_slot_int),
  .inv_slot_int_ack(inv_slot_int_ack),
  .inv_desc_int(inv_desc_int),
  .inv_desc_int_ack(inv_desc_int_ack),

  .recv_dram_tag_valid(recv_dram_tag_v),
  .recv_dram_tag(recv_dram_tag)
);

///////////////////////////////////////////////////////////////////////////
/////////////////////////// RPU CONTROLLER ////////////////////////////////
///////////////////////////////////////////////////////////////////////////
wire [DMEM_ADDR_WIDTH-1:0] bc_dmem_start_addr = DMEM_SIZE-BC_REGION_SIZE;

rpu_controller # (
  .DMEM_ADDR_WIDTH(DMEM_ADDR_WIDTH),
  .MSG_ADDR_WIDTH(MSG_ADDR_WIDTH),
  .MSG_WIDTH(MSG_WIDTH),
  .SLOT_COUNT(SLOT_COUNT)
) rpu_controller_inst (
  .clk       (clk),
  .rst       (rst),
  .core_reset(core_reset),

  // -------------- BROADCAST MSG CONTROL --------------- //
  .core_dmem_en_mon    (core_dmem_en),
  .core_mem_wen_mon    (core_mem_wen),
  .core_mem_strb_mon   (core_mem_strb),
  .core_mem_addr_mon   (core_mem_addr),
  .core_mem_wr_data_mon(core_mem_wr_data),

  .bc_start_addr       (bc_dmem_start_addr),
  .bc_msg_out          (bc_msg_out),
  .bc_msg_out_valid    (bc_msg_out_valid),
  .bc_msg_out_ready    (bc_msg_out_ready),
  .core_mem_bc_block   (core_mem_bc_block),

  // --------------- DESCRIPTORS CONTROL ---------------- //
  .in_desc_mon        (in_desc),
  .in_desc_valid_mon  (in_desc_valid),
  .in_desc_taken_mon  (in_desc_taken),

  .core_desc_hdr      (core_desc_hdr),
  .core_desc_dram_addr(core_desc_dram_addr),
  .core_desc_valid    (core_desc_valid),
  .core_desc_ready    (core_desc_ready),
  .out_desc           (out_desc),
  .out_desc_2nd       (out_desc_2nd),
  .out_desc_valid     (out_desc_valid),
  .out_desc_ready     (out_desc_ready),

  // ------- INTERCONNECT STATUS CHANNEL CONTROL -------- //
  .intercon_status_data(intercon_status_data),
  .intercon_status_addr(intercon_status_addr),

  // Information from Interconnect
  .bc_region_size (bc_region_size),
  .core_id        (core_id),
  .max_slot_count (max_slot_count),
  .send_data_items(send_data_items),
  .dram_send_items(dram_send_items),
  .dram_req_items (dram_req_items),
  .core_msg_items (core_msg_items),
  .slots_in_prog  (slots_in_prog),
  .debug_in       (debug_in),
  .timer          (timer),
  .recv_dram_tag  (recv_dram_tag),
  .recv_dram_tag_v(recv_dram_tag_v),

  // Interrupts and their acks
  .evict_int        (evict_int),
  .evict_int_ack    (evict_int_ack),
  .poke_int         (poke_int),
  .poke_int_ack     (poke_int_ack),
  .dupl_slot_int    (dupl_slot_int),
  .dupl_slot_int_ack(dupl_slot_int_ack),
  .inv_slot_int     (inv_slot_int),
  .inv_slot_int_ack (inv_slot_int_ack),
  .inv_desc_int     (inv_desc_int),
  .inv_desc_int_ack (inv_desc_int_ack),

  // ----------- RPU STATUS CHANNEL CONTROL ------------- //
  .rpu_status_data  (rpu_status_data),
  .rpu_status_addr  (rpu_status_addr),
  .slot_wr_data     (slot_wr_data),
  .slot_wr_valid    (slot_wr_valid),
  .slot_wr_ready    (slot_wr_ready),
  .lb_tag_len       (lb_tag_len),
  .tag_len_wr_valid (tag_len_wr_valid),
  .debug_out        (debug_out),
  .debug_out_l_valid(debug_out_l_valid),
  .debug_out_h_valid(debug_out_h_valid),
  .core_errors      (core_errors),
  .ready_to_evict   (ready_to_evict),
  .mem_fifo_fulls   (mem_fifo_fulls)
);

///////////////////////////////////////////////////////////////////////////
////////////////////////// ACCELERATORS ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////
wire [ACC_MEM_BLOCKS-1:0]                acc_en_b1;
wire [ACC_MEM_BLOCKS*STRB_WIDTH-1:0]     acc_wen_b1;
wire [ACC_MEM_BLOCKS*ACC_ADDR_WIDTH-1:0] acc_addr_b1;
wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_wr_data_b1;
wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_rd_data_b1;

wire [ACC_MEM_BLOCKS-1:0]                acc_en_b2;
wire [ACC_MEM_BLOCKS*STRB_WIDTH-1:0]     acc_wen_b2;
wire [ACC_MEM_BLOCKS*ACC_ADDR_WIDTH-1:0] acc_addr_b2;
wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_wr_data_b2;
wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_rd_data_b2;

wire [AROM_ADDR_WIDTH-1:0]               acc_rom_wr_addr;
wire [AROM_DATA_WIDTH-1:0]               acc_rom_wr_data;
wire                                     acc_rom_wr_en;

accel_wrap #(
  .DATA_WIDTH(DATA_WIDTH),
  .STRB_WIDTH(STRB_WIDTH),
  .PMEM_ADDR_WIDTH(PMEM_ADDR_WIDTH),
  .AROM_ADDR_WIDTH(AROM_ADDR_WIDTH),
  .AROM_DATA_WIDTH(AROM_DATA_WIDTH),
  .SLOW_M_B_LINES(SLOW_M_B_LINES),
  .ACC_ADDR_WIDTH(ACC_ADDR_WIDTH),
  .PMEM_SEL_BITS(PMEM_SEL_BITS),
  .ACC_MEM_BLOCKS(ACC_MEM_BLOCKS),
  .SLOT_COUNT(SLOT_COUNT)
) accel_wrap_inst (
  .clk(clk),
  .rst(rst),

  .io_en(core_exio_en),
  .io_wen(core_mem_wen),
  .io_strb(core_mem_strb),
  .io_addr(core_mem_addr[21:0]),
  .io_wr_data(core_mem_wr_data),
  .io_rd_data(core_exio_rd_data),
  .io_rd_valid(core_exio_rd_valid),

  .acc_rom_wr_addr(acc_rom_wr_addr),
  .acc_rom_wr_data(acc_rom_wr_data),
  .acc_rom_wr_en(acc_rom_wr_en),

  .acc_en_b1(acc_en_b1),
  .acc_wen_b1(acc_wen_b1),
  .acc_addr_b1(acc_addr_b1),
  .acc_wr_data_b1(acc_wr_data_b1),
  .acc_rd_data_b1(acc_rd_data_b1),

  .acc_en_b2(acc_en_b2),
  .acc_wen_b2(acc_wen_b2),
  .acc_addr_b2(acc_addr_b2),
  .acc_wr_data_b2(acc_wr_data_b2),
  .acc_rd_data_b2(acc_rd_data_b2),

  .error(ext_io_err),
  .error_ack(ext_io_err_ack)
);

///////////////////////////////////////////////////////////////////////////
/////////////////////// HYBRID MEMORY SYSTEM //////////////////////////////
///////////////////////////////////////////////////////////////////////////
mem_sys # (
  .DATA_WIDTH(DATA_WIDTH),
  .STRB_WIDTH(STRB_WIDTH),
  .IMEM_SIZE(IMEM_SIZE),
  .PMEM_SIZE(PMEM_SIZE),
  .DMEM_SIZE(DMEM_SIZE),
  .ACC_ROM_EN(ACC_ROM_EN),
  .AROM_ADDR_WIDTH(AROM_ADDR_WIDTH),
  .AROM_DATA_WIDTH(AROM_DATA_WIDTH),
  .BC_REGION_SIZE(BC_REGION_SIZE),
  .BC_START_ADDR(BC_START_ADDR),
  .MSG_WIDTH(MSG_WIDTH),
  .SLOW_M_B_LINES(SLOW_M_B_LINES),
  .FAST_M_B_LINES(FAST_M_B_LINES),
  .ADD_PMEM_RD_REG(ADD_PMEM_RD_REG)
) memories (
  .clk(clk),
  .rst(rst),

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

  .core_dmem_en(core_dmem_en),
  .core_pmem_en(core_pmem_en),
  .core_dmem_wen(core_mem_wen),
  .core_dmem_strb(core_mem_strb),
  .core_dmem_swap(core_mem_swap),
  .core_dmem_addr(core_mem_addr),
  .core_dmem_wr_data(core_mem_wr_data),
  .core_dmem_rd_data(core_dmem_rd_data),
  .core_dmem_rd_valid(core_dmem_rd_valid),

  .core_imem_ren(core_imem_ren),
  .core_imem_addr(core_imem_addr),
  .core_imem_rd_data(core_imem_rd_data),
  .core_imem_rd_valid(core_imem_rd_valid),

  .bc_msg_in(bc_msg_in),
  .bc_msg_in_valid(bc_msg_in_valid),

  .acc_rom_wr_addr(acc_rom_wr_addr),
  .acc_rom_wr_data(acc_rom_wr_data),
  .acc_rom_wr_en(acc_rom_wr_en),

  .acc_en_b1(acc_en_b1),
  .acc_wen_b1(acc_wen_b1),
  .acc_addr_b1(acc_addr_b1),
  .acc_wr_data_b1(acc_wr_data_b1),
  .acc_rd_data_b1(acc_rd_data_b1),

  .acc_en_b2(acc_en_b2),
  .acc_wen_b2(acc_wen_b2),
  .acc_addr_b2(acc_addr_b2),
  .acc_wr_data_b2(acc_wr_data_b2),
  .acc_rd_data_b2(acc_rd_data_b2),

  .bc_msg_addr(bc_msg_addr),
  .bc_msg_valid(bc_msg_valid),

  .mem_fifo_fulls(mem_fifo_fulls)
);

endmodule

`resetall
