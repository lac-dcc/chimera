// This program was cloned from: https://github.com/alexforencich/xfcp
// License: MIT License

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
 * XFCP DRP module
 */
module xfcp_mod_drp #
(
    parameter XFCP_ID_TYPE = 16'h0001,
    parameter XFCP_ID_STR = "DRP",
    parameter XFCP_EXT_ID = 0,
    parameter XFCP_EXT_ID_STR = "",
    parameter ADDR_WIDTH = 10
)
(
    input  wire                    clk,
    input  wire                    rst,

    /*
     * XFCP upstream interface
     */
    input  wire [7:0]              up_xfcp_in_tdata,
    input  wire                    up_xfcp_in_tvalid,
    output wire                    up_xfcp_in_tready,
    input  wire                    up_xfcp_in_tlast,
    input  wire                    up_xfcp_in_tuser,

    output wire [7:0]              up_xfcp_out_tdata,
    output wire                    up_xfcp_out_tvalid,
    input  wire                    up_xfcp_out_tready,
    output wire                    up_xfcp_out_tlast,
    output wire                    up_xfcp_out_tuser,

    /*
     * DRP interface
     */
    output wire [ADDR_WIDTH-1:0]   drp_addr,
    output wire [15:0]             drp_do,
    input  wire [15:0]             drp_di,
    output wire                    drp_en,
    output wire                    drp_we,
    input  wire                    drp_rdy
);

wire [ADDR_WIDTH-1:0] wb_adr;
wire [15:0] wb_dat_m;
wire [15:0] wb_dat_drp;
wire wb_we;
wire wb_stb;
wire wb_ack_drp;
wire wb_cyc;

xfcp_mod_wb #(
    .XFCP_ID_TYPE(XFCP_ID_TYPE),
    .XFCP_ID_STR(XFCP_ID_STR),
    .XFCP_EXT_ID(XFCP_EXT_ID),
    .XFCP_EXT_ID_STR(XFCP_EXT_ID_STR),
    .COUNT_SIZE(16),
    .WB_DATA_WIDTH(16),
    .WB_ADDR_WIDTH(ADDR_WIDTH),
    .WB_SELECT_WIDTH(1)
)
xfcp_mod_wb_inst (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(up_xfcp_in_tdata),
    .up_xfcp_in_tvalid(up_xfcp_in_tvalid),
    .up_xfcp_in_tready(up_xfcp_in_tready),
    .up_xfcp_in_tlast(up_xfcp_in_tlast),
    .up_xfcp_in_tuser(up_xfcp_in_tuser),
    .up_xfcp_out_tdata(up_xfcp_out_tdata),
    .up_xfcp_out_tvalid(up_xfcp_out_tvalid),
    .up_xfcp_out_tready(up_xfcp_out_tready),
    .up_xfcp_out_tlast(up_xfcp_out_tlast),
    .up_xfcp_out_tuser(up_xfcp_out_tuser),
    .wb_adr_o(wb_adr),
    .wb_dat_i(wb_dat_drp),
    .wb_dat_o(wb_dat_m),
    .wb_we_o(wb_we),
    .wb_sel_o(),
    .wb_stb_o(wb_stb),
    .wb_ack_i(wb_ack_drp),
    .wb_err_i(1'b0),
    .wb_cyc_o(wb_cyc)
);

wb_drp #(
    .ADDR_WIDTH(ADDR_WIDTH)
)
wb_drp_inst (
    .clk(clk),
    .rst(rst),
    .wb_adr_i(wb_adr[ADDR_WIDTH-1:0]),
    .wb_dat_i(wb_dat_m),
    .wb_dat_o(wb_dat_drp),
    .wb_we_i(wb_we),
    .wb_stb_i(wb_stb),
    .wb_ack_o(wb_ack_drp),
    .wb_cyc_i(wb_cyc),
    .drp_addr(drp_addr),
    .drp_do(drp_do),
    .drp_di(drp_di),
    .drp_en(drp_en),
    .drp_we(drp_we),
    .drp_rdy(drp_rdy)
);

endmodule
