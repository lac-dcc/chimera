/*
 *  FIFO testbench
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
module fifo_tb
  #(parameter data_width  = 16,
    parameter depth_width = 8);

   localparam DEPTH = 1<<depth_width;

   vlog_tb_utils vlog_tb_utils0();
   vlog_tap_generator #("fifo.tap", 2) vtg();

   reg clk = 1'b1;
   reg rst = 1'b1;

   always #11000 clk <= ~clk;
   initial #95000 rst <= 0;

   wire [data_width-1:0] wr_data;
   wire 	 wr_en;
   wire [data_width-1:0] rd_data;
   wire 	 rd_en;
   wire 	 full;
   wire 	 empty;

   fifo
     #(.DEPTH_WIDTH (depth_width),
       .DATA_WIDTH (data_width))
   dut
     (
      .clk       (clk),
      .rst       (rst),

      .wr_en_i   (wr_en & !full),
      .wr_data_i (wr_data),
      .full_o    (full),

      .rd_en_i   (rd_en & !empty),
      .rd_data_o (rd_data),
      .empty_o   (empty));

   fifo_tester
     #(.DEPTH   (DEPTH),
       .DW      (data_width))
   tester
     (.rst_i     (rst),
      .wr_clk_i  (clk),
      .wr_en_o   (wr_en),
      .wr_data_o (wr_data),
      .full_i    (full),

      .rd_clk_i  (clk),
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
      $display("Testing slow read rate, fast write rate");
      fork
	 tester.fifo_write(transactions , 0.9);
	 tester.fifo_verify(transactions, 0.1, errors);
      join
      vtg.write_tc("Slow read rate, fast write rate", !errors);

      $display("Testing fast read rate, slow write rate");
      fork
	 tester.fifo_write(transactions , 0.1);
	 tester.fifo_verify(transactions, 0.9, errors);
      join
      vtg.write_tc("Fast read rate, slow write rate", !errors);

      $finish;
   end

endmodule
