// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_mux. Part of wb_intercon
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
 Wishbone multiplexer, burst-compatible

 Simple mux with an arbitrary number of slaves.

 The parameters MATCH_ADDR and MATCH_MASK are flattened arrays
 aw*NUM_SLAVES sized arrays that are used to calculate the
 active slave. slave i is selected when
 (wb_adr_i & MATCH_MASK[(i+1)*aw-1:i*aw] is equal to
 MATCH_ADDR[(i+1)*aw-1:i*aw]
 If several regions are overlapping, the slave with the lowest
 index is selected. This can be used to have fallback
 functionality in the last slave, in case no other slave was
 selected.

 If no match is found, the wishbone transaction will stall and
 an external watchdog is required to abort the transaction

 Todo:
 Registered master/slave connections
 Rewrite with System Verilog 2D arrays when tools support them
*/
module wb_mux
  #(parameter dw = 32,        // Data width
    parameter aw = 32,        // Address width
    parameter num_slaves = 2, // Number of slaves
    parameter [num_slaves*aw-1:0] MATCH_ADDR = 0,
    parameter [num_slaves*aw-1:0] MATCH_MASK = 0)

   (
    input wire			    wb_clk_i,
    input wire			    wb_rst_i,

    // Master Interface
    input wire [aw-1:0]		    wbm_adr_i,
    input wire [dw-1:0]		    wbm_dat_i,
    input wire [3:0]		    wbm_sel_i,
    input wire			    wbm_we_i,
    input wire			    wbm_cyc_i,
    input wire			    wbm_stb_i,
    input wire [2:0]		    wbm_cti_i,
    input wire [1:0]		    wbm_bte_i,
    output wire [dw-1:0]	    wbm_dat_o,
    output wire			    wbm_ack_o,
    output wire			    wbm_err_o,
    output wire			    wbm_rty_o,
    // Wishbone Slave interface
    output wire [num_slaves*aw-1:0] wbs_adr_o,
    output wire [num_slaves*dw-1:0] wbs_dat_o,
    output wire [num_slaves*4-1:0]  wbs_sel_o,
    output wire [num_slaves-1:0]    wbs_we_o,
    output wire [num_slaves-1:0]    wbs_cyc_o,
    output wire [num_slaves-1:0]    wbs_stb_o,
    output wire [num_slaves*3-1:0]  wbs_cti_o,
    output wire [num_slaves*2-1:0]  wbs_bte_o,
    input wire [num_slaves*dw-1:0]  wbs_dat_i,
    input wire [num_slaves-1:0]	    wbs_ack_i,
    input wire [num_slaves-1:0]	    wbs_err_i,
    input wire [num_slaves-1:0]	    wbs_rty_i);

///////////////////////////////////////////////////////////////////////////////
// Master/slave connection
///////////////////////////////////////////////////////////////////////////////

   //Use parameter instead of localparam to work around a bug in Xilinx ISE
   parameter slave_sel_bits = num_slaves > 1 ? $clog2(num_slaves) : 1;

   reg  			 wbm_err;
   wire [slave_sel_bits-1:0] 	 slave_sel;
   wire [num_slaves-1:0] 	 match;

   genvar 			 idx;

   generate
      for(idx=0; idx<num_slaves ; idx=idx+1) begin : addr_match
	 assign match[idx] = (wbm_adr_i & MATCH_MASK[idx*aw+:aw]) == MATCH_ADDR[idx*aw+:aw];
      end
   endgenerate

//
// Find First 1 - Start from MSB and count downwards, returns 0 when no bit set
//
   function [slave_sel_bits-1:0] ff1;
      input [num_slaves-1:0] in;
      integer 		     i;

      begin
	 ff1 = 0;
	 for (i = num_slaves-1; i >= 0; i=i-1) begin
	    if (in[i])
/* verilator lint_off WIDTH */
	      ff1 = i;
/* verilator lint_on WIDTH */
	 end
      end
   endfunction

   assign slave_sel = ff1(match);

   always @(posedge wb_clk_i)
     wbm_err <= wbm_cyc_i & !(|match);

   assign wbs_adr_o = {num_slaves{wbm_adr_i}};
   assign wbs_dat_o = {num_slaves{wbm_dat_i}};
   assign wbs_sel_o = {num_slaves{wbm_sel_i}};
   assign wbs_we_o  = {num_slaves{wbm_we_i}};
/* verilator lint_off WIDTH */

   assign wbs_cyc_o = match & (wbm_cyc_i << slave_sel);
/* verilator lint_on WIDTH */
   assign wbs_stb_o = {num_slaves{wbm_stb_i}};

   assign wbs_cti_o = {num_slaves{wbm_cti_i}};
   assign wbs_bte_o = {num_slaves{wbm_bte_i}};

   assign wbm_dat_o = wbs_dat_i[slave_sel*dw+:dw];
   assign wbm_ack_o = wbs_ack_i[slave_sel];
   assign wbm_err_o = wbs_err_i[slave_sel] | wbm_err;
   assign wbm_rty_o = wbs_rty_i[slave_sel];

endmodule
