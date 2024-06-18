// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) 2010, 2011 Muhammad Shahbaz
* Copyright (C) 2015 Gianni Antichi
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


  module eth_parser
    #(parameter C_S_AXIS_DATA_WIDTH	= 512,
      parameter NUM_QUEUES		= 8,
      parameter NUM_QUEUES_WIDTH	= log2(NUM_QUEUES)
      )
   (// --- Interface to the previous stage
    input  [C_S_AXIS_DATA_WIDTH-1:0]   tdata,
   
    // --- Interface to process block
    output                             is_arp_pkt,
    output                             is_ip_pkt,
    output                             is_for_us,
    output                             is_broadcast,
    output [NUM_QUEUES_WIDTH-1:0]      mac_dst_port_num,
    input                              eth_parser_rd_info,
    output                             eth_parser_info_vld,

    // --- Interface to preprocess block
    input                              word_IP_DST_HI,

    // --- Interface to registers
    input  [47:0]                      mac_0,    // address of rx queue 0
    input  [47:0]                      mac_1,    // address of rx queue 1
    input  [47:0]                      mac_2,    // address of rx queue 2
    input  [47:0]                      mac_3,    // address of rx queue 3

    // --- Misc

    input                              reset,
    input                              clk
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

   //------------------ Internal Parameter ---------------------------
   localparam				ETH_ARP	= 16'h0806;	// byte order = Big Endian
   localparam				ETH_IP 	= 16'h0800;	// byte order = Big Endian

   localparam                           IDLE		= 1;
   localparam                           DO_SEARCH	= 2;
   localparam				FLUSH_ENTRY	= 4;

   localparam              DST_MAC_POS = C_S_AXIS_DATA_WIDTH;
   localparam              ETHTYPE_POS = C_S_AXIS_DATA_WIDTH - 96;
   //---------------------- Wires/Regs -------------------------------
   reg [47:0]                          dst_MAC;
   reg [47:0]                          mac_sel;
   reg [15:0]                          ethertype;

   reg                                 search_req;

   reg [2:0]                           state, state_next;
   reg [log2(NUM_QUEUES/2):0]          mac_count, mac_count_next;
   reg                                 wr_en;
   reg                                 port_found;

   wire                                broadcast_bit;

   wire [47:0]			       dst_MAC_fifo;
   wire [15:0]			       ethertype_fifo;
   reg				       rd_parser;
   wire				       parser_fifo_empty;

   //----------------------- Modules ---------------------------------
   xpm_fifo_sync 
      #(.FIFO_MEMORY_TYPE     ("auto"),
        .ECC_MODE             ("no_ecc"),
        .FIFO_WRITE_DEPTH     (16),
        .WRITE_DATA_WIDTH     (4+NUM_QUEUES_WIDTH),
        .WR_DATA_COUNT_WIDTH  (1),
        //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
        .FULL_RESET_VALUE     (0),
        .USE_ADV_FEATURES     ("0707"),
        .READ_MODE            ("fwft"),
        .FIFO_READ_LATENCY    (1),
        .READ_DATA_WIDTH      (4+NUM_QUEUES_WIDTH),
        .RD_DATA_COUNT_WIDTH  (1),
        .PROG_EMPTY_THRESH    (10),
        .DOUT_RESET_VALUE     ("0"),
        .WAKEUP_TIME          (0)
      ) 
      eth_fifo (
      // Common module ports
      .sleep           (),
      .rst             (reset),

      // Write Domain ports
      .wr_clk          (clk),
      .wr_en           (wr_en),
      .din             ({port_found,               			// is for us
                  (ethertype==ETH_ARP),				// is ARP
                  (ethertype==ETH_IP),				// is IP
                  (broadcast_bit),				// is broadcast
                  {mac_count[log2(NUM_QUEUES/2)-1:0], 1'b0}}),
      .full            (),
      .prog_full       (),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (eth_parser_rd_info),
      .dout            ({is_for_us, is_arp_pkt, is_ip_pkt, is_broadcast, mac_dst_port_num}),
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
      .WRITE_DATA_WIDTH     (48+16),
      .WR_DATA_COUNT_WIDTH  (1),
      //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
      .FULL_RESET_VALUE     (0),
      .USE_ADV_FEATURES     ("0707"),
      .READ_MODE            ("fwft"),
      .FIFO_READ_LATENCY    (1),
      .READ_DATA_WIDTH      (48+16),
      .RD_DATA_COUNT_WIDTH  (1),
      .PROG_EMPTY_THRESH    (10),
      .DOUT_RESET_VALUE     ("0"),
      .WAKEUP_TIME          (0)
   ) parser_fifo (
      // Common module ports
      .sleep           (),
      .rst             (reset),
 
      // Write Domain ports
      .wr_clk          (clk),
      .wr_en           (search_req),
      .din             ({dst_MAC,ethertype}),
      .full            (),
      .prog_full       (parser_fifo_nearly_full),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (rd_parser),
      .dout            ({dst_MAC_fifo, ethertype_fifo}),
      .empty           (parser_fifo_empty),
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


   //------------------------ Logic ----------------------------------
   assign eth_parser_info_vld = !empty;
   assign broadcast_bit = dst_MAC_fifo[40]; 	// Big endian

   always @(*) begin
      mac_sel = mac_0;
      case(mac_count)
         0: mac_sel = mac_0;
         1: mac_sel = mac_1;
         2: mac_sel = mac_2;
         3: mac_sel = mac_3;
         4: mac_sel = ~48'h0;
      endcase // case(mac_count)
   end // always @ (*)

   /******************************************************************
    * Get the destination, source and ethertype of the pkt
    *****************************************************************/
   always @(posedge clk) begin
      if(reset) begin
         dst_MAC    <= 0;
         ethertype  <= 0;
         search_req <= 0;
      end
      else begin
         if(word_IP_DST_HI) begin
            dst_MAC	<= tdata[DST_MAC_POS-1:DST_MAC_POS-48]; 	// Big endian
            ethertype	<= tdata[ETHTYPE_POS-1:ETHTYPE_POS-16]; 	// Big endian
            search_req	<= 1;
         end
         else begin
               search_req     <= 0;
         end // else: !if(word_IP_DST_HI)
      end // else: !if(reset)
   end // always @ (posedge clk)

   /*************************************************************
    * check to see if the destination port matches any of our port
    * MAC addresses. We need to make sure that this search is
    * completed before the end of the packet.
    *************************************************************/
   always @(*) begin

      state_next = state;
      mac_count_next = mac_count;
      wr_en = 0;
      port_found = 0;
      rd_parser = 0;

      case(state)

        IDLE: begin
           if(!parser_fifo_empty) begin
              state_next	= DO_SEARCH;
              mac_count_next	= NUM_QUEUES/2;
           end
        end

        DO_SEARCH: begin
           mac_count_next = mac_count-1;
           if(mac_sel==dst_MAC_fifo || broadcast_bit) begin
              wr_en		= 1;
              state_next	= FLUSH_ENTRY;
              port_found	= 1;
           end
           else if(mac_count == 0) begin
              state_next	= FLUSH_ENTRY;
              wr_en 		= 1;
           end
        end

        FLUSH_ENTRY: begin
           rd_parser	= 1;
           state_next	= IDLE;
        end

      endcase // case(state)

   end // always @(*)


   always @(posedge clk) begin
      if(reset) begin
         state		<= IDLE;
         mac_count	<= 0;
      end
      else begin
         state		<= state_next;
         mac_count	<= mac_count_next;
      end
   end

endmodule // eth_parser


