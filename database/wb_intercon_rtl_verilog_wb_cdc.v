// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_cdc. Part of wb_intercon
 *
 * ISC License
 *
 * Copyright (C) 2016  Olof Kindgren <olof.kindgren@gmail.com>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*Wishbone Clock-domain crossing core.
 TODO:
 - Bursts
 - Pipelining
 */

module wb_cdc
  #(parameter AW = 32)
  (input wire		wbm_clk,
   input wire		wbm_rst,
   input wire [AW-1:0]	wbm_adr_i,
   input wire [31:0]	wbm_dat_i,
   input wire [3:0]	wbm_sel_i,
   input wire		wbm_we_i,
   input wire		wbm_cyc_i,
   input wire		wbm_stb_i,
   output wire [31:0]	wbm_dat_o,
   output wire		wbm_ack_o,
   input wire		wbs_clk,
   input wire		wbs_rst,
   output wire [AW-1:0]	wbs_adr_o,
   output wire [31:0]	wbs_dat_o,
   output wire [3:0]	wbs_sel_o,
   output wire		wbs_we_o,
   output wire		wbs_cyc_o,
   output wire		wbs_stb_o,
   input wire [31:0]	wbs_dat_i,
   input wire		wbs_ack_i);

   wire 	   wbm_m2s_en;
   reg 		   wbm_busy = 1'b0;
   wire 	   wbm_cs;
   wire 	   wbm_done;

   wire 	   wbs_m2s_en;
   reg 		   wbs_cs = 1'b0;

   cc561
     #(.DW (AW+32+4+1))
   cdc_m2s
     (.aclk  (wbm_clk),
      .arst  (wbm_rst),
      .adata ({wbm_adr_i, wbm_dat_i, wbm_sel_i, wbm_we_i}),
      .aen   (wbm_m2s_en),
      .bclk  (wbs_clk),
      .bdata ({wbs_adr_o, wbs_dat_o, wbs_sel_o, wbs_we_o}),
      .ben   (wbs_m2s_en));

   assign wbm_cs = wbm_cyc_i & wbm_stb_i;
   assign wbm_m2s_en = wbm_cs & ~wbm_busy;

   always @(posedge wbm_clk) begin
      if (wbm_ack_o | wbm_rst)
	wbm_busy <= 1'b0;
      else if (wbm_cs)
	wbm_busy <= 1'b1;
   end

   always @(posedge wbs_clk) begin
      if (wbs_ack_i)
	wbs_cs <= 1'b0;
      else if (wbs_m2s_en)
	wbs_cs <= 1'b1;
   end

   assign wbs_cyc_o = wbs_m2s_en | wbs_cs;
   assign wbs_stb_o = wbs_m2s_en | wbs_cs;

   cc561
     #(.DW (32))
   cdc_s2m
     (.aclk  (wbs_clk),
      .arst  (wbs_rst),
      .adata (wbs_dat_i),
      .aen   (wbs_ack_i),
      .bclk  (wbm_clk),
      .bdata (wbm_dat_o),
      .ben   (wbm_ack_o));

endmodule
