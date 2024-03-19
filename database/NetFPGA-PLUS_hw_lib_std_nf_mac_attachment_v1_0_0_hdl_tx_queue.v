//
// Copyright (c) 2015 James Hongyi Zeng, Yury Audzevich
// Copyright (c) 2016 Jong Hun Han
// Copyright (c) 2021 Yuta Tokusashi
// All rights reserved.
// 
// Description:
//        10g ethernet tx queue with backpressure.
//        ported from nf10 (Virtex-5 based) interface.
//
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

module tx_queue
 #(
    parameter AXI_DATA_WIDTH             = 512, //Only 64 is supported right now.
    parameter C_S_AXIS_TUSER_WIDTH       = 512

 )
 (
    // AXI side
    input                               clk,
    input                               reset,

    input [C_S_AXIS_TUSER_WIDTH-1:0]    i_tuser,
    input [AXI_DATA_WIDTH-1:0]          i_tdata,
    input [(AXI_DATA_WIDTH/8)-1:0]      i_tkeep,
    input                               i_tvalid,
    input                               i_tlast,
    output                              i_tready,

    // other
    output                              tx_dequeued_pkt,
    output reg                          be,
    output reg                          tx_pkts_enqueued_signal,
    output reg [15:0]                   tx_bytes_enqueued,

     // MAC side
    input                               clk156,
    input                               areset_clk156,

    // AXI side output
    output [AXI_DATA_WIDTH-1:0]         o_tdata,
    output [C_S_AXIS_TUSER_WIDTH-1:0]   o_tuser,
    output [(AXI_DATA_WIDTH/8)-1:0]     o_tkeep,
    output reg                          o_tvalid,
    output reg                          o_tlast,
    output reg                          o_tuser_err,
    input                               o_tready
 );

    localparam IDLE         = 2'd0;
    localparam SEND_PKT     = 2'd1;

    localparam METADATA     = 1'b0;
    localparam EOP          = 1'b1;

    wire                                tlast_axi_i;
    wire                                tlast_axi_o;

    wire                                fifo_almost_full, info_fifo_full;
    wire                                fifo_empty, info_fifo_empty;
    reg                                 fifo_rd_en, info_fifo_rd_en;
    wire                                info_fifo_wr_en;
    wire                                fifo_wr_en;

    reg                                 tx_dequeued_pkt_next;

    reg  [2:0]                          state, state_next;
    reg                                 state1, state1_next;

    wire [2:0]                          zero_padding;

    ////////////////////////////////////////////////
    ////////////////////////////////////////////////
    assign fifo_wr_en  = (i_tvalid & i_tready);
    assign info_fifo_wr_en = i_tlast & i_tvalid & i_tready;
    assign i_tready    = ~fifo_almost_full & ~info_fifo_full;
    assign tlast_axi_i = i_tlast;

    xpm_fifo_async # (
       // Common module parameters
       .FIFO_MEMORY_TYPE     ("auto"),
       .ECC_MODE             ("no_ecc"),
       .FIFO_WRITE_DEPTH     (128),
       .WRITE_DATA_WIDTH     (AXI_DATA_WIDTH+(AXI_DATA_WIDTH/8)+1+AXI_DATA_WIDTH),
       .WR_DATA_COUNT_WIDTH  (1),
       .PROG_FULL_THRESH     (128-10),
       .FULL_RESET_VALUE     (0),
       .USE_ADV_FEATURES     ("0707"),
       .READ_MODE            ("fwft")
    ) u_tx_fifo (
       // Common module ports
       .sleep (1'b0),
       .rst   (areset_clk156),
       // Write Domain ports
       .wr_clk       (clk),
       .wr_en        (fifo_wr_en),
       .din          ({tlast_axi_i , i_tkeep, i_tdata, i_tuser}),
       .full         (),
       .prog_full    (fifo_almost_full),
       .wr_data_count(),
       .overflow     (),
       .wr_rst_busy  (),
       .almost_full  (),
       .wr_ack       (),
       // Read Domain ports
       .rd_clk       (clk156),
       .rd_en        (fifo_rd_en),
       .dout         ({tlast_axi_o, o_tkeep, o_tdata, o_tuser}),
       .empty        (fifo_empty),
       .prog_empty   (),
       .rd_data_count(),
       .underflow    (),
       .rd_rst_busy  (),
       .almost_empty (),
       .data_valid   (),
       // ECC Related ports
       .injectsbiterr(),
       .injectdbiterr(),
       .sbiterr      (),
       .dbiterr      ()
    );

    fifo_generator_1_9 tx_info_fifo (
        .din            (1'b0),
        .wr_en          (info_fifo_wr_en), //Only 1 cycle per packet!
        .wr_clk         (clk),

        .dout           (),
        .rd_en          (info_fifo_rd_en),
        .rd_clk         (clk156),

        .full           (info_fifo_full),
        .empty          (info_fifo_empty),
        .rst            (areset_clk156)
    );

      // Sideband INFO
      // pkt enq FSM comb
      always @(*) begin
          state1_next             = METADATA;

          tx_pkts_enqueued_signal = 0;
          tx_bytes_enqueued       = 0;

          case(state1)
              METADATA: begin
                  if(i_tvalid & i_tlast & i_tready) begin
                      state1_next = METADATA;
                      tx_pkts_enqueued_signal = 1;
                      tx_bytes_enqueued       = i_tuser[15:0];
                  end else if(i_tvalid & i_tready) begin
                      tx_pkts_enqueued_signal = 1;
                      tx_bytes_enqueued       = i_tuser[15:0];
                      state1_next             = EOP;
                  end
              end

              EOP: begin
                  state1_next = EOP;
                  if(i_tvalid & i_tlast & i_tready) begin
                      state1_next = METADATA;
                  end
              end

              default: begin
                      state1_next = METADATA;
              end
           endcase
      end

      // pkt enq FSM seq
      always @(posedge clk) begin
           if (reset) state1 <= METADATA;
           else       state1 <= state1_next;
      end

      //////////////////////////////////////////////////////////

      // FIFO draining FSM comb
      assign tx_dequeued_pkt = tx_dequeued_pkt_next;

      always @(*) begin
          state_next            = IDLE;

          // axi
          o_tuser_err           = 1'b0; // no underrun
          o_tvalid              = 1'b0;
          o_tlast               = 1'b0;

          // fifos
          fifo_rd_en            = 1'b0;
          info_fifo_rd_en       = 1'b0;

          //sideband
          tx_dequeued_pkt_next  = 'b0;
          be                    = 'b0;

          case(state)
              IDLE: begin
                  if( ~info_fifo_empty & ~fifo_empty) begin
                      // pkt is stored already
                      info_fifo_rd_en = 1'b1;
                      be              = 'b0;
                      state_next      = SEND_PKT;
                      o_tvalid = 1'b1;
                      if (o_tready) begin
                          fifo_rd_en            = 1'b1;
                          be                    = 1'b1;
                          tx_dequeued_pkt_next  = 1'b1;

                          if (tlast_axi_o) begin
                               o_tlast    = 1'b1;
                               be         = 1'b1;
                               state_next = IDLE;
                          end
                      end
                  end
              end

              SEND_PKT: begin
                // very important:
                // tvalid to go first: pg157, v3.0, pp. 109.
                o_tvalid = 1'b1;
                state_next  = SEND_PKT;
                if (o_tready & ~fifo_empty) begin
                    fifo_rd_en            = 1'b1;
                    be                    = 1'b1;
                    tx_dequeued_pkt_next  = 1'b1;

                    if (tlast_axi_o) begin
                         o_tlast    = 1'b1;
                         be         = 1'b1;
                         state_next = IDLE;
                    end
                end
              end
          endcase
      end

      always @(posedge clk156) begin
          if(areset_clk156) state <= IDLE;
          else      state <= state_next;
      end
 endmodule
