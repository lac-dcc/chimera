//
// Copyright (c) 2015 University of Cambridge All rights reserved.
//
// This software was developed by the University of Cambridge Computer
// Laboratory under EPSRC INTERNET Project EP/H040536/1, National Science
// Foundation under Grant No. CNS-0855268, and Defense Advanced Research
// Projects Agency (DARPA) and Air Force Research Laboratory (AFRL), under
// contract FA8750-11-C-0249.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more
// contributor license agreements.  See the NOTICE file distributed with this
// work for additional information regarding copyright ownership.  NetFPGA
// licenses this file to you under the NetFPGA Hardware-Software License,
// Version 1.0 (the "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

`timescale 1ns/1ps

module testbench();

reg   CLK, RSTN;
integer i;

`ifdef 16d
localparam  ADDR_WIDTH = 5;
localparam  DATA_WIDTH = 16;
`elsif 32d
localparam  ADDR_WIDTH = 5;
localparam  DATA_WIDTH = 32;
`elsif 48d
localparam  ADDR_WIDTH = 5;
localparam  DATA_WIDTH = 48;
`else
localparam  ADDR_WIDTH = 5;
localparam  DATA_WIDTH = 16;
`endif


reg   WE;
reg   [ADDR_WIDTH-1:0]  ADDR_WR;
reg   [DATA_WIDTH-1:0]  DIN, DATA_MASK;
reg   [DATA_WIDTH-1:0]  CMP_DIN, CMP_DATA_MASK;

wire  BUSY;
wire  MATCH;
wire  [ADDR_WIDTH-1:0]  MATCH_ADDR;

reg   [7:0] match_cnt;


initial begin
   CLK = 0;
   RSTN = 0;
   for (i=0; i<100; i=i+1) begin
      @(posedge CLK);
   end
   RSTN = 1;
end

always #2.5 CLK=~CLK;

reg   [31:0]   count;
always @(posedge CLK)
   if (~RSTN) begin
      count <= 0;
   end
   else begin
      count <= count + 1;
   end

`ifdef 16d
always @(*) begin
   WE             = 0;
   ADDR_WR        = 0;
   DIN            = 0;
   DATA_MASK      = 0;
   CMP_DIN        = 0;
   CMP_DATA_MASK  = 0;
   // Start write
   if (count == 100) begin
      WE       = 1;
      ADDR_WR  = 5'h0;
      DIN      = 16'h1234;
   end
   if (count == 120) begin
      WE       = 1;
      ADDR_WR  = 5'hf;
      DIN      = 16'habcd;
   end
   if (count == 140) begin
      WE       = 1;
      ADDR_WR  = 5'h1e;
      DIN      = 16'h5678;
   end
   // Start Lookup
   if (count == 200) begin
      CMP_DIN  = 16'h1234;
   end
   if (count == 220) begin
      CMP_DIN  = 16'habcd;
   end
   if (count == 240) begin
      CMP_DIN  = 16'h5678;
   end
   if (count == 300) begin
      if (match_cnt == 3)
         $display ("\nPASS : Three matches...!");
      else
         $display ("\nFAIL : Match failed...!");
      $display ("\n\n");
      $display ("Simulation finish...\n");
      $finish;
   end
end
`elsif 32d
always @(*) begin
   WE             = 0;
   ADDR_WR        = 0;
   DIN            = 0;
   DATA_MASK      = 0;
   CMP_DIN        = 0;
   CMP_DATA_MASK  = 0;
   // Start write
   if (count == 100) begin
      WE       = 1;
      ADDR_WR  = 5'h0;
      DIN      = 32'h12341234;
   end
   if (count == 120) begin
      WE       = 1;
      ADDR_WR  = 5'hf;
      DIN      = 32'habcdabcd;
   end
   if (count == 140) begin
      WE       = 1;
      ADDR_WR  = 5'h1e;
      DIN      = 32'h56785678;
   end
   // Start Lookup
   if (count == 200) begin
      CMP_DIN  = 32'h12341234;
   end
   if (count == 220) begin
      CMP_DIN  = 32'habcdabcd;
   end
   if (count == 240) begin
      CMP_DIN  = 32'h56785678;
   end
   if (count == 300) begin
      if (match_cnt == 3)
         $display ("\nPASS : Three matches...!");
      else
         $display ("\nFAIL : Match failed...!");
      $display ("\n\n");
      $display ("Simulation finish...\n");
      $finish;
   end
end
`elsif 48d
always @(*) begin
   WE             = 0;
   ADDR_WR        = 0;
   DIN            = 0;
   DATA_MASK      = 0;
   CMP_DIN        = 0;
   CMP_DATA_MASK  = 0;
   // Start write
   if (count == 100) begin
      WE       = 1;
      ADDR_WR  = 5'h0;
      DIN      = 48'h123412341234;
   end
   if (count == 120) begin
      WE       = 1;
      ADDR_WR  = 5'hf;
      DIN      = 48'habcdabcdabcd;
   end
   if (count == 140) begin
      WE       = 1;
      ADDR_WR  = 5'h1e;
      DIN      = 48'h567856785678;
   end
   // Start Lookup
   if (count == 200) begin
      CMP_DIN  = 48'h123412341234;
   end
   if (count == 220) begin
      CMP_DIN  = 48'habcdabcdabcd;
   end
   if (count == 240) begin
      CMP_DIN  = 48'h567856785678;
   end
   if (count == 300) begin
      if (match_cnt == 3)
         $display ("\nPASS : Three matches...!");
      else
         $display ("\nFAIL : Match failed...!");
      $display ("\n\n");
      $display ("Simulation finish...\n");
      $finish;
   end
end
`endif

always @(posedge CLK)
   if (~RSTN)
      match_cnt   <= 0;
   else if (MATCH)
      match_cnt   <= match_cnt + 1;


tcam 
#(
  .C_TCAM_ADDR_WIDTH   (  ADDR_WIDTH        ),
  .C_TCAM_DATA_WIDTH   (  DATA_WIDTH        )
)
sume_tcam
(
   .CLK              (  CLK               ),
   .WE               (  WE                ),
   .ADDR_WR          (  ADDR_WR           ),
   .DIN              (  DIN               ),
   .DATA_MASK        (  DATA_MASK         ),
   .BUSY             (  BUSY              ),

   .CMP_DIN          (  CMP_DIN           ),
   .CMP_DATA_MASK    (  CMP_DATA_MASK     ),
   .MATCH            (  MATCH             ),
   .MATCH_ADDR       (  MATCH_ADDR        )
);

endmodule
