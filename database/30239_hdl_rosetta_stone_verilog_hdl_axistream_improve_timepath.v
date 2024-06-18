// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file axistream_improve_timepath.v
 * @author Trip Richert
 **/

// license at bottom of file

/**
 * @interface axistream_improve_timepath
 * @brief can improve timing on axistream pipeline by breaking path src to dest
 **/

module axistream_improve_timepath
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
   dest_tlast
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

   reg [1:0]  cnt;
   reg [1:0]   rd_ptr;
   
   reg [DATA_WIDTH:0] data_buf [2:0];

   assign dest_tvalid = (cnt != 0)? !rst : 1'b0;
   assign src_tready  = (cnt < 3)?  !rst : 1'b0;

   assign dest_tlast  = dest_tvalid && data_buf[rd_ptr][DATA_WIDTH];
   assign dest_tdata  = data_buf[rd_ptr][DATA_WIDTH-1:0];

   assign rd_ptr = (cnt == 0)?0 : cnt - 1;
   
   initial begin
      cnt = 0;
   end

   always @(posedge clk) begin

      if (src_tvalid && src_tready) begin
	 data_buf[2] <= data_buf[1];
	 data_buf[1] <= data_buf[0];
	 data_buf[0] <= {src_tlast, src_tdata};
      end else begin
	 data_buf[0] <= data_buf[0];
	 data_buf[1] <= data_buf[1];
	 data_buf[2] <= data_buf[2];
      end
	
      
      if ((src_tvalid && src_tready) && !(dest_tvalid && dest_tready)) begin
	 cnt <= cnt + 1;
      end else if (!(src_tvalid && src_tready) 
		   && (dest_tvalid && dest_tready)
		   ) begin
	 assert(cnt > 0);
	 cnt <= cnt - 1;
      end else begin
	 cnt <= cnt;
      end
      
      if (rst) begin
	 cnt <= 0;
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
