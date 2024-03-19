/*

Copyright (c) 2014-2018 Alex Forencich

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
 * FPGA top-level module
 */
module ntps_top (
    /*
     * Clock: 125MHz LVDS
     * Reset: Push button, active low
     */
    input wire clk_125mhz_int,
    input wire rst_125mhz_int,

    /*
     * Ethernet: QSFP28
     */
    output wire       qsfp1_tx1_p,
    output wire       qsfp1_tx1_n,
    input  wire       qsfp1_rx1_p,
    input  wire       qsfp1_rx1_n,
    output wire       qsfp1_tx2_p,
    output wire       qsfp1_tx2_n,
    input  wire       qsfp1_rx2_p,
    input  wire       qsfp1_rx2_n,
    output wire       qsfp1_tx3_p,
    output wire       qsfp1_tx3_n,
    input  wire       qsfp1_rx3_p,
    input  wire       qsfp1_rx3_n,
    output wire       qsfp1_tx4_p,
    output wire       qsfp1_tx4_n,
    input  wire       qsfp1_rx4_p,
    input  wire       qsfp1_rx4_n,
    input  wire       qsfp1_mgt_refclk_0,
    // input  wire       qsfp1_mgt_refclk_1_p,
    // input  wire       qsfp1_mgt_refclk_1_n,
    // output wire       qsfp1_recclk_p,
    // output wire       qsfp1_recclk_n,
    output wire       qsfp1_modsell,
    output wire       qsfp1_resetl,
    input  wire       qsfp1_modprsl,
    input  wire       qsfp1_intl,
    output wire       qsfp1_lpmode
);

// Clock and reset

// XGMII 10G PHY
assign qsfp1_modsell = 1'b0;
assign qsfp1_resetl = 1'b1;
assign qsfp1_lpmode = 1'b0;

wire        qsfp1_tx_clk_1_int;
wire        qsfp1_tx_rst_1_int;
wire [63:0] qsfp1_txd_1_int;
wire [7:0]  qsfp1_txc_1_int;
wire        qsfp1_rx_clk_1_int;
wire        qsfp1_rx_rst_1_int;
wire [63:0] qsfp1_rxd_1_int;
wire [7:0]  qsfp1_rxc_1_int;
wire        qsfp1_tx_clk_2_int;
wire        qsfp1_tx_rst_2_int;
wire [63:0] qsfp1_txd_2_int;
wire [7:0]  qsfp1_txc_2_int;
wire        qsfp1_rx_clk_2_int;
wire        qsfp1_rx_rst_2_int;
wire [63:0] qsfp1_rxd_2_int;
wire [7:0]  qsfp1_rxc_2_int;
wire        qsfp1_tx_clk_3_int;
wire        qsfp1_tx_rst_3_int;
wire [63:0] qsfp1_txd_3_int;
wire [7:0]  qsfp1_txc_3_int;
wire        qsfp1_rx_clk_3_int;
wire        qsfp1_rx_rst_3_int;
wire [63:0] qsfp1_rxd_3_int;
wire [7:0]  qsfp1_rxc_3_int;
wire        qsfp1_tx_clk_4_int;
wire        qsfp1_tx_rst_4_int;
wire [63:0] qsfp1_txd_4_int;
wire [7:0]  qsfp1_txc_4_int;
wire        qsfp1_rx_clk_4_int;
wire        qsfp1_rx_rst_4_int;
wire [63:0] qsfp1_rxd_4_int;
wire [7:0]  qsfp1_rxc_4_int;

wire qsfp1_rx_block_lock_1;
wire qsfp1_rx_block_lock_2;
wire qsfp1_rx_block_lock_3;
wire qsfp1_rx_block_lock_4;

wire [3:0] gt_txclkout;
wire gt_txusrclk;

wire [3:0] gt_rxclkout;
wire [3:0] gt_rxusrclk;

wire gt_reset_tx_done;
wire gt_reset_rx_done;

wire [3:0] gt_txprgdivresetdone;
wire [3:0] gt_txpmaresetdone;
wire [3:0] gt_rxprgdivresetdone;
wire [3:0] gt_rxpmaresetdone;

