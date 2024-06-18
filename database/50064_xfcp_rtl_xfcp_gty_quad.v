// This program was cloned from: https://github.com/alexforencich/xfcp
// License: MIT License

/*

Copyright (c) 2017-2022 Alex Forencich

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
 * XFCP GTY quad module
 */
module xfcp_gty_quad #
(
    parameter CH = 4,
    parameter COM = 1,
    parameter SW_XFCP_ID_TYPE = 16'h0100,
    parameter SW_XFCP_ID_STR = "GTY QUAD",
    parameter SW_XFCP_EXT_ID = 0,
    parameter SW_XFCP_EXT_ID_STR = "",
    parameter COM_XFCP_ID_TYPE = 16'h8A82,
    parameter COM_XFCP_ID_STR = "GTY COM",
    parameter COM_XFCP_EXT_ID = 0,
    parameter COM_XFCP_EXT_ID_STR = "",
    parameter CH_0_XFCP_ID_TYPE = 16'h8A83,
    parameter CH_0_XFCP_ID_STR = "GTY CH0",
    parameter CH_0_XFCP_EXT_ID = 0,
    parameter CH_0_XFCP_EXT_ID_STR = "",
    parameter CH_1_XFCP_ID_TYPE = 16'h8A83,
    parameter CH_1_XFCP_ID_STR = "GTY CH1",
    parameter CH_1_XFCP_EXT_ID = 0,
    parameter CH_1_XFCP_EXT_ID_STR = "",
    parameter CH_2_XFCP_ID_TYPE = 16'h8A83,
    parameter CH_2_XFCP_ID_STR = "GTY CH2",
    parameter CH_2_XFCP_EXT_ID = 0,
    parameter CH_2_XFCP_EXT_ID_STR = "",
    parameter CH_3_XFCP_ID_TYPE = 16'h8A83,
    parameter CH_3_XFCP_ID_STR = "GTY CH3",
    parameter CH_3_XFCP_EXT_ID = 0,
    parameter CH_3_XFCP_EXT_ID_STR = "",
    parameter COM_ADDR_WIDTH = 10,
    parameter CH_ADDR_WIDTH = 10
)
(
    input  wire                         clk,
    input  wire                         rst,

    /*
     * XFCP upstream interface
     */
    input  wire [7:0]                   up_xfcp_in_tdata,
    input  wire                         up_xfcp_in_tvalid,
    output wire                         up_xfcp_in_tready,
    input  wire                         up_xfcp_in_tlast,
    input  wire                         up_xfcp_in_tuser,

    output wire [7:0]                   up_xfcp_out_tdata,
    output wire                         up_xfcp_out_tvalid,
    input  wire                         up_xfcp_out_tready,
    output wire                         up_xfcp_out_tlast,
    output wire                         up_xfcp_out_tuser,

    /*
     * Common interface
     */
    output wire [COM_ADDR_WIDTH-1:0]    gty_com_drp_addr,
    output wire [15:0]                  gty_com_drp_do,
    input  wire [15:0]                  gty_com_drp_di,
    output wire                         gty_com_drp_en,
    output wire                         gty_com_drp_we,
    input  wire                         gty_com_drp_rdy,

    /*
     * Transceiver interface
     */
    output wire [CH*CH_ADDR_WIDTH-1:0]  gty_drp_addr,
    output wire [CH*16-1:0]             gty_drp_do,
    input  wire [CH*16-1:0]             gty_drp_di,
    output wire [CH-1:0]                gty_drp_en,
    output wire [CH-1:0]                gty_drp_we,
    input  wire [CH-1:0]                gty_drp_rdy,

    output wire [CH-1:0]                gty_reset,
    output wire [CH-1:0]                gty_tx_pcs_reset,
    output wire [CH-1:0]                gty_tx_pma_reset,
    output wire [CH-1:0]                gty_rx_pcs_reset,
    output wire [CH-1:0]                gty_rx_pma_reset,
    output wire [CH-1:0]                gty_rx_dfe_lpm_reset,
    output wire [CH-1:0]                gty_eyescan_reset,
    input  wire [CH-1:0]                gty_tx_reset_done,
    input  wire [CH-1:0]                gty_tx_pma_reset_done,
    input  wire [CH-1:0]                gty_rx_reset_done,
    input  wire [CH-1:0]                gty_rx_pma_reset_done,

    input  wire [CH-1:0]                gty_txusrclk2,
    output wire [CH*4-1:0]              gty_txprbssel,
    output wire [CH-1:0]                gty_txprbsforceerr,
    output wire [CH-1:0]                gty_txpolarity,
    output wire [CH-1:0]                gty_txelecidle,
    output wire [CH-1:0]                gty_txinhibit,
    output wire [CH*5-1:0]              gty_txdiffctrl,
    output wire [CH*7-1:0]              gty_txmaincursor,
    output wire [CH*5-1:0]              gty_txpostcursor,
    output wire [CH*5-1:0]              gty_txprecursor,

    input  wire [CH-1:0]                gty_rxusrclk2,
    output wire [CH-1:0]                gty_rxpolarity,
    output wire [CH-1:0]                gty_rxprbscntreset,
    output wire [CH*4-1:0]              gty_rxprbssel,
    input  wire [CH-1:0]                gty_rxprbserr,
    input  wire [CH-1:0]                gty_rxprbslocked
);

