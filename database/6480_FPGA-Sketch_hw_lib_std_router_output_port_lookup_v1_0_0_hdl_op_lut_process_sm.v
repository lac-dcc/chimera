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


module op_lut_process_sm
  #(parameter C_S_AXIS_DATA_WIDTH	= 512,
    parameter C_S_AXIS_TUSER_WIDTH	= 128,
    parameter NUM_QUEUES		= 8,
    parameter NUM_QUEUES_WIDTH		= log2(NUM_QUEUES)
  )
  (// --- interface to input fifo - fallthrough
   input                              in_fifo_vld,
   input [C_S_AXIS_DATA_WIDTH-1:0]    in_fifo_tdata,
   input                              in_fifo_tlast,
   input [C_S_AXIS_TUSER_WIDTH-1:0]   in_fifo_tuser,
   input [C_S_AXIS_DATA_WIDTH/8-1:0]  in_fifo_keep,
   output reg                         in_fifo_rd_en,

   // --- interface to eth_parser
   input                              is_arp_pkt,
   input                              is_ip_pkt,
   input                              is_for_us,
   input                              is_broadcast,
   input                              eth_parser_info_vld,
   input      [NUM_QUEUES_WIDTH-1:0]  mac_dst_port_num,

   // --- interface to ip_arp
   input      [47:0]                  next_hop_mac,
   input      [NUM_QUEUES-1:0]        output_port,
   input                              arp_lookup_hit, // indicates if the next hop mac is correct
   input                              lpm_lookup_hit, // indicates if the route to the destination IP was found
   input                              arp_mac_vld,    // indicates the lookup is done

   // --- interface to op_lut_hdr_parser
   input                              is_from_cpu,
   input      [NUM_QUEUES-1:0]        to_cpu_output_port,   // where to send pkts this pkt if it has to go to the CPU
   input      [NUM_QUEUES-1:0]        from_cpu_output_port, // where to send this pkt if it is coming from the CPU
   input                              is_from_cpu_vld,
   input      [NUM_QUEUES_WIDTH-1:0]  input_port_num,

   // --- interface to IP_checksum
   input                              ip_checksum_vld,
   input                              ip_checksum_is_good,
   input                              ip_hdr_has_options,
   input      [15:0]                  ip_new_checksum,     // new checksum assuming decremented TTL
   input                              ip_ttl_is_good,
   input      [7:0]                   ip_new_ttl,

   // --- input to dest_ip_filter
   input                              dest_ip_hit,
   input                              dest_ip_filter_vld,

   // -- connected to all preprocess blocks
   output reg                         rd_preprocess_info,

   // --- interface to next module
   output reg                         		out_tvalid,
   output reg [C_S_AXIS_DATA_WIDTH-1:0]		out_tdata,
   output reg [C_S_AXIS_TUSER_WIDTH-1:0]	out_tuser,     // new checksum assuming decremented TTL
   input                              		out_tready,
   output reg [C_S_AXIS_DATA_WIDTH/8-1:0]  	out_keep,
   output reg					out_tlast,

   // --- interface to registers
   output reg                         pkt_sent_from_cpu,              // pulsed: we've sent a pkt from the CPU
   output reg                         pkt_sent_to_cpu_options_ver,    // pulsed: we've sent a pkt to the CPU coz it has options/bad version
   output reg                         pkt_sent_to_cpu_bad_ttl,        // pulsed: sent a pkt to the CPU coz the TTL is 1 or 0
   output reg                         pkt_sent_to_cpu_dest_ip_hit,    // pulsed: sent a pkt to the CPU coz it has hit in the destination ip filter list
   output reg                         pkt_forwarded,	              // pulsed: forwarded pkt to the destination port
   output reg                         pkt_dropped_checksum,           // pulsed: dropped pkt coz bad checksum
   output reg                         pkt_sent_to_cpu_non_ip,         // pulsed: sent pkt to cpu coz it's not IP
   output reg                         pkt_sent_to_cpu_arp_miss,       // pulsed: sent pkt to cpu coz we didn't find arp entry for next hop ip
   output reg                         pkt_sent_to_cpu_lpm_miss,       // pulsed: sent pkt to cpu coz we didn't find lpm entry for destination ip
   output reg                         pkt_dropped_wrong_dst_mac,      // pulsed: dropped pkt not destined to us

   input  [47:0]                      mac_0,    // address of rx queue 0
   input  [47:0]                      mac_1,    // address of rx queue 1
   input  [47:0]                      mac_2,    // address of rx queue 2
   input  [47:0]                      mac_3,    // address of rx queue 3

   // misc
   input reset,
   input clk
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

   //------------------- Internal parameters -----------------------
   localparam NUM_STATES          = 5;
   localparam WAIT_PREPROCESS_RDY = 1;
   localparam MOVE_TUSER    	  = 2;
   localparam CHANGE_PKT     	  = 4;
   localparam SEND_PKT         	  = 8;
   localparam DROP_PKT            = 16;
   localparam C_AXIS_SRC_PORT_POS = 16;
   localparam C_AXIS_DST_PORT_POS = 24;

   //---------------------- Wires and regs -------------------------
   wire                 preprocess_vld;

   reg [NUM_STATES-1:0]		state;
   reg [NUM_STATES-1:0]		state_next;
   reg				out_tvalid_next;
   reg				out_tlast_next;
   reg [C_S_AXIS_DATA_WIDTH-1:0]	out_tdata_next;
   reg [C_S_AXIS_TUSER_WIDTH-1:0]	out_tuser_next;
   reg [C_S_AXIS_DATA_WIDTH/8-1:0]	out_keep_next;

   reg [47:0]           src_mac_sel;

   reg [NUM_QUEUES-1:0] dst_port;
   reg [NUM_QUEUES-1:0] dst_port_next;

   reg                  to_from_cpu;
   reg                  to_from_cpu_next;

   //-------------------------- Logic ------------------------------
   assign preprocess_vld = eth_parser_info_vld & arp_mac_vld
                         & is_from_cpu_vld & ip_checksum_vld & dest_ip_filter_vld;

   /* select the src mac address to write in the forwarded pkt */
   always @(*) begin
      case(output_port)
        'h1: src_mac_sel       = mac_0;
        'h4: src_mac_sel       = mac_1;
        'h10: src_mac_sel      = mac_2;
        'h40: src_mac_sel      = mac_3;
        default: src_mac_sel   = mac_0;
      endcase // case(output_port)
   end


   /* Modify the packet's hdrs and change tuser */
   always @(*) begin
      out_tlast_next                = in_fifo_tlast;
      out_tdata_next                = in_fifo_tdata;
      out_tuser_next                = in_fifo_tuser;
      out_keep_next                 = in_fifo_keep;
      out_tvalid_next               = 0;

      rd_preprocess_info            = 0;
      state_next                    = state;
      in_fifo_rd_en                 = 0;
      to_from_cpu_next              = to_from_cpu;
      dst_port_next                 = dst_port;

      pkt_sent_from_cpu             = 0;
      pkt_sent_to_cpu_options_ver   = 0;
      pkt_sent_to_cpu_arp_miss      = 0;
      pkt_sent_to_cpu_lpm_miss      = 0;
      pkt_sent_to_cpu_bad_ttl       = 0;
      pkt_forwarded                 = 0;
      pkt_dropped_checksum          = 0;
      pkt_sent_to_cpu_non_ip        = 0;
      pkt_dropped_wrong_dst_mac     = 0;
      pkt_sent_to_cpu_dest_ip_hit   = 0;

      case(state)
        WAIT_PREPROCESS_RDY: begin
           if(preprocess_vld) begin
              /* if the packet is from the CPU then all the info on it is correct.
               * We just pipe it to the output */
              if(is_from_cpu) begin
                 to_from_cpu_next     = 1;
                 dst_port_next        = from_cpu_output_port;
                 rd_preprocess_info   = 1;
                 state_next           = SEND_PKT;
                 pkt_sent_from_cpu    = 1;
              end
              /* check that the port on which it was received matches its mac */
              else if(is_for_us && (input_port_num==mac_dst_port_num || is_broadcast)) begin
                 if(is_ip_pkt) begin
                    if(ip_checksum_is_good) begin
                       /* if the packet has any options or ver!=4 or the TTL is 1 or 0 or if the ip destination address
                        * is in the destination filter list, then send it to the cpu queue corresponding to the input queue
                        * Also send pkt to CPU if we don't find it in the ARP lookup or in the LPM lookup*/
                       if(dest_ip_hit || (ip_hdr_has_options | !ip_ttl_is_good | !arp_lookup_hit | !lpm_lookup_hit)) begin
                          rd_preprocess_info            = 1;
                          to_from_cpu_next              = 1;
                          dst_port_next                 = to_cpu_output_port;
                          state_next                    = SEND_PKT;

                          // Note: care must be taken to ensure that only
                          // *one* of the counters will be incremented at any
                          // given time. (Otherwise the output port lookup
                          // counters will register more packets than other
                          // modules.)
                          //
                          // These are currently sorted in order of priority
                          pkt_sent_to_cpu_dest_ip_hit   = dest_ip_hit;
                          pkt_sent_to_cpu_bad_ttl       = !ip_ttl_is_good & !dest_ip_hit;
                          pkt_sent_to_cpu_options_ver   = ip_hdr_has_options &
                                                          ip_ttl_is_good & !dest_ip_hit;
                          pkt_sent_to_cpu_lpm_miss      = !lpm_lookup_hit & !ip_hdr_has_options &
                                                          ip_ttl_is_good & !dest_ip_hit;
                          pkt_sent_to_cpu_arp_miss      = !arp_lookup_hit & lpm_lookup_hit &
                                                          !ip_hdr_has_options & ip_ttl_is_good &
                                                          !dest_ip_hit;
                       end
                       else if (!is_broadcast) begin
                          to_from_cpu_next   = 0;
                          dst_port_next      = output_port;
                          state_next         = CHANGE_PKT;
                          pkt_forwarded      = 1;
                       end // else: !if(ip_hdr_has_options | !ip_ttl_is_good)
                       else begin
                          pkt_dropped_wrong_dst_mac   = 1;
                          rd_preprocess_info          = 1;
                          //in_fifo_rd_en               = 1;
                          state_next                  = DROP_PKT;
                       end
                    end // if (ip_checksum_is_good)
                    else begin
                       pkt_dropped_checksum   = 1;
                       rd_preprocess_info     = 1;
                       //in_fifo_rd_en          = 1;
                       state_next             = DROP_PKT;
                    end // else: !if(ip_checksum_is_good)
                 end // if (is_ip_pkt)
                 else begin // non-ip pkt
                    pkt_sent_to_cpu_non_ip   = 1;
                    rd_preprocess_info       = 1;
                    to_from_cpu_next         = 1;
                    dst_port_next            = to_cpu_output_port;
                    state_next               = SEND_PKT;
                 end // else: !if(is_ip_pkt)
              end // if (is_for_us)
              else begin // pkt not for us
                 pkt_dropped_wrong_dst_mac   = 1;
                 rd_preprocess_info          = 1;
                 //in_fifo_rd_en               = 1;
                 state_next                  = DROP_PKT;
              end // else: !if(is_for_us)
           end // if (preprocess_vld & out_rdy)
        end // case: WAIT_PREPROCESS_RDY

        CHANGE_PKT: begin
           if(in_fifo_vld && out_tready) begin
              out_tuser_next[C_AXIS_DST_PORT_POS+7:C_AXIS_DST_PORT_POS] = dst_port;
              out_tvalid_next	= 1;
              in_fifo_rd_en	= 1;
              // don't decrement the TTL and don't recalculate checksum for local pkts
              // Big-endian
              out_tdata_next 	= {next_hop_mac,src_mac_sel,in_fifo_tdata[C_S_AXIS_DATA_WIDTH-97:C_S_AXIS_DATA_WIDTH-176],ip_new_ttl[7:0],in_fifo_tdata[C_S_AXIS_DATA_WIDTH-185:C_S_AXIS_DATA_WIDTH-192],ip_new_checksum,in_fifo_tdata[C_S_AXIS_DATA_WIDTH-209:0]};
              rd_preprocess_info= 1;
              if(in_fifo_tlast)
                  state_next =  WAIT_PREPROCESS_RDY;
              else
                  state_next = SEND_PKT;
            end
        end

        SEND_PKT: begin
            if(in_fifo_vld && out_tready) begin
              out_tuser_next[C_AXIS_DST_PORT_POS+7:C_AXIS_DST_PORT_POS] = dst_port; 
              out_tvalid_next	= 1;
              in_fifo_rd_en	= 1;
              if(in_fifo_tlast)
                  state_next =  WAIT_PREPROCESS_RDY;
            end
        end

        DROP_PKT: begin
           if(in_fifo_vld) begin
              in_fifo_rd_en = 1;
              if(in_fifo_tlast)
                 state_next = WAIT_PREPROCESS_RDY;
           end
        end
        default: ;
      endcase // case(state)
   end // always @ (*)

   always @(posedge clk) begin
      if(reset) begin
         state             <= WAIT_PREPROCESS_RDY;
         out_tvalid        <= 0;
         out_tdata         <= 0;
         out_tuser         <= 0;
         out_keep	   <= 0;
         out_tlast	   <= 0;
         to_from_cpu       <= 0;
         dst_port          <= 'h0;
      end
      else begin
         state             <= state_next;
         out_tvalid	   <= out_tvalid_next;
         out_tlast         <= out_tlast_next;
         out_tdata	   <= out_tdata_next;
         out_tuser         <= out_tuser_next;
         out_keep         <= out_keep_next;
         to_from_cpu       <= to_from_cpu_next;
         dst_port          <= dst_port_next;
      end // else: !if(reset)
   end // always @ (posedge clk)

endmodule // op_lut_process_sm

