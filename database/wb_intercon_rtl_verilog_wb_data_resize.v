// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_data_resize. Part of wb_intercon
 *
 * ISC License
 *
 * Copyright (C) 2019  Olof Kindgren <olof.kindgren@gmail.com>
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
module wb_data_resize
  #(parameter aw  = 32, //Address width
    parameter mdw = 32, //Master Data Width
    parameter sdw = 8, //Slave Data Width
    parameter [47:0] endian = "big") // Endian for byte reads/writes
   (//Wishbone Master interface
    input wire [aw-1:0]	  wbm_adr_i,
    input wire [mdw-1:0]  wbm_dat_i,
    input wire [3:0]	  wbm_sel_i,
    input wire		  wbm_we_i,
    input wire		  wbm_cyc_i,
    input wire		  wbm_stb_i,
    input wire [2:0]	  wbm_cti_i,
    input wire [1:0]	  wbm_bte_i,
    output wire [mdw-1:0] wbm_dat_o,
    output wire		  wbm_ack_o,
    output wire		  wbm_err_o,
    output wire		  wbm_rty_o,
    // Wishbone Slave interface
    output wire [aw-1:0]  wbs_adr_o,
    output wire [sdw-1:0] wbs_dat_o,
    output wire		  wbs_we_o,
    output wire		  wbs_cyc_o,
    output wire		  wbs_stb_o,
    output wire [2:0]	  wbs_cti_o,
    output wire [1:0]	  wbs_bte_o,
    input wire [sdw-1:0]  wbs_dat_i,
    input wire		  wbs_ack_i,
    input wire		  wbs_err_i,
    input wire		  wbs_rty_i);

   assign wbs_adr_o[aw-1:2] = wbm_adr_i[aw-1:2];

   generate if (endian == "little") begin : le_resize_gen
      assign wbs_adr_o[1:0] = wbm_sel_i[3] ? 2'd3 :
                              wbm_sel_i[2] ? 2'd2 :
                              wbm_sel_i[1] ? 2'd1 : 2'd0;
   end else begin : be_resize_gen
      assign wbs_adr_o[1:0] = wbm_sel_i[3] ? 2'd0 :
                              wbm_sel_i[2] ? 2'd1 :
                              wbm_sel_i[1] ? 2'd2 : 2'd3;
   end endgenerate

   assign wbs_dat_o = wbm_sel_i[3] ? wbm_dat_i[31:24] :
                      wbm_sel_i[2] ? wbm_dat_i[23:16] :
                      wbm_sel_i[1] ? wbm_dat_i[15:8]  :
                      wbm_sel_i[0] ? wbm_dat_i[7:0]   : 8'b0;

   assign wbs_we_o  = wbm_we_i;

   assign wbs_cyc_o = wbm_cyc_i;
   assign wbs_stb_o = wbm_stb_i;

   assign wbs_cti_o = wbm_cti_i;
   assign wbs_bte_o = wbm_bte_i;

   assign wbm_dat_o = (wbm_sel_i[3]) ? {wbs_dat_i, 24'd0} :
                      (wbm_sel_i[2]) ? {8'd0 , wbs_dat_i, 16'd0} :
                      (wbm_sel_i[1]) ? {16'd0, wbs_dat_i, 8'd0} :
                                       {24'd0, wbs_dat_i};
   assign wbm_ack_o = wbs_ack_i;
   assign wbm_err_o = wbs_err_i;
   assign wbm_rty_o = wbs_rty_i;

endmodule