parameter N = (COM ? 1 : 0)+CH;

// check configuration
initial begin
    if (CH < 1 || CH > 4) begin
        $error("Error: CH must be between 1 and 4 (instance %m)");
        $finish;
    end
end

wire [N*8-1:0] xfcp_gty_up_tdata;
wire [N-1:0] xfcp_gty_up_tvalid;
wire [N-1:0] xfcp_gty_up_tready;
wire [N-1:0] xfcp_gty_up_tlast;
wire [N-1:0] xfcp_gty_up_tuser;
wire [N*8-1:0] xfcp_gty_down_tdata;
wire [N-1:0] xfcp_gty_down_tvalid;
wire [N-1:0] xfcp_gty_down_tready;
wire [N-1:0] xfcp_gty_down_tlast;
wire [N-1:0] xfcp_gty_down_tuser;

xfcp_switch #(
    .PORTS(N),
    .XFCP_ID_TYPE(SW_XFCP_ID_TYPE),
    .XFCP_ID_STR(SW_XFCP_ID_STR),
    .XFCP_EXT_ID(SW_XFCP_EXT_ID),
    .XFCP_EXT_ID_STR(SW_XFCP_EXT_ID_STR)
)
xfcp_switch_inst (
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
    .down_xfcp_in_tdata(xfcp_gty_up_tdata),
    .down_xfcp_in_tvalid(xfcp_gty_up_tvalid),
    .down_xfcp_in_tready(xfcp_gty_up_tready),
    .down_xfcp_in_tlast(xfcp_gty_up_tlast),
    .down_xfcp_in_tuser(xfcp_gty_up_tuser),
    .down_xfcp_out_tdata(xfcp_gty_down_tdata),
    .down_xfcp_out_tvalid(xfcp_gty_down_tvalid),
    .down_xfcp_out_tready(xfcp_gty_down_tready),
    .down_xfcp_out_tlast(xfcp_gty_down_tlast),
    .down_xfcp_out_tuser(xfcp_gty_down_tuser)
);

