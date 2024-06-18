// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_cdc_tb. Part of wb_intercon
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

/*Testbench for wb_cdc
 */
`default_nettype none
module wb_cdc_tb
  #(parameter AUTORUN = 1);

   localparam aw = 32;
   localparam dw = 32;

   localparam MEM_SIZE = 256;


   reg wbm_clk = 1'b1;
   reg wbm_rst = 1'b1;
   reg wbs_clk = 1'b1;
   reg wbs_rst = 1'b1;

   wire [aw-1:0] wbm_m2s_adr;
   wire [dw-1:0] wbm_m2s_dat;
   wire [3:0] 	 wbm_m2s_sel;
   wire 	 wbm_m2s_we ;
   wire 	 wbm_m2s_cyc;
   wire 	 wbm_m2s_stb;
   wire [dw-1:0] wbm_s2m_dat;
   wire 	 wbm_s2m_ack;

   wire [aw-1:0] wbs_m2s_adr;
   wire [dw-1:0] wbs_m2s_dat;
   wire [3:0] 	 wbs_m2s_sel;
   wire 	 wbs_m2s_we ;
   wire 	 wbs_m2s_cyc;
   wire 	 wbs_m2s_stb;
   wire [dw-1:0] wbs_s2m_dat;
   wire 	 wbs_s2m_ack;

   wire 	 done;

   integer  TRANSACTIONS;

   generate
      if (AUTORUN) begin
         vlog_tb_utils vtu();
         vlog_tap_generator #("wb_cdc.tap", 1) vtg();

         initial begin
            run;
            vtg.ok("wb_cdc: All tests passed!");
            $finish;
         end
      end
   endgenerate

   task run;
      begin
         transactor.bfm.reset;
	 @(posedge wbs_clk) wbs_rst = 1'b0;
	 @(posedge wbm_clk) wbm_rst = 1'b0;

	 if($value$plusargs("transactions=%d", TRANSACTIONS))
	   transactor.set_transactions(TRANSACTIONS);
	 transactor.display_settings;
	 transactor.run();
	 transactor.display_stats;
      end
   endtask

   always #5 wbm_clk <= ~wbm_clk;
   always #3 wbs_clk <= ~wbs_clk;

   wb_bfm_transactor
     #(.MEM_HIGH (MEM_SIZE-1),
       .AUTORUN (0),
       .VERBOSE (0))
   transactor
     (.wb_clk_i (wbm_clk),
      .wb_rst_i (1'b0),
      .wb_adr_o (wbm_m2s_adr),
      .wb_dat_o (wbm_m2s_dat),
      .wb_sel_o (wbm_m2s_sel),
      .wb_we_o  (wbm_m2s_we),
      .wb_cyc_o (wbm_m2s_cyc),
      .wb_stb_o (wbm_m2s_stb),
      .wb_cti_o (),
      .wb_bte_o (),
      .wb_dat_i (wbm_s2m_dat),
      .wb_ack_i (wbm_s2m_ack),
      .wb_err_i (1'b0),
      .wb_rty_i (1'b0),
      //Test Control
      .done());

   wb_cdc
     #(.AW(aw))
   dut
     (.wbm_clk    (wbm_clk),
      .wbm_rst    (wbm_rst),

      // Master Interface
      .wbm_adr_i (wbm_m2s_adr),
      .wbm_dat_i (wbm_m2s_dat),
      .wbm_sel_i (wbm_m2s_sel),
      .wbm_we_i  (wbm_m2s_we ),
      .wbm_cyc_i (wbm_m2s_cyc),
      .wbm_stb_i (wbm_m2s_stb),
      .wbm_dat_o (wbm_s2m_dat),
      .wbm_ack_o (wbm_s2m_ack),
      // Wishbone Slave interface
      .wbs_clk   (wbs_clk),
      .wbs_rst   (wbs_rst),
      .wbs_adr_o (wbs_m2s_adr),
      .wbs_dat_o (wbs_m2s_dat),
      .wbs_sel_o (wbs_m2s_sel),
      .wbs_we_o  (wbs_m2s_we),
      .wbs_cyc_o (wbs_m2s_cyc),
      .wbs_stb_o (wbs_m2s_stb),
      .wbs_dat_i (wbs_s2m_dat),
      .wbs_ack_i (wbs_s2m_ack & !wbs_rst));

   wb_bfm_memory
     #(.DEBUG (0),
       .mem_size_bytes(MEM_SIZE))
   mem
     (.wb_clk_i (wbs_clk),
      .wb_rst_i (wbs_rst),
      .wb_adr_i (wbs_m2s_adr),
      .wb_dat_i (wbs_m2s_dat),
      .wb_sel_i (wbs_m2s_sel),
      .wb_we_i  (wbs_m2s_we),
      .wb_cyc_i (wbs_m2s_cyc),
      .wb_stb_i (wbs_m2s_stb),
      .wb_cti_i (3'b000),
      .wb_bte_i (2'b00),
      .wb_dat_o (wbs_s2m_dat),
      .wb_ack_o (wbs_s2m_ack),
      .wb_err_o (),
      .wb_rty_o ());

endmodule
