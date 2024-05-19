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

module rpu_controller # (
  parameter DMEM_ADDR_WIDTH = 15,
  parameter MSG_ADDR_WIDTH  = 11,
  parameter MSG_WIDTH       = 32+4+MSG_ADDR_WIDTH,
  parameter SLOT_COUNT      = 16
) (
  input  wire                       clk,
  input  wire                       rst,
  input  wire                       core_reset,


  // -------------- BROADCAST MSG CONTROL --------------- //
  // Monitor on DMEM write
  input  wire                       core_dmem_en_mon,
  input  wire                       core_mem_wen_mon,
  input  wire [3:0]                 core_mem_strb_mon,
  input  wire [24:0]                core_mem_addr_mon,
  input  wire [31:0]                core_mem_wr_data_mon,

  // Broadcast messages, and potential block for core_mem_wr
  input  wire [DMEM_ADDR_WIDTH-1:0] bc_start_addr,
  output wire [MSG_WIDTH-1:0]       bc_msg_out,
  output wire                       bc_msg_out_valid,
  input  wire                       bc_msg_out_ready,
  output wire                       core_mem_bc_block,

  // --------------- DESCRIPTORS CONTROL ---------------- //
  // Monitor on in_desc
  input  wire [63:0]                in_desc_mon,
  input  wire                       in_desc_valid_mon,
  input  wire                       in_desc_taken_mon,

  // Width converter on out_desc
  input  wire [63:0]                core_desc_hdr,
  input  wire [63:0]                core_desc_dram_addr,
  input  wire                       core_desc_valid,
  output wire                       core_desc_ready,

  output wire [63:0]                out_desc,
  output wire                       out_desc_2nd,
  output wire                       out_desc_valid,
  input  wire                       out_desc_ready,

  // ------- INTERCONNECT STATUS CHANNEL CONTROL -------- //
  input  wire [31:0]                intercon_status_data,
  input  wire [2:0]                 intercon_status_addr,

  // Information from Interconnect
  output reg  [15:0]                bc_region_size,
  output reg  [7:0]                 core_id,
  output reg  [7:0]                 max_slot_count,

  output reg  [7:0]                 send_data_items,
  output reg  [7:0]                 dram_send_items,
  output reg  [7:0]                 dram_req_items,
  output reg  [7:0]                 core_msg_items,

  output reg  [SLOT_COUNT:1]        slots_in_prog,
  output reg  [63:0]                debug_in,
  output reg  [63:0]                timer,

  output reg  [4:0]                 recv_dram_tag,
  output reg                        recv_dram_tag_v,

  // Interrupts and their acks
  output reg                        evict_int,
  input  wire                       evict_int_ack,
  output reg                        poke_int,
  input  wire                       poke_int_ack,
  output reg                        dupl_slot_int,
  input  wire                       dupl_slot_int_ack,
  output reg                        inv_slot_int,
  input  wire                       inv_slot_int_ack,
  output reg                        inv_desc_int,
  input  wire                       inv_desc_int_ack,

  // ----------- RPU STATUS CHANNEL CONTROL ------------- //
  output wire [31:0]                rpu_status_data,
  output wire [2:0]                 rpu_status_addr,

  input  wire [31:0]                slot_wr_data,
  input  wire                       slot_wr_valid,
  output wire                       slot_wr_ready,

  input  wire [15:0]                lb_tag_len,
  input  wire                       tag_len_wr_valid,

  input  wire [63:0]                debug_out,
  input  wire                       debug_out_l_valid,
  input  wire                       debug_out_h_valid,

  input  wire [7:0]                 core_errors,
  input  wire                       ready_to_evict,
  input  wire [7:0]                 mem_fifo_fulls
);

///////////////////////////////////////////////////////////////////////////
/////////////////////// BROADCAST MESSAGES ////////////////////////////////
///////////////////////////////////////////////////////////////////////////

// Broadcast messaging
assign bc_msg_out[31:0]           = core_mem_wr_data_mon;
assign bc_msg_out[35:32]          = core_mem_strb_mon;
assign bc_msg_out[MSG_WIDTH-1:36] = core_mem_addr_mon[MSG_ADDR_WIDTH+2-1:2];
assign bc_msg_out_valid           = core_dmem_en_mon && core_mem_wen_mon &&
                    (core_mem_addr_mon[DMEM_ADDR_WIDTH-1:0] > bc_start_addr);

assign core_mem_bc_block = bc_msg_out_valid && !bc_msg_out_ready;

///////////////////////////////////////////////////////////////////////////
////////////////////////// OUT DESC MERGER ////////////////////////////////
///////////////////////////////////////////////////////////////////////////
localparam DESC=1'b0;
localparam DRAM=1'b1;
reg out_desc_state;

wire [3:0] out_desc_type = core_desc_hdr[63:60];
wire           dram_desc = (out_desc_type == 4'd4) || (out_desc_type == 4'd5);

