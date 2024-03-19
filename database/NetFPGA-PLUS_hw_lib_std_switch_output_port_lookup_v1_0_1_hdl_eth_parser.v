/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) 2010, 2011 Muhammad Shahbaz
* Copyright (C) 2015 Gianni Antichi
* All rights reserved.
*
* This software was developed by
* Stanford University and the University of Cambridge Computer Laboratory
* under National Science Foundation under Grant No. CNS-0855268,
* the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
* by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
* as part of the DARPA MRC research programme.
*
* @NETFPGA_LICENSE_HEADER_START@
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*  http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* @NETFPGA_LICENSE_HEADER_END@
*
*/
/******************************************************************************
*
* File:
* 	eth_parser.v
*
*  Module:
*        eth_parser
*
*  Author:
*        Gianni Antichi, Muhammad Shahbaz
*
* Description:
* 	parsing of the L2 header
*
*/

  `timescale 1ns/1ps

  module eth_parser
    #(parameter C_S_AXIS_DATA_WIDTH  = 256,
      parameter C_S_AXIS_TUSER_WIDTH = 128,
      parameter SRC_PORT_POS         = 16,
      parameter NUM_QUEUES           = 8
    )
    (
      // --- Interface to the previous stage
      input  [C_S_AXIS_DATA_WIDTH-1:0]   tdata,
      input  [C_S_AXIS_TUSER_WIDTH-1:0]  tuser,
      input                              valid,
      input 				             tlast,

      // --- Interface to output_port_lookup
      output reg [47:0]                  dst_mac,
      output reg [47:0]                  src_mac,
      output reg                         eth_done,
      output reg [NUM_QUEUES-1:0]        src_port,

      // --- Misc
      input                              reset,
      input                              clk
    );

 // ------------ Internal Params --------

   localparam NUM_STATES         = 2;
   localparam READ_MAC_ADDRESSES = 1;
   localparam WAIT_EOP           = 2;

   // ------------- Regs/ wires -----------

   reg [47:0]                  dst_mac_w;
   reg [47:0]                  src_mac_w;
   reg                         eth_done_w;
   reg [NUM_QUEUES-1:0]        src_port_w;

   reg [NUM_STATES-1:0]        state, state_next;

   // ------------ Logic ----------------

   always @(*) begin
      src_mac_w      = 0;
      dst_mac_w      = 0;
      eth_done_w     = 0;
      src_port_w     = 0;
      state_next     = state;

      case(state)
        /* read the input source header and get the first word */
        READ_MAC_ADDRESSES: begin
           if(valid && tlast) begin
              src_port_w   = tuser[SRC_PORT_POS+7:SRC_PORT_POS];
              dst_mac_w    = tdata[47:0];
              src_mac_w    = tdata[95:48];
              eth_done_w   = 1;
              state_next = READ_MAC_ADDRESSES;
           end else if(valid) begin
              src_port_w   = tuser[SRC_PORT_POS+7:SRC_PORT_POS];
              dst_mac_w    = tdata[47:0];
              src_mac_w    = tdata[95:48];
              eth_done_w   = 1;
              state_next = WAIT_EOP;
           end
        end // case: READ_WORD_1

        WAIT_EOP: begin
           if(valid && tlast)
              state_next = READ_MAC_ADDRESSES;
           end
      endcase // case(state)
   end // always @ (*)

   always @(posedge clk) begin
      if(reset) begin
         src_port <= {NUM_QUEUES{1'b0}};
         dst_mac  <= 48'b0;
         src_mac  <= 48'b0;
         eth_done <= 0;

         state  <= READ_MAC_ADDRESSES;
      end
      else begin
         src_port <= src_port_w;
         dst_mac  <= dst_mac_w;
         src_mac  <= src_mac_w;
         eth_done <= eth_done_w;

         state  <= state_next;
      end // else: !if(reset)
   end // always @ (posedge clk)

endmodule // ethernet_parser

