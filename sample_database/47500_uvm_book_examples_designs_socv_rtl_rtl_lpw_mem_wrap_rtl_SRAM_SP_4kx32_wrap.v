// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_SP_4kx32_wrap.v
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
module SRAM_SP_4kx32_wrap(
                Q,
                CLK,
                ME,
                WE,
                ADR,
                D,
		reset_n,
		scan_mode
   	);


input [31:0] 	D;
input          	CLK;
input        	ME;
input  [3:0]   	WE;
input [11:0]  	ADR;
input		reset_n;
input		scan_mode;
output [31:0] 	Q;

wire		write_accs;

// Detect a write to any byte
assign write_accs = WE[3] | WE [2] | WE[1] | WE[0];

generic_sram_bit #(32, 4096, 12) i_ram
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (~(write_accs & ME)),
   .n_oe (1'b0),
   .mask(~{WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0]}),
   .ad   (ADR),
   .din  (D),
   .dout (Q)
   );


endmodule
