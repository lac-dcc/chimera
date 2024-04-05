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
 *        output_queues.v
 *
 *  Library:
 *        hw/std/cores/output_queues.v
 *
 *  Module:
 *        output_queues.v
 *
 *  Author:
 *        Adam Covington
 *        Modified by Noa Zilberman
 * 		
 *  Description:
 *        BRAM Output queues
 *        Outputs have a parameterizable width
 *
 */

`timescale 1ns/1ns
`include "output_queues_cpu_regs_defines.v"

module output_queues
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

    // Slave Stream Ports (interface to data path)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
    input s_axis_tvalid,
    output s_axis_tready,
    input s_axis_tlast,

    // Master Stream Ports (interface to TX queues)
    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_0_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_0_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_0_tuser,
    output  m_axis_0_tvalid,
    input m_axis_0_tready,
    output  m_axis_0_tlast,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_1_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_1_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_1_tuser,
    output  m_axis_1_tvalid,
    input m_axis_1_tready,
    output  m_axis_1_tlast,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_2_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_2_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_2_tuser,
    output  m_axis_2_tvalid,
    input m_axis_2_tready,
    output  m_axis_2_tlast,

    // stats
    output reg  [C_S_AXI_DATA_WIDTH-1:0] bytes_stored,
    output reg  [NUM_QUEUES-1:0]         pkt_stored,

    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_0,
    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_1,
    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_2,
    output                           pkt_removed_0,
    output                           pkt_removed_1,
    output                           pkt_removed_2,

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
    output                                    S_AXI_AWREADY,

    output reg [C_S_AXI_DATA_WIDTH-1:0]  bytes_dropped,
    output reg [NUM_QUEUES-1:0]          pkt_dropped
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

  localparam NUM_QUEUES_WIDTH = log2(NUM_QUEUES);

  localparam BUFFER_SIZE         = 4096; // Buffer size 4096B
  localparam BUFFER_SIZE_WIDTH   = log2(BUFFER_SIZE/(C_M_AXIS_DATA_WIDTH/8));

  localparam MAX_PACKET_SIZE = 1600;
  localparam BUFFER_THRESHOLD = (BUFFER_SIZE-MAX_PACKET_SIZE)/(C_M_AXIS_DATA_WIDTH/8);

  localparam NUM_STATES = 3;
  localparam IDLE = 0;
  localparam WR_PKT = 1;
  localparam DROP = 2;

  localparam NUM_METADATA_STATES = 2;
  localparam WAIT_HEADER = 0;
  localparam WAIT_EOP = 1;


  // ------------- Regs/ wires -----------

  reg [NUM_QUEUES-1:0]                nearly_full;
  wire [NUM_QUEUES-1:0]               nearly_full_fifo, full_fifo, empty;

  reg [NUM_QUEUES-1:0]                metadata_nearly_full;
  wire [NUM_QUEUES-1:0]               metadata_nearly_full_fifo;
  wire [NUM_QUEUES-1:0]               metadata_full_fifo;
  wire [NUM_QUEUES-1:0]               metadata_empty;

  wire [C_M_AXIS_TUSER_WIDTH-1:0]     fifo_out_tuser[NUM_QUEUES-1:0];
  wire [C_M_AXIS_DATA_WIDTH-1:0]      fifo_out_tdata[NUM_QUEUES-1:0];
  wire [((C_M_AXIS_DATA_WIDTH/8))-1:0]fifo_out_tkeep[NUM_QUEUES-1:0];
  wire [NUM_QUEUES-1:0]               fifo_out_tlast;

  wire [NUM_QUEUES-1:0]               rd_en, wr_en;

  reg [NUM_QUEUES-1:0]                metadata_rd_en;
  wire [NUM_QUEUES-1:0]               metadata_wr_en;

  reg [NUM_QUEUES-1:0]                cur_queue, cur_queue_next;
  wire [NUM_QUEUES-1:0]               oq;

  reg [NUM_STATES-1:0]                state, state_next;

  reg [NUM_METADATA_STATES-1:0]       metadata_state[NUM_QUEUES-1:0];
  reg [NUM_METADATA_STATES-1:0]       metadata_state_next[NUM_QUEUES-1:0];

  reg [NUM_QUEUES-1:0] pkt_stored_next;
  reg [C_S_AXI_DATA_WIDTH-1:0] bytes_stored_next;
  reg [NUM_QUEUES-1:0] pkt_dropped_next;
  reg [C_S_AXI_DATA_WIDTH-1:0] bytes_dropped_next;
  reg [NUM_QUEUES-1:0] pkt_removed;
  reg [C_S_AXI_DATA_WIDTH-1:0] bytes_removed[NUM_QUEUES-1:0];

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

  reg      [`REG_PKTSTOREDPORT0_BITS]    pktstoredport0_reg;
  wire                             pktstoredport0_reg_clear;
  reg      [`REG_BYTESSTOREDPORT0_BITS]    bytesstoredport0_reg;
  wire                             bytesstoredport0_reg_clear;
  reg      [`REG_PKTREMOVEDPORT0_BITS]    pktremovedport0_reg;
  wire                             pktremovedport0_reg_clear;
  reg      [`REG_BYTESREMOVEDPORT0_BITS]    bytesremovedport0_reg;
  wire                             bytesremovedport0_reg_clear;
  reg      [`REG_PKTDROPPEDPORT0_BITS]    pktdroppedport0_reg;
  wire                             pktdroppedport0_reg_clear;
  reg      [`REG_BYTESDROPPEDPORT0_BITS]    bytesdroppedport0_reg;
  wire                             bytesdroppedport0_reg_clear;
  reg      [`REG_PKTINQUEUEPORT0_BITS]    pktinqueueport0_reg;
  wire                             pktinqueueport0_reg_clear;
  reg      [`REG_PKTSTOREDPORT1_BITS]    pktstoredport1_reg;
  wire                             pktstoredport1_reg_clear;
  reg      [`REG_BYTESSTOREDPORT1_BITS]    bytesstoredport1_reg;
  wire                             bytesstoredport1_reg_clear;
  reg      [`REG_PKTREMOVEDPORT1_BITS]    pktremovedport1_reg;
  wire                             pktremovedport1_reg_clear;
  reg      [`REG_BYTESREMOVEDPORT1_BITS]    bytesremovedport1_reg;
  wire                             bytesremovedport1_reg_clear;
  reg      [`REG_PKTDROPPEDPORT1_BITS]    pktdroppedport1_reg;
  wire                             pktdroppedport1_reg_clear;
  reg      [`REG_BYTESDROPPEDPORT1_BITS]    bytesdroppedport1_reg;
  wire                             bytesdroppedport1_reg_clear;
  reg      [`REG_PKTINQUEUEPORT1_BITS]    pktinqueueport1_reg;
  wire                             pktinqueueport1_reg_clear;
  reg      [`REG_PKTSTOREDPORT2_BITS]    pktstoredport2_reg;
  wire                             pktstoredport2_reg_clear;
  reg      [`REG_BYTESSTOREDPORT2_BITS]    bytesstoredport2_reg;
  wire                             bytesstoredport2_reg_clear;
  reg      [`REG_PKTREMOVEDPORT2_BITS]    pktremovedport2_reg;
  wire                             pktremovedport2_reg_clear;
  reg      [`REG_BYTESREMOVEDPORT2_BITS]    bytesremovedport2_reg;
  wire                             bytesremovedport2_reg_clear;
  reg      [`REG_PKTDROPPEDPORT2_BITS]    pktdroppedport2_reg;
  wire                             pktdroppedport2_reg_clear;
  reg      [`REG_BYTESDROPPEDPORT2_BITS]    bytesdroppedport2_reg;
  wire                             bytesdroppedport2_reg_clear;
  reg      [`REG_PKTINQUEUEPORT2_BITS]    pktinqueueport2_reg;
  wire                             pktinqueueport2_reg_clear;

  wire clear_counters;
  wire reset_registers;

  reg tready;


  // ------------ Modules -------------

  generate
  genvar i;
  for(i=0; i<NUM_QUEUES; i=i+1) begin: output_queues
     fallthrough_small_fifo
       #( .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
          .MAX_DEPTH_BITS(BUFFER_SIZE_WIDTH),
          .PROG_FULL_THRESHOLD(BUFFER_THRESHOLD))
     output_fifo
       (// Outputs
        .dout                           ({fifo_out_tlast[i], fifo_out_tkeep[i], fifo_out_tdata[i]}),
        .full                           (full_fifo[i]),
        .nearly_full                    (),
        .prog_full                      (nearly_full_fifo[i]),
        .empty                          (empty[i]),
        // Inputs
        .din                            ({s_axis_tlast, s_axis_tkeep, s_axis_tdata}),
        .wr_en                          (wr_en[i]),
        .rd_en                          (rd_en[i]),
        .reset                          (~axis_resetn),
        .clk                            (axis_aclk));

     fallthrough_small_fifo
       #( .WIDTH(C_M_AXIS_TUSER_WIDTH),
          .MAX_DEPTH_BITS(6))
     metadata_fifo
       (// Outputs
        .dout                           (fifo_out_tuser[i]),
        .full                           (metadata_full_fifo[i]),
        .nearly_full                    (metadata_nearly_full_fifo[i]),
        .prog_full                      (),
        .empty                          (metadata_empty[i]),
        // Inputs
        .din                            (s_axis_tuser),
        .wr_en                          (metadata_wr_en[i]),
        .rd_en                          (metadata_rd_en[i]),
        .reset                          (~axis_resetn),
        .clk                            (axis_aclk));


  always @(metadata_state[i], rd_en[i], fifo_out_tlast[i], fifo_out_tuser[i]) begin
       metadata_rd_en[i] = 1'b0;
       pkt_removed[i]= 1'b0;
       bytes_removed[i]=32'b0;
       metadata_state_next[i] = metadata_state[i];
       case(metadata_state[i])
           WAIT_HEADER: begin
               if(rd_en[i] & fifo_out_tlast[i]) begin
                   metadata_state_next[i] = WAIT_HEADER;
                   metadata_rd_en[i] = 1'b1;
                   pkt_removed[i]= 1'b1;
                   bytes_removed[i]=fifo_out_tuser[i][15:0];
               end
               else if(rd_en[i]) begin
                   metadata_state_next[i] = WAIT_EOP;
                   metadata_rd_en[i] = 1'b1;
                   pkt_removed[i]= 1'b1;
                   bytes_removed[i]=fifo_out_tuser[i][15:0];
               end
           end
           WAIT_EOP: begin
               if(rd_en[i] & fifo_out_tlast[i]) begin
                   metadata_state_next[i] = WAIT_HEADER;
               end
           end
       endcase
     end

     always @(posedge axis_aclk) begin
       if(~axis_resetn) begin
           metadata_state[i] <= WAIT_HEADER;
       end
       else begin
           metadata_state[i] <= metadata_state_next[i];
       end
     end

  end
  endgenerate

  // Per NetFPGA-10G AXI Spec
  localparam DST_POS = 24;
  assign oq = s_axis_tuser[DST_POS] |
              (s_axis_tuser[DST_POS + 2] << 1) |
              ((s_axis_tuser[DST_POS + 1] | s_axis_tuser[DST_POS + 3]) << 2);

  always @(*) begin
     state_next     = state;
     cur_queue_next = cur_queue;
     bytes_stored_next = 0;
     pkt_stored_next = 0;
     pkt_dropped_next = 0;
     bytes_dropped_next = 0;

     case(state)
       /* cycle between input queues until one is not empty */
       IDLE: begin
          cur_queue_next = oq;
          if(s_axis_tvalid && s_axis_tlast) begin
              if (~|((nearly_full_fifo | metadata_nearly_full_fifo) & oq)) begin
                   state_next = IDLE;
                   pkt_stored_next = oq;
                   bytes_stored_next = s_axis_tuser[15:0];
              end
              else begin
                   state_next = IDLE;
                   pkt_dropped_next = oq;
                   bytes_dropped_next = s_axis_tuser[15:0];
              end
          end
          else if(s_axis_tvalid && !s_axis_tlast) begin
              if(~|((nearly_full_fifo | metadata_nearly_full_fifo) & oq)) begin // All interesting oqs are NOT _nearly_ full (able to fit in the maximum pacekt).
                  state_next = WR_PKT;
                  pkt_stored_next = oq;
                  bytes_stored_next = s_axis_tuser[15:0];
              end
              else begin
                  state_next = DROP;
                  pkt_dropped_next = oq;
                  bytes_dropped_next = s_axis_tuser[15:0];
              end
          end
       end

       /* wait until eop */
       WR_PKT: begin
           if(s_axis_tvalid && s_axis_tlast) begin
               state_next = IDLE;
          end 
       end // case: WR_PKT

       DROP: begin
          if(s_axis_tvalid & s_axis_tlast ) begin
              state_next = IDLE;
          end
       end // case: DROP
       default: ;
     endcase // case(state)
  end // always @ (*)

  assign s_axis_tready =  1;//((~|(full_fifo | metadata_full_fifo) ));// | (state == DROP)); 
  assign wr_en = !(s_axis_tvalid & s_axis_tready)  ? 0 : 
                 (state == IDLE) ? (~|((nearly_full_fifo | metadata_nearly_full_fifo) & oq) ? oq : 0 ) :
                 (state == WR_PKT) ? cur_queue : 0;
  assign metadata_wr_en = !(s_axis_tvalid & s_axis_tready)  ? 0 : 
                 (state == IDLE) ? (~|((nearly_full_fifo | metadata_nearly_full_fifo) & oq) ? oq : 0 ) : 0;

  always @(posedge axis_aclk) begin
     if(~axis_resetn) begin
        state <= IDLE;
        cur_queue <= 0;
        bytes_stored <= 0;
        pkt_stored <= 0;
        pkt_dropped <=0;
        bytes_dropped <=0;
     end
     else begin
        state <= state_next;
        cur_queue <= cur_queue_next;
        bytes_stored <= bytes_stored_next;
        pkt_stored <= pkt_stored_next;
        pkt_dropped<= pkt_dropped_next;
        bytes_dropped<= bytes_dropped_next;
     end

     nearly_full <= nearly_full_fifo;
     metadata_nearly_full <= metadata_nearly_full_fifo;
  end


  assign m_axis_0_tdata	 = fifo_out_tdata[0];
  assign m_axis_0_tkeep	 = fifo_out_tkeep[0];
  assign m_axis_0_tuser	 = fifo_out_tuser[0];
  assign m_axis_0_tlast	 = fifo_out_tlast[0];
  assign m_axis_0_tvalid	 = ~empty[0];
  assign rd_en[0]		 = m_axis_0_tready & ~empty[0];
  assign pkt_removed_0		 = pkt_removed[0];
  assign bytes_removed_0          = bytes_removed[0];

  assign m_axis_1_tdata	 = fifo_out_tdata[1];
  assign m_axis_1_tkeep	 = fifo_out_tkeep[1];
  assign m_axis_1_tuser	 = fifo_out_tuser[1];
  assign m_axis_1_tlast	 = fifo_out_tlast[1];
  assign m_axis_1_tvalid	 = ~empty[1];
  assign rd_en[1]		 = m_axis_1_tready & ~empty[1];
  assign pkt_removed_1          = pkt_removed[1];
  assign bytes_removed_1          = bytes_removed[1];

  assign m_axis_2_tdata	 = fifo_out_tdata[2];
  assign m_axis_2_tkeep	 = fifo_out_tkeep[2];
  assign m_axis_2_tuser	 = fifo_out_tuser[2];
  assign m_axis_2_tlast	 = fifo_out_tlast[2];
  assign m_axis_2_tvalid	 = ~empty[2];
  assign rd_en[2]		 = m_axis_2_tready & ~empty[2];
  assign pkt_removed_2          = pkt_removed[2];
  assign bytes_removed_2          = bytes_removed[2];

  //Registers section
  output_queues_cpu_regs 
   #(
       .C_BASE_ADDRESS        (C_BASEADDR),
       .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
       .C_S_AXI_ADDR_WIDTH    (C_S_AXI_ADDR_WIDTH)
   ) output_queues_cpu_regs_inst
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
     .ip2cpu_debug_reg          (ip2cpu_debug_reg),
     .cpu2ip_debug_reg          (cpu2ip_debug_reg),
     .pktin_reg          (pktin_reg),
     .pktin_reg_clear    (pktin_reg_clear),
     .pktout_reg          (pktout_reg),
     .pktout_reg_clear    (pktout_reg_clear),
     .pktstoredport0_reg          (pktstoredport0_reg),
     .pktstoredport0_reg_clear    (pktstoredport0_reg_clear),
     .bytesstoredport0_reg          (bytesstoredport0_reg),
     .bytesstoredport0_reg_clear    (bytesstoredport0_reg_clear),
     .pktremovedport0_reg          (pktremovedport0_reg),
     .pktremovedport0_reg_clear    (pktremovedport0_reg_clear),
     .bytesremovedport0_reg          (bytesremovedport0_reg),
     .bytesremovedport0_reg_clear    (bytesremovedport0_reg_clear),
     .pktdroppedport0_reg          (pktdroppedport0_reg),
     .pktdroppedport0_reg_clear    (pktdroppedport0_reg_clear),
     .bytesdroppedport0_reg          (bytesdroppedport0_reg),
     .bytesdroppedport0_reg_clear    (bytesdroppedport0_reg_clear),
     .pktinqueueport0_reg          (pktinqueueport0_reg),
     .pktinqueueport0_reg_clear    (pktinqueueport0_reg_clear),
     .pktstoredport1_reg          (pktstoredport1_reg),
     .pktstoredport1_reg_clear    (pktstoredport1_reg_clear),
     .bytesstoredport1_reg          (bytesstoredport1_reg),
     .bytesstoredport1_reg_clear    (bytesstoredport1_reg_clear),
     .pktremovedport1_reg          (pktremovedport1_reg),
     .pktremovedport1_reg_clear    (pktremovedport1_reg_clear),
     .bytesremovedport1_reg          (bytesremovedport1_reg),
     .bytesremovedport1_reg_clear    (bytesremovedport1_reg_clear),
     .pktdroppedport1_reg          (pktdroppedport1_reg),
     .pktdroppedport1_reg_clear    (pktdroppedport1_reg_clear),
     .bytesdroppedport1_reg          (bytesdroppedport1_reg),
     .bytesdroppedport1_reg_clear    (bytesdroppedport1_reg_clear),
     .pktinqueueport1_reg          (pktinqueueport1_reg),
     .pktinqueueport1_reg_clear    (pktinqueueport1_reg_clear),
     .pktstoredport2_reg          (pktstoredport2_reg),
     .pktstoredport2_reg_clear    (pktstoredport2_reg_clear),
     .bytesstoredport2_reg          (bytesstoredport2_reg),
     .bytesstoredport2_reg_clear    (bytesstoredport2_reg_clear),
     .pktremovedport2_reg          (pktremovedport2_reg),
     .pktremovedport2_reg_clear    (pktremovedport2_reg_clear),
     .bytesremovedport2_reg          (bytesremovedport2_reg),
     .bytesremovedport2_reg_clear    (bytesremovedport2_reg_clear),
     .pktdroppedport2_reg          (pktdroppedport2_reg),
     .pktdroppedport2_reg_clear    (pktdroppedport2_reg_clear),
     .bytesdroppedport2_reg          (bytesdroppedport2_reg),
     .bytesdroppedport2_reg_clear    (bytesdroppedport2_reg_clear),
     .pktinqueueport2_reg          (pktinqueueport2_reg),
     .pktinqueueport2_reg_clear    (pktinqueueport2_reg_clear),
     // Global Registers - user can select if to use
     .cpu_resetn_soft(),//software reset, after cpu module
     .resetn_soft    (),//software reset to cpu module (from central reset management)
     .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
  );

  assign clear_counters = reset_reg[0];
  assign reset_registers = reset_reg[4];

  ////registers logic, current logic is just a placeholder for initial compil, required to be changed by the user
  always @(posedge axis_aclk)
    if (~resetn_sync | reset_registers) begin
      id_reg <= #1    `REG_ID_DEFAULT;
      version_reg <= #1    `REG_VERSION_DEFAULT;
      ip2cpu_flip_reg <= #1    `REG_FLIP_DEFAULT;
      pktin_reg <= #1    `REG_PKTIN_DEFAULT;
      pktout_reg <= #1    `REG_PKTOUT_DEFAULT;
      ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT;
      pktstoredport0_reg <= #1    `REG_PKTSTOREDPORT0_DEFAULT;
      bytesstoredport0_reg <= #1    `REG_BYTESSTOREDPORT0_DEFAULT;
      pktremovedport0_reg <= #1    `REG_PKTREMOVEDPORT0_DEFAULT;
      bytesremovedport0_reg <= #1    `REG_BYTESREMOVEDPORT0_DEFAULT;
      pktdroppedport0_reg <= #1    `REG_PKTDROPPEDPORT0_DEFAULT;
      bytesdroppedport0_reg <= #1    `REG_BYTESDROPPEDPORT0_DEFAULT;
      pktinqueueport0_reg <= #1    `REG_PKTINQUEUEPORT0_DEFAULT;
      pktstoredport1_reg <= #1    `REG_PKTSTOREDPORT1_DEFAULT;
      bytesstoredport1_reg <= #1    `REG_BYTESSTOREDPORT1_DEFAULT;
      pktremovedport1_reg <= #1    `REG_PKTREMOVEDPORT1_DEFAULT;
      bytesremovedport1_reg <= #1    `REG_BYTESREMOVEDPORT1_DEFAULT;
      pktdroppedport1_reg <= #1    `REG_PKTDROPPEDPORT1_DEFAULT;
      bytesdroppedport1_reg <= #1    `REG_BYTESDROPPEDPORT1_DEFAULT;
      pktinqueueport1_reg <= #1    `REG_PKTINQUEUEPORT1_DEFAULT;
      pktstoredport2_reg <= #1    `REG_PKTSTOREDPORT2_DEFAULT;
      bytesstoredport2_reg <= #1    `REG_BYTESSTOREDPORT2_DEFAULT;
      pktremovedport2_reg <= #1    `REG_PKTREMOVEDPORT2_DEFAULT;
      bytesremovedport2_reg <= #1    `REG_BYTESREMOVEDPORT2_DEFAULT;
      pktdroppedport2_reg <= #1    `REG_PKTDROPPEDPORT2_DEFAULT;
      bytesdroppedport2_reg <= #1    `REG_BYTESDROPPEDPORT2_DEFAULT;
      pktinqueueport2_reg <= #1    `REG_PKTINQUEUEPORT2_DEFAULT;
    end
    else begin
      id_reg <= #1    `REG_ID_DEFAULT;
      version_reg <= #1    `REG_VERSION_DEFAULT;
      ip2cpu_flip_reg <= #1    ~cpu2ip_flip_reg;
      pktin_reg[`REG_PKTIN_WIDTH -2: 0] <= #1  clear_counters | pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) ;
                pktin_reg[`REG_PKTIN_WIDTH-1] <= #1 clear_counters | pktin_reg_clear ? 1'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) > {(`REG_PKTIN_WIDTH-1){1'b1}} ? 1'b1 : pktin_reg[`REG_PKTIN_WIDTH-1];
                                                               
      pktout_reg [`REG_PKTOUT_WIDTH-2:0]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_0_tlast && m_axis_0_tvalid && m_axis_0_tready) + (m_axis_1_tlast && m_axis_1_tvalid && m_axis_1_tready)+ (m_axis_2_tlast && m_axis_2_tvalid && m_axis_2_tready);
                pktout_reg [`REG_PKTOUT_WIDTH-1]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_0_tlast && m_axis_0_tvalid && m_axis_0_tready) + (m_axis_1_tlast && m_axis_1_tvalid && m_axis_1_tready)+ (m_axis_2_tlast && m_axis_2_tvalid && m_axis_2_tready) > {(`REG_PKTOUT_WIDTH-1){1'b1}} ? 1'b1 : pktout_reg [`REG_PKTOUT_WIDTH-1];
      ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT+cpu2ip_debug_reg;
       //Port 0 Counters
      pktstoredport0_reg[`REG_PKTSTOREDPORT0_WIDTH-2:0] <= #1  clear_counters | pktstoredport0_reg_clear ? 'h0  : pktstoredport0_reg[`REG_PKTSTOREDPORT0_WIDTH-2:0] + pkt_stored[0];
                pktstoredport0_reg[`REG_PKTSTOREDPORT0_WIDTH-1] <= #1  clear_counters | pktstoredport0_reg_clear ? 'h0 : pktstoredport0_reg [`REG_PKTSTOREDPORT0_WIDTH-2:0] + pkt_stored[0]  > {(`REG_PKTSTOREDPORT0_WIDTH-1){1'b1}} ? 1'b1 : pktstoredport0_reg[`REG_PKTSTOREDPORT0_WIDTH-1];
      bytesstoredport0_reg[`REG_BYTESSTOREDPORT0_WIDTH-2:0] <= #1  clear_counters | bytesstoredport0_reg_clear ? 'h0  : bytesstoredport0_reg[`REG_BYTESSTOREDPORT0_WIDTH-2:0] + (pkt_stored[0] ? bytes_stored : 0);
                bytesstoredport0_reg[`REG_BYTESSTOREDPORT0_WIDTH-1] <= #1  clear_counters | bytesstoredport0_reg_clear ? 'h0 : bytesstoredport0_reg [`REG_BYTESSTOREDPORT0_WIDTH-2:0] + (pkt_stored[0] ? bytes_stored : 0)  > {(`REG_BYTESSTOREDPORT0_WIDTH-1){1'b1}} ? 1'b1 : bytesstoredport0_reg[`REG_BYTESSTOREDPORT0_WIDTH-1];
      pktremovedport0_reg[`REG_PKTREMOVEDPORT0_WIDTH-2:0] <= #1  clear_counters | pktremovedport0_reg_clear ? 'h0  : pktremovedport0_reg[`REG_PKTREMOVEDPORT0_WIDTH-2:0] + pkt_removed[0];
                pktremovedport0_reg[`REG_PKTREMOVEDPORT0_WIDTH-1] <= #1  clear_counters | pktremovedport0_reg_clear ? 'h0 : pktremovedport0_reg [`REG_PKTREMOVEDPORT0_WIDTH-2:0] + pkt_removed[0]  > {(`REG_PKTREMOVEDPORT0_WIDTH-1){1'b1}} ? 1'b1 : pktremovedport0_reg[`REG_PKTREMOVEDPORT0_WIDTH-1];
      bytesremovedport0_reg[`REG_BYTESREMOVEDPORT0_WIDTH-2:0] <= #1  clear_counters | bytesremovedport0_reg_clear ? 'h0  : bytesremovedport0_reg[`REG_BYTESREMOVEDPORT0_WIDTH-2:0] + bytes_removed_0;
                bytesremovedport0_reg[`REG_BYTESREMOVEDPORT0_WIDTH-1] <= #1  clear_counters | bytesremovedport0_reg_clear ? 'h0 : bytesremovedport0_reg [`REG_BYTESREMOVEDPORT0_WIDTH-2:0] + bytes_removed_0  > {(`REG_BYTESREMOVEDPORT0_WIDTH-1){1'b1}} ? 1'b1 : bytesremovedport0_reg[`REG_BYTESREMOVEDPORT0_WIDTH-1];
      pktdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-2:0] <= #1  clear_counters | pktdroppedport0_reg_clear ? 'h0  : pktdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-2:0] + pkt_dropped[0];
                pktdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-1] <= #1  clear_counters | pktdroppedport0_reg_clear ? 'h0 : pktdroppedport0_reg [`REG_PKTDROPPEDPORT0_WIDTH-2:0] + pkt_dropped[0]  > {(`REG_PKTDROPPEDPORT0_WIDTH-1){1'b1}} ? 1'b1 : pktdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-1];
      bytesdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-2:0] <= #1  clear_counters | bytesdroppedport0_reg_clear ? 'h0  : bytesdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-2:0] + bytes_dropped[0];
                bytesdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-1] <= #1  clear_counters | bytesdroppedport0_reg_clear ? 'h0 : bytesdroppedport0_reg [`REG_PKTDROPPEDPORT0_WIDTH-2:0] + bytes_dropped[0]  > {(`REG_PKTDROPPEDPORT0_WIDTH-1){1'b1}} ? 1'b1 : bytesdroppedport0_reg[`REG_PKTDROPPEDPORT0_WIDTH-1];
      pktinqueueport0_reg[`REG_PKTINQUEUEPORT0_WIDTH-2:0] <= #1  clear_counters | pktinqueueport0_reg_clear ? 'h0  : pktinqueueport0_reg[`REG_PKTINQUEUEPORT0_WIDTH-2:0] + pkt_stored[0]-pkt_removed[0];
                pktinqueueport0_reg[`REG_PKTINQUEUEPORT0_WIDTH-1] <= #1  clear_counters | pktinqueueport0_reg_clear ? 'h0 : pktinqueueport0_reg [`REG_PKTINQUEUEPORT0_WIDTH-2:0] + pkt_stored[0]-pkt_removed[0]  > {(`REG_PKTINQUEUEPORT0_WIDTH-1){1'b1}} ? 1'b1 : pktinqueueport0_reg[`REG_PKTINQUEUEPORT0_WIDTH-1];
      //Port 1 Counters
      pktstoredport1_reg[`REG_PKTSTOREDPORT1_WIDTH-2:0] <= #1  clear_counters | pktstoredport1_reg_clear ? 'h0  : pktstoredport1_reg[`REG_PKTSTOREDPORT1_WIDTH-2:0] + pkt_stored[1];
                pktstoredport1_reg[`REG_PKTSTOREDPORT1_WIDTH-1] <= #1  clear_counters | pktstoredport1_reg_clear ? 'h0 : pktstoredport1_reg [`REG_PKTSTOREDPORT1_WIDTH-2:0] + pkt_stored[1]  > {(`REG_PKTSTOREDPORT1_WIDTH-1){1'b1}} ? 1'b1 : pktstoredport1_reg[`REG_PKTSTOREDPORT1_WIDTH-1];
      bytesstoredport1_reg[`REG_BYTESSTOREDPORT1_WIDTH-2:0] <= #1  clear_counters | bytesstoredport1_reg_clear ? 'h0  : bytesstoredport1_reg[`REG_BYTESSTOREDPORT1_WIDTH-2:0] + (pkt_stored[1] ? bytes_stored : 0);
                bytesstoredport1_reg[`REG_BYTESSTOREDPORT1_WIDTH-1] <= #1  clear_counters | bytesstoredport1_reg_clear ? 'h0 : bytesstoredport1_reg [`REG_BYTESSTOREDPORT1_WIDTH-2:0] + (pkt_stored[1] ? bytes_stored : 0)  > {(`REG_BYTESSTOREDPORT1_WIDTH-1){1'b1}} ? 1'b1 : bytesstoredport1_reg[`REG_BYTESSTOREDPORT1_WIDTH-1];
      pktremovedport1_reg[`REG_PKTREMOVEDPORT1_WIDTH-2:0] <= #1  clear_counters | pktremovedport1_reg_clear ? 'h0  : pktremovedport1_reg[`REG_PKTREMOVEDPORT1_WIDTH-2:0] + pkt_removed[1];
                pktremovedport1_reg[`REG_PKTREMOVEDPORT1_WIDTH-1] <= #1  clear_counters | pktremovedport1_reg_clear ? 'h0 : pktremovedport1_reg [`REG_PKTREMOVEDPORT1_WIDTH-2:0] + pkt_removed[1]  > {(`REG_PKTREMOVEDPORT1_WIDTH-1){1'b1}} ? 1'b1 : pktremovedport1_reg[`REG_PKTREMOVEDPORT1_WIDTH-1];
      bytesremovedport1_reg[`REG_BYTESREMOVEDPORT1_WIDTH-2:0] <= #1  clear_counters | bytesremovedport1_reg_clear ? 'h0  : bytesremovedport1_reg[`REG_BYTESREMOVEDPORT1_WIDTH-2:0] + bytes_removed_1;
                bytesremovedport1_reg[`REG_BYTESREMOVEDPORT1_WIDTH-1] <= #1  clear_counters | bytesremovedport1_reg_clear ? 'h0 : bytesremovedport1_reg [`REG_BYTESREMOVEDPORT1_WIDTH-2:0] + bytes_removed_1  > {(`REG_BYTESREMOVEDPORT1_WIDTH-1){1'b1}} ? 1'b1 : bytesremovedport1_reg[`REG_BYTESREMOVEDPORT1_WIDTH-1];
      pktdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-2:0] <= #1  clear_counters | pktdroppedport1_reg_clear ? 'h0  : pktdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-2:0] + pkt_dropped[1];
                pktdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-1] <= #1  clear_counters | pktdroppedport1_reg_clear ? 'h0 : pktdroppedport1_reg [`REG_PKTDROPPEDPORT1_WIDTH-2:0] + pkt_dropped[1]  > {(`REG_PKTDROPPEDPORT1_WIDTH-1){1'b1}} ? 1'b1 : pktdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-1];
      bytesdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-2:0] <= #1  clear_counters | bytesdroppedport1_reg_clear ? 'h0  : bytesdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-2:0] + bytes_dropped[1];
                bytesdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-1] <= #1  clear_counters | bytesdroppedport1_reg_clear ? 'h0 : bytesdroppedport1_reg [`REG_PKTDROPPEDPORT1_WIDTH-2:0] + bytes_dropped[1]  > {(`REG_PKTDROPPEDPORT1_WIDTH-1){1'b1}} ? 1'b1 : bytesdroppedport1_reg[`REG_PKTDROPPEDPORT1_WIDTH-1];
      pktinqueueport1_reg[`REG_PKTINQUEUEPORT1_WIDTH-2:0] <= #1  clear_counters | pktinqueueport1_reg_clear ? 'h0  : pktinqueueport1_reg[`REG_PKTINQUEUEPORT1_WIDTH-2:0] + pkt_stored[1]-pkt_removed[1];
                pktinqueueport1_reg[`REG_PKTINQUEUEPORT1_WIDTH-1] <= #1  clear_counters | pktinqueueport1_reg_clear ? 'h0 : pktinqueueport1_reg [`REG_PKTINQUEUEPORT1_WIDTH-2:0] + pkt_stored[1]-pkt_removed[1]  > {(`REG_PKTINQUEUEPORT1_WIDTH-1){1'b1}} ? 1'b1 : pktinqueueport1_reg[`REG_PKTINQUEUEPORT1_WIDTH-1];
      //Port 2 Counters
      pktstoredport2_reg[`REG_PKTSTOREDPORT2_WIDTH-2:0] <= #1  clear_counters | pktstoredport2_reg_clear ? 'h0  : pktstoredport2_reg[`REG_PKTSTOREDPORT2_WIDTH-2:0] + pkt_stored[2];
                pktstoredport2_reg[`REG_PKTSTOREDPORT2_WIDTH-1] <= #1  clear_counters | pktstoredport2_reg_clear ? 'h0 : pktstoredport2_reg [`REG_PKTSTOREDPORT2_WIDTH-2:0] + pkt_stored[2]  > {(`REG_PKTSTOREDPORT2_WIDTH-1){1'b1}} ? 1'b1 : pktstoredport2_reg[`REG_PKTSTOREDPORT2_WIDTH-1];
      bytesstoredport2_reg[`REG_BYTESSTOREDPORT2_WIDTH-2:0] <= #1  clear_counters | bytesstoredport2_reg_clear ? 'h0  : bytesstoredport2_reg[`REG_BYTESSTOREDPORT2_WIDTH-2:0] + (pkt_stored[2] ? bytes_stored : 0);
                bytesstoredport2_reg[`REG_BYTESSTOREDPORT2_WIDTH-1] <= #1  clear_counters | bytesstoredport2_reg_clear ? 'h0 : bytesstoredport2_reg [`REG_BYTESSTOREDPORT2_WIDTH-2:0] + (pkt_stored[2] ? bytes_stored : 0)  > {(`REG_BYTESSTOREDPORT2_WIDTH-1){1'b1}} ? 1'b1 : bytesstoredport2_reg[`REG_BYTESSTOREDPORT2_WIDTH-1];
      pktremovedport2_reg[`REG_PKTREMOVEDPORT2_WIDTH-2:0] <= #1  clear_counters | pktremovedport2_reg_clear ? 'h0  : pktremovedport2_reg[`REG_PKTREMOVEDPORT2_WIDTH-2:0] + pkt_removed[2];
                pktremovedport2_reg[`REG_PKTREMOVEDPORT2_WIDTH-1] <= #1  clear_counters | pktremovedport2_reg_clear ? 'h0 : pktremovedport2_reg [`REG_PKTREMOVEDPORT2_WIDTH-2:0] + pkt_removed[2]  > {(`REG_PKTREMOVEDPORT2_WIDTH-1){1'b1}} ? 1'b1 : pktremovedport2_reg[`REG_PKTREMOVEDPORT2_WIDTH-1];
      bytesremovedport2_reg[`REG_BYTESREMOVEDPORT2_WIDTH-2:0] <= #1  clear_counters | bytesremovedport2_reg_clear ? 'h0  : bytesremovedport2_reg[`REG_BYTESREMOVEDPORT2_WIDTH-2:0] + bytes_removed_2;
                bytesremovedport2_reg[`REG_BYTESREMOVEDPORT2_WIDTH-1] <= #1  clear_counters | bytesremovedport2_reg_clear ? 'h0 : bytesremovedport2_reg [`REG_BYTESREMOVEDPORT2_WIDTH-2:0] + bytes_removed_2  > {(`REG_BYTESREMOVEDPORT2_WIDTH-1){1'b1}} ? 1'b1 : bytesremovedport2_reg[`REG_BYTESREMOVEDPORT2_WIDTH-1];
      pktdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-2:0] <= #1  clear_counters | pktdroppedport2_reg_clear ? 'h0  : pktdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-2:0] + pkt_dropped[2];
                pktdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-1] <= #1  clear_counters | pktdroppedport2_reg_clear ? 'h0 : pktdroppedport2_reg [`REG_PKTDROPPEDPORT2_WIDTH-2:0] + pkt_dropped[2]  > {(`REG_PKTDROPPEDPORT2_WIDTH-1){1'b1}} ? 1'b1 : pktdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-1];
      bytesdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-2:0] <= #1  clear_counters | bytesdroppedport2_reg_clear ? 'h0  : bytesdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-2:0] + bytes_dropped[2];
                bytesdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-1] <= #1  clear_counters | bytesdroppedport2_reg_clear ? 'h0 : bytesdroppedport2_reg [`REG_PKTDROPPEDPORT2_WIDTH-2:0] + bytes_dropped[2]  > {(`REG_PKTDROPPEDPORT2_WIDTH-1){1'b1}} ? 1'b1 : bytesdroppedport2_reg[`REG_PKTDROPPEDPORT2_WIDTH-1];
      pktinqueueport2_reg[`REG_PKTINQUEUEPORT2_WIDTH-2:0] <= #1  clear_counters | pktinqueueport2_reg_clear ? 'h0  : pktinqueueport2_reg[`REG_PKTINQUEUEPORT2_WIDTH-2:0] + pkt_stored[2]-pkt_removed[2];
                pktinqueueport2_reg[`REG_PKTINQUEUEPORT2_WIDTH-1] <= #1  clear_counters | pktinqueueport2_reg_clear ? 'h0 : pktinqueueport2_reg [`REG_PKTINQUEUEPORT2_WIDTH-2:0] + pkt_stored[2]-pkt_removed[2]  > {(`REG_PKTINQUEUEPORT2_WIDTH-1){1'b1}} ? 1'b1 : pktinqueueport2_reg[`REG_PKTINQUEUEPORT2_WIDTH-1];
    
          end





endmodule
