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
//
///////////////////////////////////////////////////////////////////////////////
// $Id: small_fifo.v 4761 2008-12-27 01:11:00Z jnaous $
//
// Module: small_fifo.v
// Project: UNET
// Description: small fifo with no fallthrough i.e. data valid after rd is high
//
// Change history:
//   7/20/07 -- Set nearly full to 2^MAX_DEPTH_BITS - 1 by default so that it
//              goes high a clock cycle early.
//   11/2/09 -- Modified to have both prog threshold and almost full
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

  module small_fifo
    #(parameter WIDTH = 72,
      parameter MAX_DEPTH_BITS = 3,
      parameter PROG_FULL_THRESHOLD = 2**MAX_DEPTH_BITS - 1
      )
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


parameter MAX_DEPTH        = 2 ** MAX_DEPTH_BITS;

reg [WIDTH-1:0] queue [MAX_DEPTH - 1 : 0];
reg [MAX_DEPTH_BITS - 1 : 0] rd_ptr;
reg [MAX_DEPTH_BITS - 1 : 0] wr_ptr;
reg [MAX_DEPTH_BITS : 0] depth;

// Sample the data
always @(posedge clk)
begin
   if (wr_en)
      queue[wr_ptr] <= din;
   if (rd_en)
      dout <=
	      // synthesis translate_off
	      #1
	      // synthesis translate_on
	      queue[rd_ptr];
end

always @(posedge clk)
begin
   if (reset) begin
      rd_ptr <= 'h0;
      wr_ptr <= 'h0;
      depth  <= 'h0;
   end
   else begin
      if (wr_en) wr_ptr <= wr_ptr + 'h1;
      if (rd_en) rd_ptr <= rd_ptr + 'h1;
      if (wr_en & ~rd_en) depth <=
				   // synthesis translate_off
				   #1
				   // synthesis translate_on
				   depth + 'h1;
      else if (~wr_en & rd_en) depth <=
				   // synthesis translate_off
				   #1
				   // synthesis translate_on
				   depth - 'h1;
   end
end

assign full = depth == MAX_DEPTH;
assign prog_full = (depth >= PROG_FULL_THRESHOLD);
assign nearly_full = depth >= MAX_DEPTH-1;
assign empty = depth == 'h0;

// synthesis translate_off
always @(posedge clk)
begin
   if (wr_en && depth == MAX_DEPTH && !rd_en)
      $display($time, " ERROR: Attempt to write to full FIFO: %m");
   if (rd_en && depth == 'h0)
      $display($time, " ERROR: Attempt to read an empty FIFO: %m");
end
// synthesis translate_on

endmodule // small_fifo

