// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_SP_ADV_synth.v
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
module SRAM_SP_ADV (
                Q,
                CLK,
                CEN,
                WEN,
                A,
                D,
                EMA
                );

   output [31:0]            Q;
   input                    CLK;
   input                    CEN;
   input [3:0]              WEN;
   input [10:0]             A;
   input [31:0]             D;
   input [2:0]              EMA;

   

SRAM_SP_2Kx32_mux8 i_SRAM_SP_2K (
                .Q(Q),
                .CLK(CLK),
                .ME(CEN),
                .WEN(WEN[0]),
                .ADR(A),
                .D(D),
		.TEST1(),
		.RM(),
		.RME()
                );
endmodule
 
