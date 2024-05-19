// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_arbiter. Part of wb_intercon
 *
 * ISC License
 *
 * Copyright (C) 2013-2019  Olof Kindgren <olof.kindgren@gmail.com>
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

/*
 Wishbone arbiter, burst-compatible
 Simple round-robin arbiter for multiple Wishbone masters
 */

module wb_arbiter
 #(parameter dw = 32,
   parameter aw = 32,
   parameter num_masters = 0)
  (
   input wire			    wb_clk_i,
   input wire			    wb_rst_i,

   // Wishbone Master Interface
   input wire [num_masters*aw-1:0]  wbm_adr_i,
   input wire [num_masters*dw-1:0]  wbm_dat_i,
   input wire [num_masters*4-1:0]   wbm_sel_i,
   input wire [num_masters-1:0]	    wbm_we_i,
   input wire [num_masters-1:0]	    wbm_cyc_i,
   input wire [num_masters-1:0]	    wbm_stb_i,
   input wire [num_masters*3-1:0]   wbm_cti_i,
   input wire [num_masters*2-1:0]   wbm_bte_i,
   output wire [num_masters*dw-1:0] wbm_dat_o,
   output wire [num_masters-1:0]    wbm_ack_o,
   output wire [num_masters-1:0]    wbm_err_o,
   output wire [num_masters-1:0]    wbm_rty_o,

   // Wishbone Slave interface
   output wire [aw-1:0]		    wbs_adr_o,
   output wire [dw-1:0]		    wbs_dat_o,
   output wire [3:0]		    wbs_sel_o,
   output wire			    wbs_we_o,
   output wire			    wbs_cyc_o,
   output wire			    wbs_stb_o,
   output wire [2:0]		    wbs_cti_o,
   output wire [1:0]		    wbs_bte_o,
   input wire [dw-1:0]		    wbs_dat_i,
   input wire			    wbs_ack_i,
   input wire			    wbs_err_i,
   input wire			    wbs_rty_i);


///////////////////////////////////////////////////////////////////////////////
// Parameters
///////////////////////////////////////////////////////////////////////////////

   //ISim does not implement $clog2. Other tools have broken implementations
`ifdef BROKEN_CLOG2
   function integer clog2;
      input integer in;
      begin
	 in = in - 1;
	 for (clog2 = 0; in > 0; clog2=clog2+1)
	   in = in >> 1;
      end
   endfunction
 `define clog2 clog2
`else // !`ifdef BROKEN_CLOG2
   `define clog2 $clog2
`endif
   //Use parameter instead of localparam to work around a bug in Xilinx ISE
   parameter master_sel_bits = num_masters > 1 ? `clog2(num_masters) : 1;

   wire [num_masters-1:0]     grant;
   wire [master_sel_bits-1:0] master_sel;
   wire 		      active;

   arbiter
     #(.NUM_PORTS (num_masters))
   arbiter0
     (.clk (wb_clk_i),
      .rst (wb_rst_i),
      .request (wbm_cyc_i),
      .grant (grant),
      .select (master_sel),
      .active (active));
/* verilator lint_off WIDTH */
   //Mux active master
   assign wbs_adr_o = wbm_adr_i[master_sel*aw+:aw];
   assign wbs_dat_o = wbm_dat_i[master_sel*dw+:dw];
   assign wbs_sel_o = wbm_sel_i[master_sel*4+:4];
   assign wbs_we_o  = wbm_we_i [master_sel];
   assign wbs_cyc_o = wbm_cyc_i[master_sel] & active;
   assign wbs_stb_o = wbm_stb_i[master_sel];
   assign wbs_cti_o = wbm_cti_i[master_sel*3+:3];
   assign wbs_bte_o = wbm_bte_i[master_sel*2+:2];

   assign wbm_dat_o = {num_masters{wbs_dat_i}};
   assign wbm_ack_o = ((wbs_ack_i & active) << master_sel);
   assign wbm_err_o = ((wbs_err_i & active) << master_sel);
   assign wbm_rty_o = ((wbs_rty_i & active) << master_sel);
/* verilator lint_on WIDTH */

endmodule // wb_arbiter
