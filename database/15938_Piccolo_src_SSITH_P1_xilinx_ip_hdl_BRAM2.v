// This program was cloned from: https://github.com/bluespec/Piccolo
// License: Apache License 2.0

// Copyright (c) 2000-2011 Bluespec, Inc.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// $Revision$
// $Date$

`ifdef BSV_ASSIGNMENT_DELAY
`else
 `define BSV_ASSIGNMENT_DELAY
`endif

// Dual-Ported BRAM (WRITE FIRST)
module BRAM2(CLKA,
             ENA,
             WEA,
             ADDRA,
             DIA,
             DOA,
             CLKB,
             ENB,
             WEB,
             ADDRB,
             DIB,
             DOB
             );

   parameter                      PIPELINED  = 0;
   parameter                      ADDR_WIDTH = 1;
   parameter                      DATA_WIDTH = 1;
   parameter                      MEMSIZE    = 1;

   input                          CLKA;
   input                          ENA;
   input                          WEA;
   input [ADDR_WIDTH-1:0]         ADDRA;
   input [DATA_WIDTH-1:0]         DIA;
   output [DATA_WIDTH-1:0]        DOA;

   input                          CLKB;
   input                          ENB;
   input                          WEB;
   input [ADDR_WIDTH-1:0]         ADDRB;
   input [DATA_WIDTH-1:0]         DIB;
   output [DATA_WIDTH-1:0]        DOB;

   (* RAM_STYLE = "BLOCK" *)
   reg [DATA_WIDTH-1:0]           RAM[0:MEMSIZE-1] /* synthesis syn_ramstyle="no_rw_check" */ ;
   reg [DATA_WIDTH-1:0]           DOA_R;
   reg [DATA_WIDTH-1:0]           DOB_R;
   reg [DATA_WIDTH-1:0]           DOA_R2;
   reg [DATA_WIDTH-1:0]           DOB_R2;

`ifdef BSV_NO_INITIAL_BLOCKS
`else
   // synopsys translate_off
   integer                        i;
   initial
   begin : init_block
      for (i = 0; i < MEMSIZE; i = i + 1) begin
         RAM[i] = { ((DATA_WIDTH+1)/2) { 2'b10 } };
      end
      DOA_R = { ((DATA_WIDTH+1)/2) { 2'b10 } };
      DOB_R = { ((DATA_WIDTH+1)/2) { 2'b10 } };
      DOA_R2 = { ((DATA_WIDTH+1)/2) { 2'b10 } };
      DOB_R2 = { ((DATA_WIDTH+1)/2) { 2'b10 } };
   end
   // synopsys translate_on
`endif // !`ifdef BSV_NO_INITIAL_BLOCKS

   always @(posedge CLKA) begin
      if (ENA) begin
         if (WEA) begin
            RAM[ADDRA] <= `BSV_ASSIGNMENT_DELAY DIA;
            DOA_R <= `BSV_ASSIGNMENT_DELAY DIA;
         end
         else begin
            DOA_R <= `BSV_ASSIGNMENT_DELAY RAM[ADDRA];
         end
      end
      DOA_R2 <= `BSV_ASSIGNMENT_DELAY DOA_R;
   end

   always @(posedge CLKB) begin
      if (ENB) begin
         if (WEB) begin
            RAM[ADDRB] <= `BSV_ASSIGNMENT_DELAY DIB;
            DOB_R <= `BSV_ASSIGNMENT_DELAY DIB;
         end
         else begin
            DOB_R <= `BSV_ASSIGNMENT_DELAY RAM[ADDRB];
         end
      end
      DOB_R2 <= `BSV_ASSIGNMENT_DELAY DOB_R;
   end

   // Output drivers
   assign DOA = (PIPELINED) ? DOA_R2 : DOA_R;
   assign DOB = (PIPELINED) ? DOB_R2 : DOB_R;

endmodule // BRAM2
