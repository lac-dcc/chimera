// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

//
// Copyright (c) 2015 James Hongyi Zeng, Yury Audzevich, Gianni Antichi, Neelakandan Manihatty Bojan
// Copyright (c) 2016 Jong Hun Han
// Copyright (c) 2021 Yuta Tokusashi
// All rights reserved.
//
// Description:
//        100g ethernet rx queue with backpressure.
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

module rx_queue
#(
    parameter AXI_DATA_WIDTH = 512,
    parameter AXI_USER_WIDTH = 128,
    parameter RXQUEUE_DEPTH  = 128
)
(
    // AXI side output
    input                                clk,
    input                                reset,
 
    output  [AXI_DATA_WIDTH-1:0]         o_tdata,
    output  [AXI_USER_WIDTH-1:0]         o_tuser,
    output  [AXI_DATA_WIDTH/8-1:0]       o_tkeep,
    output                               o_tvalid,
    output                               o_tlast,
    input                                o_tready,

    // MAC side input
    input                                clk156,
    input                                areset_clk156,

    input [AXI_DATA_WIDTH-1:0]           i_tdata,
    input [AXI_DATA_WIDTH/8-1:0]         i_tkeep,
    input [AXI_USER_WIDTH-1:0]           i_tuser,
    input                                i_tuser_err,
    input                                i_tvalid,
    input                                i_tlast,

    // statistics
    output wire                          fifo_wr_en,
    output wire                          rx_pkt_drop,
    output                               rx_bad_frame, 
    output                               rx_good_frame
);

    localparam IDLE          = 0;
    localparam PKT           = 1;

    wire fifo_almost_full;
    wire fifo_empty, fifo_full;
    wire fifo_rd_en;

    wire [AXI_DATA_WIDTH-1:0]    tdata_rx_fifo, tdata_delay;
    wire [AXI_USER_WIDTH-1:0]    tuser_rx_fifo, tuser_delay;
    wire [AXI_DATA_WIDTH/8-1:0]  tkeep_rx_fifo, tkeep_delay;
    wire                         tlast_rx_fifo, tlast_delay;

    reg  rx_pkt_drop_reg;
    wire rx_pkt_drop_frame;
    reg  [0:0] state;

    /* **************************************************
     *  FIFO: rx_queue
     * **************************************************/
    xpm_fifo_async # (
       // Common module parameters
       .FIFO_MEMORY_TYPE     ("auto"),
       .ECC_MODE             ("no_ecc"),
       .FIFO_WRITE_DEPTH     (RXQUEUE_DEPTH),
       .WRITE_DATA_WIDTH     (AXI_USER_WIDTH+AXI_DATA_WIDTH+(AXI_DATA_WIDTH/8)+1),
       .WR_DATA_COUNT_WIDTH  (1),
       .PROG_FULL_THRESH     (RXQUEUE_DEPTH-10),
       .FULL_RESET_VALUE     (0),
       .USE_ADV_FEATURES     ("0707"),
       .READ_MODE            ("fwft")
    ) u_rxqueue (
       // Common module ports
       .sleep (1'b0),
       .rst   (areset_clk156),
       // Write Domain ports
       .wr_clk       (clk156),
       .wr_en        (fifo_wr_en),
       .din          ({tlast_rx_fifo, tkeep_rx_fifo, tdata_rx_fifo, tuser_rx_fifo}),
       .full         (fifo_full),
       .prog_full    (fifo_almost_full),
       .wr_data_count(),
       .overflow     (),
       .wr_rst_busy  (),
       .almost_full  (),
       .wr_ack       (),
       // Read Domain ports
       .rd_clk       (clk),
       .rd_en        (fifo_rd_en),
       .dout         ({tlast_delay, tkeep_delay, tdata_delay, tuser_delay}),
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

    assign rx_good_frame = (i_tuser_err == 1'b1);
    assign rx_bad_frame  = (i_tvalid && i_tlast && !rx_good_frame); 

    /* **************************************************
     *  Enqueue: rx_queue
     * **************************************************/
    assign rx_pkt_drop       = (i_tvalid && state == IDLE && fifo_almost_full) ||
                               (i_tvalid && state == IDLE && !rx_good_frame);
    assign rx_pkt_drop_frame = rx_pkt_drop || rx_pkt_drop_reg;
    assign fifo_wr_en        = i_tvalid && !rx_pkt_drop_frame;
    assign tdata_rx_fifo = i_tdata;
    assign tkeep_rx_fifo = i_tkeep;
    assign tlast_rx_fifo = i_tlast;
    assign tuser_rx_fifo = i_tuser;

    always @ (posedge clk156)
        if (areset_clk156) begin
            state <= IDLE;
            rx_pkt_drop_reg <= 1'b0;
        end
        else begin
            case(state)
            IDLE:begin
                if (i_tvalid && i_tlast && rx_pkt_drop_frame) begin
                    state <= IDLE;
                    rx_pkt_drop_reg <= 1'b0;
                end
                else if (i_tvalid && rx_pkt_drop_frame) begin
                    state <= IDLE;
                    rx_pkt_drop_reg <= 1'b1;
                end
                else if (i_tvalid && i_tlast && !rx_pkt_drop_frame) begin
                    state <= IDLE;
                end
                else if (i_tvalid && !rx_pkt_drop_frame) begin
                    state <= PKT;
                end
            end
            PKT:begin
                if (i_tvalid && i_tlast && ~fifo_full) begin
                    state <= IDLE;
                end
            end
            default: ;
            endcase
        end

    /* **************************************************
     *  Dequeue: rx_queue
     * **************************************************/
    assign fifo_rd_en = ~fifo_empty && o_tready;
    assign o_tvalid = ~fifo_empty;
    assign o_tlast  = tlast_delay;
    assign o_tdata  = tdata_delay;
    assign o_tkeep  = tkeep_delay;
    assign o_tuser  = tuser_delay;
endmodule
