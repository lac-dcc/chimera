/*
 *  Wrapper with proper reset handling for Xilinx FIFOE1 components
 *
 *  Copyright (C) 2017  Olof Kindgren <olof.kindgren@gmail.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

//TODO: Add support for FIFO36 primitives
module xilinx_fifoe1
  #(parameter ADDR_WIDTH = 0,
    parameter DATA_WIDTH = 0)
   (input wire 			rst_i,

    input wire 			 wr_clk_i,
    input wire 			 wr_en_i,
    input wire [DATA_WIDTH-1:0]  wr_data_i,
    output wire 		 full_o,

    input wire 			 rd_clk_i,
    input wire 			 rd_en_i,
    output wire [DATA_WIDTH-1:0] rd_data_o,
    output wire 		 empty_o);

   localparam FIFO_MODE = (DATA_WIDTH > 18) ? "FIFO18_36" : "FIFO18";
   localparam DATA_WIDTH_INT = (DATA_WIDTH <=  4) ?  4 :
			       (DATA_WIDTH <=  9) ?  9 :
			       (DATA_WIDTH <= 18) ? 18 :
			       36;

   localparam DP_LSB = DATA_WIDTH_INT/9*8;
   localparam PAD = DATA_WIDTH_INT-DATA_WIDTH;

   wire [35:0] 			 wr_data;
   wire [35:0] 			 rd_data;

   reg [6:0] 			 wr_rst_done = 7'd0;
   reg [2:0] 			 wr_en_mask = 1'b0;
   wire 			 wr_en;
   wire 			 full;

   reg [6:0] 			 rd_rst_done = 7'd0;
   reg [2:0] 			 rd_en_mask = 1'b0;
   wire 			 rd_en;

   wire 			 rst;

   assign wr_data = {{PAD{1'b0}},wr_data_i};
   assign rd_data_o = rd_data[DATA_WIDTH-1:0];

   FIFO18E1
     #(.ALMOST_EMPTY_OFFSET     (13'h0080),
       .ALMOST_FULL_OFFSET      (13'h0080),
       .DATA_WIDTH              (DATA_WIDTH_INT),
       .DO_REG                  (1),
       .EN_SYN                  ("FALSE"),
       .FIFO_MODE               (FIFO_MODE),
       .FIRST_WORD_FALL_THROUGH ("FALSE"),
       .INIT                    (36'h000000000),
       .SIM_DEVICE              ("7SERIES"),
       .SRVAL                   (36'h000000000))
   fifo (.RST         (rst),
	 //WRCLK domain
         .WRCLK       (wr_clk_i),
         .ALMOSTFULL  (),
         .DI          (wr_data[31:0]),
         .DIP         (wr_data[35:32]),
         .FULL        (full),
         .WRCOUNT     (),
         .WREN        (wr_en),
         .WRERR       (),
	 //RDCLK domain
         .RDCLK       (rd_clk_i),
         .DO          (rd_data[31:0]),
         .DOP         (rd_data[35:32]),
         .ALMOSTEMPTY (),
         .EMPTY       (empty_o),
         .RDCOUNT     (),
         .RDEN        (rd_en),
         .RDERR       (),
         .REGCE       (1'b1),
	 .RSTREG      (1'b0));


   //Reset must be asserted for five wr_clk cycles
   always @(posedge wr_clk_i or rst_i) begin
      wr_rst_done <= {wr_rst_done[5:0],1'b0};
      if (rst_i) begin
	 wr_rst_done <= 7'b1111111;
      end
   end

   //Reset must be asserted for five rd_clk cycles
   always @(posedge rd_clk_i or rst_i) begin
      rd_rst_done <= {rd_rst_done[5:0],1'b0};
      if (rst_i) begin
	 rd_rst_done <= 7'b1111111;
      end
   end

   assign rst = wr_rst_done[6] | rd_rst_done[6];

   //wr_en must be deasserted for two wr_clk cycles after reset is released
   always @(posedge wr_clk_i or posedge rst_i) begin
      wr_en_mask <= {wr_en_mask[1:0],~rst};
      if (rst_i)
	wr_en_mask <= 3'b000;
   end

   assign wr_en = wr_en_i & wr_en_mask[2];

   //Pretend FIFO is full until it's ready to receive data
   assign full_o = full | ~wr_en_mask[2];

   //rd_en must be deasserted for two rd_clk cycles after reset is released
   always @(posedge rd_clk_i or posedge rst_i) begin
      rd_en_mask <= {rd_en_mask[1:0],~rst};
      if (rst_i)
	rd_en_mask <= 3'b000;
   end

   assign rd_en = rd_en_i & rd_en_mask[2];

endmodule
