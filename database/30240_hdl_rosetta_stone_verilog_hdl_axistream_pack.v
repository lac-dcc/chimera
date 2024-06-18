// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file axistream_pack
 * @author Trip Richert
 **/

// license at bottom of file

/**
 * @interface axistream_pack
 * @brief concatenates NUM_PACK elements from src_data and sends out dest
 * @param src_tlast may only be raised on multiples of NUM_PACK of src 
 **/

module axistream_pack
  (
   clk,
   rst,

   src_tvalid,
   src_tready,
   src_tdata,
   src_tlast, //! may only be raised on multiples of NUM_PACK of src

   dest_tvalid,
   dest_tready,
   dest_tdata,
   dest_tlast,

   tlast_align_err //! src_tlast && src_tvalid at invalid time for src_tlast
   );

   parameter DATA_WIDTH = 8;
   parameter NUM_PACK = 4;
   parameter BIG_ENDIAN = 1'b0; //! most significant word comes first from src
   

   input                              clk;
   input                              rst;

   input                              src_tvalid;
   output                             src_tready;
   input [DATA_WIDTH-1:0]             src_tdata;
   input 		              src_tlast;

   output 		              dest_tvalid;
   input 		              dest_tready;
   output [(DATA_WIDTH*NUM_PACK)-1:0] dest_tdata;
   output 			      dest_tlast;
   
   output reg 			      tlast_align_err;
   
   

   reg [(NUM_PACK*DATA_WIDTH)-1:0]   data_buf;
   reg [NUM_PACK-1:0] 		     tlast_buf;
   
   reg [$clog2(NUM_PACK+1)-1:0]       cnt;

   assign dest_tvalid = (cnt == NUM_PACK) ? !rst : 1'b0;
   assign src_tready  = (cnt == NUM_PACK) ? dest_tvalid && dest_tready : !rst;

   assign dest_tdata = data_buf;
   assign dest_tlast = (!BIG_ENDIAN)?tlast_buf[NUM_PACK-1]:tlast_buf[0];

   initial begin
      cnt = 0;
      tlast_align_err = 1'b0;
   end
   
   always @(posedge clk) begin
      //rst overrides cnt and tlast_align_err
      
      if (src_tvalid && src_tready) begin
	 if (!BIG_ENDIAN) begin
	       
	    data_buf[((NUM_PACK-1)*DATA_WIDTH)-1:0] 
	      <= data_buf[NUM_PACK*DATA_WIDTH-1:DATA_WIDTH];
	       
	    data_buf[NUM_PACK*DATA_WIDTH-1:(NUM_PACK-1)*DATA_WIDTH] 
	      <= src_tdata;
	       
	    tlast_buf[NUM_PACK-2:0] <= tlast_buf[NUM_PACK-1:1];
	    tlast_buf[NUM_PACK-1] <= src_tlast;
	       
	 end else begin 
	       
	    data_buf[NUM_PACK*DATA_WIDTH-1:DATA_WIDTH] 
	      <= data_buf[((NUM_PACK-1)*DATA_WIDTH)-1:0];
       
	    data_buf[DATA_WIDTH - 1 : 0] <= src_tdata;

	    tlast_buf[NUM_PACK-1:1] <= tlast_buf[NUM_PACK-2:0];
	    tlast_buf[0] <= src_tlast;
	       
	 end
      end else begin
	 data_buf <= data_buf;
	 tlast_buf <= tlast_buf;
      end
	 
      if (src_tvalid && src_tready && dest_tvalid && dest_tready) begin
	 cnt <= 1;	    
      end else if (dest_tvalid && dest_tready) begin
	 cnt <= 0;
      end else if (src_tvalid && src_tready) begin
	 cnt <= cnt + 1;
      end else begin
	 cnt <= cnt;
      end

      if (dest_tvalid && dest_tready) begin
	 if (!BIG_ENDIAN) begin
	    tlast_align_err <= (|tlast_buf[NUM_PACK-2:0])?1'b1:1'b0;
	 end else begin
	    tlast_align_err <= (|tlast_buf[NUM_PACK-1:1])?1'b1:1'b0;
	 end
      end else begin
	 tlast_align_err <= 1'b0;
      end
	 
      if (rst) begin
	 cnt <= 0;
	 tlast_align_err <= 1'b0;
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
