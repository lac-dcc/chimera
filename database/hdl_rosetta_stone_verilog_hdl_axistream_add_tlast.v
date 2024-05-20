// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file axistream_add_tlast
 * @author Trip Richert
 **/

// license at bottom of file

/**
 * @interface axistream_add_tlast
 * @brief buffers one word of stream, releasing when more data is available or tlast cmded
 **/

module axistream_add_tlast
  (
   clk,
   rst,

   src_tvalid,
   src_tready,
   src_tdata,

   dest_tvalid,
   dest_tready,
   dest_tdata,
   dest_tlast,

   add_tlast
   );

   parameter DATA_WIDTH = 8;

   input                              clk;
   input                              rst;

   input                              src_tvalid;
   output                             src_tready;
   input [DATA_WIDTH-1:0]             src_tdata;

   output 		              dest_tvalid;
   input 		              dest_tready;
   output [DATA_WIDTH-1:0]            dest_tdata;
   output 			      dest_tlast;
   
   input 			      add_tlast;
   
   reg [DATA_WIDTH-1:0] 	      data_buf;
   reg 				      buffered;
   reg 				      hold_tlast;
   
   

   assign dest_tvalid = !rst && (
				 (src_tvalid && buffered) 
				 || (buffered && (add_tlast || hold_tlast))
				 );
   assign src_tready = !rst && (!buffered || dest_tready);

   assign dest_tlast = dest_tvalid && (add_tlast || hold_tlast);
   
   assign dest_tdata = data_buf;

   initial begin
      buffered = 1'b0;
      hold_tlast = 1'b0;
   end
   
   always @(posedge clk) begin
      if (src_tvalid && src_tready) begin
	 data_buf <= src_tdata;
         buffered <= 1'b1;
	 hold_tlast <= 1'b0;
      end else if (dest_tvalid && dest_tready) begin
	 buffered <= 1'b0;
	 data_buf <= data_buf;
	 hold_tlast <= 1'b0;
      end else begin
	 buffered <= buffered;
	 data_buf <= data_buf;
	 if (buffered && add_tlast) begin
	   hold_tlast <= 1'b1;
	 end else begin
	   hold_tlast <= 1'b0;
	 end
      end
      if (rst) begin
	 hold_tlast <= 1'b0;
	 buffered <= 1'b0;
      end
   end

endmodule // axistream_add_tlast

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
