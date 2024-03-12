/*
 * This Source Code Form is subject to the terms of the Mozilla
 * Public License, v. 2.0. If a copy of the MPL was not distributed
 * with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * Copyright (c) 2017 DUKELEC, All rights reserved.
 *
 * Author: Duke Fong <d@d-l.io>
 */

`timescale 1 ns / 1 ps

module cdpga_bx_wrapper(
        input       clk,
        input       rx
    );

wire tx;
wire tx_en;

cdpga_bx cdpga_bx_m(
          .clk_i(clk),

          .rx(rx),
          .tx(tx),
          .tx_en(tx_en)
      );

initial begin
    $dumpfile("cdpga_bx.vcd");
    $dumpvars();
end

endmodule
