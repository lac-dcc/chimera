// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2018 Stephen Ibanez
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
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
 *        axis_fifo.v
 *
 *  Library:
 *
 *  Module:
 *        axis_fifo
 *
 *  Author:
 *        Stephen Ibanez
 * 		
 *  Description:
 *        Simple AXI4 Stream wrapper around fallthrough_small_fifo
 *
 */

module axis_fifo
#(
    // Pkt AXI Stream Data Width
    parameter C_AXIS_DATA_WIDTH  = 64,
    parameter C_AXIS_TUSER_WIDTH = 128
)
(
    // Global Ports
    input                                        axis_aclk,
    input                                        axis_resetn,

    // Master Pkt Stream Ports (outgoing pkts) 
    output     [C_AXIS_DATA_WIDTH - 1:0]         m_axis_tdata,
    output     [((C_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
    output     [C_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser,
    output reg                                   m_axis_tvalid,
    input                                        m_axis_tready,
    output                                       m_axis_tlast,

    // Slave Pkt Stream Ports (incomming pkts)
    input [C_AXIS_DATA_WIDTH - 1:0]              s_axis_tdata,
    input [((C_AXIS_DATA_WIDTH / 8)) - 1:0]      s_axis_tkeep,
    input [C_AXIS_TUSER_WIDTH-1:0]               s_axis_tuser,
    input                                        s_axis_tvalid,
    output reg                                   s_axis_tready,
    input                                        s_axis_tlast

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

   //--------------------- Internal Parameters-------------------------
   /* For Insertion FSM */
   localparam WAIT_START     = 0;
   localparam RCV_WORD       = 1;
   localparam L2_IFSM_STATES = 1;

   /* For Removal FSM */
   localparam RFSM_START = 0;
   localparam RFSM_FINISH_PKT = 1;
   localparam L2_RFSM_STATES = 1;   

   localparam MAX_PKT_SIZE = 2048;
   localparam MIN_PKT_SIZE = 64;
   localparam MAX_PKTS = MAX_PKT_SIZE/MIN_PKT_SIZE;

   localparam MAX_DEPTH = MAX_PKT_SIZE/(C_AXIS_DATA_WIDTH/8); 
   localparam L2_MAX_DEPTH = log2(MAX_DEPTH);
   localparam L2_MAX_PKTS = log2(MAX_PKTS);

   //---------------------- Wires and Regs ---------------------------- 
   reg  d_fifo_wr_en;
   reg  d_fifo_rd_en;
   wire d_fifo_nearly_full;
   wire d_fifo_empty;

   reg  m_fifo_wr_en;
   reg  m_fifo_rd_en;
   wire m_fifo_nearly_full;
   wire m_fifo_empty;

   reg s_axis_fifo_tlast;

   reg [L2_IFSM_STATES-1:0] ifsm_state, ifsm_state_next;
   reg [L2_RFSM_STATES-1:0] rfsm_state, rfsm_state_next;

   //-------------------- Modules and Logic ---------------------------

   fallthrough_small_fifo 
      #(
          .WIDTH(C_AXIS_DATA_WIDTH+C_AXIS_DATA_WIDTH/8+1),
          .MAX_DEPTH_BITS(L2_MAX_DEPTH)
      )
      data_fifo
        (.din         ({s_axis_fifo_tlast, s_axis_tkeep, s_axis_tdata}),     // Data in
         .wr_en       (d_fifo_wr_en),       // Write enable
         .rd_en       (d_fifo_rd_en),       // Read the next word
         .dout        ({m_axis_tlast, m_axis_tkeep, m_axis_tdata}),
         .full        (),
         .prog_full   (),
         .nearly_full (d_fifo_nearly_full),
         .empty       (d_fifo_empty),
         .reset       (~axis_resetn),
         .clk         (axis_aclk)
         );

   fallthrough_small_fifo 
      #(
          .WIDTH(C_AXIS_TUSER_WIDTH),
          .MAX_DEPTH_BITS(L2_MAX_PKTS)
      )
      meta_fifo
        (.din         (s_axis_tuser),     // Data in
         .wr_en       (m_fifo_wr_en),     // Write enable
         .rd_en       (m_fifo_rd_en),     // Read the next word
         .dout        (m_axis_tuser),
         .full        (),
         .prog_full   (),
         .nearly_full (m_fifo_nearly_full),
         .empty       (m_fifo_empty),
         .reset       (~axis_resetn),
         .clk         (axis_aclk)
         );


    /* Insertion State Machine */
    always @(*) begin
        // defaults
        ifsm_state_next = ifsm_state;

        d_fifo_wr_en = 0;
        m_fifo_wr_en = 0;

        s_axis_fifo_tlast = s_axis_tlast;
        s_axis_tready = ~d_fifo_nearly_full & ~m_fifo_nearly_full;

        case(ifsm_state)
            WAIT_START: begin
                if (s_axis_tvalid & s_axis_tready) begin
                    d_fifo_wr_en = 1;
                    m_fifo_wr_en = 1;
                    if (s_axis_tlast) begin
                        ifsm_state_next = WAIT_START;
                    end else begin
                        ifsm_state_next = RCV_WORD;
                    end
                end
            end

            RCV_WORD: begin
                if (s_axis_tvalid & s_axis_tready) begin
                    d_fifo_wr_en = 1;
                    if (s_axis_tlast) begin
                        ifsm_state_next = WAIT_START;
                    end
                end
            end
        endcase
    end

    always @(posedge axis_aclk) begin
        if (~axis_resetn) begin
            ifsm_state <= WAIT_START;
        end
        else begin
            ifsm_state <= ifsm_state_next;
        end
    end

    /* Removal State Machine */
    always @(*) begin
        // defaults
        rfsm_state_next = rfsm_state;

        d_fifo_rd_en = 0;
        m_fifo_rd_en = 0;

        m_axis_tvalid = 0;

        case(rfsm_state)
            RFSM_START: begin
               if (~d_fifo_empty & ~m_fifo_empty) begin
                   m_axis_tvalid = 1;
                   if (m_axis_tready) begin
                       d_fifo_rd_en = 1;
                       m_fifo_rd_en = 1;
                       if (m_axis_tlast) begin
                           rfsm_state_next = RFSM_START;
                       end else begin
                           rfsm_state_next = RFSM_FINISH_PKT;
                       end
                   end
               end 
            end

            RFSM_FINISH_PKT: begin
               if (~d_fifo_empty) begin
                   m_axis_tvalid = 1;
                   if (m_axis_tready) begin
                       d_fifo_rd_en = 1;
                       if (m_axis_tlast)
                           rfsm_state_next = RFSM_START;
                   end
               end
            end
        endcase
    end

    always @(posedge axis_aclk) begin
        if (~axis_resetn) begin
            rfsm_state <= RFSM_START;
        end
        else begin
            rfsm_state <= rfsm_state_next;
        end
    end
   
endmodule

