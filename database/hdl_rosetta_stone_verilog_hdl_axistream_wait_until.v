// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file axistream_wait_until.v
 * @author Trip Richert
 **/

// license at bottom of file

/**
 * @interface axistream_wait_until
 * @brief allows full packet through only after go is raised for a clk cyle
 **/

module axistream_wait_until
  (
   clk,
   rst,

   src_tvalid,
   src_tready,
   src_tdata,
   src_tlast,

   dest_tvalid,
   dest_tready,
   dest_tdata,
   dest_tlast,
   go //! raise to allow full packet of data through
   );

   parameter DATA_WIDTH = 8;
   input clk;
   input rst;
   
   input src_tvalid;
   output src_tready;
   input  [DATA_WIDTH-1:0] src_tdata;
   input  src_tlast;
   output dest_tvalid;
   input dest_tready;
   output [DATA_WIDTH-1:0] dest_tdata;
   output dest_tlast;
   input  go;
   
   localparam SM_WAIT = 0;
   localparam SM_GO = 1;
   
   reg sm;
   
   assign dest_tvalid = (sm == SM_GO) ? src_tvalid && !rst : 1'b0;
   assign src_tready  = (sm == SM_GO) ? dest_tready && !rst : 1'b0;
   assign dest_tlast  = (sm == SM_GO) ? src_tlast && dest_tvalid: 1'b0;
   assign dest_tdata  = src_tdata;

   initial begin
      sm = SM_WAIT;
   end

   always @(posedge clk) begin
      case (sm)
	SM_WAIT: sm <= (go) ? SM_GO : SM_WAIT;
	SM_GO  : sm <= (dest_tvalid && dest_tready && dest_tlast)?SM_WAIT:SM_GO;
      endcase 
      if (rst) begin
	 sm <= SM_WAIT;
      end
   end

endmodule

	 

// Copyright 2021 Trip Richert

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
