// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : generic_sram_32k_wrapper.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------
module generic_sram_32k_wrapper (
   gate_mem,
   clk,
   n_cs,
   n_we,
   n_oe,
   mask,
   ad,
   din,
   dout );


  input  gate_mem;          // gate access to memory during standby
  input  clk;          // posedge clock
  input  n_cs;         // RAM select
  input  n_we;         // read=1/write=0
  input  n_oe;         // output enable
  input  [32-1:0] mask; // if 1 bit not written
  input  [13-1:0] ad;  // address
  input  [32-1:0] din; // data in
  output [32-1:0] dout;// data out

  
  // output signals
  wire    [32-1:0] dout;

  wire clk_gated;
  wire n_we_gated;
  wire [32-1:0] mask_gated;
  wire [13-1:0] ad_gated;
  wire [32-1:0] din_gated;

  assign clk_gated = clk && (~gate_mem);

  assign n_we_gated = gate_mem ? 1'b1 : n_we;

  assign mask_gated = gate_mem ? 32'hFFFF : mask;

  assign ad_gated = gate_mem ? 13'h0 : ad;

  assign din_gated = gate_mem ? 32'h0 : din;

generic_sram_bit #(32, 8192, 13) i_ram
  (.clk  (clk_gated),
   .n_cs (1'b0),
   .n_we (n_we_gated),
   .n_oe (1'b0),
   .mask (mask_gated ),
   .ad   (ad_gated),
   .din  (din_gated),
   .dout (dout)
   );

endmodule
  
