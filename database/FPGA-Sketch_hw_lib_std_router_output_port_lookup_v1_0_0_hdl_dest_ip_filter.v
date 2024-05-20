// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) grg, Gianni Antichi
* Copyright (C) 2021 Yuta Tokusashi
* All rights reserved.
*
* This software was developed by
* Stanford University and the University of Cambridge Computer Laboratory
* under National Science Foundation under Grant No. CNS-0855268,
* the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
* by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
* as part of the DARPA MRC research programme,
* and by the University of Cambridge Computer Laboratory under EPSRC EARL Project
* EP/P025374/1 alongside support from Xilinx Inc.
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
*******************************************************************************/


  module dest_ip_filter
    #(parameter C_S_AXIS_DATA_WIDTH	= 512,
      parameter LUT_DEPTH		= 32,
      parameter LUT_DEPTH_BITS		= log2(LUT_DEPTH)
      )
   (// --- Interface to the previous stage
    input  [C_S_AXIS_DATA_WIDTH-1:0]   tdata,

    // --- Interface to process block
    output                             dest_ip_hit,
    output                             dest_ip_filter_vld,
    input                              rd_dest_ip_filter_result,

    // --- Interface to preprocess block
    input                              word_IP_DST_HI,
    input                              word_IP_DST_LO,

    // --- Interface to registers
    // --- Read port
    input  [LUT_DEPTH_BITS-1:0]        dest_ip_filter_rd_addr,          // address in table to read
    input                              dest_ip_filter_rd_req,           // request a read
    output [31:0]                      dest_ip_filter_rd_ip,            // ip to match in the CAM
    output                             dest_ip_filter_rd_ack,           // pulses high

    // --- Write port
    input [LUT_DEPTH_BITS-1:0]         dest_ip_filter_wr_addr,
    input                              dest_ip_filter_wr_req,
    input [31:0]                       dest_ip_filter_wr_ip,            // data to match in the CAM
    output                             dest_ip_filter_wr_ack,

    // --- Misc
    input                              reset,
    input                              clk
   );


   localparam DEST_IP_POS  = C_S_AXIS_DATA_WIDTH - 240;
 
   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2

   localparam	WAIT	= 1;
   localparam	PROCESS	= 2;

   //---------------------- Wires and regs----------------------------

   wire                                  cam_busy;
   wire                                  cam_match;
   wire [LUT_DEPTH-1:0]   	         cam_match_addr;
   wire [31:0]                           cam_cmp_din, cam_cmp_data_mask;
   wire [31:0]                           cam_din, cam_data_mask;
   wire                                  cam_we;
   wire [LUT_DEPTH_BITS-1:0]             cam_wr_addr;

   reg                                   dst_ip_vld;
   reg [31:0]                            dst_ip;

   reg                                   rd_dest;
   reg                                   dst_ip_ready;
   wire [31:0]                           dst_ip_fifo;
   wire                                  dest_fifo_empty;

   reg [1:0]                             state,state_next;

   //------------------------- Modules-------------------------------

   // 1 cycle read latency, 16 cycles write latency
   // priority encoded for the smallest address. 
   // Single match unencoded match addresses
   cam 
    #(.C_TCAM_ADDR_WIDTH	(LUT_DEPTH_BITS),
      .C_TCAM_DATA_WIDTH	(32),
      .C_TCAM_ADDR_TYPE	(1),
      .C_TCAM_MATCH_ADDR_WIDTH (LUT_DEPTH)
    )
   dest_ip_cam
     (
      // Outputs
      .BUSY                             (cam_busy),
      .MATCH                            (cam_match),
      .MATCH_ADDR                       (cam_match_addr),
      // Inputs
      .CLK                              (clk),
      .CMP_DIN                          (cam_cmp_din),
      .DIN                              (cam_din),
      .WE                               (cam_we),
      .ADDR_WR                          (cam_wr_addr));

   unencoded_cam_lut_sm
     #(.CMP_WIDTH(32),                  // IPv4 addr width
       .DATA_WIDTH(1),                  // no data
       .LUT_DEPTH(LUT_DEPTH),
       .DEFAULT_DATA(0)
      ) cam_lut_sm
       (// --- Interface for lookups
        .lookup_req          (dst_ip_ready),
        .lookup_cmp_data     (dst_ip_fifo),
        .lookup_cmp_dmask    (32'h0),
        .lookup_ack          (lookup_ack),
        .lookup_hit          (lookup_hit),
        .lookup_data         (),

        // --- Interface to registers
        // --- Read port
        .rd_addr             (dest_ip_filter_rd_addr),    // address in table to read
        .rd_req              (dest_ip_filter_rd_req),     // request a read
        .rd_data             (),                          // data found for the entry
        .rd_cmp_data         (dest_ip_filter_rd_ip),      // matching data for the entry
        .rd_cmp_dmask        (),                          // don't cares entry
        .rd_ack              (dest_ip_filter_rd_ack),     // pulses high

        // --- Write port
        .wr_addr             (dest_ip_filter_wr_addr),
        .wr_req              (dest_ip_filter_wr_req),
        .wr_data             (1'b0),                    // data found for the entry
        .wr_cmp_data         (dest_ip_filter_wr_ip),    // matching data for the entry
        .wr_cmp_dmask        (32'h0),                   // don't cares for the entry
        .wr_ack              (dest_ip_filter_wr_ack),

        // --- CAM interface
        .cam_busy            (cam_busy),
        .cam_match           (cam_match),
        .cam_match_addr      (cam_match_addr),
        .cam_cmp_din         (cam_cmp_din),
        .cam_din             (cam_din),
        .cam_we              (cam_we),
        .cam_wr_addr         (cam_wr_addr),
        .cam_cmp_data_mask   (cam_cmp_data_mask),
        .cam_data_mask       (cam_data_mask),

        // --- Misc
        .reset               (reset),
        .clk                 (clk));

   xpm_fifo_sync #(
       .FIFO_MEMORY_TYPE     ("auto"),
       .ECC_MODE             ("no_ecc"),
       .FIFO_WRITE_DEPTH     (16),
       .WRITE_DATA_WIDTH     (1),
       .WR_DATA_COUNT_WIDTH  (1),
       //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
       .FULL_RESET_VALUE     (0),
       .USE_ADV_FEATURES     ("0707"),
       .READ_MODE            ("fwft"),
       .FIFO_READ_LATENCY    (1),
       .READ_DATA_WIDTH      (1),
       .RD_DATA_COUNT_WIDTH  (1),
       .PROG_EMPTY_THRESH    (10),
       .DOUT_RESET_VALUE     ("0"),
       .WAKEUP_TIME          (0)
   ) dest_ip_filter_fifo (
       // Common module ports
       .sleep           (),
       .rst             (reset),

       // Write Domain ports
       .wr_clk          (clk),
       .wr_en           (lookup_ack),
       .din             (lookup_hit),
       .full            (),
       .prog_full       (),
       .wr_data_count   (),
       .overflow        (),
       .wr_rst_busy     (),
       .almost_full     (),
       .wr_ack          (),

       // Read Domain ports
       .rd_en           (rd_dest_ip_filter_result),
       .dout            (dest_ip_hit),
       .empty           (empty),
       .prog_empty      (),
       .rd_data_count   (),
       .underflow       (),
       .rd_rst_busy     (),
       .almost_empty    (),
       .data_valid      (),

       // ECC Related ports
       .injectsbiterr   (),
       .injectdbiterr   (),
       .sbiterr         (),
       .dbiterr         () 
   );

   xpm_fifo_sync #(
      .FIFO_MEMORY_TYPE     ("auto"),
      .ECC_MODE             ("no_ecc"),
      .FIFO_WRITE_DEPTH     (16),
      .WRITE_DATA_WIDTH     (32),
      .WR_DATA_COUNT_WIDTH  (1),
      //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
      .FULL_RESET_VALUE     (0),
      .USE_ADV_FEATURES     ("0707"),
      .READ_MODE            ("fwft"),
      .FIFO_READ_LATENCY    (1),
      .READ_DATA_WIDTH      (32),
      .RD_DATA_COUNT_WIDTH  (1),
      .PROG_EMPTY_THRESH    (10),
      .DOUT_RESET_VALUE     ("0"),
      .WAKEUP_TIME          (0)
   ) dest_fifo2 (
      // Common module ports
      .sleep           (),
      .rst             (reset),

      // Write Domain ports
      .wr_clk          (clk),
      .wr_en           (dst_ip_vld),
      .din             (dst_ip),
      .full            (),
      .prog_full       (filter_fifo_nearly_full),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (rd_dest),
      .dout            (dst_ip_fifo),
      .empty           (dest_fifo_empty),
      .prog_empty      (),
      .rd_data_count   (),
      .underflow       (),
      .rd_rst_busy     (),
      .almost_empty    (),
      .data_valid      (),

      // ECC Related ports
      .injectsbiterr   (),
      .injectdbiterr   (),
      .sbiterr         (),
      .dbiterr         () 
   );

   //------------------------- Logic --------------------------------

   assign dest_ip_filter_vld = !empty;


    always @(*) begin
        rd_dest = 0;
        dst_ip_ready = 0;
        state_next = state;

        case(state)

                WAIT: begin
                        if(!dest_fifo_empty) begin
                                rd_dest = 1;
                                dst_ip_ready = 1;
                                state_next = PROCESS;
                        end
                end

                PROCESS: begin
                        if(lookup_ack)
                                state_next = WAIT;
                end
        endcase
     end


   always @(posedge clk) begin
        if(reset)
                state <= WAIT;
        else
                state <= state_next;
   end


   /*****************************************************************
    * find the dst IP address and do the lookup
    *****************************************************************/
   generate 
      if (C_S_AXIS_DATA_WIDTH == 256) begin
   always @(posedge clk) begin
      if(reset) begin
         dst_ip <= 0;
         dst_ip_vld <= 0;
      end
      else begin
         if(word_IP_DST_HI) begin
         	dst_ip[31:16] <= tdata[15:0]; 			// Big endian
            	dst_ip_vld <= 0;
         end
         if(word_IP_DST_LO) begin
            	dst_ip[15:0]  <= tdata[255:240];		// Big endian
            	dst_ip_vld <= 1;
         end
         else begin
            dst_ip_vld <= 0;
         end
      end // else: !if(reset)
   end // always @ (posedge clk)
    end // generate : C_S_AXIS_DATA_WIDTH == 256
        else if (C_S_AXIS_DATA_WIDTH >= 512) begin
   always @(posedge clk) begin
      if(reset) begin
         dst_ip <= 0;
         dst_ip_vld <= 0;
      end else begin
         if(word_IP_DST_HI) begin
            dst_ip[31:0] <= tdata[DEST_IP_POS-1:DEST_IP_POS-32]; 			// Big endian
            dst_ip_vld <= 1;
         end else begin
            dst_ip_vld <= 0;
         end
      end // else: !if(reset)
   end // always @ (posedge clk)
    end 
  endgenerate

endmodule // dest_ip_filter



