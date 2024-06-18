// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) grg
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
********************************************************************************/


  module ip_arp
    #(parameter NUM_QUEUES	= 8,
      parameter LUT_DEPTH	= 32,
      parameter LUT_DEPTH_BITS	= log2(LUT_DEPTH)
      )
   (// --- Interface to ip_arp
    input   [31:0]                   next_hop_ip,
    input   [NUM_QUEUES-1:0]         lpm_output_port,
    input                            lpm_vld,
    input                            lpm_hit,

    output                           arp_done,
    // --- interface to process block
    output  [47:0]                   next_hop_mac,
    output  [NUM_QUEUES-1:0]         output_port,
    output                           arp_mac_vld,
    output                           arp_lookup_hit,
    output                           lpm_lookup_hit,
    input                            rd_arp_result,

    // --- Interface to registers
    // --- Read port
    input   [LUT_DEPTH_BITS-1:0]     arp_rd_addr,          // address in table to read
    input                            arp_rd_req,           // request a read
    output  [47:0]                   arp_rd_mac,           // data read from the LUT at rd_addr
    output  [31:0]                   arp_rd_ip,            // ip to match in the CAM
    output                           arp_rd_ack,           // pulses high

    // --- Write port
    input   [LUT_DEPTH_BITS-1:0]     arp_wr_addr,
    input                            arp_wr_req,
    input   [47:0]                   arp_wr_mac,
    input   [31:0]                   arp_wr_ip,            // data to match in the CAM
    output                           arp_wr_ack,

    // --- Misc
    input                            reset,
    input                            clk
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

   //--------------------- Internal Parameter-------------------------

   //---------------------- Wires and regs----------------------------
   wire                         cam_busy;
   wire                         cam_match;
   wire [LUT_DEPTH-1:0]         cam_match_addr;
   wire [31:0]                  cam_cmp_din, cam_cmp_data_mask;
   wire [31:0]                  cam_din, cam_data_mask;
   wire                         cam_we;
   wire [LUT_DEPTH_BITS-1:0]    cam_wr_addr;

   wire [47:0]                  next_hop_mac_result;

   wire                         empty;

   reg  [NUM_QUEUES-1:0]        output_port_latched;
   reg                          lpm_hit_latched;



   //------------------------- Modules-------------------------------

   // 1 cycle read latency, 16 cycles write latency
   // priority encoded for the smallest address.
   // priority encoded for the smallest address. 
   // Single match unencoded match addresses
   cam 
    #(.C_TCAM_ADDR_WIDTH	(LUT_DEPTH_BITS),
      .C_TCAM_DATA_WIDTH	(32),
      .C_TCAM_ADDR_TYPE	(1),
      .C_TCAM_MATCH_ADDR_WIDTH (LUT_DEPTH)
    )
   ip_arp_cam
     (
      // Outputs
      .BUSY                 (cam_busy),
      .MATCH                (cam_match),
      .MATCH_ADDR           (cam_match_addr),
      // Inputs
      .CLK                  (clk),
      .CMP_DIN              (cam_cmp_din),
      .DIN                  (cam_din),
      .WE                   (cam_we),
      .ADDR_WR              (cam_wr_addr));

   unencoded_cam_lut_sm
     #(.CMP_WIDTH(32),                  // IPv4 addr width
       .DATA_WIDTH(48),			// MAC address width
       .LUT_DEPTH(LUT_DEPTH)
       ) cam_lut_sm
       (// --- Interface for lookups
        .lookup_req         (lpm_vld),
        .lookup_cmp_data    (next_hop_ip),
        .lookup_cmp_dmask   (32'h0),
        .lookup_ack         (lookup_ack),
        .lookup_hit         (lookup_hit),
        .lookup_data        (next_hop_mac_result),

        // --- Interface to registers
        // --- Read port
        .rd_addr            (arp_rd_addr),    // address in table to read
        .rd_req             (arp_rd_req),     // request a read
        .rd_data            (arp_rd_mac),     // data found for the entry
        .rd_cmp_data        (arp_rd_ip),      // matching data for the entry
        .rd_cmp_dmask       (),               // don't cares entry
        .rd_ack             (arp_rd_ack),     // pulses high

        // --- Write port
        .wr_addr            (arp_wr_addr),
        .wr_req             (arp_wr_req),
        .wr_data            (arp_wr_mac),    // data found for the entry
        .wr_cmp_data        (arp_wr_ip),     // matching data for the entry
        .wr_cmp_dmask       (32'h0),         // don't cares for the entry
        .wr_ack             (arp_wr_ack),

        // --- CAM interface
        .cam_busy           (cam_busy),
        .cam_match          (cam_match),
        .cam_match_addr     (cam_match_addr),
        .cam_cmp_din        (cam_cmp_din),
        .cam_din            (cam_din),
        .cam_we             (cam_we),
        .cam_wr_addr        (cam_wr_addr),
        .cam_cmp_data_mask  (cam_cmp_data_mask),
        .cam_data_mask      (cam_data_mask),

        // --- Misc
        .reset (reset),
        .clk   (clk));

   xpm_fifo_sync 
      #(.FIFO_MEMORY_TYPE     ("auto"),
        .ECC_MODE             ("no_ecc"),
        .FIFO_WRITE_DEPTH     (16),
        .WRITE_DATA_WIDTH     (50+NUM_QUEUES),
        .WR_DATA_COUNT_WIDTH  (1),
        //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
        .FULL_RESET_VALUE     (0),
        .USE_ADV_FEATURES     ("0707"),
        .READ_MODE            ("fwft"),
        .FIFO_READ_LATENCY    (1),
        .READ_DATA_WIDTH      (50+NUM_QUEUES),
        .RD_DATA_COUNT_WIDTH  (1),
        .PROG_EMPTY_THRESH    (10),
        .DOUT_RESET_VALUE     ("0"),
        .WAKEUP_TIME          (0)
      ) arp_fifo 
      (
      // Common module ports
      .sleep           (),
      .rst             (reset),

      // Write Domain ports
      .wr_clk          (clk),
      .wr_en           (lookup_ack),
      .din             ({next_hop_mac_result, output_port_latched, lookup_hit, lpm_hit_latched}),
      .full            (),
      .prog_full       (),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (rd_arp_result),
      .dout            ({next_hop_mac, output_port, arp_lookup_hit, lpm_lookup_hit}),
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
      .dbiterr         ());

   //------------------------- Logic --------------------------------
   assign arp_mac_vld = !empty;
   assign arp_done = lookup_ack;
   always @(posedge clk) begin
      if(reset) begin
         output_port_latched	<= 0;
         lpm_hit_latched	<= 0;
      end
      else if(lpm_vld) begin
         output_port_latched	<= lpm_output_port;
         lpm_hit_latched	<= lpm_hit;
      end
   end

endmodule // ip_arp



