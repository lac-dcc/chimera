// This program was cloned from: https://github.com/alexforencich/verilog-ethernet
// License: MIT License

/*

Copyright (c) 2015-2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * Testbench for eth_mac_1g_rgmii_fifo
 */
module test_eth_mac_1g_rgmii_fifo;

// Parameters
parameter TARGET = "SIM";
parameter IODDR_STYLE = "IODDR2";
parameter CLOCK_INPUT_STYLE = "BUFIO2";
parameter USE_CLK90 = "TRUE";
parameter AXIS_DATA_WIDTH = 8;
parameter AXIS_KEEP_ENABLE = (AXIS_DATA_WIDTH>8);
parameter AXIS_KEEP_WIDTH = (AXIS_DATA_WIDTH/8);
parameter ENABLE_PADDING = 1;
parameter MIN_FRAME_LENGTH = 64;
parameter TX_FIFO_DEPTH = 4096;
parameter TX_FIFO_PIPELINE_OUTPUT = 2;
parameter TX_FRAME_FIFO = 1;
parameter TX_DROP_BAD_FRAME = TX_FRAME_FIFO;
parameter TX_DROP_WHEN_FULL = 0;
parameter RX_FIFO_DEPTH = 4096;
parameter RX_FIFO_PIPELINE_OUTPUT = 2;
parameter RX_FRAME_FIFO = 1;
parameter RX_DROP_BAD_FRAME = RX_FRAME_FIFO;
parameter RX_DROP_WHEN_FULL = RX_FRAME_FIFO;

// Inputs
reg clk = 0;
reg rst = 0;
reg [7:0] current_test = 0;

reg gtx_clk = 0;
reg gtx_clk90 = 0;
reg gtx_rst = 0;
reg logic_clk = 0;
reg logic_rst = 0;
reg [AXIS_DATA_WIDTH-1:0] tx_axis_tdata = 0;
reg [AXIS_KEEP_WIDTH-1:0] tx_axis_tkeep = 0;
reg tx_axis_tvalid = 0;
reg tx_axis_tlast = 0;
reg tx_axis_tuser = 0;
reg rx_axis_tready = 0;
reg rgmii_rx_clk = 0;
reg [3:0] rgmii_rxd = 0;
reg rgmii_rx_ctl = 0;
reg [7:0] ifg_delay = 0;

// Outputs
wire tx_axis_tready;
wire [AXIS_DATA_WIDTH-1:0] rx_axis_tdata;
wire [AXIS_KEEP_WIDTH-1:0] rx_axis_tkeep;
wire rx_axis_tvalid;
wire rx_axis_tlast;
wire rx_axis_tuser;
wire rgmii_tx_clk;
wire [3:0] rgmii_txd;
wire rgmii_tx_ctl;
wire tx_error_underflow;
wire tx_fifo_overflow;
wire tx_fifo_bad_frame;
wire tx_fifo_good_frame;
wire rx_error_bad_frame;
wire rx_error_bad_fcs;
wire rx_fifo_overflow;
wire rx_fifo_bad_frame;
wire rx_fifo_good_frame;
wire [1:0] speed;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        current_test,
        gtx_clk,
        gtx_clk90,
        gtx_rst,
        logic_clk,
        logic_rst,
        tx_axis_tdata,
        tx_axis_tkeep,
        tx_axis_tvalid,
        tx_axis_tlast,
        tx_axis_tuser,
        rx_axis_tready,
        rgmii_rx_clk,
        rgmii_rxd,
        rgmii_rx_ctl,
        ifg_delay
    );
    $to_myhdl(
        tx_axis_tready,
        rx_axis_tdata,
        rx_axis_tkeep,
        rx_axis_tvalid,
        rx_axis_tlast,
        rx_axis_tuser,
        rgmii_tx_clk,
        rgmii_txd,
        rgmii_tx_ctl,
        tx_error_underflow,
        tx_fifo_overflow,
        tx_fifo_bad_frame,
        tx_fifo_good_frame,
        rx_error_bad_frame,
        rx_error_bad_fcs,
        rx_fifo_overflow,
        rx_fifo_bad_frame,
        rx_fifo_good_frame,
        speed
    );

    // dump file
    $dumpfile("test_eth_mac_1g_rgmii_fifo.lxt");
    $dumpvars(0, test_eth_mac_1g_rgmii_fifo);
