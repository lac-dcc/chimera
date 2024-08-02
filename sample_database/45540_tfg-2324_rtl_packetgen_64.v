// This program was cloned from: https://github.com/p-ariza/tfg-2324
// License: MIT License

/*

Copyright (c) 2024 Pablo Ariza García

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

`resetall
`timescale 1ns / 10fs
`default_nettype none

module packetgen_64 #(
    parameter DATA_WIDTH=512,
    parameter FREQUENCY = 350000000,
    parameter N_FLOWS = 4,

    //Flow characteristics
    parameter BANDWIDTHS = {32'd1000000000, 32'd1000000000, 32'd1000000000, 32'd1000000000},
    parameter SIZES = {11'd192, 11'd192, 11'd192, 11'd192},

    //Packet contents
    parameter D_MACS = {48'hABCDEF000001, 48'hABCDEF000002, 48'hABCDEF000003, 48'hABCDEF000004},
    parameter S_MACS = {48'hBEEFBEEF0001, 48'hBEEFBEEF0002, 48'hBEEFBEEF0003, 48'hBEEFBEEF0004},
    parameter ETHERTYPES = {16'h0800, 16'h0800, 16'h0800, 16'h0800}, 
    parameter PAYLOADS = {8'hAA, 8'hBB, 8'hCC, 8'hDD},

    //FIFO depth
    parameter DEPTH = 4096
)
(
    input wire clk,
    input wire rst,
    //AXI Stream
    //input  wire						axis_tready,
    output wire [63:0]	axis_tdata,
    output wire [7:0]	axis_tkeep,
    output wire 		axis_tvalid,
    output wire 		axis_tlast
);

    wire [DATA_WIDTH-1:0]   pg_axis_tdata;
    wire [DATA_WIDTH/8-1:0] pg_axis_tkeep;
    wire                    pg_axis_tvalid;
    wire                    pg_axis_tready;
    wire                    pg_axis_tlast;

    packetgen #(
        .DATA_WIDTH(DATA_WIDTH),
        .FREQUENCY(FREQUENCY),
        .N_FLOWS(N_FLOWS),
        .BANDWIDTHS(BANDWIDTHS),
        .SIZES(SIZES),
        .D_MACS(D_MACS),
        .S_MACS(S_MACS),
        .ETHERTYPES(ETHERTYPES),
        .PAYLOADS(PAYLOADS)
    ) generator (
        .clk(clk),
        .rst(rst),
        .axis_tdata(pg_axis_tdata),
        .axis_tkeep(pg_axis_tkeep),
        .axis_tvalid(pg_axis_tvalid),
        .axis_tlast(pg_axis_tlast)
    );

    axis_fifo_adapter #(
        .DEPTH(DEPTH),
        .S_DATA_WIDTH(DATA_WIDTH),
        .S_KEEP_WIDTH((DATA_WIDTH+7)/8),

        .M_DATA_WIDTH(64),
        .M_KEEP_WIDTH(64/8),

        .FRAME_FIFO(0)
    ) adapter (
        .clk(clk),
        .rst(rst),

        .s_axis_tdata(pg_axis_tdata),
        .s_axis_tkeep(pg_axis_tkeep),
        .s_axis_tvalid(pg_axis_tvalid),
        
        .s_axis_tlast(pg_axis_tlast),

        .m_axis_tdata(axis_tdata),
        .m_axis_tkeep(axis_tkeep),
        .m_axis_tvalid(axis_tvalid),
        .m_axis_tready(1),
        .m_axis_tlast(axis_tlast)
    );

endmodule