/*

Copyright (c) 2017 Alex Forencich

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
 * XFCP Interface (UART)
 */
module xfcp_interface_uart
(
    input  wire         clk,
    input  wire         rst,

    /*
     * UART interface
     */
    input  wire         uart_rxd,
    output wire         uart_txd,

    /*
     * XFCP downstream interface
     */
    input  wire [7:0]   down_xfcp_in_tdata,
    input  wire         down_xfcp_in_tvalid,
    output wire         down_xfcp_in_tready,
    input  wire         down_xfcp_in_tlast,
    input  wire         down_xfcp_in_tuser,

    output wire [7:0]   down_xfcp_out_tdata,
    output wire         down_xfcp_out_tvalid,
    input  wire         down_xfcp_out_tready,
    output wire         down_xfcp_out_tlast,
    output wire         down_xfcp_out_tuser,

    /*
     * Configuration
     */
    input  wire [15:0]  prescale
);

wire [7:0] uart_tx_axis_tdata;
wire uart_tx_axis_tvalid;
wire uart_tx_axis_tready;

wire [7:0] uart_rx_axis_tdata;
wire uart_rx_axis_tvalid;
wire uart_rx_axis_tready;

wire [7:0] fifo_tx_axis_tdata;
wire fifo_tx_axis_tvalid;
wire fifo_tx_axis_tready;
wire fifo_tx_axis_tlast;
wire fifo_tx_axis_tuser;

wire [7:0] fifo_rx_axis_tdata;
wire fifo_rx_axis_tvalid;
wire fifo_rx_axis_tready;
wire fifo_rx_axis_tlast;
wire fifo_rx_axis_tuser;

uart
uart_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(uart_tx_axis_tdata),
    .s_axis_tvalid(uart_tx_axis_tvalid),
    .s_axis_tready(uart_tx_axis_tready),
    // AXI output
    .m_axis_tdata(uart_rx_axis_tdata),
    .m_axis_tvalid(uart_rx_axis_tvalid),
    .m_axis_tready(uart_rx_axis_tready),
    // UART
    .rxd(uart_rxd),
    .txd(uart_txd),
    // Status
    .tx_busy(),
    .rx_busy(),
    .rx_overrun_error(),
    .rx_frame_error(),
    // Configuration
    .prescale(prescale)
);

axis_cobs_decode
cobs_decode_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(uart_rx_axis_tdata),
    .s_axis_tvalid(uart_rx_axis_tvalid),
    .s_axis_tready(uart_rx_axis_tready),
    .s_axis_tlast(1'b0),
    .s_axis_tuser(1'b0),
    // AXI output
    .m_axis_tdata(fifo_rx_axis_tdata),
    .m_axis_tvalid(fifo_rx_axis_tvalid),
    .m_axis_tready(fifo_rx_axis_tready),
    .m_axis_tlast(fifo_rx_axis_tlast),
    .m_axis_tuser(fifo_rx_axis_tuser)
);

axis_fifo #(
    .DEPTH(512),
    .DATA_WIDTH(8),
    .KEEP_ENABLE(0),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(1),
    .FRAME_FIFO(1),
    .DROP_BAD_FRAME(1),
    .DROP_WHEN_FULL(1)
)
rx_fifo_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(fifo_rx_axis_tdata),
    .s_axis_tkeep(0),
    .s_axis_tvalid(fifo_rx_axis_tvalid),
    .s_axis_tready(fifo_rx_axis_tready),
    .s_axis_tlast(fifo_rx_axis_tlast),
    .s_axis_tid(0),
    .s_axis_tdest(0),
    .s_axis_tuser(fifo_rx_axis_tuser),
    // AXI output
    .m_axis_tdata(down_xfcp_out_tdata),
    .m_axis_tkeep(),
    .m_axis_tvalid(down_xfcp_out_tvalid),
    .m_axis_tready(down_xfcp_out_tready),
    .m_axis_tlast(down_xfcp_out_tlast),
    .m_axis_tid(),
    .m_axis_tdest(),
    .m_axis_tuser(down_xfcp_out_tuser),
    // Status
    .status_overflow(),
    .status_bad_frame(),
    .status_good_frame()
);

axis_cobs_encode #(
    .APPEND_ZERO(1)
)
cobs_encode_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(fifo_tx_axis_tdata),
    .s_axis_tvalid(fifo_tx_axis_tvalid),
    .s_axis_tready(fifo_tx_axis_tready),
    .s_axis_tlast(fifo_tx_axis_tlast),
    .s_axis_tuser(fifo_tx_axis_tuser),
    // AXI output
    .m_axis_tdata(uart_tx_axis_tdata),
    .m_axis_tvalid(uart_tx_axis_tvalid),
    .m_axis_tready(uart_tx_axis_tready),
    .m_axis_tlast(),
    .m_axis_tuser()
);

axis_fifo #(
    .DEPTH(512),
    .DATA_WIDTH(8),
    .KEEP_ENABLE(0),
    .ID_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(1),
    .FRAME_FIFO(1),
    .DROP_BAD_FRAME(1),
    .DROP_WHEN_FULL(0)
)
tx_fifo_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(down_xfcp_in_tdata),
    .s_axis_tkeep(0),
    .s_axis_tvalid(down_xfcp_in_tvalid),
    .s_axis_tready(down_xfcp_in_tready),
    .s_axis_tlast(down_xfcp_in_tlast),
    .s_axis_tid(0),
    .s_axis_tdest(0),
    .s_axis_tuser(down_xfcp_in_tuser),
    // AXI output
    .m_axis_tdata(fifo_tx_axis_tdata),
    .m_axis_tkeep(),
    .m_axis_tvalid(fifo_tx_axis_tvalid),
    .m_axis_tready(fifo_tx_axis_tready),
    .m_axis_tlast(fifo_tx_axis_tlast),
    .m_axis_tid(),
    .m_axis_tdest(),
    .m_axis_tuser(fifo_tx_axis_tuser),
    // Status
    .status_overflow(),
    .status_bad_frame(),
    .status_good_frame()
);

endmodule
