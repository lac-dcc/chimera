// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ROM_SP_512x32_wrap.v
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
module ROM_SP_512x32_wrap(
                Q,
                CLK,
                ME,
                ADR,
		reset_n,
		scan_mode
   	);


input          	CLK;
input        	ME;
input [8:0]  	ADR;
input		reset_n;
input		scan_mode;
output [31:0] 	Q;

wire [31:0]	Q_mem;


	assign Q = scan_mode ? 32'b0 : Q_mem;


generic_sram #(32, 512, 9) i_rom
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (1'b1),
   .n_oe (1'b0),
   .ad   (ADR),
   .din  (32'd0),
   .dout (Q_mem)
   );

endmodule
