// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_intercon_tb. Part of wb_intercon
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
module wb_intercon_tb;

   vlog_tb_utils vlog_tb_utils0();
   vlog_tap_generator #("wb_intercon.tap", 3) vtg();

   wb_mux_tb     #(.AUTORUN (0)) wb_mux_tb();
   wb_arbiter_tb #(.AUTORUN (0)) wb_arb_tb();
   wb_cdc_tb     #(.AUTORUN (0)) wb_cdc_tb();

   initial begin
      wb_mux_tb.run;
      vtg.ok("wb_mux: All tests passed!");
      wb_arb_tb.run;
      vtg.ok("wb_arbiter: All tests passed!");
      wb_cdc_tb.run;
      vtg.ok("wb_cdc: All tests passed!");

      #3 $finish;
   end

endmodule
