// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_upsizer_tb. Part of wb_intercon
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
module wb_upsizer_tb
  (input wire  wb_clk_i,
   input wire  wb_rst_i,
   output wire done);

   localparam aw = 32;
   localparam MEMORY_SIZE_WORDS = 2**10;

   localparam DW_IN = 32;
   localparam SCALE = 2;
   localparam DW_OUT = DW_IN * SCALE;

   wire [aw-1:0] wbm_m2s_adr;
   wire [DW_IN-1:0] wbm_m2s_dat;
   wire [DW_IN/8-1:0] wbm_m2s_sel;
   wire 	      wbm_m2s_we ;
   wire 	      wbm_m2s_cyc;
   wire 	      wbm_m2s_stb;
   wire [2:0] 	      wbm_m2s_cti;
   wire [1:0] 	      wbm_m2s_bte;
   wire [DW_IN-1:0]   wbm_s2m_dat;
   wire 	      wbm_s2m_ack;
   wire 	      wbm_s2m_err;
   wire 	      wbm_s2m_rty;

   wire [aw-1:0]      wbs_m2s_adr;
   wire [DW_OUT-1:0]  wbs_m2s_dat;
   wire [DW_OUT/8-1:0] wbs_m2s_sel;
   wire 	       wbs_m2s_we ;
   wire 	       wbs_m2s_cyc;
   wire 	       wbs_m2s_stb;
   wire [2:0] 	       wbs_m2s_cti;
   wire [1:0] 	       wbs_m2s_bte;
   wire [DW_OUT-1:0]   wbs_s2m_dat;
   wire 	       wbs_s2m_ack;
   wire 	       wbs_s2m_err;
   wire 	       wbs_s2m_rty;

   wire [31:0] 	 slave_writes;
   wire [31:0] 	 slave_reads;

   wb_bfm_transactor
     #(.MEM_HIGH(MEMORY_SIZE_WORDS-1),
       .MEM_LOW (0),
       .VERBOSE (0))
   wb_bfm_transactor0
     (.wb_clk_i (wb_clk_i),
      .wb_rst_i (wb_rst_i),
      .wb_adr_o (wbm_m2s_adr),
      .wb_dat_o (wbm_m2s_dat),
      .wb_sel_o (wbm_m2s_sel),
      .wb_we_o  (wbm_m2s_we ),
      .wb_cyc_o (wbm_m2s_cyc),
      .wb_stb_o (wbm_m2s_stb),
      .wb_cti_o (wbm_m2s_cti),
      .wb_bte_o (wbm_m2s_bte),
      .wb_dat_i (wbm_s2m_dat),
      .wb_ack_i (wbm_s2m_ack),
      .wb_err_i (wbm_s2m_err),
      .wb_rty_i (wbm_s2m_rty),
      //Test Control
      .done(done));

   integer 	 idx;

   always @(done) begin
      if(done === 1) begin
	 $display("Average wait times");
	 $display("Master : %f", ack_delay/num_transactions);
	 $display("%0d : All tests passed!", $time);
      end
   end

   wb_upsizer
     #(.DW_IN (DW_IN),
       .SCALE (SCALE))
   dut
     (.wb_clk_i  (wb_clk_i),
      .wb_rst_i  (wb_rst_i),
      // Master Interface
      .wbs_adr_i (wbm_m2s_adr),
      .wbs_dat_i (wbm_m2s_dat),
      .wbs_sel_i (wbm_m2s_sel),
      .wbs_we_i  (wbm_m2s_we ),
      .wbs_cyc_i (wbm_m2s_cyc),
      .wbs_stb_i (wbm_m2s_stb),
      .wbs_cti_i (wbm_m2s_cti),
      .wbs_bte_i (wbm_m2s_bte),
      .wbs_dat_o (wbm_s2m_dat),
      .wbs_ack_o (wbm_s2m_ack),
      .wbs_err_o (wbm_s2m_err),
      .wbs_rty_o (wbm_s2m_rty),
      // Wishbone Slave interface
      .wbm_adr_o (wbs_m2s_adr),
      .wbm_dat_o (wbs_m2s_dat),
      .wbm_sel_o (wbs_m2s_sel),
      .wbm_we_o  (wbs_m2s_we),
      .wbm_cyc_o (wbs_m2s_cyc),
      .wbm_stb_o (wbs_m2s_stb),
      .wbm_cti_o (wbs_m2s_cti),
      .wbm_bte_o (wbs_m2s_bte),
      .wbm_dat_i (wbs_s2m_dat),
      .wbm_ack_i (wbs_s2m_ack),
      .wbm_err_i (wbs_s2m_err),
      .wbm_rty_i (wbs_s2m_rty));

   assign slave_writes = mem.writes;
   assign slave_reads  = mem.reads;

   time start_time;
   time ack_delay;
   integer num_transactions;

   initial begin
      ack_delay = 0;
      num_transactions = 0;
      while(1) begin
	 @(posedge wbm_m2s_cyc);
	 start_time = $time;
	 @(posedge wbm_s2m_ack);
	 ack_delay = ack_delay + $time-start_time;
	 num_transactions = num_transactions+1;
      end
   end

   wb_bfm_memory #(.DEBUG (0),
		   .dw (DW_OUT),
		   .mem_size_bytes(MEMORY_SIZE_WORDS*(DW_IN/8)))
   mem
     (.wb_clk_i (wb_clk_i),
      .wb_rst_i (wb_rst_i),
      .wb_adr_i (wbs_m2s_adr),
      .wb_dat_i (wbs_m2s_dat),
      .wb_sel_i (wbs_m2s_sel),
      .wb_we_i  (wbs_m2s_we),
      .wb_cyc_i (wbs_m2s_cyc),
      .wb_stb_i (wbs_m2s_stb),
      .wb_cti_i (wbs_m2s_cti),
      .wb_bte_i (wbs_m2s_bte),
      .wb_dat_o (wbs_s2m_dat),
      .wb_ack_o (wbs_s2m_ack),
      .wb_err_o (wbs_s2m_err),
      .wb_rty_o (wbs_s2m_rty));
endmodule