always @ (posedge clk) begin
  if (out_desc_valid && out_desc_ready)
    if ((out_desc_state==DESC) && dram_desc)
      out_desc_state <= DRAM;
    else
      out_desc_state <= DESC;

  if (rst || core_reset)
    out_desc_state <= DESC;
end

assign out_desc_2nd    = (out_desc_state==DRAM);
assign out_desc        = (out_desc_state==DRAM) ?
                          core_desc_dram_addr : core_desc_hdr;
assign out_desc_valid  = core_desc_valid;
assign core_desc_ready = (out_desc_state==DESC) && dram_desc ?
                          1'b0: out_desc_ready ;

///////////////////////////////////////////////////////////////////////////
///////////////////////// TRACKING ACTIVE SLOTS ///////////////////////////
///////////////////////////////////////////////////////////////////////////
localparam SLOT_WIDTH = $clog2(SLOT_COUNT+1);

wire [SLOT_WIDTH-1:0] in_desc_slot  = in_desc_mon [16+:SLOT_WIDTH];
wire [SLOT_WIDTH-1:0] out_desc_slot = core_desc_hdr[16+:SLOT_WIDTH];

wire done_w_slot = ((out_desc_type == 4'd0) ||
                    (out_desc_type == 4'd1) ||
                    (out_desc_type == 4'd2)) &&
                    out_desc_valid && out_desc_ready;

always @ (posedge clk) begin
  if (in_desc_valid_mon && in_desc_taken_mon)
    slots_in_prog[in_desc_slot]  <= 1'b1;
  if (done_w_slot)
    slots_in_prog[out_desc_slot] <= 1'b0;

  if (rst || core_reset)
    slots_in_prog <= {SLOT_COUNT{1'b0}};
end

///////////////////////////////////////////////////////////////////////////
/////////////////// STATUS CHANNEL FROM INTERCONNECT //////////////////////
///////////////////////////////////////////////////////////////////////////
always @ (posedge clk) begin
  timer           <= timer + 64'd1;
  recv_dram_tag_v <= 1'b0; //Single cycle signal

  case (intercon_status_addr)
    3'b000: begin
              bc_region_size <= intercon_status_data[15:0];
              max_slot_count <= intercon_status_data[23:16];
              core_id        <= intercon_status_data[31:24];
    end

    3'b001: timer <= {timer[63:32], intercon_status_data};
    3'b010: timer <= {intercon_status_data, timer[31:0]};

    3'b011: begin
              recv_dram_tag_v <= intercon_status_data[21];
              dupl_slot_int   <= intercon_status_data[20];
              inv_slot_int    <= intercon_status_data[19];
              inv_desc_int    <= intercon_status_data[18];
              poke_int        <= intercon_status_data[17];
              evict_int       <= intercon_status_data[16];
              recv_dram_tag   <= intercon_status_data[4:0];
     end
    3'b100: debug_in[31:0]  <= intercon_status_data;
    3'b101: debug_in[63:32] <= intercon_status_data;
    3'b110: begin
              core_msg_items  <= intercon_status_data[31:24];
              dram_req_items  <= intercon_status_data[23:16];
              dram_send_items <= intercon_status_data[15:8];
              send_data_items <= intercon_status_data[7:0];
    end
    default: begin end
  endcase

  if (dupl_slot_int_ack)
    dupl_slot_int <= 1'b0;
  if (inv_slot_int_ack)
    inv_slot_int <= 1'b0;
  if (inv_desc_int_ack)
    inv_desc_int <= 1'b0;
  if (poke_int_ack)
    poke_int <= 1'b0;
  if (evict_int_ack)
    evict_int <= 1'b0;

  if (rst || core_reset) begin
    recv_dram_tag_v <= 1'b0;
    dupl_slot_int   <= 1'b0;
    inv_slot_int    <= 1'b0;
    inv_desc_int    <= 1'b0;
    poke_int        <= 1'b0;
    evict_int       <= 1'b0;
  end
end

///////////////////////////////////////////////////////////////////////////
//////////////////// STATUS CHANNEL TO INTERCONNECT ///////////////////////
///////////////////////////////////////////////////////////////////////////
assign rpu_status_addr = slot_wr_valid     ? 3'd1 :
                         tag_len_wr_valid  ? 3'd4 :
                         debug_out_l_valid ? 3'd2 :
                         debug_out_h_valid ? 3'd3 :
                                              3'd0 ;

assign rpu_status_data = slot_wr_valid     ? slot_wr_data :
                         tag_len_wr_valid  ? {16'd0, lb_tag_len} :
                         debug_out_l_valid ? debug_out[31:0] :
                         debug_out_h_valid ? debug_out[63:32] :
                         {14'd0, core_reset, ready_to_evict,
                         mem_fifo_fulls, core_errors};

assign slot_wr_ready   = 1'b1;

endmodule

`resetall
