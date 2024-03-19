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


module ip_checksum_ttl
  #(parameter C_S_AXIS_DATA_WIDTH=512)
  (
   //--- datapath interface
   input  [C_S_AXIS_DATA_WIDTH-1:0]   tdata,
   input                              valid,

   //--- interface to preprocess
   input                              word_IP_DST_HI,
   input                              word_IP_DST_LO,

   // --- interface to process
   output                             ip_checksum_vld,
   output                             ip_checksum_is_good,
   output                             ip_hdr_has_options,
   output                             ip_ttl_is_good,
   output     [7:0]                   ip_new_ttl,
   output     [15:0]                  ip_new_checksum,     // new checksum assuming decremented TTL
   input                              rd_checksum,

   // misc
   input reset,
   input clk
   );

   //---------------------- Wires and regs---------------------------
   wire		empty;
   reg	[19:0]	checksum, checksum_next;
   reg	[16:0]	adjusted_checksum;
   reg		checksum_done;
   reg		info_ready;
   reg	[7:0]	ttl_new;
   reg		ttl_good;
   reg		hdr_has_options;
   reg		add_carry, add_carry_d1, add_carry_d0;

   reg	[19:0]	cksm_sum_0, cksm_sum_1, cksm_sum_0_next, cksm_sum_1_next, cksm_sum_2, cksm_sum_2_next, cksm_sum_3, cksm_sum_3_next;
   wire	[19:0]	cksm_temp,cksm_temp2;

   //------------------------- Modules-------------------------------

   xpm_fifo_sync #(
      .FIFO_MEMORY_TYPE     ("auto"),
      .ECC_MODE             ("no_ecc"),
      .FIFO_WRITE_DEPTH     (16),
      .WRITE_DATA_WIDTH     (26),
      .WR_DATA_COUNT_WIDTH  (1),
      //.PROG_FULL_THRESH     (PROG_FULL_THRESH),
      .FULL_RESET_VALUE     (0),
      .USE_ADV_FEATURES     ("0707"),
      .READ_MODE            ("fwft"),
      .FIFO_READ_LATENCY    (1),
      .READ_DATA_WIDTH      (26),
      .RD_DATA_COUNT_WIDTH  (1),
      .PROG_EMPTY_THRESH    (10),
      .DOUT_RESET_VALUE     ("0"),
      .WAKEUP_TIME          (0)
   ) info_fifo (
      // Common module ports
      .sleep           (),
      .rst             (reset),

      // Write Domain ports
      .wr_clk          (clk),
      .wr_en           (info_ready),
      .din             ({adjusted_checksum[15:0], ttl_good, ttl_new, hdr_has_options}),
      .full            (),
      .prog_full       (),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (rd_checksum),
      .dout            ({ip_new_checksum, ip_ttl_is_good, ip_new_ttl, ip_hdr_has_options}),
      .empty           (),
      .prog_empty      (),
      .rd_data_count   (),
      .underflow       (),
      .rd_rst_busy     (),
      .almost_empty    (),
      .data_valid      ()
   );

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
   ) cksm_fifo (
      // Common module ports
      .sleep           (),
      .rst             (reset),

      // Write Domain ports
      .wr_clk          (clk),
      .wr_en           (checksum_done),
      .din             (&checksum[15:0]),
      .full            (),
      .prog_full       (),
      .wr_data_count   (),
      .overflow        (),
      .wr_rst_busy     (),
      .almost_full     (),
      .wr_ack          (),

      // Read Domain ports
      .rd_en           (rd_checksum),
      .dout            (ip_checksum_is_good),
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

   //------------------------- Logic -------------------------------
   assign ip_checksum_vld = !empty;


   generate 
       if (C_S_AXIS_DATA_WIDTH == 256) begin
           assign cksm_temp = cksm_sum_0 + cksm_sum_1;
           assign cksm_temp2 = cksm_sum_2 + cksm_sum_3;
          always @(*) begin
             checksum_next = checksum;
             cksm_sum_0_next = cksm_sum_0;
             cksm_sum_1_next = cksm_sum_1;
             cksm_sum_2_next = cksm_sum_2;
             cksm_sum_3_next = cksm_sum_3;
             if(word_IP_DST_HI) begin
                cksm_sum_0_next = tdata[143:128]+tdata[127:112]+tdata[111:96];
                cksm_sum_1_next = tdata[95:80]+tdata[79:64];
                cksm_sum_2_next = tdata[63:48]+tdata[47:32];
                cksm_sum_3_next = tdata[31:16]+tdata[15:0];
             end
             if(word_IP_DST_LO) begin
                checksum_next = cksm_temp + cksm_temp2 + tdata[255:240];
             end
             if(add_carry) begin
                checksum_next = checksum[19:16] + checksum[15:0];
             end
          end // always @ (*)
       end // generate: C_S_AXIS_DATA_WIDTH == 256
          else if (C_S_AXIS_DATA_WIDTH >= 512) begin
          assign cksm_temp = cksm_sum_0 + cksm_sum_1;
          assign cksm_temp2 = cksm_sum_2 + cksm_sum_3;

          always @(*) begin
             checksum_next = checksum;
             cksm_sum_0_next = cksm_sum_0;
             cksm_sum_1_next = cksm_sum_1;
             cksm_sum_2_next = cksm_sum_2;
             cksm_sum_3_next = cksm_sum_3;
             if(word_IP_DST_HI) begin
                cksm_sum_0_next = tdata[C_S_AXIS_DATA_WIDTH-112-1:C_S_AXIS_DATA_WIDTH-128]+tdata[C_S_AXIS_DATA_WIDTH-128-1:C_S_AXIS_DATA_WIDTH-144]+tdata[C_S_AXIS_DATA_WIDTH-144-1:C_S_AXIS_DATA_WIDTH-160];
                cksm_sum_1_next = tdata[C_S_AXIS_DATA_WIDTH-160-1:C_S_AXIS_DATA_WIDTH-176]+tdata[C_S_AXIS_DATA_WIDTH-176-1:C_S_AXIS_DATA_WIDTH-192];
                cksm_sum_2_next = tdata[C_S_AXIS_DATA_WIDTH-192-1:C_S_AXIS_DATA_WIDTH-208]+tdata[C_S_AXIS_DATA_WIDTH-208-1:C_S_AXIS_DATA_WIDTH-224];
                cksm_sum_3_next = tdata[C_S_AXIS_DATA_WIDTH-224-1:C_S_AXIS_DATA_WIDTH-240]+tdata[C_S_AXIS_DATA_WIDTH-240-1:C_S_AXIS_DATA_WIDTH-256] + tdata[C_S_AXIS_DATA_WIDTH-256-1:C_S_AXIS_DATA_WIDTH-272];
             end
             if (add_carry_d0) begin
                checksum_next = cksm_temp + cksm_temp2;
             end
             if(add_carry) begin
                checksum_next = checksum[19:16] + checksum[15:0];
             end
          end // always @ (*)
       end // generate: C_S_AXIS_DATA_WIDTH >= 512
   endgenerate

   // checksum logic. 16bit 1's complement over the IP header.
   // --- see RFC1936 for guidance.
   // If checksum is good then it should be 0xffff
   generate 
      if (C_S_AXIS_DATA_WIDTH == 256) begin
         always @(posedge clk) begin
            if(reset) begin
               adjusted_checksum	<= 17'h0; // calculates the new chksum
               checksum_done		<= 0;
               ttl_new		<= 0;
               ttl_good		<= 0;
               hdr_has_options	<= 0;
               info_ready		<= 0;
               checksum		<= 20'h0;
               add_carry		<= 0;
               add_carry_d1		<= 0;

               cksm_sum_0		<= 0;
               cksm_sum_1		<= 0;
               cksm_sum_2		<= 0;
               cksm_sum_3		<= 0;
            end
            else begin
               checksum <= checksum_next;
               cksm_sum_0 <= cksm_sum_0_next;
               cksm_sum_1 <= cksm_sum_1_next;
               cksm_sum_2 <= cksm_sum_2_next;
               cksm_sum_3 <= cksm_sum_3_next;

               /* make sure the version is correct and there are no options */
               if(word_IP_DST_HI) begin
                  hdr_has_options	<= (tdata[143:136]!=8'h45);
                  ttl_new		<= (tdata[79:72]==8'h0) ? 8'h0 : tdata[79:72] - 1'b1;
                  ttl_good		<= (tdata[79:72] > 8'h1);
                  adjusted_checksum	<= {1'h0, tdata[63:48]} + 17'h0100; // adjust for the decrement in TTL (BIG Endian)
               end

               if(word_IP_DST_LO) begin
                  adjusted_checksum	<= {1'h0, adjusted_checksum[15:0]} + adjusted_checksum[16];
                  info_ready		<= 1;
                  add_carry		<= 1;
               end
               else begin
                  info_ready	<= 0;
                  add_carry	<= 0;
               end

               if(add_carry)
                  add_carry_d1 <= 1;
               else
                  add_carry_d1 <= 0;


               if(add_carry_d1) begin
                  checksum_done <= 1;
                  add_carry <= 0;
               end

               else begin
                  checksum_done <= 0;
               end

               // synthesis translate_off
               // If we have any carry left in top 4 bits then algorithm is wrong
               if (checksum_done && checksum[19:16] != 4'h0) begin
                  $display("%t %m ERROR: top 4 bits of checksum_word_0 not zero - algo wrong???",
                           $time);
                  #100 $stop;
               end
               // synthesis translate_on

            end // else: !if(reset)
         end // always @ (posedge clk)
      end // generate: C_S_AXIS_DATA_WIDTH == 256
          else if (C_S_AXIS_DATA_WIDTH >= 512) begin
         always @(posedge clk) begin
            if(reset) begin
               adjusted_checksum	<= 17'h0; // calculates the new chksum
               checksum_done		<= 0;
               ttl_new		<= 0;
               ttl_good		<= 0;
               hdr_has_options	<= 0;
               info_ready		<= 0;
               checksum		<= 20'h0;
               add_carry		<= 0;
               add_carry_d1		<= 0;
               add_carry_d0		<= 0;

               cksm_sum_0		<= 0;
               cksm_sum_1		<= 0;
               cksm_sum_2		<= 0;
               cksm_sum_3		<= 0;
            end
            else begin
               checksum <= checksum_next;
               cksm_sum_0 <= cksm_sum_0_next;
               cksm_sum_1 <= cksm_sum_1_next;
               cksm_sum_2 <= cksm_sum_2_next;
               cksm_sum_3 <= cksm_sum_3_next;

               /* make sure the version is correct and there are no options */
               if(word_IP_DST_HI) begin
                  hdr_has_options	<= (tdata[C_S_AXIS_DATA_WIDTH-112-1:C_S_AXIS_DATA_WIDTH-120]!=8'h45);
                  ttl_new		<= (tdata[C_S_AXIS_DATA_WIDTH-176-1:C_S_AXIS_DATA_WIDTH-184]==8'h0) ? 8'h0 : tdata[C_S_AXIS_DATA_WIDTH-176-1:C_S_AXIS_DATA_WIDTH-184] - 1'b1;
                  ttl_good		<= (tdata[C_S_AXIS_DATA_WIDTH-176-1:C_S_AXIS_DATA_WIDTH-184] > 8'h1);
                  adjusted_checksum	<= {1'h0, tdata[C_S_AXIS_DATA_WIDTH-192-1:C_S_AXIS_DATA_WIDTH-208]} + 17'h0100; // adjust for the decrement in TTL (BIG Endian)
                  add_carry_d0		<= 1;
               end else begin
                  add_carry_d0	<= 0;
               end

               if(add_carry_d0) begin
                  add_carry <= 1'b1;
               end else begin
                  add_carry <= 1'b0;
               end

               if(add_carry) begin
                  add_carry_d1 <= 1;
                  adjusted_checksum	<= {1'h0, adjusted_checksum[15:0]} + adjusted_checksum[16];
                  info_ready		<= 1;
               end else begin
                  add_carry_d1 <= 0;
                  info_ready	<= 0;
               end


               if(add_carry_d1) begin
                  checksum_done <= 1;
                  add_carry <= 0;
               end else begin
                  checksum_done <= 0;
               end

               // synthesis translate_off
               // If we have any carry left in top 4 bits then algorithm is wrong
               if (checksum_done && checksum[19:16] != 4'h0) begin
                  $display("%t %m ERROR: top 4 bits of checksum_word_0 not zero - algo wrong???",
                           $time);
                  #100 $stop;
               end
               // synthesis translate_on

            end // else: !if(reset)
         end // always @ (posedge clk)
      end
      endgenerate

endmodule // IP_checksum
