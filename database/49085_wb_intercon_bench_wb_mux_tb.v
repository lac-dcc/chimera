// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_mux_tb. Part of wb_intercon
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
`default_nettype none
module wb_mux_tb
  #(parameter AUTORUN = 1);

   localparam NUM_SLAVES = 4;

   localparam aw = 32;
   localparam dw = 32;

   localparam SEGMENT_SIZE = 32'h100;
   localparam MEMORY_SIZE_BITS  = 8;

   /*TODO: Find a way to generate MATCH_ADDR and MATCH_MASK based on memory
           size and number of slaves. Missing support for constant
           user functions in Icarus Verilog is the blocker for this*/
   localparam [dw*NUM_SLAVES-1:0] MATCH_ADDR = {32'h00000300,
						32'h00000200,
						32'h00000100,
						32'h00000000};
   localparam [dw*NUM_SLAVES-1:0] MATCH_MASK = {NUM_SLAVES{32'hffffff00}};

   reg wb_clk = 1'b1;
   reg wb_rst = 1'b1;

   wire [NUM_SLAVES*aw-1:0] wbs_m2s_adr;
   wire [NUM_SLAVES*dw-1:0] wbs_m2s_dat;
   wire [NUM_SLAVES*4-1:0]  wbs_m2s_sel;
   wire [NUM_SLAVES-1:0]    wbs_m2s_we ;
   wire [NUM_SLAVES-1:0]    wbs_m2s_cyc;
   wire [NUM_SLAVES-1:0]    wbs_m2s_stb;
   wire [NUM_SLAVES*3-1:0]  wbs_m2s_cti;
   wire [NUM_SLAVES*2-1:0]  wbs_m2s_bte;
   wire [NUM_SLAVES*dw-1:0] wbs_s2m_dat;
   wire [NUM_SLAVES-1:0]    wbs_s2m_ack;
   wire [NUM_SLAVES-1:0]    wbs_s2m_err;
   wire [NUM_SLAVES-1:0]    wbs_s2m_rty;

   wire [aw-1:0] wb_m2s_adr;
   wire [dw-1:0] wb_m2s_dat;
   wire [3:0] 	 wb_m2s_sel;
   wire 	 wb_m2s_we ;
   wire 	 wb_m2s_cyc;
   wire 	 wb_m2s_stb;
   wire [2:0] 	 wb_m2s_cti;
   wire [1:0] 	 wb_m2s_bte;
   wire [dw-1:0] wb_s2m_dat;
   wire 	 wb_s2m_ack;
   wire 	 wb_s2m_err;
   wire 	 wb_s2m_rty;

   wire [31:0] 	 slave_writes [0:NUM_SLAVES-1];
   wire [31:0] 	 slave_reads  [0:NUM_SLAVES-1];

   genvar 	 i;

   integer  TRANSACTIONS;

   generate
      if (AUTORUN) begin
         vlog_tb_utils vtu();
         vlog_tap_generator #("wb_mux.tap", 1) vtg();

         initial begin
            #100 run;
            vtg.ok("wb_mux: All tests passed!");
            $finish;
         end
      end
   endgenerate

   task run;
      integer idx;
      begin
	 wb_rst = 1'b0;
         if($value$plusargs("transactions=%d", TRANSACTIONS))
	   transactor.set_transactions(TRANSACTIONS);

	 transactor.display_settings;
	 transactor.run();
	 transactor.display_stats;

	 for(idx=0;idx<NUM_SLAVES;idx=idx+1) begin
	    $display("%0d writes to slave %0d", slave_writes[idx], idx);
	 end
      end
   endtask

   always #5 wb_clk <= ~wb_clk;

   wb_bfm_transactor
     #(.NUM_SEGMENTS (NUM_SLAVES),
       .AUTORUN (0),
       .VERBOSE (0),
       .SEGMENT_SIZE (SEGMENT_SIZE))
   transactor
     (.wb_clk_i (wb_clk),
      .wb_rst_i (wb_rst),
      .wb_adr_o (wb_m2s_adr),
      .wb_dat_o (wb_m2s_dat),
      .wb_sel_o (wb_m2s_sel),
      .wb_we_o  (wb_m2s_we ),
      .wb_cyc_o (wb_m2s_cyc),
      .wb_stb_o (wb_m2s_stb),
      .wb_cti_o (wb_m2s_cti),
      .wb_bte_o (wb_m2s_bte),
      .wb_dat_i (wb_s2m_dat),
      .wb_ack_i (wb_s2m_ack),
      .wb_err_i (wb_s2m_err),
      .wb_rty_i (wb_s2m_rty),
      //Test Control
      .done());

   wb_mux
     #(.num_slaves(NUM_SLAVES),
       .MATCH_ADDR (MATCH_ADDR),
       .MATCH_MASK (MATCH_MASK))
   wb_mux0
   (.wb_clk_i    (wb_clk),
    .wb_rst_i     (wb_rst),

    // Master Interface
    .wbm_adr_i (wb_m2s_adr),
    .wbm_dat_i (wb_m2s_dat),
    .wbm_sel_i (wb_m2s_sel),
    .wbm_we_i  (wb_m2s_we ),
    .wbm_cyc_i (wb_m2s_cyc),
    .wbm_stb_i (wb_m2s_stb),
    .wbm_cti_i (wb_m2s_cti),
    .wbm_bte_i (wb_m2s_bte),
    .wbm_dat_o (wb_s2m_dat),
    .wbm_ack_o (wb_s2m_ack),
    .wbm_err_o (wb_s2m_err),
    .wbm_rty_o (wb_s2m_rty),
    // Wishbone Slave interface
    .wbs_adr_o (wbs_m2s_adr),
    .wbs_dat_o (wbs_m2s_dat),
    .wbs_sel_o (wbs_m2s_sel),
    .wbs_we_o  (wbs_m2s_we),
    .wbs_cyc_o (wbs_m2s_cyc),
    .wbs_stb_o (wbs_m2s_stb),
    .wbs_cti_o (wbs_m2s_cti),
    .wbs_bte_o (wbs_m2s_bte),
    .wbs_dat_i (wbs_s2m_dat),
    .wbs_ack_i (wbs_s2m_ack),
    .wbs_err_i (wbs_s2m_err),
    .wbs_rty_i (wbs_s2m_rty));

   generate
      for(i=0;i<NUM_SLAVES;i=i+1) begin : slaves
	 assign slave_writes[i] = wb_mem_model0.writes;
	 assign slave_reads[i]  = wb_mem_model0.reads;

	 wb_bfm_memory #(.DEBUG (0),
			 .mem_size_bytes(SEGMENT_SIZE))
	 wb_mem_model0
	    (.wb_clk_i (wb_clk),
	     .wb_rst_i (wb_rst),
	     .wb_adr_i (wbs_m2s_adr[i*aw+:aw] & (2**MEMORY_SIZE_BITS-1)),
	     .wb_dat_i (wbs_m2s_dat[i*dw+:dw]),
	     .wb_sel_i (wbs_m2s_sel[i*4+:4]),
	     .wb_we_i  (wbs_m2s_we[i]),
	     .wb_cyc_i (wbs_m2s_cyc[i]),
	     .wb_stb_i (wbs_m2s_stb[i]),
	     .wb_cti_i (wbs_m2s_cti[i*3+:3]),
	     .wb_bte_i (wbs_m2s_bte[i*2+:2]),
	     .wb_dat_o (wbs_s2m_dat[i*dw+:dw]),
	     .wb_ack_o (wbs_s2m_ack[i]),
	     .wb_err_o (wbs_s2m_err[i]),
	     .wb_rty_o (wbs_s2m_rty[i]));
      end // block: slaves
   endgenerate

endmodule
