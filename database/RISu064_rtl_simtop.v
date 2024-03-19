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
module simtop(
    input  wire         clk,
    input  wire         rst,
    output wire [31:0]  bus_req_addr,
    output wire         bus_req_wen,
    output wire [63:0]  bus_req_wdata,
    output wire [7:0]   bus_req_wmask,
    output wire [2:0]   bus_req_size,
    output wire [4:0]   bus_req_srcid,
    output wire         bus_req_valid,
    input  wire         bus_req_ready,
    input  wire [63:0]  bus_resp_rdata,
    input  wire         bus_resp_ren,
    input  wire [2:0]   bus_resp_size,
    input  wire [4:0]   bus_resp_dstid,
    input  wire         bus_resp_valid,
    output wire         bus_resp_ready
);

    wire ml_abr;
    wire ml_bbr;
    wire [21:0] ml_data_a2b;
    wire [21:0] ml_data_b2a;
    wire ml_a_data_oe;
    wire ml_b_data_oe;
    wire explosion = ml_a_data_oe && ml_b_data_oe;

    asictop asictop(
        .clk(clk),
        .rst(rst),
        /* verilator lint_off PINCONNECTEMPTY */
        .ml_clk(),
        .ml_clkn(),
        /* verilator lint_on PINCONNECTEMPTY */
        .ml_abr(ml_abr),
        .ml_bbr(ml_bbr),
        .ml_data_o(ml_data_a2b),
        .ml_data_i(ml_data_b2a),
        .ml_data_oe(ml_a_data_oe),
        /* verilator lint_off PINCONNECTEMPTY */
        .ml_data_ie(),
        /* verilator lint_on PINCONNECTEMPTY */
        .extint_software(1'b0),
        .extint_external(1'b0),
        .extint_timer(1'b0)
    );

    // The bridge allows the requests and responses to be interleaved
    // This requires the RAM to be able to either buffer requests or reponses
    // A 1-deep FWFT FIFO is inserted here as a request queue
    // As the only bus masters are I and D cache, and they are guarenteed to
    // only send new requests after the previous response has been received,
    // a 1-deep FIFO should be enough in any case.
    wire [31:0] kl_req_addr;
    wire        kl_req_wen;
    wire [63:0] kl_req_wdata;
    wire [7:0]  kl_req_wmask;
    wire [2:0]  kl_req_size;
    wire [4:0]  kl_req_srcid;
    wire        kl_req_valid;
    wire        kl_req_ready;

    fifo_1d_fwft #(.WIDTH(113)) req_queue (
        .clk(clk),
        .rst(rst),
        .a_data({kl_req_addr, kl_req_wen, kl_req_wdata, kl_req_wmask,
                kl_req_size, kl_req_srcid}),
        .a_valid(kl_req_valid),
        .a_ready(kl_req_ready),
        .b_data({bus_req_addr, bus_req_wen, bus_req_wdata, bus_req_wmask,
                bus_req_size, bus_req_srcid}),
        .b_valid(bus_req_valid),
        .b_ready(bus_req_ready)
    );

    ml2kl_bridge ml2kl_bridge(
        .clk(clk),
        .rst(rst),
        .kl_req_addr(kl_req_addr),
        .kl_req_wen(kl_req_wen),
        .kl_req_wdata(kl_req_wdata),
        .kl_req_wmask(kl_req_wmask),
        .kl_req_size(kl_req_size),
        .kl_req_srcid(kl_req_srcid),
        .kl_req_valid(kl_req_valid),
        .kl_req_ready(kl_req_ready),
        .kl_resp_rdata(bus_resp_rdata),
        .kl_resp_ren(bus_resp_ren),
        .kl_resp_size(bus_resp_size),
        .kl_resp_dstid(bus_resp_dstid),
        .kl_resp_valid(bus_resp_valid),
        .kl_resp_ready(bus_resp_ready),
        .ml_abr(ml_abr),
        .ml_bbr(ml_bbr),
        .ml_data_o(ml_data_b2a),
        .ml_data_i(ml_data_a2b),
        .ml_data_oe(ml_b_data_oe),
        /* verilator lint_off PINCONNECTEMPTY */
        .ml_data_ie()
        /* verilator lint_on PINCONNECTEMPTY */
    );

endmodule
