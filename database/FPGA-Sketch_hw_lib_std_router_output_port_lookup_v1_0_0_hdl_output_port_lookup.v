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
********************************************************************************/


module output_port_lookup
#(
    //Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH       = 512,
    parameter C_S_AXIS_DATA_WIDTH       = 512,
    parameter C_M_AXIS_TUSER_WIDTH      = 128,
    parameter C_S_AXIS_TUSER_WIDTH      = 128,
    parameter NUM_OUTPUT_QUEUES         = 8,
    parameter NUM_OUTPUT_QUEUES_WIDTH   = log2(NUM_OUTPUT_QUEUES),
    parameter LPM_LUT_DEPTH             = 32,
    parameter LPM_LUT_DEPTH_BITS        = log2(LPM_LUT_DEPTH),
    parameter ARP_LUT_DEPTH             = 32,
    parameter ARP_LUT_DEPTH_BITS        = log2(ARP_LUT_DEPTH),
    parameter FILTER_DEPTH              = 32,
    parameter FILTER_DEPTH_BITS         = log2(FILTER_DEPTH)
)
(
    // Global Ports
    input axis_aclk,
    input axis_resetn,

    // Master Stream Ports (interface to data path)
    output [C_M_AXIS_DATA_WIDTH - 1:0]		m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0]	m_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]		m_axis_tuser,
    output m_axis_tvalid,
    input  m_axis_tready,
    output m_axis_tlast,

    // Slave Stream Ports (interface to RX queues)
    input [C_S_AXIS_DATA_WIDTH - 1:0]		s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0]	s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0]		s_axis_tuser,
    input  s_axis_tvalid,
    output s_axis_tready,
    input  s_axis_tlast,

    // --- interface to op_lut_process_sm
    output                               pkt_sent_from_cpu,              // pulsed: we've sent a pkt from the CPU
    output                               pkt_sent_to_cpu_options_ver,    // pulsed: we've sent a pkt to the CPU coz it has options/bad version
    output                               pkt_sent_to_cpu_bad_ttl,        // pulsed: sent a pkt to the CPU coz the TTL is 1 or 0
    output                               pkt_sent_to_cpu_dest_ip_hit,    // pulsed: sent a pkt to the CPU coz it has hit in the destination ip filter list
    output                               pkt_forwarded     ,             // pulsed: forwarded pkt to the destination port
    output                               pkt_dropped_checksum,           // pulsed: dropped pkt coz bad checksum
    output                               pkt_sent_to_cpu_non_ip,         // pulsed: sent pkt to cpu coz it's not IP
    output                               pkt_sent_to_cpu_arp_miss,       // pulsed: sent pkt to cpu coz we didn't find arp entry for next hop ip
    output                               pkt_sent_to_cpu_lpm_miss,       // pulsed: sent pkt to cpu coz we didn't find lpm entry for destination ip
    output                               pkt_dropped_wrong_dst_mac,      // pulsed: dropped pkt not destined to us

    // --- interface to ip_lpm
    input [LPM_LUT_DEPTH_BITS-1:0]       lpm_rd_addr,          // address in table to read
    input                                lpm_rd_req,           // request a read
    output [31:0]                        lpm_rd_ip,            // ip to match in the CAM
    output [31:0]                        lpm_rd_mask,          // subnet mask
    output [NUM_OUTPUT_QUEUES-1:0]       lpm_rd_oq,            // input queue
    output [31:0]                        lpm_rd_next_hop_ip,   // ip addr of next hop
    output                               lpm_rd_ack,           // pulses high
    input [LPM_LUT_DEPTH_BITS-1:0]       lpm_wr_addr,
    input                                lpm_wr_req,
    input [NUM_OUTPUT_QUEUES-1:0]        lpm_wr_oq,
    input [31:0]                         lpm_wr_next_hop_ip,   // ip addr of next hop
    input [31:0]                         lpm_wr_ip,            // data to match in the CAM
    input [31:0]                         lpm_wr_mask,
    output                               lpm_wr_ack,

    // --- ip_arp
    input [ARP_LUT_DEPTH_BITS-1:0]       arp_rd_addr,          // address in table to read
    input                                arp_rd_req,           // request a read
    output  [47:0]                       arp_rd_mac,           // data read from the LUT at rd_addr
    output  [31:0]                       arp_rd_ip,            // ip to match in the CAM
    output                               arp_rd_ack,           // pulses high
    input [ARP_LUT_DEPTH_BITS-1:0]       arp_wr_addr,
    input                                arp_wr_req,
    input [47:0]                         arp_wr_mac,
    input [31:0]                         arp_wr_ip,            // data to match in the CAM
    output                               arp_wr_ack,

    // --- interface to dest_ip_filter
    input [FILTER_DEPTH_BITS-1:0]        dest_ip_filter_rd_addr,          // address in table to read
    input                                dest_ip_filter_rd_req,           // request a read
    output [31:0]                        dest_ip_filter_rd_ip,            // ip to match in the CAM
    output                               dest_ip_filter_rd_ack,           // pulses high
    input [FILTER_DEPTH_BITS-1:0]        dest_ip_filter_wr_addr,
    input                                dest_ip_filter_wr_req,
    input [31:0]                         dest_ip_filter_wr_ip,            // data to match in the CAM
    output                               dest_ip_filter_wr_ack,

    // --- eth_parser
    input [47:0]                         mac_0,    // address of rx queue 0
    input [47:0]                         mac_1,    // address of rx queue 1
    input [47:0]                         mac_2,    // address of rx queue 2
    input [47:0]                         mac_3,    // address of rx queue 3

    // --- Reset Tables
    input [3:0]                          reset_tables

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

   wire [NUM_OUTPUT_QUEUES_WIDTH-1:0]      mac_dst_port_num;
   wire [31:0]                             next_hop_ip;

   wire [NUM_OUTPUT_QUEUES-1:0]            lpm_output_port;

   wire [47:0]                             next_hop_mac;
   wire [NUM_OUTPUT_QUEUES-1:0]            output_port;

   wire [7:0]                              ip_new_ttl;
   wire [15:0]                             ip_new_checksum;

   wire [NUM_OUTPUT_QUEUES-1:0]            to_cpu_output_port;
   wire [NUM_OUTPUT_QUEUES-1:0]            from_cpu_output_port;
   wire [NUM_OUTPUT_QUEUES_WIDTH-1:0]      input_port_num;

   wire [C_M_AXIS_DATA_WIDTH-1:0]          in_fifo_tdata;
   wire [C_M_AXIS_TUSER_WIDTH-1:0]         in_fifo_tuser;
   wire [C_M_AXIS_DATA_WIDTH/8-1:0]        in_fifo_tkeep;
   wire                                    in_fifo_tlast;

   wire                                    in_fifo_nearly_full;
   wire                                    arp_done;
   wire                                    dest_fifo_nearly_full;
   wire                                    ready;

   // Control signals
   assign s_axis_tready = ~in_fifo_nearly_full & ~dest_fifo_nearly_full & ready;

   //-------------------- Modules and Logic ---------------------------

   /* The size of this fifo has to be large enough to fit the previous modules' headers
    * and the ethernet header */
   xpm_fifo_sync #(
      .FIFO_MEMORY_TYPE     ("auto"),
      .ECC_MODE             ("no_ecc"),
      .FIFO_WRITE_DEPTH     (16),
      .WRITE_DATA_WIDTH     (C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
      .WR_DATA_COUNT_WIDTH  (1),
      //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
      .FULL_RESET_VALUE     (0),
      .USE_ADV_FEATURES     ("0707"),
      .READ_MODE            ("fwft"),
      .FIFO_READ_LATENCY    (1),
      .READ_DATA_WIDTH      (C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
      .RD_DATA_COUNT_WIDTH  (1),
      .PROG_EMPTY_THRESH    (10),
      .DOUT_RESET_VALUE     ("0"),
      .WAKEUP_TIME          (0)
   ) input_fifo (
      // Common module ports
      .sleep           (),
      .rst             (~axis_resetn),

      // Write Domain ports
      .wr_clk          (axis_aclk),
      .wr_en           (s_axis_tvalid & s_axis_tready),
      .din             ({s_axis_tlast, s_axis_tuser, s_axis_tkeep, s_axis_tdata}),
      .full            (),
      .prog_full       (in_fifo_nearly_full),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (in_fifo_rd_en),
      .dout            ({in_fifo_tlast, in_fifo_tuser, in_fifo_tkeep, in_fifo_tdata}),
      .empty           (in_fifo_empty),
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

   preprocess_control
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH)
       ) preprocess_control
       ( // --- Interface to the previous stage
      // --- Input
      .tdata                     (s_axis_tdata),
      .valid                     (s_axis_tvalid & s_axis_tready),
      .tlast                     (s_axis_tlast),
      .ready                     (ready),

      // --- Interface to other preprocess blocks
      // --- Output
      .word_IP_DST_HI            (word_IP_DST_HI),
      .word_IP_DST_LO            (word_IP_DST_LO),

      // --- Misc
      // --- Input
      .reset                     (~axis_resetn),
      .clk                       (axis_aclk)
   );

   eth_parser
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH),
       .NUM_QUEUES(NUM_OUTPUT_QUEUES)
       ) eth_parser
       ( // --- Interface to the previous stage
      // --- Input
      .tdata                 (s_axis_tdata),

      // --- Interface to process block
      // --- Output
      .is_arp_pkt            (is_arp_pkt), 
      .is_ip_pkt             (is_ip_pkt),
      .is_for_us             (is_for_us),
      .is_broadcast          (is_broadcast),
      .mac_dst_port_num      (mac_dst_port_num),

      // --- Input
      .eth_parser_rd_info    (rd_preprocess_info),

      // --- Output
      .eth_parser_info_vld   (eth_parser_info_vld),

      // --- Interface to preprocess block
      // --- Input
      .word_IP_DST_HI        (word_IP_DST_HI),

          // --- Interface to registers
      // --- Input
      .mac_0                 (mac_0),    // address of rx queue 0
      .mac_1                 (mac_1),    // address of rx queue 1
      .mac_2                 (mac_2),    // address of rx queue 2
      .mac_3                 (mac_3),    // address of rx queue 3

      // --- Misc
      // --- Input
      .reset                 (~axis_resetn),
      .clk                   (axis_aclk)
    );


   ip_lpm
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH),
       .NUM_QUEUES(NUM_OUTPUT_QUEUES)
       ) ip_lpm
       ( // --- Interface to the previous stage
         // --- Input
         .tdata                (s_axis_tdata),

         // --- Interface to arp_lut
         // --- Output
         .next_hop_ip          (next_hop_ip),
         .lpm_output_port      (lpm_output_port),
         .lpm_vld              (lpm_vld),
         .lpm_hit              (lpm_hit),

         // --- Input
         .arp_done             (arp_done),

         // --- Output
         .dest_fifo_nearly_full(dest_fifo_nearly_full),

             // --- Interface to preprocess block
         // --- Input
         .word_IP_DST_HI       (word_IP_DST_HI),
         .word_IP_DST_LO       (word_IP_DST_LO),

             // --- Interface to registers
             // --- Read port
         // --- Input
         .lpm_rd_addr          (lpm_rd_addr),          // address in table to read
         .lpm_rd_req           (lpm_rd_req),           // request a read

         // --- Output
         .lpm_rd_ip            (lpm_rd_ip),            // ip to match in the CAM
         .lpm_rd_mask          (lpm_rd_mask),          // subnet mask
         .lpm_rd_oq            (lpm_rd_oq),            // output queue
         .lpm_rd_next_hop_ip   (lpm_rd_next_hop_ip),   // ip addr of next hop
         .lpm_rd_ack           (lpm_rd_ack),           // pulses high

             // --- Write port
         // --- Input
         .lpm_wr_addr          (lpm_wr_addr),
         .lpm_wr_req           (lpm_wr_req),
         .lpm_wr_oq            (lpm_wr_oq),
         .lpm_wr_next_hop_ip   (lpm_wr_next_hop_ip),   // ip addr of next hop
         .lpm_wr_ip            (lpm_wr_ip),            // data to match in the CAM
         .lpm_wr_mask          (lpm_wr_mask),
         // --- Output
         .lpm_wr_ack           (lpm_wr_ack),

             // --- Misc
         // --- Input
         .reset                (~axis_resetn | reset_tables[1]),
         .clk                  (axis_aclk)
         );


   ip_arp
     #(.NUM_QUEUES(NUM_OUTPUT_QUEUES)
       ) ip_arp
       ( // --- Interface to ip_arp
         .next_hop_ip       (next_hop_ip),
         .lpm_output_port   (lpm_output_port),
         .lpm_vld           (lpm_vld),
         .lpm_hit           (lpm_hit),
         .arp_done          (arp_done),

         // --- interface to process block
         .next_hop_mac      (next_hop_mac),
         .output_port       (output_port),
         .arp_mac_vld       (arp_mac_vld),
         .rd_arp_result     (rd_preprocess_info),
         .arp_lookup_hit    (arp_lookup_hit),
         .lpm_lookup_hit    (lpm_lookup_hit),

         // --- Interface to registers
         // --- Read port
         .arp_rd_addr       (arp_rd_addr),          // address in table to read
         .arp_rd_req        (arp_rd_req),           // request a read
         .arp_rd_mac        (arp_rd_mac),           // data read from the LUT at rd_addr
         .arp_rd_ip         (arp_rd_ip),            // ip to match in the CAM
         .arp_rd_ack        (arp_rd_ack),           // pulses high

         // --- Write port
         .arp_wr_addr       (arp_wr_addr),
         .arp_wr_req        (arp_wr_req),
         .arp_wr_mac        (arp_wr_mac),
         .arp_wr_ip         (arp_wr_ip),            // data to match in the CAM
         .arp_wr_ack        (arp_wr_ack),

         // --- Misc
         .reset             (~axis_resetn | reset_tables[2]),
         .clk               (axis_aclk)
         );

   dest_ip_filter
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH)
     ) dest_ip_filter
       ( // --- Interface to the previous stage
         .tdata                    (s_axis_tdata),

         // --- Interface to preprocess block
         .word_IP_DST_HI           (word_IP_DST_HI),
         .word_IP_DST_LO           (word_IP_DST_LO),

         // --- interface to process block
         .dest_ip_hit              (dest_ip_hit),
         .dest_ip_filter_vld       (dest_ip_filter_vld),
         .rd_dest_ip_filter_result (rd_preprocess_info),

         // --- Interface to registers
         // --- Read port
         .dest_ip_filter_rd_addr   (dest_ip_filter_rd_addr),
         .dest_ip_filter_rd_req    (dest_ip_filter_rd_req),
         .dest_ip_filter_rd_ip     (dest_ip_filter_rd_ip), // ip to match in the cam
         .dest_ip_filter_rd_ack    (dest_ip_filter_rd_ack),

         // --- Write port
         .dest_ip_filter_wr_addr   (dest_ip_filter_wr_addr),
         .dest_ip_filter_wr_req    (dest_ip_filter_wr_req),
         .dest_ip_filter_wr_ip     (dest_ip_filter_wr_ip),
         .dest_ip_filter_wr_ack    (dest_ip_filter_wr_ack),

         // --- Misc
         .reset                    (~axis_resetn | reset_tables[3]),
         .clk                      (axis_aclk)
         );


   ip_checksum_ttl
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH)
       ) ip_checksum_ttl
       ( //--- datapath interface
         .tdata                     (s_axis_tdata),
         .valid                     (s_axis_tvalid & s_axis_tready),

         //--- interface to preprocess
         .word_IP_DST_HI            (word_IP_DST_HI),
         .word_IP_DST_LO            (word_IP_DST_LO),

         // --- interface to process
         .ip_checksum_vld           (ip_checksum_vld),
         .ip_checksum_is_good       (ip_checksum_is_good),
         .ip_hdr_has_options        (ip_hdr_has_options),
         .ip_ttl_is_good            (ip_ttl_is_good),
         .ip_new_ttl                (ip_new_ttl),
         .ip_new_checksum           (ip_new_checksum),     // new checksum assuming decremented TTL
         .rd_checksum               (rd_preprocess_info),

         // misc
         .reset                     (~axis_resetn),
         .clk                       (axis_aclk)
         );


   op_lut_hdr_parser
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH),
       .C_S_AXIS_TUSER_WIDTH (C_S_AXIS_TUSER_WIDTH),
       .NUM_QUEUES(NUM_OUTPUT_QUEUES)
       ) op_lut_hdr_parser
       ( // --- Interface to the previous stage
         .tdata                 (s_axis_tdata),
         .tuser                 (s_axis_tuser),
         .valid                 (s_axis_tvalid & s_axis_tready),
         .tlast                 (s_axis_tlast),

         // --- Interface to process block
         .is_from_cpu           (is_from_cpu),
         .to_cpu_output_port    (to_cpu_output_port),
         .from_cpu_output_port  (from_cpu_output_port),
         .input_port_num        (input_port_num),
         .rd_hdr_parser         (rd_preprocess_info),
         .is_from_cpu_vld       (is_from_cpu_vld),

         // --- Misc
         .reset                 (~axis_resetn),
         .clk                   (axis_aclk)
         );


   op_lut_process_sm
     #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH),
       .C_S_AXIS_TUSER_WIDTH (C_S_AXIS_TUSER_WIDTH),
       .NUM_QUEUES(NUM_OUTPUT_QUEUES)
       ) op_lut_process_sm
       ( // --- interface to input fifo - fallthrough
         .in_fifo_vld                   (!in_fifo_empty),
         .in_fifo_tdata                 (in_fifo_tdata),
         .in_fifo_tlast                 (in_fifo_tlast),
         .in_fifo_tuser                 (in_fifo_tuser),
         .in_fifo_keep                  (in_fifo_tkeep),
         .in_fifo_rd_en                 (in_fifo_rd_en),

         // --- interface to eth_parser
         .is_arp_pkt                    (is_arp_pkt),
         .is_ip_pkt                     (is_ip_pkt),
         .is_for_us                     (is_for_us),
         .is_broadcast                  (is_broadcast),
         .mac_dst_port_num              (mac_dst_port_num),
         .eth_parser_info_vld           (eth_parser_info_vld),

         // --- interface to ip_arp
         .next_hop_mac                  (next_hop_mac),
         .output_port                   (output_port),
         .arp_mac_vld                   (arp_mac_vld),
         .arp_lookup_hit                (arp_lookup_hit),
         .lpm_lookup_hit                (lpm_lookup_hit),

         // --- interface to op_lut_hdr_parser
         .is_from_cpu                   (is_from_cpu),
         .to_cpu_output_port            (to_cpu_output_port),
         .from_cpu_output_port          (from_cpu_output_port),
         .is_from_cpu_vld               (is_from_cpu_vld),
         .input_port_num                (input_port_num),

         // --- interface to dest_ip_filter
         .dest_ip_hit                   (dest_ip_hit),
         .dest_ip_filter_vld            (dest_ip_filter_vld),

         // --- interface to IP_checksum
         .ip_checksum_vld               (ip_checksum_vld),
         .ip_checksum_is_good           (ip_checksum_is_good),
         .ip_new_checksum               (ip_new_checksum),     // new checksum assuming decremented TTL
         .ip_ttl_is_good                (ip_ttl_is_good),
         .ip_new_ttl                    (ip_new_ttl),
         .ip_hdr_has_options            (ip_hdr_has_options),

         // -- connected to all preprocess blocks
         .rd_preprocess_info            (rd_preprocess_info),

         // --- interface to next module
         .out_tvalid                    (m_axis_tvalid),
         .out_tlast                     (m_axis_tlast),
         .out_tdata                     (m_axis_tdata),
         .out_tuser                     (m_axis_tuser),
         .out_tready                    (m_axis_tready),
         .out_keep                      (m_axis_tkeep),

         // --- interface to registers
         .pkt_sent_from_cpu             (pkt_sent_from_cpu),              // pulsed: we've sent a pkt from the CPU
         .pkt_sent_to_cpu_options_ver   (pkt_sent_to_cpu_options_ver),    // pulsed: we've sent a pkt to the CPU coz it has options/bad version
         .pkt_sent_to_cpu_bad_ttl       (pkt_sent_to_cpu_bad_ttl),        // pulsed: sent a pkt to the CPU coz the TTL is 1 or 0
         .pkt_sent_to_cpu_dest_ip_hit   (pkt_sent_to_cpu_dest_ip_hit),    // pulsed: sent a pkt to the CPU coz it has hit in the destination ip filter list
         .pkt_forwarded                 (pkt_forwarded),             	  // pulsed: forwarded pkt to the destination port
         .pkt_dropped_checksum          (pkt_dropped_checksum),           // pulsed: dropped pkt coz bad checksum
         .pkt_sent_to_cpu_non_ip        (pkt_sent_to_cpu_non_ip),         // pulsed: sent pkt to cpu coz it's not IP
         .pkt_sent_to_cpu_arp_miss      (pkt_sent_to_cpu_arp_miss),       // pulsed: sent pkt to cpu coz no entry in arp table
         .pkt_sent_to_cpu_lpm_miss      (pkt_sent_to_cpu_lpm_miss),       // pulsed: sent pkt to cpu coz no entry in lpm table
         .pkt_dropped_wrong_dst_mac     (pkt_dropped_wrong_dst_mac),      // pulsed: dropped pkt not destined to us
         .mac_0                         (mac_0),    // address of rx queue 0
         .mac_1                         (mac_1),    // address of rx queue 1
         .mac_2                         (mac_2),    // address of rx queue 2
         .mac_3                         (mac_3),    // address of rx queue 3

         // misc
         .reset                         (~axis_resetn),
         .clk                           (axis_aclk)
         );

// remember: assert tvalid with the right output port...then wait for tready signal and send data.

endmodule // output_port_lookup

