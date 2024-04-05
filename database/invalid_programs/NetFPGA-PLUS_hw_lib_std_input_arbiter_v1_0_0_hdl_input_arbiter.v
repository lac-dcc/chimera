//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2010, 2011 Adam Covington
// Copyright (C) 2015 Noa Zilberman
// Copyright (C) 2021 Yuta Tokusashi
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme,
// and by the University of Cambridge Computer Laboratory under EPSRC EARL Project
// EP/P025374/1 alongside support from Xilinx Inc.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//
/*******************************************************************************
 *  File:
 *        input_arbiter.v
 *
 *  Library:
 *        hw/std/cores/input_arbiter
 *
 *  Module:
 *        input_arbiter
 *
 *  Author:
 *        Adam Covington
 *        Modified by Noa Zilberman
 * 		
 *  Description:
 *        Round Robin arbiter (N inputs to 1 output)
 *        Inputs have a parameterizable width
 *
 */

`timescale 1ns/1ns
`include "input_arbiter_cpu_regs_defines.v"

module input_arbiter
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=512,
    parameter C_S_AXIS_DATA_WIDTH=512,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter NUM_QUEUES=3,
    
    // AXI Registers Data Width
    parameter C_S_AXI_DATA_WIDTH    = 32,          
    parameter C_S_AXI_ADDR_WIDTH    = 12,          
    parameter C_BASEADDR            = 32'h00000000
 
)
(
    // Part 1: System side signals
    // Global Ports
    input axis_aclk,
    input axis_resetn,

    // Master Stream Ports (interface to data path)
    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser,
    output m_axis_tvalid,
    input  m_axis_tready,
    output m_axis_tlast,

    // Slave Stream Ports (interface to RX queues)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_0_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_0_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_0_tuser,
    input  s_axis_0_tvalid,
    output s_axis_0_tready,
    input  s_axis_0_tlast,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_1_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_1_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_1_tuser,
    input  s_axis_1_tvalid,
    output s_axis_1_tready,
    input  s_axis_1_tlast,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_2_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_2_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_2_tuser,
    input  s_axis_2_tvalid,
    output s_axis_2_tready,
    input  s_axis_2_tlast,

    // Slave AXI Ports
    input                                     S_AXI_ACLK,
    input                                     S_AXI_ARESETN,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    input                                     S_AXI_AWVALID,
    input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
    input                                     S_AXI_WVALID,
    input                                     S_AXI_BREADY,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    input                                     S_AXI_ARVALID,
    input                                     S_AXI_RREADY,
    output                                    S_AXI_ARREADY,
    output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
    output     [1 : 0]                        S_AXI_RRESP,
    output                                    S_AXI_RVALID,
    output                                    S_AXI_WREADY,
    output     [1 :0]                         S_AXI_BRESP,
    output                                    S_AXI_BVALID,
    output                                    S_AXI_AWREADY

);

  function integer log2;
     input integer number;
     begin
        log2=0;
        while(2**log2<number) begin
           log2=log2+1;
        end
     end
  endfunction // log2

  // ------------ Internal Params --------

  localparam  NUM_QUEUES_WIDTH = log2(NUM_QUEUES);


  localparam NUM_STATES = 1;
  localparam IDLE = 0;
  localparam WR_PKT = 1;

  localparam MAX_PKT_SIZE = 2000; // In bytes
  localparam IN_FIFO_DEPTH_BIT = log2(MAX_PKT_SIZE/(C_M_AXIS_DATA_WIDTH / 8));

  // ------------- Regs/ wires -----------

  wire [NUM_QUEUES-1:0]               nearly_full;
  wire [NUM_QUEUES-1:0]               empty;
  wire [2*NUM_QUEUES-1:0]             extended_empty;  //extend the empty vector for easier comparison
  wire [C_M_AXIS_DATA_WIDTH-1:0]        in_tdata      [NUM_QUEUES-1:0];
  wire [((C_M_AXIS_DATA_WIDTH/8))-1:0]  in_tkeep      [NUM_QUEUES-1:0];
  wire [C_M_AXIS_TUSER_WIDTH-1:0]             in_tuser      [NUM_QUEUES-1:0];
  wire [NUM_QUEUES-1:0] 	       in_tvalid;
  wire [NUM_QUEUES-1:0]               in_tlast;
  wire [C_M_AXIS_TUSER_WIDTH-1:0]             fifo_out_tuser[NUM_QUEUES-1:0];
  wire [C_M_AXIS_DATA_WIDTH-1:0]        fifo_out_tdata[NUM_QUEUES-1:0];
  wire [((C_M_AXIS_DATA_WIDTH/8))-1:0]  fifo_out_tkeep[NUM_QUEUES-1:0];
  wire [NUM_QUEUES-1:0] 	       fifo_out_tlast;
  reg [NUM_QUEUES-1:0]                rd_en;

  wire [NUM_QUEUES_WIDTH-1:0]         next_queue; //next non-empty queue
  wire [NUM_QUEUES_WIDTH:0]       extended_next_queue; //extended non-empty queue, looking beyond the current array length
  reg [NUM_QUEUES_WIDTH-1:0]          cur_queue;
  reg [NUM_QUEUES_WIDTH-1:0]          cur_queue_next;

  reg [NUM_STATES-1:0]                state;
  reg [NUM_STATES-1:0]                state_next;

  reg      [`REG_ID_BITS]    id_reg;
  reg      [`REG_VERSION_BITS]    version_reg;
  wire     [`REG_RESET_BITS]    reset_reg;
  reg      [`REG_FLIP_BITS]    ip2cpu_flip_reg;
  wire     [`REG_FLIP_BITS]    cpu2ip_flip_reg;
  reg      [`REG_PKTIN_BITS]    pktin_reg;
  wire                             pktin_reg_clear;
  reg      [`REG_PKTOUT_BITS]    pktout_reg;
  wire                             pktout_reg_clear;
  reg      [`REG_DEBUG_BITS]    ip2cpu_debug_reg;
  wire     [`REG_DEBUG_BITS]    cpu2ip_debug_reg;

  wire clear_counters;
  wire reset_registers;
  wire unused;

  // ------------ Modules -------------

  generate
  genvar i;
  for(i=0; i<NUM_QUEUES; i=i+1) begin: in_arb_queues
    fallthrough_small_fifo
       #( .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
          .MAX_DEPTH_BITS(IN_FIFO_DEPTH_BIT))
     in_arb_fifo
       (// Outputs
        .dout                           ({fifo_out_tlast[i], fifo_out_tuser[i], fifo_out_tkeep[i], fifo_out_tdata[i]}),
        .full                           (),
        .nearly_full                    (nearly_full[i]),
        .prog_full                      (),
        .empty                          (empty[i]),
        // Inputs
        .din                            ({in_tlast[i], in_tuser[i], in_tkeep[i], in_tdata[i]}),
        .wr_en                          (in_tvalid[i] & ~nearly_full[i]),
        .rd_en                          (rd_en[i]),
        .reset                          (~axis_resetn),
        .clk                            (axis_aclk));
  end
  endgenerate

  // ------------- Logic ------------

  assign in_tdata[0]        = s_axis_0_tdata;
  assign in_tkeep[0]        = s_axis_0_tkeep;
  assign in_tuser[0]        = s_axis_0_tuser;
  assign in_tvalid[0]       = s_axis_0_tvalid;
  assign in_tlast[0]        = s_axis_0_tlast;
  assign s_axis_0_tready    = !nearly_full[0];

  assign in_tdata[1]        = s_axis_1_tdata;
  assign in_tkeep[1]        = s_axis_1_tkeep;
  assign in_tuser[1]        = s_axis_1_tuser;
  assign in_tvalid[1]       = s_axis_1_tvalid;
  assign in_tlast[1]        = s_axis_1_tlast;
  assign s_axis_1_tready    = !nearly_full[1];

  assign in_tdata[2]        = s_axis_2_tdata;
  assign in_tkeep[2]        = s_axis_2_tkeep;
  assign in_tuser[2]        = s_axis_2_tuser;
  assign in_tvalid[2]       = s_axis_2_tvalid;
  assign in_tlast[2]        = s_axis_2_tlast;
  assign s_axis_2_tready    = !nearly_full[2];

  //Find the next non-empty queue
  assign extended_empty = {empty,empty};
  assign extended_next_queue = !extended_empty[cur_queue+1] ? cur_queue+1 : 
                               !extended_empty[cur_queue+2] ? cur_queue+2 :
                               !extended_empty[cur_queue+3] ? cur_queue+3 :
                               cur_queue+1;
  assign {unused,next_queue} = (extended_next_queue > NUM_QUEUES-1) ? extended_next_queue - NUM_QUEUES : extended_next_queue; 

  assign m_axis_tuser = fifo_out_tuser[cur_queue];
  assign m_axis_tdata = fifo_out_tdata[cur_queue];
  assign m_axis_tlast = fifo_out_tlast[cur_queue];
  assign m_axis_tkeep = fifo_out_tkeep[cur_queue];
  assign m_axis_tvalid = ~empty[cur_queue];


  always @(*) begin
     state_next      = state;
     cur_queue_next  = cur_queue;
     rd_en           = 0;

     case(state)

       /* cycle between input queues until one is not empty */
       IDLE: begin
          if(!empty[cur_queue]) begin
             if(m_axis_tready && m_axis_tlast) begin
                state_next = IDLE;
                rd_en[cur_queue] = 1;
                cur_queue_next = next_queue;
             end
             else if(m_axis_tready) begin
                state_next = WR_PKT;
                rd_en[cur_queue] = 1;
             end
          end
          else begin
             cur_queue_next = next_queue;
          end
       end

       /* wait until eop */
       WR_PKT: begin
          /* if this is the last word then write it and get out */
          if(m_axis_tready & m_axis_tlast) begin
             state_next = IDLE;
             rd_en[cur_queue] = 1;
             cur_queue_next = next_queue;  //next non-empty queue
          end
          /* otherwise read and write as usual */
          else if (m_axis_tready & !empty[cur_queue]) begin
             rd_en[cur_queue] = 1;
          end
       end // case: WR_PKT

     endcase // case(state)
  end // always @ (*)

  always @(posedge axis_aclk) begin
     if(~axis_resetn) begin
        state <= IDLE;
        cur_queue <= 0;
     end
     else begin
        state <= state_next;
        cur_queue <= cur_queue_next;
     end
  end


  //Registers section
  input_arbiter_cpu_regs 
  #(
    .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
    .C_BASE_ADDRESS    (C_BASEADDR)
  ) arbiter_cpu_regs_inst
  (   
    // General ports
     .clk                    (axis_aclk),
     .resetn                 (axis_resetn),
    // AXI Lite ports
     .S_AXI_ACLK             (S_AXI_ACLK),
     .S_AXI_ARESETN          (S_AXI_ARESETN),
     .S_AXI_AWADDR           (S_AXI_AWADDR),
     .S_AXI_AWVALID          (S_AXI_AWVALID),
     .S_AXI_WDATA            (S_AXI_WDATA),
     .S_AXI_WSTRB            (S_AXI_WSTRB),
     .S_AXI_WVALID           (S_AXI_WVALID),
     .S_AXI_BREADY           (S_AXI_BREADY),
     .S_AXI_ARADDR           (S_AXI_ARADDR),
     .S_AXI_ARVALID          (S_AXI_ARVALID),
     .S_AXI_RREADY           (S_AXI_RREADY),
     .S_AXI_ARREADY          (S_AXI_ARREADY),
     .S_AXI_RDATA            (S_AXI_RDATA),
     .S_AXI_RRESP            (S_AXI_RRESP),
     .S_AXI_RVALID           (S_AXI_RVALID),
     .S_AXI_WREADY           (S_AXI_WREADY),
     .S_AXI_BRESP            (S_AXI_BRESP),
     .S_AXI_BVALID           (S_AXI_BVALID),
     .S_AXI_AWREADY          (S_AXI_AWREADY),

    // Register ports
    .id_reg          (id_reg),
    .version_reg          (version_reg),
    .reset_reg          (reset_reg),
    .ip2cpu_flip_reg          (ip2cpu_flip_reg),
    .cpu2ip_flip_reg          (cpu2ip_flip_reg),
    .pktin_reg          (pktin_reg),
    .pktin_reg_clear    (pktin_reg_clear),
    .pktout_reg          (pktout_reg),
    .pktout_reg_clear    (pktout_reg_clear),
    .ip2cpu_debug_reg          (ip2cpu_debug_reg),
    .cpu2ip_debug_reg          (cpu2ip_debug_reg),
    // Global Registers - user can select if to use
    .cpu_resetn_soft(),//software reset, after cpu module
    .resetn_soft    (),//software reset to cpu module (from central reset management)
    .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
  );

  assign clear_counters = reset_reg[0];
  assign reset_registers = reset_reg[4];

  always @(posedge axis_aclk)
    if (~resetn_sync | reset_registers) begin
      id_reg <= #1    `REG_ID_DEFAULT;
      version_reg <= #1    `REG_VERSION_DEFAULT;
      ip2cpu_flip_reg <= #1    `REG_FLIP_DEFAULT;
      pktin_reg <= #1    `REG_PKTIN_DEFAULT;
      pktout_reg <= #1    `REG_PKTOUT_DEFAULT;
      ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT;
    end
    else begin
      id_reg <= #1 `REG_ID_DEFAULT;
      version_reg <= #1 `REG_VERSION_DEFAULT;
      ip2cpu_flip_reg <= #1 ~cpu2ip_flip_reg;
      pktin_reg[`REG_PKTIN_WIDTH -2: 0] <= #1  clear_counters | pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_0_tlast && s_axis_0_tvalid && s_axis_0_tready ) + (s_axis_1_tlast && s_axis_1_tvalid && s_axis_1_tready) + (s_axis_2_tlast && s_axis_2_tvalid && s_axis_2_tready);
        pktin_reg[`REG_PKTIN_WIDTH-1] <= #1 clear_counters | pktin_reg_clear ? 1'h0 : pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_0_tlast && s_axis_0_tvalid && s_axis_0_tready ) + (s_axis_1_tlast && s_axis_1_tvalid && s_axis_1_tready) + (s_axis_2_tlast && s_axis_2_tvalid && s_axis_2_tready) > {(`REG_PKTIN_WIDTH-1){1'b1}} ? 1'b1 : pktin_reg[`REG_PKTIN_WIDTH-1];
                                                                 
      pktout_reg [`REG_PKTOUT_WIDTH-2:0]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tvalid && m_axis_tlast && m_axis_tready ) ;
        pktout_reg [`REG_PKTOUT_WIDTH-1]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tvalid && m_axis_tlast && m_axis_tready) > {(`REG_PKTOUT_WIDTH-1){1'b1}} ?  1'b1 : pktout_reg [`REG_PKTOUT_WIDTH-1];
      ip2cpu_debug_reg <= #1 `REG_DEBUG_DEFAULT+cpu2ip_debug_reg;
    end



endmodule
