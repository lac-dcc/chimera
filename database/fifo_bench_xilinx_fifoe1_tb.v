/*
 *  Xilinx FIFOE1 wrapper testbench
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
module xilinx_fifoe1_tb
  #(parameter data_width = 16);

   localparam DEPTH = 8192; //FIXME: Make this depend on data_width

   vlog_tb_utils vlog_tb_utils0();
   vlog_tap_generator #("xilinx_fifoe1.tap", 4) vtg();

   reg slow_clk = 1'b1;
   reg fast_clk = 1'b1;
   reg rst = 1'b1;

   reg 		 faster_write_clk = 1'b0;
   wire 	 wr_clk;
   wire 	 rd_clk;


   always #11000 slow_clk <= ~slow_clk;
   always  #7000 fast_clk <= ~fast_clk;
   initial #95000 rst <= 0;

   assign wr_clk = faster_write_clk ? fast_clk : slow_clk;
   assign rd_clk = faster_write_clk ? slow_clk : fast_clk;

   wire [data_width-1:0] wr_data;
   wire 	 wr_en;
   wire [data_width-1:0] rd_data;
   wire 	 rd_en;
   wire 	 full;
   wire 	 empty;

   xilinx_fifoe1
     #(.ADDR_WIDTH (0),
       .DATA_WIDTH (data_width))
   dut
     (.rst_i (rst),

      .wr_clk_i  (wr_clk),
      .wr_en_i   (wr_en & !full),
      .wr_data_i (wr_data),
      .full_o    (full),

      .rd_clk_i  (rd_clk),
      .rd_en_i   (rd_en & !empty),
      .rd_data_o (rd_data),
      .empty_o   (empty));

   fifo_tester
     #(.DEPTH   (DEPTH),
       .DW      (data_width))
   tester
     (.rst_i     (rst),
      .wr_clk_i  (wr_clk),
      .wr_en_o   (wr_en),
      .wr_data_o (wr_data),
      .full_i    (full),

      .rd_clk_i  (rd_clk),
      .rd_en_o   (rd_en),
      .rd_data_i (rd_data),
      .empty_i   (empty));

   integer 	 transactions = 10000;

   integer 	 errors;

   initial begin
      if($value$plusargs("transactions=%d", transactions)) begin
	 $display("Setting number of transactions to %0d", transactions);
      end

      #95000 rst = 0;
      $display("Testing slow write clock, fast write rate");
      fork
	 tester.fifo_write(transactions , 0.9);
	 tester.fifo_verify(transactions, 0.1, errors);
      join
      vtg.write_tc("Slow write clock, fast write rate", !errors);

      $display("Testing slow write clock, slow write rate");
      fork
	 tester.fifo_write(transactions , 0.1);
	 tester.fifo_verify(transactions, 0.9, errors);
      join
      vtg.write_tc("Slow write clock, slow write rate", !errors);

      rst = 1'b1;
      faster_write_clk = 1;
      #123 rst = 1'b0;

      $display("Testing fast write clock, fast write rate");
      fork
	 tester.fifo_write(transactions , 0.9);
	 tester.fifo_verify(transactions, 0.1, errors);
      join
      vtg.write_tc("Fast write clock, fast write rate", !errors);

      $display("Testing fast write clock, fast write rate");
      fork
	 tester.fifo_write(transactions , 0.1);
	 tester.fifo_verify(transactions, 0.9, errors);
      join
      vtg.write_tc("Fast write clock, slow write rate", !errors);
      $finish;
   end

endmodule
