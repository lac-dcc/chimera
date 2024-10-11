// This program was cloned from: https://github.com/cbalint13/e-verest
// License: Apache License 2.0

/*
 *
 *  Copyright (C) 2021  Cristian Balint <cristian dot balint at gmail dot com>
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
 *
 */

`timescale 1 ns / 1 ps

//
// Simple CLK divisor

module div_clk (
    input clk,
    output div2_clk
);
    wire clk;
    wire rst;
    reg div2_clk;

`ifndef SYNTHESIS
    initial div2_clk = 0;
`endif

    always @(posedge clk)
    begin
        div2_clk <= ~div2_clk;
    end
endmodule