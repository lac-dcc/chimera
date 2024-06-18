// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : generic_sram_128k_wrapper.v
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
module generic_sram_128k_wrapper (
   clk,
   n_cs,
   n_we,
   n_oe,
   mask,
   ad,
   din,
   dout );


  input  clk;          // posedge clock
  input  n_cs;         // RAM select
  input  n_we;         // read=1/write=0
  input  n_oe;         // output enable
  input  [32-1:0] mask; // if 1 bit not written
  input  [15-1:0] ad;  // address
  input  [32-1:0] din; // data in
  output [32-1:0] dout;// data out

  
  // output signals
  wire    [32-1:0] dout;


generic_sram_bit #(32, 32768, 15) i_ram
  (.clk  (clk),
   .n_cs (1'b0),
   .n_we (n_we),
   .n_oe (1'b0),
   .mask (mask ),
   .ad   (ad),
   .din  (din),
   .dout (dout)
   );

endmodule
  