end

eth_mac_1g_rgmii_fifo #(
    .TARGET(TARGET),
    .IODDR_STYLE(IODDR_STYLE),
    .CLOCK_INPUT_STYLE(CLOCK_INPUT_STYLE),
    .USE_CLK90(USE_CLK90),
    .AXIS_DATA_WIDTH(AXIS_DATA_WIDTH),
    .AXIS_KEEP_ENABLE(AXIS_KEEP_ENABLE),
    .AXIS_KEEP_WIDTH(AXIS_KEEP_WIDTH),
    .ENABLE_PADDING(ENABLE_PADDING),
    .MIN_FRAME_LENGTH(MIN_FRAME_LENGTH),
    .TX_FIFO_DEPTH(TX_FIFO_DEPTH),
    .TX_FIFO_PIPELINE_OUTPUT(TX_FIFO_PIPELINE_OUTPUT),
    .TX_FRAME_FIFO(TX_FRAME_FIFO),
    .TX_DROP_BAD_FRAME(TX_DROP_BAD_FRAME),
    .TX_DROP_WHEN_FULL(TX_DROP_WHEN_FULL),
    .RX_FIFO_DEPTH(RX_FIFO_DEPTH),
    .RX_FIFO_PIPELINE_OUTPUT(RX_FIFO_PIPELINE_OUTPUT),
    .RX_FRAME_FIFO(RX_FRAME_FIFO),
    .RX_DROP_BAD_FRAME(RX_DROP_BAD_FRAME),
    .RX_DROP_WHEN_FULL(RX_DROP_WHEN_FULL)
)
UUT (
    .gtx_clk(gtx_clk),
    .gtx_clk90(gtx_clk90),
    .gtx_rst(gtx_rst),
    .logic_clk(logic_clk),
    .logic_rst(logic_rst),
    .tx_axis_tdata(tx_axis_tdata),
    .tx_axis_tkeep(tx_axis_tkeep),
    .tx_axis_tvalid(tx_axis_tvalid),
    .tx_axis_tready(tx_axis_tready),
    .tx_axis_tlast(tx_axis_tlast),
    .tx_axis_tuser(tx_axis_tuser),
    .rx_axis_tdata(rx_axis_tdata),
    .rx_axis_tkeep(rx_axis_tkeep),
    .rx_axis_tvalid(rx_axis_tvalid),
    .rx_axis_tready(rx_axis_tready),
    .rx_axis_tlast(rx_axis_tlast),
    .rx_axis_tuser(rx_axis_tuser),
    .rgmii_rx_clk(rgmii_rx_clk),
    .rgmii_rxd(rgmii_rxd),
    .rgmii_rx_ctl(rgmii_rx_ctl),
    .rgmii_tx_clk(rgmii_tx_clk),
    .rgmii_txd(rgmii_txd),
    .rgmii_tx_ctl(rgmii_tx_ctl),
    .tx_error_underflow(tx_error_underflow),
    .tx_fifo_overflow(tx_fifo_overflow),
    .tx_fifo_bad_frame(tx_fifo_bad_frame),
    .tx_fifo_good_frame(tx_fifo_good_frame),
    .rx_error_bad_frame(rx_error_bad_frame),
    .rx_error_bad_fcs(rx_error_bad_fcs),
    .rx_fifo_overflow(rx_fifo_overflow),
    .rx_fifo_bad_frame(rx_fifo_bad_frame),
    .rx_fifo_good_frame(rx_fifo_good_frame),
    .speed(speed),
    .ifg_delay(ifg_delay)
);

endmodule
