// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

module ram_single_port (clk, we, addr, data_in, data_out);

   parameter DATA_WIDTH = 8;
   parameter ADDR_WIDTH = 5;
   parameter DEPTH = 2**ADDR_WIDTH;

   input clk, we;
   input [ADDR_WIDTH-1:0] addr;
   input [DATA_WIDTH-1:0] data_in;
   output [DATA_WIDTH-1:0] data_out;

   reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
  
   reg [ADDR_WIDTH-1:0] addr_reg;
   integer i;
   initial for (i=0; i<DEPTH; i=i+1) ram[i] = 0;

   always @(posedge clk) begin
       addr_reg <= addr;
       if (we) 
           ram[addr] <= data_in;
   end

   assign data_out = ram[addr_reg];


/////  clk ___^^^___^^^___^^^___^^^___^^^___
//
//      we ___^^^^^^______^^^^^^^^^^^^______
//      di ___XXXXXX______YYYYYYZZZZZZ______
//    addr ___AAAAAA______BBBBBBCCCCCC______
//addr_reg _________AAAAAA______BBBBBBCCCCCC
//      do _________XXXXXX______YYYYYYZZZZZZ

endmodule