wire gt_tx_reset = ~((&gt_txprgdivresetdone) & (&gt_txpmaresetdone));
wire gt_rx_reset = ~&gt_rxpmaresetdone;

reg gt_userclk_tx_active = 1'b0;
reg [3:0] gt_userclk_rx_active = 1'b0;

BUFG_GT bufg_gt_tx_usrclk_inst (
    .CE      (1'b1),
    .CEMASK  (1'b0),
    .CLR     (gt_tx_reset),
    .CLRMASK (1'b0),
    .DIV     (3'd0),
    .I       (gt_txclkout[0]),
    .O       (gt_txusrclk)
);

// Internal 156.25 MHz clock
wire clk_156mhz_int;
wire rst_156mhz_int;

assign clk_156mhz_int = gt_txusrclk;

always @(posedge gt_txusrclk, posedge gt_tx_reset) begin
    if (gt_tx_reset) begin
        gt_userclk_tx_active <= 1'b0;
    end else begin
        gt_userclk_tx_active <= 1'b1;
    end
end

genvar n;

generate

for (n = 0; n < 4; n = n + 1) begin

    BUFG_GT bufg_gt_rx_usrclk_inst (
        .CE      (1'b1),
        .CEMASK  (1'b0),
        .CLR     (gt_rx_reset),
        .CLRMASK (1'b0),
        .DIV     (3'd0),
        .I       (gt_rxclkout[n]),
        .O       (gt_rxusrclk[n])
    );

    always @(posedge gt_rxusrclk[n], posedge gt_rx_reset) begin
        if (gt_rx_reset) begin
            gt_userclk_rx_active[n] <= 1'b0;
        end else begin
            gt_userclk_rx_active[n] <= 1'b1;
        end
    end

end

endgenerate

sync_reset #(
    .N(4)
)
sync_reset_156mhz_inst (
    .clk(clk_156mhz_int),
    .rst(~gt_reset_tx_done),
    .out(rst_156mhz_int)
);

wire [5:0] qsfp1_gt_txheader_1;
wire [63:0] qsfp1_gt_txdata_1;
wire qsfp1_gt_rxgearboxslip_1;
wire [5:0] qsfp1_gt_rxheader_1;
wire [1:0] qsfp1_gt_rxheadervalid_1;
wire [63:0] qsfp1_gt_rxdata_1;
wire [1:0] qsfp1_gt_rxdatavalid_1;

wire [5:0] qsfp1_gt_txheader_2;
wire [63:0] qsfp1_gt_txdata_2;
wire qsfp1_gt_rxgearboxslip_2;
wire [5:0] qsfp1_gt_rxheader_2;
wire [1:0] qsfp1_gt_rxheadervalid_2;
wire [63:0] qsfp1_gt_rxdata_2;
wire [1:0] qsfp1_gt_rxdatavalid_2;

wire [5:0] qsfp1_gt_txheader_3;
wire [63:0] qsfp1_gt_txdata_3;
wire qsfp1_gt_rxgearboxslip_3;
wire [5:0] qsfp1_gt_rxheader_3;
wire [1:0] qsfp1_gt_rxheadervalid_3;
wire [63:0] qsfp1_gt_rxdata_3;
wire [1:0] qsfp1_gt_rxdatavalid_3;

wire [5:0] qsfp1_gt_txheader_4;
wire [63:0] qsfp1_gt_txdata_4;
wire qsfp1_gt_rxgearboxslip_4;
wire [5:0] qsfp1_gt_rxheader_4;
wire [1:0] qsfp1_gt_rxheadervalid_4;
wire [63:0] qsfp1_gt_rxdata_4;
wire [1:0] qsfp1_gt_rxdatavalid_4;

gtwizard_ultrascale_0
qsfp_gty_inst (
    .gtwiz_userclk_tx_active_in(&gt_userclk_tx_active),
    .gtwiz_userclk_rx_active_in(&gt_userclk_rx_active),

    .gtwiz_reset_clk_freerun_in(clk_125mhz_int),
    .gtwiz_reset_all_in(rst_125mhz_int),

    .gtwiz_reset_tx_pll_and_datapath_in(1'b0),
    .gtwiz_reset_tx_datapath_in(1'b0),

    .gtwiz_reset_rx_pll_and_datapath_in(1'b0),
    .gtwiz_reset_rx_datapath_in(1'b0),

    .gtwiz_reset_rx_cdr_stable_out(),

    .gtwiz_reset_tx_done_out(gt_reset_tx_done),
    .gtwiz_reset_rx_done_out(gt_reset_rx_done),

    .gtrefclk00_in({qsfp1_mgt_refclk_0}),

    .qpll0outclk_out(),
    .qpll0outrefclk_out(),

    .gtyrxn_in({qsfp1_rx4_n, qsfp1_rx3_n, qsfp1_rx2_n, qsfp1_rx1_n}),
    .gtyrxp_in({qsfp1_rx4_p, qsfp1_rx3_p, qsfp1_rx2_p, qsfp1_rx1_p}),

    .rxusrclk_in(gt_rxusrclk),
    .rxusrclk2_in(gt_rxusrclk),

    .gtwiz_userdata_tx_in({qsfp1_gt_txdata_4, qsfp1_gt_txdata_3, qsfp1_gt_txdata_2, qsfp1_gt_txdata_1}),
    .txheader_in({qsfp1_gt_txheader_4, qsfp1_gt_txheader_3, qsfp1_gt_txheader_2, qsfp1_gt_txheader_1}),
    .txsequence_in({4{1'b0}}),

    .txusrclk_in({4{gt_txusrclk}}),
    .txusrclk2_in({4{gt_txusrclk}}),

    .gtpowergood_out(),

    .gtytxn_out({qsfp1_tx4_n, qsfp1_tx3_n, qsfp1_tx2_n, qsfp1_tx1_n}),
    .gtytxp_out({qsfp1_tx4_p, qsfp1_tx3_p, qsfp1_tx2_p, qsfp1_tx1_p}),

    .rxgearboxslip_in({qsfp1_gt_rxgearboxslip_4, qsfp1_gt_rxgearboxslip_3, qsfp1_gt_rxgearboxslip_2, qsfp1_gt_rxgearboxslip_1}),
    .gtwiz_userdata_rx_out({qsfp1_gt_rxdata_4, qsfp1_gt_rxdata_3, qsfp1_gt_rxdata_2, qsfp1_gt_rxdata_1}),
    .rxdatavalid_out({qsfp1_gt_rxdatavalid_4, qsfp1_gt_rxdatavalid_3, qsfp1_gt_rxdatavalid_2, qsfp1_gt_rxdatavalid_1}),
    .rxheader_out({qsfp1_gt_rxheader_4, qsfp1_gt_rxheader_3, qsfp1_gt_rxheader_2, qsfp1_gt_rxheader_1}),
    .rxheadervalid_out({qsfp1_gt_rxheadervalid_4, qsfp1_gt_rxheadervalid_3, qsfp1_gt_rxheadervalid_2, qsfp1_gt_rxheadervalid_1}),
    .rxoutclk_out(gt_rxclkout),
    .rxpmaresetdone_out(gt_rxpmaresetdone),
    .rxprgdivresetdone_out(gt_rxprgdivresetdone),
    .rxstartofseq_out(),

    .txoutclk_out(gt_txclkout),
    .txpmaresetdone_out(gt_txpmaresetdone),
    .txprgdivresetdone_out(gt_txprgdivresetdone)
);

assign qsfp1_tx_clk_1_int = clk_156mhz_int;
assign qsfp1_tx_rst_1_int = rst_156mhz_int;

assign qsfp1_rx_clk_1_int = gt_rxusrclk[0];

sync_reset #(
    .N(4)
)
qsfp1_rx_rst_1_reset_sync_inst (
    .clk(qsfp1_rx_clk_1_int),
    .rst(~gt_reset_rx_done),
    .out(qsfp1_rx_rst_1_int)
);

eth_phy_10g #(
    .BIT_REVERSE(1)
)
qsfp1_phy_1_inst (
    .tx_clk(qsfp1_tx_clk_1_int),
    .tx_rst(qsfp1_tx_rst_1_int),
    .rx_clk(qsfp1_rx_clk_1_int),
    .rx_rst(qsfp1_rx_rst_1_int),
    .xgmii_txd(qsfp1_txd_1_int),
    .xgmii_txc(qsfp1_txc_1_int),
    .xgmii_rxd(qsfp1_rxd_1_int),
    .xgmii_rxc(qsfp1_rxc_1_int),
    .serdes_tx_data(qsfp1_gt_txdata_1),
    .serdes_tx_hdr(qsfp1_gt_txheader_1),
    .serdes_rx_data(qsfp1_gt_rxdata_1),
    .serdes_rx_hdr(qsfp1_gt_rxheader_1),
    .serdes_rx_bitslip(qsfp1_gt_rxgearboxslip_1),
    .rx_block_lock(qsfp1_rx_block_lock_1),
    .rx_high_ber()
);

assign qsfp1_tx_clk_2_int = clk_156mhz_int;
assign qsfp1_tx_rst_2_int = rst_156mhz_int;

assign qsfp1_rx_clk_2_int = gt_rxusrclk[1];

sync_reset #(
    .N(4)
)
qsfp1_rx_rst_2_reset_sync_inst (
    .clk(qsfp1_rx_clk_2_int),
    .rst(~gt_reset_rx_done),
    .out(qsfp1_rx_rst_2_int)
);

eth_phy_10g #(
    .BIT_REVERSE(1)
)
qsfp1_phy_2_inst (
    .tx_clk(qsfp1_tx_clk_2_int),
    .tx_rst(qsfp1_tx_rst_2_int),
    .rx_clk(qsfp1_rx_clk_2_int),
    .rx_rst(qsfp1_rx_rst_2_int),
    .xgmii_txd(qsfp1_txd_2_int),
    .xgmii_txc(qsfp1_txc_2_int),
    .xgmii_rxd(qsfp1_rxd_2_int),
    .xgmii_rxc(qsfp1_rxc_2_int),
    .serdes_tx_data(qsfp1_gt_txdata_2),
    .serdes_tx_hdr(qsfp1_gt_txheader_2),
    .serdes_rx_data(qsfp1_gt_rxdata_2),
    .serdes_rx_hdr(qsfp1_gt_rxheader_2),
    .serdes_rx_bitslip(qsfp1_gt_rxgearboxslip_2),
    .rx_block_lock(qsfp1_rx_block_lock_2),
    .rx_high_ber()
);

assign qsfp1_tx_clk_3_int = clk_156mhz_int;
assign qsfp1_tx_rst_3_int = rst_156mhz_int;

assign qsfp1_rx_clk_3_int = gt_rxusrclk[2];

sync_reset #(
    .N(4)
)
qsfp1_rx_rst_3_reset_sync_inst (
    .clk(qsfp1_rx_clk_3_int),
    .rst(~gt_reset_rx_done),
    .out(qsfp1_rx_rst_3_int)
);

eth_phy_10g #(
    .BIT_REVERSE(1)
)
qsfp1_phy_3_inst (
    .tx_clk(qsfp1_tx_clk_3_int),
    .tx_rst(qsfp1_tx_rst_3_int),
    .rx_clk(qsfp1_rx_clk_3_int),
    .rx_rst(qsfp1_rx_rst_3_int),
    .xgmii_txd(qsfp1_txd_3_int),
    .xgmii_txc(qsfp1_txc_3_int),
    .xgmii_rxd(qsfp1_rxd_3_int),
    .xgmii_rxc(qsfp1_rxc_3_int),
    .serdes_tx_data(qsfp1_gt_txdata_3),
    .serdes_tx_hdr(qsfp1_gt_txheader_3),
    .serdes_rx_data(qsfp1_gt_rxdata_3),
    .serdes_rx_hdr(qsfp1_gt_rxheader_3),
    .serdes_rx_bitslip(qsfp1_gt_rxgearboxslip_3),
    .rx_block_lock(qsfp1_rx_block_lock_3),
    .rx_high_ber()
);

assign qsfp1_tx_clk_4_int = clk_156mhz_int;
assign qsfp1_tx_rst_4_int = rst_156mhz_int;

assign qsfp1_rx_clk_4_int = gt_rxusrclk[3];

sync_reset #(
    .N(4)
)
qsfp1_rx_rst_4_reset_sync_inst (
    .clk(qsfp1_rx_clk_4_int),
    .rst(~gt_reset_rx_done),
    .out(qsfp1_rx_rst_4_int)
);

eth_phy_10g #(
    .BIT_REVERSE(1)
)
qsfp1_phy_4_inst (
    .tx_clk(qsfp1_tx_clk_4_int),
    .tx_rst(qsfp1_tx_rst_4_int),
    .rx_clk(qsfp1_rx_clk_4_int),
    .rx_rst(qsfp1_rx_rst_4_int),
    .xgmii_txd(qsfp1_txd_4_int),
    .xgmii_txc(qsfp1_txc_4_int),
    .xgmii_rxd(qsfp1_rxd_4_int),
    .xgmii_rxc(qsfp1_rxc_4_int),
    .serdes_tx_data(qsfp1_gt_txdata_4),
    .serdes_tx_hdr(qsfp1_gt_txheader_4),
    .serdes_rx_data(qsfp1_gt_rxdata_4),
    .serdes_rx_hdr(qsfp1_gt_rxheader_4),
    .serdes_rx_bitslip(qsfp1_gt_rxgearboxslip_4),
    .rx_block_lock(qsfp1_rx_block_lock_4),
    .rx_high_ber()
);

fpga_core
core_inst (
    /*
     * Clock: 156.25 MHz
     * Synchronous reset
     */
    .clk(clk_156mhz_int),
    .rst(rst_156mhz_int),

    /*
     * Ethernet: QSFP28
     */
    .qsfp1_tx_clk_1(qsfp1_tx_clk_1_int),
    .qsfp1_tx_rst_1(qsfp1_tx_rst_1_int),
    .qsfp1_txd_1(qsfp1_txd_1_int),
    .qsfp1_txc_1(qsfp1_txc_1_int),
    .qsfp1_rx_clk_1(qsfp1_rx_clk_1_int),
    .qsfp1_rx_rst_1(qsfp1_rx_rst_1_int),
    .qsfp1_rxd_1(qsfp1_rxd_1_int),
    .qsfp1_rxc_1(qsfp1_rxc_1_int),
    .qsfp1_tx_clk_2(qsfp1_tx_clk_2_int),
    .qsfp1_tx_rst_2(qsfp1_tx_rst_2_int),
    .qsfp1_txd_2(qsfp1_txd_2_int),
    .qsfp1_txc_2(qsfp1_txc_2_int),
    .qsfp1_rx_clk_2(qsfp1_rx_clk_2_int),
    .qsfp1_rx_rst_2(qsfp1_rx_rst_2_int),
    .qsfp1_rxd_2(qsfp1_rxd_2_int),
    .qsfp1_rxc_2(qsfp1_rxc_2_int),
    .qsfp1_tx_clk_3(qsfp1_tx_clk_3_int),
    .qsfp1_tx_rst_3(qsfp1_tx_rst_3_int),
    .qsfp1_txd_3(qsfp1_txd_3_int),
    .qsfp1_txc_3(qsfp1_txc_3_int),
    .qsfp1_rx_clk_3(qsfp1_rx_clk_3_int),
    .qsfp1_rx_rst_3(qsfp1_rx_rst_3_int),
    .qsfp1_rxd_3(qsfp1_rxd_3_int),
    .qsfp1_rxc_3(qsfp1_rxc_3_int),
    .qsfp1_tx_clk_4(qsfp1_tx_clk_4_int),
    .qsfp1_tx_rst_4(qsfp1_tx_rst_4_int),
    .qsfp1_txd_4(qsfp1_txd_4_int),
    .qsfp1_txc_4(qsfp1_txc_4_int),
    .qsfp1_rx_clk_4(qsfp1_rx_clk_4_int),
    .qsfp1_rx_rst_4(qsfp1_rx_rst_4_int),
    .qsfp1_rxd_4(qsfp1_rxd_4_int),
    .qsfp1_rxc_4(qsfp1_rxc_4_int)
);

endmodule
