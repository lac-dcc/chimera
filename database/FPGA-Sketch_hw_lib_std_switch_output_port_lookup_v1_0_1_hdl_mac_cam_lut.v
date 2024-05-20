// This program was cloned from: https://github.com/PaperL/FPGA-Sketch
// License: Apache License 2.0

/*******************************************************************************
*
* Copyright (C) 2013 Gianni Antichi
* Copyright (C) 2015 Noa Zilberman
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
*/
/******************************************************************************
*
*  File:
* 	mac_cam_lut.v
*
*  Module:
*        mac_cam_lut
*
*  Author:
*        Gianni Antichi
*        Modified by Noa Zilberman
*
*  Description:
* 	learning CAM switch core functionality
*
*/

`timescale 1ns/1ps

module mac_cam_lut
    #(parameter NUM_OUTPUT_QUEUES = 8,
      parameter LUT_DEPTH_BITS = 4,
      parameter LUT_DEPTH = 2**LUT_DEPTH_BITS,
      parameter DEFAULT_MISS_OUTPUT_PORTS = 8'h05) // only send to the MAC txfifos not the cpu

   ( // --- core functionality signals
     input [47:0]                       dst_mac,
     input [47:0]                       src_mac,
     input [NUM_OUTPUT_QUEUES-1:0]      src_port,
     input                              lookup_req,
     output[NUM_OUTPUT_QUEUES-1:0]      dst_ports,
  
     // --- lookup done signal
     output reg                         lookup_done,          // pulses high on lookup done
     output reg                         lut_miss,
     output reg                         lut_hit,

     // --- Misc
     input                              clk,
     input                              reset

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
   localparam RESET            = 1;
   localparam IDLE             = 2;
   localparam LATCH_DST_LOOKUP = 4;

   //---------------------- Wires and regs----------------------------

   wire [NUM_OUTPUT_QUEUES-1:0]          rd_oq;            // data read from the LUT at rd_addr
   wire [47:0]                           rd_mac;

   wire                                  cam_busy, cam_match;
   wire [LUT_DEPTH_BITS-1:0]             cam_match_addr;
   reg  [47:0]                           cam_cmp_din;

   reg  [47:0]                           cam_din, cam_din_next;
   reg                                   cam_we, cam_we_next;
   reg  [LUT_DEPTH_BITS-1:0]             cam_wr_addr, cam_wr_addr_next;

   wire                                  cam_busy_learn, cam_match_learn;
   wire [LUT_DEPTH_BITS-1:0]             cam_match_addr_learn;
   reg  [47:0]                           cam_cmp_din_learn;

   reg  [47:0]                           cam_din_learn, cam_din_learn_next;
   reg                                   cam_we_learn, cam_we_learn_next;
   reg  [LUT_DEPTH_BITS-1:0]             cam_wr_addr_learn, cam_wr_addr_learn_next;


   reg  [NUM_OUTPUT_QUEUES-1:0]          src_port_latched, src_port_latched_d;
   reg  [47:0]                           src_mac_latched;
   reg                                   latch_src;

   reg  [2:0]                            lookup_state, lookup_state_next;

   reg [LUT_DEPTH_BITS-1:0]              lut_rd_addr, lut_wr_addr, lut_wr_addr_next;
   reg                                   lut_wr_en, lut_wr_en_next;
   reg [NUM_OUTPUT_QUEUES+47:0]          lut_wr_data, lut_wr_data_next;
   reg [NUM_OUTPUT_QUEUES+47:0]          lut_rd_data;
   reg [NUM_OUTPUT_QUEUES+47:0]          lut[LUT_DEPTH-1:0];

   reg                                   reset_count_inc;
   reg [LUT_DEPTH_BITS:0]                reset_count;

   reg                                   lut_miss_next, lut_hit_next;
   reg                                   lookup_done_next;

   reg [LUT_DEPTH_BITS-1:0]              pointer_add_cam, pointer_add_cam_next;

   //------------------------- Modules-------------------------------

   // 1 cycle read latency, 2 cycles write latency, width=48, depth=16
   cam 
     #(
      .C_TCAM_ADDR_WIDTH   (LUT_DEPTH_BITS),
      .C_TCAM_MATCH_ADDR_WIDTH (LUT_DEPTH_BITS),
      .C_TCAM_DATA_WIDTH   (48)
     )
    mac_cam
     (  
      (* box_type = "user_black_box" *)
      // Outputs
      .BUSY                             (cam_busy),
      .MATCH                            (cam_match),
      .MATCH_ADDR                       (cam_match_addr[LUT_DEPTH_BITS-1:0]),
      // Inputs
      .CLK                              (clk),
      .CMP_DIN                          (cam_cmp_din),
      .DIN                              (cam_din[47:0]),
      .WE                               (cam_we),
      .ADDR_WR                          (cam_wr_addr[LUT_DEPTH_BITS-1:0]));

   cam 
   #(
     .C_TCAM_ADDR_WIDTH   (LUT_DEPTH_BITS), 
     .C_TCAM_MATCH_ADDR_WIDTH (LUT_DEPTH_BITS),
     .C_TCAM_DATA_WIDTH   (48) 
    )
   mac_cam_learn
     (
      (* box_type = "user_black_box" *)
      .BUSY                             (cam_busy_learn),
      .MATCH                            (cam_match_learn),
      .MATCH_ADDR                       (cam_match_addr_learn[LUT_DEPTH_BITS-1:0]),
      .CLK                              (clk),
      .CMP_DIN                          (cam_cmp_din_learn),
      .DIN                              (cam_din_learn[47:0]),
      .WE                               (cam_we_learn),
      .ADDR_WR                          (cam_wr_addr_learn[LUT_DEPTH_BITS-1:0]));

   //------------------------- Logic --------------------------------


   /* assign lut outputs */
   assign rd_oq = lut_rd_data[NUM_OUTPUT_QUEUES+47:48];
   assign rd_mac = lut_rd_data[47:0];

   /* if we get a miss then set the dst port to the default ports
    * without the source */
   assign dst_ports = (lut_miss) ? (DEFAULT_MISS_OUTPUT_PORTS & ~src_port_latched_d)
                                           : (rd_oq & ~src_port_latched_d);

   always @(*) begin
      cam_wr_addr_next = pointer_add_cam;
      cam_din_next     = src_mac_latched;
      cam_we_next      = 0;
      cam_cmp_din      = 0;
    
      cam_wr_addr_learn_next = pointer_add_cam;
      cam_din_learn_next     = src_mac_latched;
      cam_we_learn_next      = 0;
      cam_cmp_din_learn      = 0;

      lut_rd_addr      = cam_match_addr;
      lut_wr_en_next   = 1'b0;
      lut_wr_data_next = {src_port_latched, src_mac_latched};      
      lut_wr_addr_next = cam_match_addr_learn;
      reset_count_inc  = 0;
      latch_src        = 0;
      lookup_done_next = 0;
      lut_miss_next        = 0;
      lut_hit_next         = 0;
      pointer_add_cam_next = pointer_add_cam;

      lookup_state_next = lookup_state;

      case(lookup_state)
        /* write to all locations */
        RESET: begin
           if( !cam_we_learn && !cam_busy_learn && !cam_we && !cam_busy && reset_count < LUT_DEPTH-1) begin
              cam_wr_addr_next = reset_count;
              cam_we_next = 1;
              cam_din_next = 0;

              cam_wr_addr_learn_next = reset_count;
              cam_we_learn_next = 1;
              cam_din_learn_next = 0;

              reset_count_inc = 1;
              lut_wr_addr_next = reset_count;
              lut_wr_data_next = 0;
              lut_wr_en_next = 1;
           end
           // write the broadcast
           else if( !cam_we_learn && !cam_busy_learn && !cam_we && !cam_busy &&
               reset_count == LUT_DEPTH-1) begin
              cam_wr_addr_next = reset_count;
              cam_we_next = 1;
              cam_din_next = ~48'h0;

              cam_wr_addr_learn_next = reset_count;
              cam_we_learn_next = 1;
              cam_din_learn_next = ~48'h0;

              reset_count_inc = 1;
              // write the broadcast address
              lut_wr_addr_next = reset_count;
              lut_wr_data_next = {DEFAULT_MISS_OUTPUT_PORTS, ~48'h0};
              lut_wr_en_next = 1;
           end
           else if(!cam_we && !cam_busy) begin
              lookup_state_next = IDLE;
           end
        end // case: RESET 

        IDLE: begin
           cam_cmp_din = dst_mac;
           cam_cmp_din_learn = src_mac;
           if(lookup_req) begin
              lookup_state_next = LATCH_DST_LOOKUP;
              latch_src = 1;
           end
        end // case: IDLE

        LATCH_DST_LOOKUP: begin
           /* latch the info from the lut if we have a match */
            if(!cam_match)
               lut_miss_next = 1;
            else
               lut_hit_next = 1;

            lookup_done_next = 1;
            if(cam_match_learn)
               lut_wr_en_next = 1;
            else begin
               if(!cam_busy && !cam_busy_learn) begin
                  lut_wr_addr_next = pointer_add_cam;
                  lut_wr_en_next = 1;
                  cam_we_next = 1;
                  cam_we_learn_next = 1;
                  if(pointer_add_cam==LUT_DEPTH-2)
                     pointer_add_cam_next = 0;
                  else
                     pointer_add_cam_next = pointer_add_cam + 1;
               end
            end

            // -- pipelined --
            if (lookup_req) begin
               lookup_state_next = LATCH_DST_LOOKUP;
               cam_cmp_din = dst_mac;
               cam_cmp_din_learn = src_mac;
               latch_src = 1;
            end
            else begin
               lookup_state_next = IDLE;
            end

        end // case: LATCH_DST_LOOKUP

        default: begin end
      endcase // case(lookup_state)
   end // always @ (*)

   always @(posedge clk) begin
      if(reset) begin
         lut_rd_data       <= 0;
         reset_count       <= 0;
         src_port_latched  <= 0;
         src_port_latched_d <= 0;
         src_mac_latched   <= 0;
         lookup_done       <= 0;
         lut_miss          <= 0;
         lut_hit           <= 0;

         cam_wr_addr       <= 0;
         cam_din           <= 0;
         cam_we            <= 0;

         cam_wr_addr_learn <= 0;
         cam_din_learn     <= 0;
         cam_we_learn      <= 0;

         lut_wr_en         <= 0;
         lut_wr_data       <= 0;
         lut_wr_addr       <= 0;

         pointer_add_cam   <= 0;

         lookup_state      <= RESET;
      end
      else begin
         reset_count       <= reset_count_inc ? reset_count + 1 : reset_count;
         src_port_latched  <= latch_src ? src_port : src_port_latched;
         src_port_latched_d <= src_port_latched;
         src_mac_latched   <= latch_src ? src_mac : src_mac_latched;
         lookup_done       <= lookup_done_next;
         lut_miss          <= lut_miss_next;
         lut_hit           <= lut_hit_next;

         pointer_add_cam   <= pointer_add_cam_next;

         lut_rd_data       <= lut[lut_rd_addr];
         if(lut_wr_en) begin
            lut[lut_wr_addr] <= lut_wr_data;
         end

         cam_wr_addr       <= cam_wr_addr_next;
         cam_din           <= cam_din_next;
         cam_we            <= cam_we_next;

         cam_wr_addr_learn       <= cam_wr_addr_learn_next;
         cam_din_learn           <= cam_din_learn_next;
         cam_we_learn            <= cam_we_learn_next;

         lut_wr_en         <= lut_wr_en_next;
         lut_wr_data       <= lut_wr_data_next;
         lut_wr_addr       <= lut_wr_addr_next;

         lookup_state      <= lookup_state_next;
      end
   end

endmodule // mac_lut
