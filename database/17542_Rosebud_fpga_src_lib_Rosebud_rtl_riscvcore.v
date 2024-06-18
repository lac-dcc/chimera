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

module riscvcore #(
  parameter IMEM_SIZE       = 65536,
  parameter DMEM_SIZE       = 32768,
  parameter PMEM_SIZE       = 1048576,
  parameter PMEM_SEG_SIZE   = 131072,
  parameter PMEM_SEG_COUNT  = 8,
  parameter DMEM_ADDR_WIDTH = $clog2(DMEM_SIZE)
)(
  input  wire                       clk,
  input  wire                       rst,

  // Data memory interface
  output wire                       dmem_en,
  output wire                       pmem_en,
  output wire                       exio_en,
  output wire                       mem_wen,
  input  wire                       mem_ready,
  output wire [3:0]                 mem_strb,
  output wire                       mem_swap,
  output wire [24:0]                mem_addr,
  output wire [31:0]                mem_wr_data,
  input  wire [31:0]                mem_rd_data,
  input  wire                       mem_rd_valid,

  // Instruction memory interface
  output wire                       imem_ren,
  output wire [24:0]                imem_addr,
  input  wire [31:0]                imem_rd_data,
  input  wire                       imem_rd_valid,

  // Packet descriptor input and output
  input  wire [63:0]                in_desc,
  input  wire                       in_desc_valid,
  output wire                       in_desc_taken,

  output wire [63:0]                out_desc,
  output wire                       out_desc_valid,
  output wire [63:0]                out_desc_dram_addr,
  input  wire                       out_desc_ready,

  // Status and debug input
  input  wire [31:0]                active_slots,
  input  wire [15:0]                bc_region_size,
  input  wire [7:0]                 core_id,
  input  wire [7:0]                 max_slot_count,
  input  wire [63:0]                debug_in,
  input  wire [63:0]                timer,

  // Interconnect FIFO occupancy
  input  wire [7:0]                 send_data_items,
  input  wire [7:0]                 dram_send_items,
  input  wire [7:0]                 dram_req_items,
  input  wire [7:0]                 core_msg_items,

  // Broadcast message
  input  wire                       core_msg_ready,
  input  wire [DMEM_ADDR_WIDTH-1:0] bc_msg_in_addr,
  input  wire                       bc_msg_in_valid,

  // slot addr write, debug and status output
  output wire [31:0]                slot_wr_data,
  output wire                       slot_wr_valid,
  input  wire                       slot_wr_ready,
  output wire [15:0]                lb_tag_len,
  output wire                       tag_len_wr_valid,
  output wire [63:0]                debug_out,
  output wire                       debug_out_l_valid,
  output wire                       debug_out_h_valid,
  output wire [7:0]                 core_errors,
  output wire                       ready_to_evict,

  // External IO error
  input  wire                       ext_io_err,
  output wire                       ext_io_err_ack,

  // Interrupts
  input  wire                       evict_int,
  output wire                       evict_int_ack,
  input  wire                       poke_int,
  output wire                       poke_int_ack,
  input  wire                       dupl_slot_int,
  output wire                       dupl_slot_int_ack,
  input  wire                       inv_slot_int,
  output wire                       inv_slot_int_ack,
  input  wire                       inv_desc_int,
  output wire                       inv_desc_int_ack,
  input  wire [4:0]                 recv_dram_tag,
  input  wire                       recv_dram_tag_valid
  );

  // Core to memory signals
  wire [31:0] dmem_read_data;
  wire [31:0] dmem_addr, imem_addr_n;
  wire [4:0]  dmem_wr_strb;
  wire [1:0]  dmem_byte_count;
  wire        dmem_v;

  reg [15:0] int_mask;
  reg        imem_access_err, dmem_access_err;
  reg        io_access_err, pmem_access_err;
  reg        timer_interrupt;
  reg        io_ren_r;
  wire       io_wr_ready;
  reg core_interrupt;

  VexRiscv core (
    .clk(clk),
    .reset(rst),

    .iBus_cmd_valid(imem_ren),
    .iBus_cmd_ready(1'b1),
    .iBus_cmd_payload_pc(imem_addr_n),
    .iBus_rsp_valid(imem_rd_valid),
    .iBus_rsp_payload_error(imem_access_err),
    .iBus_rsp_payload_inst(imem_rd_data),

    .dBus_cmd_valid(dmem_v),
    .dBus_cmd_ready(mem_ready && io_wr_ready),
    .dBus_cmd_payload_wr(mem_wen),
    .dBus_cmd_payload_address(dmem_addr),
    .dBus_cmd_payload_data(mem_wr_data),
    .dBus_cmd_payload_size(dmem_byte_count),
    .dBus_rsp_ready(mem_rd_valid || io_ren_r),
    .dBus_rsp_error(dmem_access_err  || io_access_err ||
                    pmem_access_err),
    .dBus_rsp_data(dmem_read_data),

    .timerInterrupt(timer_interrupt && int_mask[0]),
    .externalInterrupt(core_interrupt),
    .softwareInterrupt(1'b0)
  );

  // Conversion from core dmem_byte_count to normal byte mask
  assign dmem_wr_strb = ((!mem_wen) || (!dmem_v)) ? 5'h0 :
                          (dmem_byte_count == 2'd0) ? (5'h01 << dmem_addr[1:0]) :
                          (dmem_byte_count == 2'd1) ? (5'h03 << dmem_addr[1:0]) :
                           5'h0f;

  // Memory address decoding
  wire internal_io = dmem_addr[24:22]==3'b000;
  wire external_io = dmem_addr[24:22]==3'b001;
  wire data_mem    = dmem_addr[24:23]==2'b01;
  wire packet_mem  = dmem_addr[24]   ==1'b1;

  assign mem_swap  = dmem_addr[26];
  assign dmem_en   = dmem_v && data_mem;
  assign pmem_en   = dmem_v && packet_mem;
  assign exio_en   = dmem_v && external_io;

  wire [5:0] io_addr  = dmem_addr[7:2];
  wire       io_read  = internal_io && dmem_v && (!mem_wen);
  wire       io_write = internal_io && dmem_v && mem_wen;
  reg [31:0] io_read_data;

  // selecting input/output data
  assign imem_addr      = imem_addr_n[24:0];
  assign dmem_read_data = io_ren_r ? io_read_data : mem_rd_data;
  assign mem_strb       = dmem_wr_strb[3:0];
  assign mem_addr       = dmem_addr;

  ///////////////////////////////////////////////////////////////////////////
  ///////////////////////////// IO WRITES ///////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////

  // localparam RESERVED      = 6'b000000; NULL pointer
  // localparam RESERVED      = 6'b000001;
  localparam SEND_DESC_ADDR_L = 6'b000010;
  localparam SEND_DESC_ADDR_H = 6'b000011;
  localparam WR_DRAM_ADDR_L   = 6'b000100;
  localparam WR_DRAM_ADDR_H   = 6'b000101;
  localparam SLOT_LUT_ADDR    = 6'b000110;
  localparam TIMER_STP_ADDR   = 6'b000111;
  localparam DRAM_FLAG_ADDR   = 6'b001000;
  localparam READY_TO_EVICT   = 6'b001001;
  localparam SEND_DESC_TYPE   = 6'b001010;
  localparam RD_DESC_STRB     = 6'b001011;
  localparam DRAM_FLAG_RST    = 6'b001100;
  localparam SLOT_LUT_STRB    = 6'b001101;
  localparam MASK_WR          = 6'b001110;
  localparam INTERRUPT_ACK    = 6'b001111;
  localparam DEBUG_REG_ADDR_L = 6'b010000;
  localparam DEBUG_REG_ADDR_H = 6'b010001;
  localparam BC_MSG_MASK_REG  = 6'b010010;
  localparam BC_MSG_EQUAL_REG = 6'b010011;
  localparam BC_MSG_FIFO_EN   = 6'b010100;
  localparam BC_MSG_RD_STRB   = 6'b010101;
  localparam REWR_DESC_ADDR_L = 6'b010110;
  localparam REWR_DESC_ADDR_H = 6'b010111;
  localparam LB_TAG_LEN       = 6'b011000;

  reg [63:0] dram_wr_addr_r;
  reg [31:0] timer_step_r;
  reg [63:0] debug_register;
  reg [15:0] lb_tag_len_r;

  reg [63:0] out_desc_data_r;
  reg [3:0]  out_desc_type_r;
  reg [31:0] slot_info_data_r;
  reg        ready_to_evict_r;
  reg        bc_msg_fifo_en;

  reg [DMEM_ADDR_WIDTH-1:0] bc_mask_reg, bc_equal_reg;
  reg out_desc_v_r;

  integer i,j;
  always @ (posedge clk) begin
    if (io_write) begin
      // Byte writable values that will be paused if not ready
      if ((!out_desc_v_r)||out_desc_ready) begin
        for (i = 0; i < 4; i = i + 1)
          if (dmem_wr_strb[i] == 1'b1)
            case (io_addr)
              SEND_DESC_ADDR_L: out_desc_data_r[i*8 +: 8]    <= mem_wr_data[i*8 +: 8];
              SEND_DESC_ADDR_H: out_desc_data_r[32+i*8 +: 8] <= mem_wr_data[i*8 +: 8];
              WR_DRAM_ADDR_L:   dram_wr_addr_r[i*8 +: 8]     <= mem_wr_data[i*8 +: 8];
              WR_DRAM_ADDR_H:   dram_wr_addr_r[32+i*8 +: 8]  <= mem_wr_data[i*8 +: 8];
              default: begin end
            endcase
      end

      // Byte writable values without a pause
      for (j = 0; j < 4; j = j + 1)
        if (dmem_wr_strb[j] == 1'b1)
          case (io_addr)
            REWR_DESC_ADDR_L: out_desc_data_r[j*8 +: 8]    <= mem_wr_data[j*8 +: 8];
            REWR_DESC_ADDR_H: out_desc_data_r[32+j*8 +: 8] <= mem_wr_data[j*8 +: 8];
            SLOT_LUT_ADDR:    slot_info_data_r[j*8 +: 8]   <= mem_wr_data[j*8 +: 8];
            TIMER_STP_ADDR:   timer_step_r[j*8 +: 8]       <= mem_wr_data[j*8 +: 8];
            DEBUG_REG_ADDR_L: debug_register[j*8 +: 8]     <= mem_wr_data[j*8 +: 8];
            DEBUG_REG_ADDR_H: debug_register[32+j*8 +: 8]  <= mem_wr_data[j*8 +: 8];
            default: begin end
          endcase

      // Non-byte writable values
      case (io_addr)
        BC_MSG_MASK_REG:  bc_mask_reg      <= mem_wr_data[DMEM_ADDR_WIDTH-1:0];
        BC_MSG_EQUAL_REG: bc_equal_reg     <= mem_wr_data[DMEM_ADDR_WIDTH-1:0];
        BC_MSG_FIFO_EN:   bc_msg_fifo_en   <= mem_wr_data[0];
        // it's both type and strb
        SEND_DESC_TYPE:   out_desc_type_r  <= mem_wr_data[3:0];
        MASK_WR:          int_mask         <= mem_wr_data[15:0];
        READY_TO_EVICT:   ready_to_evict_r <= mem_wr_data[0];
        LB_TAG_LEN:       lb_tag_len_r     <= mem_wr_data[15:0];
        default: begin end
      endcase
    end

    if (rst) begin
      timer_step_r     <= 32'h00000001;
      int_mask         <= 16'hFFF0;
      ready_to_evict_r <= 1'b0;
      bc_msg_fifo_en   <= 1'b0;
      lb_tag_len_r     <= 16'd0;
    end
  end

  // Remaining addresses
  wire timer_step_wen = io_write &&  (io_addr==TIMER_STP_ADDR);
  wire dram_flags_wen = io_write &&  (io_addr==DRAM_FLAG_ADDR);
  wire send_out_desc  = io_write &&  (io_addr==SEND_DESC_TYPE);
  wire dram_flag_rst  = io_write &&  (io_addr==DRAM_FLAG_RST);
  wire interrupt_ack  = io_write &&  (io_addr==INTERRUPT_ACK);
  wire slot_wr_v      = io_write &&  (io_addr==SLOT_LUT_STRB) && mem_wr_data[0];
  wire debug_reg_wr_l = io_write &&  (io_addr==DEBUG_REG_ADDR_L);
  wire debug_reg_wr_h = io_write &&  (io_addr==DEBUG_REG_ADDR_H);
  wire tag_len_wr_v   = io_write &&  (io_addr==LB_TAG_LEN);
  wire update_desc    = io_write && ((io_addr==SEND_DESC_ADDR_L) ||
                                     (io_addr==SEND_DESC_ADDR_H) ||
                                     (io_addr==WR_DRAM_ADDR_L)   ||
                                     (io_addr==WR_DRAM_ADDR_H));

  reg debug_reg_wr_l_r, debug_reg_wr_h_r, tag_len_wr_v_r, slot_wr_v_r;

  always @ (posedge clk) begin
    if (rst) begin
      out_desc_v_r     <= 1'b0;
      slot_wr_v_r      <= 1'b0;
      debug_reg_wr_l_r <= 1'b0;
      debug_reg_wr_h_r <= 1'b0;
      tag_len_wr_v_r   <= 1'b0;
    end else begin
      debug_reg_wr_l_r <= debug_reg_wr_l;
      debug_reg_wr_h_r <= debug_reg_wr_h;
      slot_wr_v_r      <= slot_wr_v;
      tag_len_wr_v_r   <= tag_len_wr_v;
      if (send_out_desc)
        out_desc_v_r <= 1'b1;
      if (out_desc_v_r && out_desc_ready)
        out_desc_v_r <= 1'b0;
    end
  end

  assign slot_wr_valid      = slot_wr_v_r;
  assign slot_wr_data       = slot_info_data_r;
  assign tag_len_wr_valid   = tag_len_wr_v_r;
  assign lb_tag_len         = lb_tag_len_r;

  assign debug_out          = debug_register;
  assign debug_out_l_valid  = debug_reg_wr_l_r;
  assign debug_out_h_valid  = debug_reg_wr_h_r;

  assign out_desc           = {out_desc_type_r, out_desc_data_r[59:0]};
  assign out_desc_valid     = out_desc_v_r;
  assign out_desc_dram_addr = dram_wr_addr_r;
  assign io_wr_ready        = !(send_out_desc || update_desc) || //Non blocking writes
                               (update_desc && !out_desc_v_r) || out_desc_ready;
  assign in_desc_taken      = io_write && (io_addr==RD_DESC_STRB) && mem_wr_data[0];

  assign ready_to_evict     = ready_to_evict_r;
  wire   bc_msg_taken       = io_write && (io_addr==BC_MSG_RD_STRB) && mem_wr_data[0];

  ///////////////////////////////////////////////////////////////////////////
  //////////////////////// INTERRUPT HANDLING ///////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  reg        bc_int_fifo_err;
  wire       dram_recv_any;
  wire       bc_msg_int;
  wire timer_int_ack;

  // These interrupts are kept high until acked or addressed
  // so easy to add a pipe register, if there is a ack this
  // signal is masked so drop of interrupt is accurate.
  // If program is still in the interrupt read of int flags
  // is not based on this signal.
  always @ (posedge clk)
    if (rst)
      core_interrupt <= 1'b0;
    else
      core_interrupt <= !interrupt_ack && (
                        (in_desc_valid   && int_mask[1]) ||
                        (dram_recv_any   && int_mask[2]) ||
                        (bc_msg_int      && int_mask[3]) ||
                        (poke_int        && int_mask[4]) ||
                        (evict_int       && int_mask[5]) ||
                        (bc_int_fifo_err && int_mask[8]) ||
                        (ext_io_err      && int_mask[9]) ||
                        (dupl_slot_int   && int_mask[10])||
                        (inv_slot_int    && int_mask[11])||
                        (inv_desc_int    && int_mask[12]));

  assign timer_int_ack     = interrupt_ack && mem_wr_data[0];
  // in_desc and dram and bc_msg are handled with release signals
  assign poke_int_ack      = interrupt_ack && mem_wr_data[4];
  assign evict_int_ack     = interrupt_ack && mem_wr_data[5];
  assign ext_io_err_ack    = interrupt_ack && mem_wr_data[9];
  // bc_int_fifo_err and ext_io_err are handled next to memory errors
  assign dupl_slot_int_ack = interrupt_ack && mem_wr_data[10];
  assign inv_slot_int_ack  = interrupt_ack && mem_wr_data[11];
  assign inv_desc_int_ack  = interrupt_ack && mem_wr_data[12];

  ///////////////////////////////////////////////////////////////////////////
  ////////////////////////////// IO READS ///////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////

  localparam RD_DESC_ADDR_L   = 6'b100000;
  localparam RD_DESC_ADDR_H   = 6'b100001;
  localparam RD_D_FLAGS_ADDR  = 6'b100010;
  localparam RD_STAT_ADDR     = 6'b100011;
  localparam RD_ID_ADDR       = 6'b100100;
  localparam RD_TIMER_L_ADDR  = 6'b100101;
  localparam RD_TIMER_H_ADDR  = 6'b100110;
  localparam RD_INT_F_ADDR    = 6'b100111;
  localparam RD_MASK          = 6'b101000;
  localparam RD_IMEM_SIZE     = 6'b101001;
  localparam RD_DMEM_SIZE     = 6'b101010;
  localparam RD_PMEM_SIZE     = 6'b101011;
  localparam RD_PMEM_SEG_SIZE = 6'b101100;
  localparam RD_PMEM_SEG_CNT  = 6'b101101;
  localparam RD_BC_SIZE       = 6'b101110;
  localparam MAX_SLOT_CNT     = 6'b101111;
  localparam DEBUG_IN_ADDR_L  = 6'b110000;
  localparam DEBUG_IN_ADDR_H  = 6'b110001;
  localparam RD_BC_MASK       = 6'b110010;
  localparam RD_BC_EQUAL      = 6'b110011;
  localparam RD_BC_ADDR       = 6'b110100;
  localparam RD_FIFO_OCC      = 6'b110101;
  localparam RD_ACT_SLOT_ADDR = 6'b110110;

  reg [31:0] dram_recv_flag;

  wire [DMEM_ADDR_WIDTH-1:0] bc_msg_in_addr_f;

  always @ (posedge clk)
    if (rst)
      io_ren_r <= 1'b0;
    else
      io_ren_r <= io_read;

  // User interrupts can be masked, but not the memory access errors
  wire [31:0] int_flags = {12'd0, io_access_err, pmem_access_err,
                           dmem_access_err, imem_access_err,
                           3'd0, inv_desc_int, inv_slot_int,
                           dupl_slot_int, ext_io_err, bc_int_fifo_err,
                           2'd0, evict_int, poke_int, bc_msg_int,
                           dram_recv_any, in_desc_valid, timer_interrupt};
                           // & {16'hFFFF, int_mask};

  always @ (posedge clk)
    if (io_read)
      case (io_addr)
        RD_DESC_ADDR_L:   if (in_desc_valid) io_read_data <= in_desc[31:0];
        RD_DESC_ADDR_H:   if (in_desc_valid) io_read_data <= in_desc[63:32];
        RD_D_FLAGS_ADDR:  io_read_data <= dram_recv_flag;
        RD_STAT_ADDR:     io_read_data <= {7'd0,core_msg_ready, 7'd0,slot_wr_ready,
                                           7'd0,out_desc_ready, 7'd0,in_desc_valid};
        RD_ID_ADDR:       io_read_data <= {24'd0, core_id};
        RD_TIMER_L_ADDR:  io_read_data <= timer[31:0];
        RD_TIMER_H_ADDR:  io_read_data <= timer[63:32];
        RD_INT_F_ADDR:    io_read_data <= int_flags;
        RD_MASK:          io_read_data <= {16'd0, int_mask};
        RD_IMEM_SIZE:     io_read_data <= IMEM_SIZE;
        RD_DMEM_SIZE:     io_read_data <= DMEM_SIZE;
        RD_PMEM_SIZE:     io_read_data <= PMEM_SIZE;
        RD_PMEM_SEG_SIZE: io_read_data <= PMEM_SEG_SIZE;
        RD_PMEM_SEG_CNT:  io_read_data <= PMEM_SEG_COUNT;
        RD_BC_SIZE:       io_read_data <= bc_region_size;
        MAX_SLOT_CNT:     io_read_data <= max_slot_count;
        DEBUG_IN_ADDR_L:  io_read_data <= debug_in[31:0];
        DEBUG_IN_ADDR_H:  io_read_data <= debug_in[63:32];

        RD_BC_MASK:       io_read_data <= {{(32-DMEM_ADDR_WIDTH){1'b0}},
                                          bc_mask_reg};
        RD_BC_EQUAL:      io_read_data <= {{(32-DMEM_ADDR_WIDTH){1'b0}},
                                          bc_equal_reg};
        RD_BC_ADDR:       io_read_data <= {{(32-DMEM_ADDR_WIDTH){1'b0}},
                                          bc_msg_in_addr_f};
        RD_FIFO_OCC:      io_read_data <= {core_msg_items,  dram_req_items,
                                          dram_send_items, send_data_items};
        RD_ACT_SLOT_ADDR: io_read_data <= active_slots;

        default: begin end
      endcase

  ///////////////////////////////////////////////////////////////////////////
  //////////////////////// INTERNAL 32-BIT TIMER ////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  reg [31:0] interrupt_time;

  always @ (posedge clk)
    if (rst || timer_step_wen) begin
      interrupt_time  <= 32'd0;
      timer_interrupt <= 1'b0;
    end else if (interrupt_time == timer_step_r) begin
      interrupt_time  <= 32'd0;
      timer_interrupt <= 1'b1;
    end else begin
      interrupt_time  <= interrupt_time + 32'd1;
      if (timer_int_ack)
        timer_interrupt <= 1'b0;
    end

  ///////////////////////////////////////////////////////////////////////////
  /////////////////////////// DRAM RECV FLAGS ///////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  reg [4:0]  recv_dram_tag_r;
  reg        recv_dram_tag_valid_r;

  // Register the input to improve timing
  always @ (posedge clk) begin
    recv_dram_tag_r         <= recv_dram_tag;
    recv_dram_tag_valid_r   <= recv_dram_tag_valid;
    if (rst)
      recv_dram_tag_valid_r <= 1'b0;
  end

  always @ (posedge clk)
    if (rst)
      dram_recv_flag <= 32'd0;
    else begin
      if (dram_flags_wen)
          for (i = 0; i < 4; i = i + 1)
              if (dmem_wr_strb[i] == 1'b1)
                  dram_recv_flag[i*8 +: 8] <= mem_wr_data[i*8 +: 8];

      if (dram_flag_rst)
        dram_recv_flag[mem_wr_data[4:0]] <= 1'b0;

      // Incoming dram recv has higher priority than core reset on same bit
      if (recv_dram_tag_valid_r)
        dram_recv_flag[recv_dram_tag_r] <= 1'b1;

      dram_recv_flag[0] <= 1'b0; // synthesizer will hardwire it
    end

  assign dram_recv_any = | dram_recv_flag;

  ///////////////////////////////////////////////////////////////////////////
  //////////////////////// BC MSG FILTER AND FIFO ///////////////////////////
  ///////////////////////////////////////////////////////////////////////////

  reg [DMEM_ADDR_WIDTH-1:0] bc_msg_in_addr_r;
  reg                       bc_msg_in_valid_r;
  wire                      bc_int_ready;

  // Select which address bits to match, and the match value
  always @ (posedge clk) begin
    bc_msg_in_addr_r  <= bc_msg_in_addr;
    bc_msg_in_valid_r <= bc_msg_in_valid && bc_msg_fifo_en &&
                       ((bc_msg_in_addr & bc_mask_reg) == bc_equal_reg);
    if (rst)
      bc_msg_in_valid_r <= 1'b0;
  end

  basic_fifo # (
    .DEPTH(16),
    .DATA_WIDTH(DMEM_ADDR_WIDTH)
  ) bc_interrupt_fifo (
    .clk(clk),
    .rst(rst),
    .clear(!bc_msg_fifo_en),

    .din_valid(bc_msg_in_valid_r),
    .din(bc_msg_in_addr_r),
    .din_ready(bc_int_ready), // For now assume we have space

    .dout_valid(bc_msg_int),
    .dout(bc_msg_in_addr_f),
    .dout_ready(bc_msg_taken),

    .item_count(),
    .full(),
    .empty()
  );

  ///////////////////////////////////////////////////////////////////////////
  ///////////// ADDRESS ERROR CATCHING & INTERRUPT ACK //////////////////////
  ///////////////////////////////////////////////////////////////////////////
  // Register addresses and enables for error catching
  reg [31:0] imem_addr_r, dmem_addr_r;
  reg imem_ren_r, dmem_en_r, pmem_en_r, intio_en_r;

  always @ (posedge clk) begin
    imem_addr_r       <= imem_addr;
    dmem_addr_r       <= dmem_addr;
    imem_ren_r        <= imem_ren;
    intio_en_r        <= internal_io && dmem_v;
    dmem_en_r         <= dmem_en;
    pmem_en_r         <= pmem_en;
    if (rst) begin
      imem_ren_r      <= 1'b0;
      intio_en_r      <= 1'b0;
      dmem_en_r       <= 1'b0;
      pmem_en_r       <= 1'b0;
    end
  end

  // Each error stays asserted until it is reset by corresponding bit when interrupt_ack is asserted
  always @ (posedge clk)
    if (rst) begin
      imem_access_err <= 1'b0;
      dmem_access_err <= 1'b0;
      pmem_access_err <= 1'b0;
      io_access_err   <= 1'b0;
      bc_int_fifo_err <= 1'b0;
    end else begin
      // These errors are registered, not asserted from outside and wait for ack
      imem_access_err <= !(interrupt_ack && mem_wr_data[16]) && (imem_access_err ||
                         (imem_ren_r && (imem_addr_r >= IMEM_SIZE)));

      dmem_access_err <= !(interrupt_ack && mem_wr_data[17]) && (dmem_access_err ||
                           (dmem_en_r && (dmem_addr_r[22:0] >= DMEM_SIZE)));

      pmem_access_err <= !(interrupt_ack && mem_wr_data[18]) && (pmem_access_err ||
                           (pmem_en_r && (dmem_addr_r[23:0] >= PMEM_SIZE)));

      io_access_err   <= !(interrupt_ack && mem_wr_data[19]) && (io_access_err ||
                           (intio_en_r && (dmem_addr_r[21:0] >= 22'h000100)));

      bc_int_fifo_err <= !(interrupt_ack && mem_wr_data[8]) && (bc_int_fifo_err ||
                           (bc_msg_fifo_en && bc_msg_in_valid_r && !bc_int_ready));
    end

  assign core_errors = {3'd0, ext_io_err, io_access_err, pmem_access_err, dmem_access_err, imem_access_err};

endmodule

`resetall