generate
    genvar n;

    for (n = 0; n < CH; n = n + 1) begin : channels

        xfcp_mod_gty #(
            .XFCP_ID_TYPE(n == 0 ? CH_0_XFCP_ID_TYPE : (n == 1 ? CH_1_XFCP_ID_TYPE : ( n == 2 ? CH_2_XFCP_ID_TYPE : CH_3_XFCP_ID_TYPE))),
            .XFCP_ID_STR(n == 0 ? CH_0_XFCP_ID_STR : (n == 1 ? CH_1_XFCP_ID_STR : ( n == 2 ? CH_2_XFCP_ID_STR : CH_3_XFCP_ID_STR))),
            .XFCP_EXT_ID(n == 0 ? CH_0_XFCP_EXT_ID : (n == 1 ? CH_1_XFCP_EXT_ID : ( n == 2 ? CH_2_XFCP_EXT_ID : CH_3_XFCP_EXT_ID))),
            .XFCP_EXT_ID_STR(n == 0 ? CH_0_XFCP_EXT_ID_STR : (n == 1 ? CH_1_XFCP_EXT_ID_STR : ( n == 2 ? CH_2_XFCP_EXT_ID_STR : CH_3_XFCP_EXT_ID_STR))),
            .ADDR_WIDTH(CH_ADDR_WIDTH)
        )
        xfcp_mod_gty_inst (
            .clk(clk),
            .rst(rst),
            .up_xfcp_in_tdata(xfcp_gty_down_tdata[n*8 +: 8]),
            .up_xfcp_in_tvalid(xfcp_gty_down_tvalid[n +: 1]),
            .up_xfcp_in_tready(xfcp_gty_down_tready[n +: 1]),
            .up_xfcp_in_tlast(xfcp_gty_down_tlast[n +: 1]),
            .up_xfcp_in_tuser(xfcp_gty_down_tuser[n +: 1]),
            .up_xfcp_out_tdata(xfcp_gty_up_tdata[n*8 +: 8]),
            .up_xfcp_out_tvalid(xfcp_gty_up_tvalid[n +: 1]),
            .up_xfcp_out_tready(xfcp_gty_up_tready[n +: 1]),
            .up_xfcp_out_tlast(xfcp_gty_up_tlast[n +: 1]),
            .up_xfcp_out_tuser(xfcp_gty_up_tuser[n +: 1]),
            .gty_drp_addr(gty_drp_addr[n*CH_ADDR_WIDTH +: CH_ADDR_WIDTH]),
            .gty_drp_do(gty_drp_do[n*16 +: 16]),
            .gty_drp_di(gty_drp_di[n*16 +: 16]),
            .gty_drp_en(gty_drp_en[n +: 1]),
            .gty_drp_we(gty_drp_we[n +: 1]),
            .gty_drp_rdy(gty_drp_rdy[n +: 1]),
            .gty_reset(gty_reset[n +: 1]),
            .gty_tx_pcs_reset(gty_tx_pcs_reset[n +: 1]),
            .gty_tx_pma_reset(gty_tx_pma_reset[n +: 1]),
            .gty_rx_pcs_reset(gty_rx_pcs_reset[n +: 1]),
            .gty_rx_pma_reset(gty_rx_pma_reset[n +: 1]),
            .gty_rx_dfe_lpm_reset(gty_rx_dfe_lpm_reset[n +: 1]),
            .gty_eyescan_reset(gty_eyescan_reset[n +: 1]),
            .gty_tx_reset_done(gty_tx_reset_done[n +: 1]),
            .gty_tx_pma_reset_done(gty_tx_pma_reset_done[n +: 1]),
            .gty_rx_reset_done(gty_rx_reset_done[n +: 1]),
            .gty_rx_pma_reset_done(gty_rx_pma_reset_done[n +: 1]),
            .gty_txusrclk2(gty_txusrclk2[n +: 1]),
            .gty_txprbssel(gty_txprbssel[n*4 +: 4]),
            .gty_txprbsforceerr(gty_txprbsforceerr[n +: 1]),
            .gty_txpolarity(gty_txpolarity[n +: 1]),
            .gty_txelecidle(gty_txelecidle[n +: 1]),
            .gty_txinhibit(gty_txinhibit[n +: 1]),
            .gty_txdiffctrl(gty_txdiffctrl[n*5 +: 5]),
            .gty_txmaincursor(gty_txmaincursor[n*7 +: 7]),
            .gty_txpostcursor(gty_txpostcursor[n*5 +: 5]),
            .gty_txprecursor(gty_txprecursor[n*5 +: 5]),
            .gty_rxusrclk2(gty_rxusrclk2[n +: 1]),
            .gty_rxpolarity(gty_rxpolarity[n +: 1]),
            .gty_rxprbscntreset(gty_rxprbscntreset[n +: 1]),
            .gty_rxprbssel(gty_rxprbssel[n*4 +: 4]),
            .gty_rxprbserr(gty_rxprbserr[n +: 1]),
            .gty_rxprbslocked(gty_rxprbslocked[n +: 1])
        );

    end

    if (COM) begin

        xfcp_mod_drp #(
            .XFCP_ID_TYPE(COM_XFCP_ID_TYPE),
            .XFCP_ID_STR(COM_XFCP_ID_STR),
            .XFCP_EXT_ID(COM_XFCP_EXT_ID),
            .XFCP_EXT_ID_STR(COM_XFCP_EXT_ID_STR),
            .ADDR_WIDTH(COM_ADDR_WIDTH)
        )
        xfcp_mod_drp_inst (
            .clk(clk),
            .rst(rst),
            .up_xfcp_in_tdata(xfcp_gty_down_tdata[CH*8 +: 8]),
            .up_xfcp_in_tvalid(xfcp_gty_down_tvalid[CH +: 1]),
            .up_xfcp_in_tready(xfcp_gty_down_tready[CH +: 1]),
            .up_xfcp_in_tlast(xfcp_gty_down_tlast[CH +: 1]),
            .up_xfcp_in_tuser(xfcp_gty_down_tuser[CH +: 1]),
            .up_xfcp_out_tdata(xfcp_gty_up_tdata[CH*8 +: 8]),
            .up_xfcp_out_tvalid(xfcp_gty_up_tvalid[CH +: 1]),
            .up_xfcp_out_tready(xfcp_gty_up_tready[CH +: 1]),
            .up_xfcp_out_tlast(xfcp_gty_up_tlast[CH +: 1]),
            .up_xfcp_out_tuser(xfcp_gty_up_tuser[CH +: 1]),
            .drp_addr(gty_com_drp_addr),
            .drp_do(gty_com_drp_do),
            .drp_di(gty_com_drp_di),
            .drp_en(gty_com_drp_en),
            .drp_we(gty_com_drp_we),
            .drp_rdy(gty_com_drp_rdy)
        );

    end
endgenerate

endmodule
