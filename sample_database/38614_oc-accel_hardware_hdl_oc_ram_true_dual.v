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

module ram_true_dual #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 5, parameter DISTR = 0) (clka,clkb,ena,enb,wea,web,addra,addrb,dia,dib,doa,dob);

   parameter DEPTH = 2**ADDR_WIDTH;

   input clka,clkb,ena,enb,wea,web;
   input [ADDR_WIDTH-1:0] addra,addrb;
   input [DATA_WIDTH-1:0] dia,dib;
   output [DATA_WIDTH-1:0] doa,dob;
   reg [DATA_WIDTH-1:0] doa,dob;


   generate
     if (DISTR) begin : distributed_ram
       (* ram_style = "distributed" *)reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
       integer i;
       initial for (i=0; i<DEPTH; i=i+1) ram[i] = 0;

       always @(posedge clka)
       begin
         if (ena)
           begin
             if (wea)
               ram[addra] <= dia;
             doa <= ram[addra];
           end 
       end

       always @(posedge clkb)
       begin
         if (enb)
           begin
             if (web)
               ram[addrb] <= dib;
             dob <= ram[addrb];
           end
       end
     end

     else begin : block_ram
       integer i;
       reg [DATA_WIDTH-1:0] ram [DEPTH-1:0];
       initial for (i=0; i<DEPTH; i=i+1) ram[i] = 0;

       always @(posedge clka)
       begin
         if (ena)
           begin
             if (wea)
               ram[addra] <= dia;
             doa <= ram[addra];
           end 
       end

       always @(posedge clkb)
       begin
         if (enb)
           begin
             if (web)
               ram[addrb] <= dib;
             dob <= ram[addrb];
           end
       end
     end
   endgenerate


endmodule
