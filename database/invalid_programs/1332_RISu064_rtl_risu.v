// This program was cloned from: https://github.com/zephray/RISu064
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`include "options.vh"

module risu(
    input  wire         clk,
    input  wire         rst,
    output wire [31:0]  ib_req_addr,
    output wire [2:0]   ib_req_size,
    output wire         ib_req_valid,
    input  wire         ib_req_ready,
    input  wire [63:0]  ib_resp_rdata,
    input  wire         ib_resp_valid,
    output wire         ib_resp_ready,
    output wire [31:0]  db_req_addr,
    output wire [63:0]  db_req_wdata,
    output wire [7:0]   db_req_wmask,
    output wire         db_req_wen,
    output wire [2:0]   db_req_size,
    output wire         db_req_valid,
    input  wire         db_req_ready,
    input  wire [63:0]  db_resp_rdata,
    input  wire         db_resp_valid,
    output wire         db_resp_ready,
    input  wire         extint_software,
    input  wire         extint_timer,
    input  wire         extint_external
);
    // Signals from CPU
    wire [31:0] im_req_addr;
    wire        im_req_valid;
    wire        im_req_ready;
    wire [63:0] im_resp_rdata;
    wire        im_resp_valid;
    wire        im_invalidate_req;
    wire        im_invalidate_resp;
    wire [31:0] dm_req_addr;
    wire [63:0] dm_req_wdata;
    wire [7:0]  dm_req_wmask;
    wire        dm_req_wen;
    wire        dm_req_valid;
    wire        dm_req_ready;
    wire [63:0] dm_resp_rdata;
    wire        dm_resp_valid;
    wire        dm_flush_req;
    wire        dm_flush_resp;

    /* verilator lint_off UNUSED */
    // Only use low 48 bit of address
    wire [63:0] cpu_im_req_addr;
    wire [63:0] cpu_dm_req_addr;
    assign im_req_addr = cpu_im_req_addr[31:0];
    assign dm_req_addr = cpu_dm_req_addr[31:0];
    /* verilator lint_on UNUSED */

    // Add CPU, cache, CLINT, etc. here.
    cpu cpu(
        .clk(clk),
        .rst(rst),
        .im_req_addr(cpu_im_req_addr),
        .im_req_valid(im_req_valid),
        .im_req_ready(im_req_ready),
        .im_resp_rdata(im_resp_rdata),
        .im_resp_valid(im_resp_valid),
        .im_invalidate_req(im_invalidate_req),
        .im_invalidate_resp(im_invalidate_resp),
        .dm_req_addr(cpu_dm_req_addr),
        .dm_req_wdata(dm_req_wdata),
        .dm_req_wmask(dm_req_wmask),
        .dm_req_wen(dm_req_wen),
        .dm_req_valid(dm_req_valid),
        .dm_req_ready(dm_req_ready),
        .dm_resp_rdata(dm_resp_rdata),
        .dm_resp_valid(dm_resp_valid),
        .dm_flush_req(dm_flush_req),
        .dm_flush_resp(dm_flush_resp),
        .extint_software(extint_software),
        .extint_timer(extint_timer),
        .extint_external(extint_external)
    );

    `ifdef USE_L1_CACHE
    // TODO: Support flushing and invalidating
    l1cache l1i(
        .clk(clk),
        .rst(rst),
        .core_req_addr(im_req_addr),
        .core_req_wen(1'b0),
        .core_req_wdata(64'bx),
        .core_req_wmask(8'bx),
        .core_req_cache(1'b1),
        .core_req_ready(im_req_ready),
        .core_req_valid(im_req_valid),
        .core_resp_rdata(im_resp_rdata),
        .core_resp_valid(im_resp_valid),
        .mem_req_addr(ib_req_addr),
        /* verilator lint_off PINCONNECTEMPTY */
        .mem_req_wen(),
        .mem_req_wdata(),
        .mem_req_wmask(),
        /* verilator lint_on PINCONNECTEMPTY */
        .mem_req_size(ib_req_size),
        .mem_req_valid(ib_req_valid),
        .mem_req_ready(ib_req_ready),
        .mem_resp_rdata(ib_resp_rdata),
        .mem_resp_valid(ib_resp_valid),
        .mem_resp_ready(ib_resp_ready),
        .invalidate_req(im_invalidate_req),
        .invalidate_resp(im_invalidate_resp),
        .flush_req(1'b0),
        /* verilator lint_off PINCONNECTEMPTY */
        .flush_resp()
        /* verilator lint_on PINCONNECTEMPTY */
    );

    l1cache l1d(
        .clk(clk),
        .rst(rst),
        .core_req_addr(dm_req_addr),
        .core_req_wen(dm_req_wen),
        .core_req_wdata(dm_req_wdata),
        .core_req_wmask(dm_req_wmask),
        .core_req_cache(dm_req_addr[31]), // Only high 2GB are cached
        .core_req_ready(dm_req_ready),
        .core_req_valid(dm_req_valid),
        .core_resp_rdata(dm_resp_rdata),
        .core_resp_valid(dm_resp_valid),
        .mem_req_addr(db_req_addr),
        .mem_req_wen(db_req_wen),
        .mem_req_wdata(db_req_wdata),
        .mem_req_wmask(db_req_wmask),
        .mem_req_size(db_req_size),
        .mem_req_valid(db_req_valid),
        .mem_req_ready(db_req_ready),
        .mem_resp_rdata(db_resp_rdata),
        .mem_resp_valid(db_resp_valid),
        .mem_resp_ready(db_resp_ready),
        .invalidate_req(1'b0),
        /* verilator lint_off PINCONNECTEMPTY */
        .invalidate_resp(),
        /* verilator lint_on PINCONNECTEMPTY */
        .flush_req(dm_flush_req),
        .flush_resp(dm_flush_resp)
    );
    `else
    assign ib_req_addr = im_req_addr;
    assign ib_req_size = 3'd3; // Fixed 64-bit transfer
    assign ib_req_valid = im_req_valid;
    assign im_req_ready = ib_req_ready;
    assign ib_resp_ready = 1'b1;
    assign im_resp_rdata = ib_resp_rdata;
    assign im_resp_valid = ib_resp_valid;
    assign db_req_addr = dm_req_addr;
    assign db_req_wdata = dm_req_wdata;
    assign db_req_wmask = dm_req_wmask;
    assign db_req_wen = dm_req_wen;
    assign db_req_size = 3'd3;
    assign db_req_valid = dm_req_valid;
    assign dm_req_ready = db_req_ready;
    assign db_resp_ready = 1'b1;
    assign dm_resp_rdata = db_resp_rdata;
    assign dm_resp_valid = db_resp_valid;
    // Tie-off invalidate request: there is no icache to begin with
    assign im_invalidate_resp = im_invalidate_req;
    assign dm_flush_resp = dm_flush_req;
    `endif

endmodule
