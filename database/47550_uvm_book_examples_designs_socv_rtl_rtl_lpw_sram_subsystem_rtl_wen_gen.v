// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : wen_gen.v
//Title       : 
//Created     : 1999
//Description : Generates Wen for SRAM core.
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

//Write enable generator
module wen_gen(
      // inputs
         hsize,  // AHB Access type - byte, half-word, word
         haddr,  // Address bus
         hwrite, // Write signal
         wen     // Write enable 
   );

input  [2:0] hsize;  // AHB Access type - byte, half-word, word
input  [31:0]haddr;  // Address bus
input        hwrite; // Write signal
output [3:0] wen;    // Write enable 
reg    [3:0] wen;

always @(hsize or haddr or hwrite)
begin
casex ({hwrite,hsize,haddr[1:0]})
	6'b100000 : wen = 4'b1110;
	6'b100001 : wen = 4'b1101;
	6'b100010 : wen = 4'b1011;
	6'b100011 : wen = 4'b0111;
	6'b10010x : wen = 4'b1100;
	6'b10011x : wen = 4'b0011;
	6'b1010xx : wen = 4'b0000;
	6'b0xxxxx : wen = 4'b1111;
endcase
end

endmodule //module wen_gen
