// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file axistream_unpack
 * @author Trip Richert
 **/

// license at bottom of file

/**
 * @interface axistream_unpack
 * @brief splits up source data into NUM_PACK words, sent out dest one at a time
 **/
module axistream_unpack
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
   parameter NUM_PACK = 4;
   parameter BIG_ENDIAN = 1'b0; //! if true, src's least signicant word is first

   input clk;
   input rst;

   input                              src_tvalid;
   output                             src_tready;
   input [(DATA_WIDTH*NUM_PACK)-1:0]  src_tdata;
   input 		              src_tlast;

   output 		              dest_tvalid;
   input 		              dest_tready;
   output [DATA_WIDTH-1:0]            dest_tdata;
   output 			      dest_tlast;

   reg [(NUM_PACK*DATA_WIDTH)-1:0]    data_buf;
   wire [DATA_WIDTH-1:0]	      data_arr [NUM_PACK-1:0];
   
   reg                                tlast_buf;
   reg 				      is_nempty;
   
   reg [$clog2(NUM_PACK+1)-1:0]       cnt;
   reg [$clog2(NUM_PACK+1)-1:0]       inv_cnt;

   assign dest_tvalid = is_nempty && !rst;
   assign src_tready = !rst && 
		       (!is_nempty || 
			(dest_tvalid && dest_tready && cnt == NUM_PACK - 1)
		       );
   
   assign dest_tlast = tlast_buf && dest_tvalid && cnt == NUM_PACK - 1; 
   
   genvar 			      i;
   generate
      for (i = 0; i < NUM_PACK; i = i + 1) begin
	 assign data_arr[i] = data_buf[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH];
      end
   endgenerate

   assign dest_tdata = (BIG_ENDIAN) ? data_arr[inv_cnt] : data_arr[cnt];
   
   initial begin
      cnt = 0;
      inv_cnt = NUM_PACK - 1;
      is_nempty = 1'b0;
   end

   always @(posedge clk) begin
      //rst at end of block, overrides cnt, inv_cnt, and is_nempty

      if (src_tvalid && src_tready) begin
	 data_buf <= src_tdata;
	 tlast_buf <= src_tlast;
	 is_nempty <= 1'b1;
      end else begin
	 data_buf <= data_buf;
	 tlast_buf <= tlast_buf;
	 if ((cnt == NUM_PACK - 1) && dest_tvalid && dest_tready) begin
	    is_nempty <= 1'b0;
	 end else begin
	    is_nempty <= is_nempty;
	 end
      end
      
      if (dest_tvalid && dest_tready) begin
	 cnt <= (cnt + 1) % NUM_PACK;
	 inv_cnt <= (inv_cnt == 0) ? NUM_PACK - 1 : inv_cnt - 1;
      end else begin 
	 cnt <= cnt;
	 inv_cnt <= inv_cnt;
      end
      
      if (rst) begin
	 cnt <= 0;
	 inv_cnt <= NUM_PACK - 1;
	 is_nempty <= 1'b0;
	 tlast_buf <= 1'b0;
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
