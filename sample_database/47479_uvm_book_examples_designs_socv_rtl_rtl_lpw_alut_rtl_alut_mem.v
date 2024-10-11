// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : alut_mem.v
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

module alut_mem
(   
   // Inputs
   pclk,
   mem_addr_add,
   mem_write_add,
   mem_write_data_add,
   mem_addr_age,
   mem_write_age,
   mem_write_data_age,

   mem_read_data_add,   
   mem_read_data_age
);   

   parameter   DW = 83;          // width of data busses
   parameter   DD = 256;         // depth of RAM

   input              pclk;               // APB clock                           
   input [7:0]        mem_addr_add;       // hash address for R/W to memory     
   input              mem_write_add;      // R/W flag (write = high)            
   input [DW-1:0]     mem_write_data_add; // write data for memory             
   input [7:0]        mem_addr_age;       // hash address for R/W to memory     
   input              mem_write_age;      // R/W flag (write = high)            
   input [DW-1:0]     mem_write_data_age; // write data for memory             

   output [DW-1:0]    mem_read_data_add;  // read data from mem                 
   output [DW-1:0]    mem_read_data_age;  // read data from mem  

   reg [DW-1:0]       mem_core_array[DD-1:0]; // memory array               

   reg [DW-1:0]       mem_read_data_add;  // read data from mem                 
   reg [DW-1:0]       mem_read_data_age;  // read data from mem  


// -----------------------------------------------------------------------------
//   read and write control for address checker access
// -----------------------------------------------------------------------------
always @ (posedge pclk)
   begin
   if (~mem_write_add) // read array
      mem_read_data_add <= mem_core_array[mem_addr_add];
   else
      mem_core_array[mem_addr_add] <= mem_write_data_add;
   end

// -----------------------------------------------------------------------------
//   read and write control for age checker access
// -----------------------------------------------------------------------------
always @ (posedge pclk)
   begin
   if (~mem_write_age) // read array
      mem_read_data_age <= mem_core_array[mem_addr_age];
   else
      mem_core_array[mem_addr_age] <= mem_write_data_age;
   end


endmodule
