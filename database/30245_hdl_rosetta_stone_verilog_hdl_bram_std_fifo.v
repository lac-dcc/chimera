// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file bram_std_fifo.v
 * @author Trip Richert
 **/

/**
 * @interface bram_std_fifo
 * @brief dual port, single clock, block ram fifo.
 * data is output one clock cycle after read enable
 * data should be input at same time as write enable
 * reads are not allowed when fifo is empty, even if there a simulaneous write
 * writes are disallowed when fifo is full, even if there is a simultaneous read
 **/
module bram_std_fifo

  #(parameter DATA_WIDTH=32,
    parameter ADDR_WIDTH=10)
   (
    input                     clk,
    input                     rst,
    input [(DATA_WIDTH-1):0]  src_data,
    input                     wr_en,
    input                     rd_en,
    output                    full,
    output                    empty,
    output reg                wr_err_flr,//! raised on failed write for 1 clk
    output reg                rd_err_flr,//! raised on failed read for 1 clk
    output [(ADDR_WIDTH):0]    data_cnt,
    output [(DATA_WIDTH-1):0] dest_data
    );

   reg [(ADDR_WIDTH-1):0]      rd_ptr;
   reg [(ADDR_WIDTH-1):0]      wr_ptr;
   reg                         full_plausible;
   wire                        wr_en_internal;

   reg [(ADDR_WIDTH):0]        cnt;
   wire                        can_read;
   wire                        can_write;

   assign data_cnt = cnt;
   assign can_write = (rd_ptr != wr_ptr || full_plausible == 1'b0)? 1'b1 : 1'b0;
   assign can_read =  (rd_ptr != wr_ptr || full_plausible == 1'b1)? 1'b1 : 1'b0;

   assign empty = (rd_ptr == wr_ptr && full_plausible == 1'b0)? 1'b1 : 1'b0;
   assign full  = (rd_ptr == wr_ptr && full_plausible == 1'b1)? 1'b1 : 1'b0;
   assign wr_en_internal = (can_write)? wr_en : 1'b0;

   always @ (posedge clk) begin
      wr_err_flr <= 1'b0;
      rd_err_flr <= 1'b0;
      if (rst) begin
         rd_ptr <= 0;
         wr_ptr <= 0;
         cnt <= 0;
         full_plausible <= 1'b0;
      end else begin
         if (rd_en) begin
            if (can_read) begin
               rd_ptr <= rd_ptr + 1;
               if (!(wr_en && can_write)) begin
                  cnt <= cnt - 1;
		  full_plausible <= 1'b0;
               end
            end else begin
              rd_err_flr <= 1'b1;          
            end 
         end   // if (rd_en)
         if (wr_en) begin
            if (can_write) begin
               wr_ptr <= wr_ptr + 1;
               full_plausible <= 1'b1;
               if (!(rd_en && can_read)) begin
                 cnt <= cnt + 1;
               end
            end else begin
                 wr_err_flr <= 1'b1;
            end
         end // if (wr_en)
      end 
   end // always @ (posedge clk)

   blockram #(
      .DATA_WIDTH(DATA_WIDTH), 
      .ADDR_WIDTH(ADDR_WIDTH)
    ) br (
      .clk(clk),
      .dia(src_data),//data_input
      .addrb(rd_ptr),//read_addr
      .addra(wr_ptr),//write_addr
      .ena(wr_en_internal),//wr_en
      .wea(wr_en_internal),//wr_en
      .enb(rd_en),//rd_en
      .dob(dest_data)//data_output
      );
   
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
