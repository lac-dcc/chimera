// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ahb2ocp_ram.v
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
module ahb2ocp_ram
(
   clk,
   rst_n,
   rd_e,
   addr,
   rdata, 
   wr_e,      
   wdata, 
   be,
   cs    
);

// Default parameters
parameter WORDS   = 8; 
parameter DATA_SIZE = 1;
parameter ADDR_SIZE = 3;


input                clk;            // clock synchronizes all read inputs 
input                rst_n;          // asynchronous reset in rclk domain
input                rd_e;           // '0' for read
input  [ADDR_SIZE-1:0] addr;         // address for read
input                wr_e;           // '0' for write
input  [DATA_SIZE-1:0] wdata;        // data to be written
input  [DATA_SIZE-1:0] be;           // bit enables for writing data
input                cs;             // chip select signal

output [DATA_SIZE-1:0] rdata;        // read data 


reg [ADDR_SIZE-1:0] rd_addr_q;       // Read address latched
reg [DATA_SIZE-1:0] mem[0: WORDS-1]; // Memory array
reg [DATA_SIZE-1:0] tmp_data;        // Temporary data used when computing write data

// Data appears after 1 clock edge so registering address 
always @ (posedge clk or negedge rst_n)
begin
   if (!rst_n & cs)
      rd_addr_q <= {ADDR_SIZE{1'b0}};
   else if (rd_e & cs)
      rd_addr_q <= addr;
end

always @ (posedge clk)
begin
   if (wr_e & cs)
   begin
      tmp_data   = mem[addr];
      mem[addr] <= (tmp_data & ~be) | (wdata & be);
   end
end
 
assign rdata = mem[rd_addr_q];

// Check for errors

always @ (posedge clk)
begin
   begin
      if (cs & (addr > WORDS && wr_e))
         $display("%t:%m:ERROR: ",$time,"write address out of range, MAX = ",WORDS," Attempted = ",addr);
   end
end

endmodule




