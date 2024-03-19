//-
// Copyright (c) 2015 University of Cambridge
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
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
/////////////////////////////////////////////////////////////////////////////////
// $Id: small_fifo.v 1998 2007-07-21 01:22:57Z grg $
//
// Module: fallthrough_small_fifo.v
// Project: utils
// Description: small fifo with fallthrough i.e. data valid when rd is high
//
// Change history:
//   7/20/07 -- Set nearly full to 2^MAX_DEPTH_BITS - 1 by default so that it
//              goes high a clock cycle early.
//   2/11/09 -- jnaous: Rewrote to make much more efficient.
//	 5/11/11 -- hyzeng: Rewrote based on http://www.billauer.co.il/reg_fifo.html
//                      to improve timing by adding output register
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module fallthrough_small_fifo
    #(parameter WIDTH = 72,
      parameter MAX_DEPTH_BITS = 3,
      parameter PROG_FULL_THRESHOLD = 2**MAX_DEPTH_BITS - 1)
    (

     input [WIDTH-1:0] din,     // Data in
     input          wr_en,   // Write enable

     input          rd_en,   // Read the next word

     output reg [WIDTH-1:0]  dout,    // Data out
     output         full,
     output         nearly_full,
     output         prog_full,
     output         empty,

     input          reset,
     input          clk
     );

   reg                   fifo_valid, middle_valid, dout_valid;
   reg [(WIDTH-1):0]     middle_dout;

   wire [(WIDTH-1):0]    fifo_dout;
   wire                  fifo_empty, fifo_rd_en;
   wire                  will_update_middle, will_update_dout;

   // orig_fifo is just a normal (non-FWFT) synchronous or asynchronous FIFO
   small_fifo
     #(.WIDTH (WIDTH),
       .MAX_DEPTH_BITS (MAX_DEPTH_BITS),
       .PROG_FULL_THRESHOLD (PROG_FULL_THRESHOLD))
       fifo
        (.din           (din),
         .wr_en         (wr_en),
         .rd_en         (fifo_rd_en),
         .dout          (fifo_dout),
         .full          (full),
         .nearly_full   (nearly_full),
         .prog_full     (prog_full),
         .empty         (fifo_empty),
         .reset         (reset),
         .clk           (clk)
         );

   assign will_update_middle = fifo_valid && (middle_valid == will_update_dout);
   assign will_update_dout = (middle_valid || fifo_valid) && (rd_en || !dout_valid);
   assign fifo_rd_en = (!fifo_empty) && !(middle_valid && dout_valid && fifo_valid);
   assign empty = !dout_valid;

   always @(posedge clk) begin
      if (reset)
         begin
            fifo_valid <= 0;
            middle_valid <= 0;
            dout_valid <= 0;
            dout <= 0;
            middle_dout <= 0;
         end
      else
         begin
            if (will_update_middle)
               middle_dout <= fifo_dout;
            
            if (will_update_dout)
               dout <= middle_valid ? middle_dout : fifo_dout;
            
            if (fifo_rd_en)
               fifo_valid <= 1;
            else if (will_update_middle || will_update_dout)
               fifo_valid <= 0;
            
            if (will_update_middle)
               middle_valid <= 1;
            else if (will_update_dout)
               middle_valid <= 0;
            
            if (will_update_dout)
               dout_valid <= 1;
            else if (rd_en)
               dout_valid <= 0;
         end 
     end
endmodule
