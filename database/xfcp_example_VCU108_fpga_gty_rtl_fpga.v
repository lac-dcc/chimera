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
 * FPGA top-level module
 */
module fpga (
    /*
     * Clock: 125MHz LVDS
     * Reset: Push button, active low
     */
    input  wire       clk_125mhz_p,
    input  wire       clk_125mhz_n,
    input  wire       reset,

    /*
     * GPIO
     */
    input  wire       btnu,
    input  wire       btnl,
    input  wire       btnd,
    input  wire       btnr,
    input  wire       btnc,
    input  wire [3:0] sw,
    output wire [7:0] led,

    /*
     * I2C for board management
     */
    inout  wire       i2c_scl,
    inout  wire       i2c_sda,

    /*
     * Ethernet: QSFP28
     */
    input  wire       qsfp_rx1_p,
    input  wire       qsfp_rx1_n,
    input  wire       qsfp_rx2_p,
    input  wire       qsfp_rx2_n,
    input  wire       qsfp_rx3_n,
    input  wire       qsfp_rx3_p,
    input  wire       qsfp_rx4_p,
    input  wire       qsfp_rx4_n,
    output wire       qsfp_tx1_p,
    output wire       qsfp_tx1_n,
    output wire       qsfp_tx2_p,
    output wire       qsfp_tx2_n,
    output wire       qsfp_tx3_p,
    output wire       qsfp_tx3_n,
    output wire       qsfp_tx4_p,
    output wire       qsfp_tx4_n,
    input  wire       qsfp_mgt_refclk_0_p,
    input  wire       qsfp_mgt_refclk_0_n,
    // input  wire       qsfp_mgt_refclk_1_p,
    // input  wire       qsfp_mgt_refclk_1_n,
    // output wire       qsfp_recclk_p,
    // output wire       qsfp_recclk_n,
    output wire       qsfp_modsell,
    output wire       qsfp_resetl,
    input  wire       qsfp_modprsl,
    input  wire       qsfp_intl,
    output wire       qsfp_lpmode,

    /*
     * Ethernet: CFP2 GTY
     */
    input  wire       cfp2_rx0_p,
    input  wire       cfp2_rx0_n,
    input  wire       cfp2_rx1_p,
    input  wire       cfp2_rx1_n,
    input  wire       cfp2_rx2_n,
    input  wire       cfp2_rx2_p,
    input  wire       cfp2_rx3_p,
    input  wire       cfp2_rx3_n,
    input  wire       cfp2_rx4_p,
    input  wire       cfp2_rx4_n,
    input  wire       cfp2_rx5_p,
    input  wire       cfp2_rx5_n,
    input  wire       cfp2_rx6_p,
    input  wire       cfp2_rx6_n,
    input  wire       cfp2_rx7_p,
    input  wire       cfp2_rx7_n,
    input  wire       cfp2_rx8_p,
    input  wire       cfp2_rx8_n,
    input  wire       cfp2_rx9_p,
    input  wire       cfp2_rx9_n,
    output wire       cfp2_tx0_p,
    output wire       cfp2_tx0_n,
    output wire       cfp2_tx1_p,
    output wire       cfp2_tx1_n,
    output wire       cfp2_tx2_p,
    output wire       cfp2_tx2_n,
    output wire       cfp2_tx3_p,
    output wire       cfp2_tx3_n,
    output wire       cfp2_tx4_p,
    output wire       cfp2_tx4_n,
    output wire       cfp2_tx5_p,
    output wire       cfp2_tx5_n,
    output wire       cfp2_tx6_p,
    output wire       cfp2_tx6_n,
    output wire       cfp2_tx7_p,
    output wire       cfp2_tx7_n,
    output wire       cfp2_tx8_p,
    output wire       cfp2_tx8_n,
    output wire       cfp2_tx9_p,
    output wire       cfp2_tx9_n,
    input  wire       cfp2_mgt_refclk_0_p,
    input  wire       cfp2_mgt_refclk_0_n,
    //input  wire       cfp2_mgt_refclk_1_p,
    //input  wire       cfp2_mgt_refclk_1_n,
    output wire [2:0] cfp2_prg_cntl,
    input  wire [2:0] cfp2_prg_alrm,
    output wire [2:0] cfp2_prtadr,
    output wire       cfp2_tx_dis,
    input  wire       cfp2_rx_los,
    output wire       cfp2_mod_lopwr,
    output wire       cfp2_mod_rstn,
    input  wire       cfp2_mod_abs,
    input  wire       cfp2_glb_alrmn,
    output wire       cfp2_mdc,
    inout  wire       cfp2_mdio,

    /*
     * Bullseye GTY
     */
    input  wire       bullseye_rx0_p,
    input  wire       bullseye_rx0_n,
    input  wire       bullseye_rx1_p,
    input  wire       bullseye_rx1_n,
    input  wire       bullseye_rx2_n,
    input  wire       bullseye_rx2_p,
    input  wire       bullseye_rx3_p,
    input  wire       bullseye_rx3_n,
    output wire       bullseye_tx0_p,
    output wire       bullseye_tx0_n,
    output wire       bullseye_tx1_p,
    output wire       bullseye_tx1_n,
    output wire       bullseye_tx2_p,
    output wire       bullseye_tx2_n,
    output wire       bullseye_tx3_p,
    output wire       bullseye_tx3_n,
    // input  wire       bullseye_mgt_refclk_0_p,
    // input  wire       bullseye_mgt_refclk_0_n,
    input  wire       bullseye_mgt_refclk_1_p,
    input  wire       bullseye_mgt_refclk_1_n,

    /*
     * Ethernet: 1000BASE-T SGMII
     */
    input  wire       phy_sgmii_rx_p,
    input  wire       phy_sgmii_rx_n,
    output wire       phy_sgmii_tx_p,
    output wire       phy_sgmii_tx_n,
    input  wire       phy_sgmii_clk_p,
    input  wire       phy_sgmii_clk_n,
    output wire       phy_reset_n,
    input  wire       phy_int_n,

    /*
     * UART: 115200 bps, 8N1
     */
    input  wire       uart_rxd,
    output wire       uart_txd,
    output wire       uart_rts,
    input  wire       uart_cts
);

// Clock and reset

wire clk_125mhz_ibufg;
wire clk_125mhz_mmcm_out;
wire clk_62mhz_mmcm_out;

// Internal 125 MHz clock
wire clk_125mhz_int;
wire rst_125mhz_int;

// Internal 62.5 MHz clock
wire clk_62mhz_int;
wire rst_62mhz_int;

wire mmcm_rst = reset;
wire mmcm_locked;
wire mmcm_clkfb;

IBUFGDS #(
   .DIFF_TERM("FALSE"),
   .IBUF_LOW_PWR("FALSE")   
)
clk_125mhz_ibufg_inst (
   .O   (clk_125mhz_ibufg),
   .I   (clk_125mhz_p),
   .IB  (clk_125mhz_n) 
);

// MMCM instance
// 125 MHz in, 125 MHz and 62.5 MHz out
// PFD range: 10 MHz to 500 MHz
// VCO range: 600 MHz to 1440 MHz
// M = 5, D = 1 sets Fvco = 625 MHz (in range)
// Divide by 5 to get output frequency of 125 MHz
// Divide by 10 to get output frequency of 62.5 MHz
MMCME3_BASE #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKOUT0_DIVIDE_F(5),
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT0_PHASE(0),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT1_DUTY_CYCLE(0.5),
    .CLKOUT1_PHASE(0),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.5),
    .CLKOUT2_PHASE(0),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.5),
    .CLKOUT3_PHASE(0),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.5),
    .CLKOUT4_PHASE(0),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.5),
    .CLKOUT5_PHASE(0),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.5),
    .CLKOUT6_PHASE(0),
    .CLKFBOUT_MULT_F(5),
    .CLKFBOUT_PHASE(0),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.010),
    .CLKIN1_PERIOD(8.0),
    .STARTUP_WAIT("FALSE"),
    .CLKOUT4_CASCADE("FALSE")
)
clk_mmcm_inst (
    .CLKIN1(clk_125mhz_ibufg),
    .CLKFBIN(mmcm_clkfb),
    .RST(mmcm_rst),
    .PWRDWN(1'b0),
    .CLKOUT0(clk_125mhz_mmcm_out),
    .CLKOUT0B(),
    .CLKOUT1(clk_62mhz_mmcm_out),
    .CLKOUT1B(),
    .CLKOUT2(),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .CLKFBOUT(mmcm_clkfb),
    .CLKFBOUTB(),
    .LOCKED(mmcm_locked)
);

BUFG
clk_125mhz_bufg_inst (
    .I(clk_125mhz_mmcm_out),
    .O(clk_125mhz_int)
);

BUFG
clk_62mhz_bufg_inst (
    .I(clk_62mhz_mmcm_out),
    .O(clk_62mhz_int)
);

sync_reset #(
    .N(4)
)
sync_reset_125mhz_inst (
    .clk(clk_125mhz_int),
    .rst(~mmcm_locked),
    .out(rst_125mhz_int)
);

sync_reset #(
    .N(4)
)
sync_reset_62mhz_inst (
    .clk(clk_62mhz_int),
    .rst(~mmcm_locked),
    .out(rst_62mhz_int)
);

// GPIO
wire btnu_int;
wire btnl_int;
wire btnd_int;
wire btnr_int;
wire btnc_int;
wire [3:0] sw_int;

debounce_switch #(
    .WIDTH(9),
    .N(4),
    .RATE(125000)
)
debounce_switch_inst (
    .clk(clk_125mhz_int),
    .rst(rst_125mhz_int),
    .in({btnu,
        btnl,
        btnd,
        btnr,
        btnc,
        sw}),
    .out({btnu_int,
        btnl_int,
        btnd_int,
        btnr_int,
        btnc_int,
        sw_int})
);

wire uart_rxd_int;
wire uart_cts_int;

sync_signal #(
    .WIDTH(2),
    .N(2)
)
sync_signal_inst (
    .clk(clk_125mhz_int),
    .in({uart_rxd, uart_cts}),
    .out({uart_rxd_int, uart_cts_int})
);

wire i2c_scl_i;
wire i2c_scl_o;
wire i2c_scl_t;
wire i2c_sda_i;
wire i2c_sda_o;
wire i2c_sda_t;

assign i2c_scl_i = i2c_scl;
assign i2c_scl = i2c_scl_t ? 1'bz : i2c_scl_o;
assign i2c_sda_i = i2c_sda;
assign i2c_sda = i2c_sda_t ? 1'bz : i2c_sda_o;

// GTY instances
wire gty_drp_clk = clk_62mhz_int;
wire gty_drp_rst = rst_62mhz_int;

wire [7:0] xfcp_mgt_up_tdata;
wire xfcp_mgt_up_tvalid;
wire xfcp_mgt_up_tready;
wire xfcp_mgt_up_tlast;
wire xfcp_mgt_up_tuser;
wire [7:0] xfcp_mgt_down_tdata;
wire xfcp_mgt_down_tvalid;
wire xfcp_mgt_down_tready;
wire xfcp_mgt_down_tlast;
wire xfcp_mgt_down_tuser;

wire [7:0] xfcp_mgt_fifo_up_tdata;
wire xfcp_mgt_fifo_up_tvalid;
wire xfcp_mgt_fifo_up_tready;
wire xfcp_mgt_fifo_up_tlast;
wire xfcp_mgt_fifo_up_tuser;
wire [7:0] xfcp_mgt_fifo_down_tdata;
wire xfcp_mgt_fifo_down_tvalid;
wire xfcp_mgt_fifo_down_tready;
wire xfcp_mgt_fifo_down_tlast;
wire xfcp_mgt_fifo_down_tuser;

wire [7:0] xfcp_qsfp_gty_up_tdata;
wire xfcp_qsfp_gty_up_tvalid;
wire xfcp_qsfp_gty_up_tready;
wire xfcp_qsfp_gty_up_tlast;
wire xfcp_qsfp_gty_up_tuser;
wire [7:0] xfcp_qsfp_gty_down_tdata;
wire xfcp_qsfp_gty_down_tvalid;
wire xfcp_qsfp_gty_down_tready;
wire xfcp_qsfp_gty_down_tlast;
wire xfcp_qsfp_gty_down_tuser;

wire [7:0] xfcp_cfp2_gty_1_up_tdata;
wire xfcp_cfp2_gty_1_up_tvalid;
wire xfcp_cfp2_gty_1_up_tready;
wire xfcp_cfp2_gty_1_up_tlast;
wire xfcp_cfp2_gty_1_up_tuser;
wire [7:0] xfcp_cfp2_gty_1_down_tdata;
wire xfcp_cfp2_gty_1_down_tvalid;
wire xfcp_cfp2_gty_1_down_tready;
wire xfcp_cfp2_gty_1_down_tlast;
wire xfcp_cfp2_gty_1_down_tuser;

wire [7:0] xfcp_cfp2_gty_2_up_tdata;
wire xfcp_cfp2_gty_2_up_tvalid;
wire xfcp_cfp2_gty_2_up_tready;
wire xfcp_cfp2_gty_2_up_tlast;
wire xfcp_cfp2_gty_2_up_tuser;
wire [7:0] xfcp_cfp2_gty_2_down_tdata;
wire xfcp_cfp2_gty_2_down_tvalid;
wire xfcp_cfp2_gty_2_down_tready;
wire xfcp_cfp2_gty_2_down_tlast;
wire xfcp_cfp2_gty_2_down_tuser;

wire [7:0] xfcp_cfp2_gty_3_up_tdata;
wire xfcp_cfp2_gty_3_up_tvalid;
wire xfcp_cfp2_gty_3_up_tready;
wire xfcp_cfp2_gty_3_up_tlast;
wire xfcp_cfp2_gty_3_up_tuser;
wire [7:0] xfcp_cfp2_gty_3_down_tdata;
wire xfcp_cfp2_gty_3_down_tvalid;
wire xfcp_cfp2_gty_3_down_tready;
wire xfcp_cfp2_gty_3_down_tlast;
wire xfcp_cfp2_gty_3_down_tuser;

wire [7:0] xfcp_bullseye_gty_up_tdata;
wire xfcp_bullseye_gty_up_tvalid;
wire xfcp_bullseye_gty_up_tready;
wire xfcp_bullseye_gty_up_tlast;
wire xfcp_bullseye_gty_up_tuser;
wire [7:0] xfcp_bullseye_gty_down_tdata;
wire xfcp_bullseye_gty_down_tvalid;
wire xfcp_bullseye_gty_down_tready;
wire xfcp_bullseye_gty_down_tlast;
wire xfcp_bullseye_gty_down_tuser;

axis_async_fifo #(
    .DEPTH(32),
    .DATA_WIDTH(8)
)
xfcp_mgt_fifo_down (
    // Common reset
    .async_rst(rst_125mhz_int | gty_drp_rst),
    // AXI input
    .s_clk(clk_125mhz_int),
    .s_axis_tdata(xfcp_mgt_down_tdata),
    .s_axis_tvalid(xfcp_mgt_down_tvalid),
    .s_axis_tready(xfcp_mgt_down_tready),
    .s_axis_tlast(xfcp_mgt_down_tlast),
    .s_axis_tuser(xfcp_mgt_down_tuser),
    // AXI output
    .m_clk(gty_drp_clk),
    .m_axis_tdata(xfcp_mgt_fifo_down_tdata),
    .m_axis_tvalid(xfcp_mgt_fifo_down_tvalid),
    .m_axis_tready(xfcp_mgt_fifo_down_tready),
    .m_axis_tlast(xfcp_mgt_fifo_down_tlast),
    .m_axis_tuser(xfcp_mgt_fifo_down_tuser)
);

axis_async_fifo #(
    .DEPTH(32),
    .DATA_WIDTH(8)
)
xfcp_mgt_fifo_up (
    // Common reset
    .async_rst(rst_125mhz_int | gty_drp_rst),
    // AXI input
    .s_clk(gty_drp_clk),
    .s_axis_tdata(xfcp_mgt_fifo_up_tdata),
    .s_axis_tvalid(xfcp_mgt_fifo_up_tvalid),
    .s_axis_tready(xfcp_mgt_fifo_up_tready),
    .s_axis_tlast(xfcp_mgt_fifo_up_tlast),
    .s_axis_tuser(xfcp_mgt_fifo_up_tuser),
    // AXI output
    .m_clk(clk_125mhz_int),
    .m_axis_tdata(xfcp_mgt_up_tdata),
    .m_axis_tvalid(xfcp_mgt_up_tvalid),
    .m_axis_tready(xfcp_mgt_up_tready),
    .m_axis_tlast(xfcp_mgt_up_tlast),
    .m_axis_tuser(xfcp_mgt_up_tuser)
);

xfcp_switch #(
    .PORTS(5),
    .XFCP_ID_TYPE(16'h0100),
    .XFCP_ID_STR("XFCP switch"),
    .XFCP_EXT_ID(0),
    .XFCP_EXT_ID_STR("GTY QUADs")
)
xfcp_switch_inst (
    .clk(gty_drp_clk),
    .rst(gty_drp_rst),
    .up_xfcp_in_tdata(xfcp_mgt_fifo_down_tdata),
    .up_xfcp_in_tvalid(xfcp_mgt_fifo_down_tvalid),
    .up_xfcp_in_tready(xfcp_mgt_fifo_down_tready),
    .up_xfcp_in_tlast(xfcp_mgt_fifo_down_tlast),
    .up_xfcp_in_tuser(xfcp_mgt_fifo_down_tuser),
    .up_xfcp_out_tdata(xfcp_mgt_fifo_up_tdata),
    .up_xfcp_out_tvalid(xfcp_mgt_fifo_up_tvalid),
    .up_xfcp_out_tready(xfcp_mgt_fifo_up_tready),
    .up_xfcp_out_tlast(xfcp_mgt_fifo_up_tlast),
    .up_xfcp_out_tuser(xfcp_mgt_fifo_up_tuser),
    .down_xfcp_in_tdata(  {xfcp_bullseye_gty_up_tdata,    xfcp_cfp2_gty_3_up_tdata,    xfcp_cfp2_gty_2_up_tdata,    xfcp_cfp2_gty_1_up_tdata,    xfcp_qsfp_gty_up_tdata   }),
    .down_xfcp_in_tvalid( {xfcp_bullseye_gty_up_tvalid,   xfcp_cfp2_gty_3_up_tvalid,   xfcp_cfp2_gty_2_up_tvalid,   xfcp_cfp2_gty_1_up_tvalid,   xfcp_qsfp_gty_up_tvalid  }),
    .down_xfcp_in_tready( {xfcp_bullseye_gty_up_tready,   xfcp_cfp2_gty_3_up_tready,   xfcp_cfp2_gty_2_up_tready,   xfcp_cfp2_gty_1_up_tready,   xfcp_qsfp_gty_up_tready  }),
    .down_xfcp_in_tlast(  {xfcp_bullseye_gty_up_tlast,    xfcp_cfp2_gty_3_up_tlast,    xfcp_cfp2_gty_2_up_tlast,    xfcp_cfp2_gty_1_up_tlast,    xfcp_qsfp_gty_up_tlast   }),
    .down_xfcp_in_tuser(  {xfcp_bullseye_gty_up_tuser,    xfcp_cfp2_gty_3_up_tuser,    xfcp_cfp2_gty_2_up_tuser,    xfcp_cfp2_gty_1_up_tuser,    xfcp_qsfp_gty_up_tuser   }),
    .down_xfcp_out_tdata( {xfcp_bullseye_gty_down_tdata,  xfcp_cfp2_gty_3_down_tdata,  xfcp_cfp2_gty_2_down_tdata,  xfcp_cfp2_gty_1_down_tdata,  xfcp_qsfp_gty_down_tdata }),
    .down_xfcp_out_tvalid({xfcp_bullseye_gty_down_tvalid, xfcp_cfp2_gty_3_down_tvalid, xfcp_cfp2_gty_2_down_tvalid, xfcp_cfp2_gty_1_down_tvalid, xfcp_qsfp_gty_down_tvalid}),
    .down_xfcp_out_tready({xfcp_bullseye_gty_down_tready, xfcp_cfp2_gty_3_down_tready, xfcp_cfp2_gty_2_down_tready, xfcp_cfp2_gty_1_down_tready, xfcp_qsfp_gty_down_tready}),
    .down_xfcp_out_tlast( {xfcp_bullseye_gty_down_tlast,  xfcp_cfp2_gty_3_down_tlast,  xfcp_cfp2_gty_2_down_tlast,  xfcp_cfp2_gty_1_down_tlast,  xfcp_qsfp_gty_down_tlast }),
    .down_xfcp_out_tuser( {xfcp_bullseye_gty_down_tuser,  xfcp_cfp2_gty_3_down_tuser,  xfcp_cfp2_gty_2_down_tuser,  xfcp_cfp2_gty_1_down_tuser,  xfcp_qsfp_gty_down_tuser })
);

// QSFP GTY
assign qsfp_modsell = 1'b0;
assign qsfp_resetl = 1'b1;
assign qsfp_lpmode = 1'b0;

wire [9:0] qsfp_gty_com_drp_addr;
wire [15:0] qsfp_gty_com_drp_do;
wire [15:0] qsfp_gty_com_drp_di;
wire qsfp_gty_com_drp_en;
wire qsfp_gty_com_drp_we;
wire qsfp_gty_com_drp_rdy;

wire [4*10-1:0] qsfp_gty_drp_addr;
wire [4*16-1:0] qsfp_gty_drp_do;
wire [4*16-1:0] qsfp_gty_drp_di;
wire [4-1:0] qsfp_gty_drp_en;
wire [4-1:0] qsfp_gty_drp_we;
wire [4-1:0] qsfp_gty_drp_rdy;

wire [4-1:0] qsfp_gty_reset;
wire [4-1:0] qsfp_gty_tx_pcs_reset;
wire [4-1:0] qsfp_gty_tx_pma_reset;
wire [4-1:0] qsfp_gty_rx_pcs_reset;
wire [4-1:0] qsfp_gty_rx_pma_reset;
wire [4-1:0] qsfp_gty_rx_dfe_lpm_reset;
wire [4-1:0] qsfp_gty_eyescan_reset;
wire [4-1:0] qsfp_gty_tx_reset_done;
wire [4-1:0] qsfp_gty_tx_pma_reset_done;
wire [4-1:0] qsfp_gty_rx_reset_done;
wire [4-1:0] qsfp_gty_rx_pma_reset_done;

wire qsfp_gty_txusrclk2;
wire [4*4-1:0] qsfp_gty_txprbssel;
wire [4-1:0] qsfp_gty_txprbsforceerr;
wire [4-1:0] qsfp_gty_txpolarity;
wire [4-1:0] qsfp_gty_txelecidle;
wire [4-1:0] qsfp_gty_txinhibit;
wire [4*5-1:0] qsfp_gty_txdiffctrl;
wire [4*7-1:0] qsfp_gty_txmaincursor;
wire [4*5-1:0] qsfp_gty_txpostcursor;
wire [4*5-1:0] qsfp_gty_txprecursor;

wire qsfp_gty_rxusrclk2;
wire [4-1:0] qsfp_gty_rxpolarity;
wire [4-1:0] qsfp_gty_rxprbscntreset;
wire [4*4-1:0] qsfp_gty_rxprbssel;
wire [4-1:0] qsfp_gty_rxprbserr;
wire [4-1:0] qsfp_gty_rxprbslocked;

xfcp_gty_quad #(
    .CH(4),
    .SW_XFCP_ID_TYPE(16'h0100),
    .SW_XFCP_ID_STR("GTY QUAD 127"),
    .SW_XFCP_EXT_ID(0),
    .SW_XFCP_EXT_ID_STR("QSFP GTY QUAD"),
    .COM_XFCP_ID_TYPE(16'h8A82),
    .COM_XFCP_ID_STR("GTY COM X0Y3"),
    .COM_XFCP_EXT_ID(0),
    .COM_XFCP_EXT_ID_STR("QSFP GTY COM"),
    .CH_0_XFCP_ID_TYPE(16'h8A83),
    .CH_0_XFCP_ID_STR("GTY CH0 X0Y12"),
    .CH_0_XFCP_EXT_ID(0),
    .CH_0_XFCP_EXT_ID_STR("QSFP CH1"),
    .CH_1_XFCP_ID_TYPE(16'h8A83),
    .CH_1_XFCP_ID_STR("GTY CH1 X0Y13"),
    .CH_1_XFCP_EXT_ID(0),
    .CH_1_XFCP_EXT_ID_STR("QSFP CH2"),
    .CH_2_XFCP_ID_TYPE(16'h8A83),
    .CH_2_XFCP_ID_STR("GTY CH2 X0Y14"),
    .CH_2_XFCP_EXT_ID(0),
    .CH_2_XFCP_EXT_ID_STR("QSFP CH3"),
    .CH_3_XFCP_ID_TYPE(16'h8A83),
    .CH_3_XFCP_ID_STR("GTY CH3 X0Y15"),
    .CH_3_XFCP_EXT_ID(0),
    .CH_3_XFCP_EXT_ID_STR("QSFP CH4"),
    .COM_ADDR_WIDTH(10),
    .CH_ADDR_WIDTH(10)
)
xfcp_qsfp_gty_quad_inst (
    .clk(gty_drp_clk),
    .rst(gty_drp_rst),

    .up_xfcp_in_tdata(xfcp_qsfp_gty_down_tdata),
    .up_xfcp_in_tvalid(xfcp_qsfp_gty_down_tvalid),
    .up_xfcp_in_tready(xfcp_qsfp_gty_down_tready),
    .up_xfcp_in_tlast(xfcp_qsfp_gty_down_tlast),
    .up_xfcp_in_tuser(xfcp_qsfp_gty_down_tuser),
    .up_xfcp_out_tdata(xfcp_qsfp_gty_up_tdata),
    .up_xfcp_out_tvalid(xfcp_qsfp_gty_up_tvalid),
    .up_xfcp_out_tready(xfcp_qsfp_gty_up_tready),
    .up_xfcp_out_tlast(xfcp_qsfp_gty_up_tlast),
    .up_xfcp_out_tuser(xfcp_qsfp_gty_up_tuser),

    .gty_com_drp_addr(qsfp_gty_com_drp_addr),
    .gty_com_drp_do(qsfp_gty_com_drp_do),
    .gty_com_drp_di(qsfp_gty_com_drp_di),
    .gty_com_drp_en(qsfp_gty_com_drp_en),
    .gty_com_drp_we(qsfp_gty_com_drp_we),
    .gty_com_drp_rdy(qsfp_gty_com_drp_rdy),

    .gty_drp_addr(qsfp_gty_drp_addr),
    .gty_drp_do(qsfp_gty_drp_do),
    .gty_drp_di(qsfp_gty_drp_di),
    .gty_drp_en(qsfp_gty_drp_en),
    .gty_drp_we(qsfp_gty_drp_we),
    .gty_drp_rdy(qsfp_gty_drp_rdy),

    .gty_reset(qsfp_gty_reset),
    .gty_tx_pcs_reset(qsfp_gty_tx_pcs_reset),
    .gty_tx_pma_reset(qsfp_gty_tx_pma_reset),
    .gty_rx_pcs_reset(qsfp_gty_rx_pcs_reset),
    .gty_rx_pma_reset(qsfp_gty_rx_pma_reset),
    .gty_rx_dfe_lpm_reset(qsfp_gty_rx_dfe_lpm_reset),
    .gty_eyescan_reset(qsfp_gty_eyescan_reset),
    .gty_tx_reset_done(qsfp_gty_tx_reset_done),
    .gty_tx_pma_reset_done(qsfp_gty_tx_pma_reset_done),
    .gty_rx_reset_done(qsfp_gty_rx_reset_done),
    .gty_rx_pma_reset_done(qsfp_gty_rx_pma_reset_done),

    .gty_txusrclk2({4{qsfp_gty_txusrclk2}}),
    .gty_txprbssel(qsfp_gty_txprbssel),
    .gty_txprbsforceerr(qsfp_gty_txprbsforceerr),
    .gty_txpolarity(qsfp_gty_txpolarity),
    .gty_txelecidle(qsfp_gty_txelecidle),
    .gty_txinhibit(qsfp_gty_txinhibit),
    .gty_txdiffctrl(qsfp_gty_txdiffctrl),
    .gty_txmaincursor(qsfp_gty_txmaincursor),
    .gty_txpostcursor(qsfp_gty_txpostcursor),
    .gty_txprecursor(qsfp_gty_txprecursor),

    .gty_rxusrclk2({4{qsfp_gty_rxusrclk2}}),
    .gty_rxpolarity(qsfp_gty_rxpolarity),
    .gty_rxprbscntreset(qsfp_gty_rxprbscntreset),
    .gty_rxprbssel(qsfp_gty_rxprbssel),
    .gty_rxprbserr(qsfp_gty_rxprbserr),
    .gty_rxprbslocked(qsfp_gty_rxprbslocked)
);

wire qsfp_mgt_refclk_0;

IBUFDS_GTE3 ibufds_gte3_qsfp_mgt_refclk_0_inst (
    .I             (qsfp_mgt_refclk_0_p),
    .IB            (qsfp_mgt_refclk_0_n),
    .CEB           (1'b0),
    .O             (qsfp_mgt_refclk_0),
    .ODIV2         ()
);

gtwizard_ultrascale_0 gtwizard_ultrascale_0_inst (
    .gtyrxn_in                           ({qsfp_rx4_n, qsfp_rx3_n, qsfp_rx2_n, qsfp_rx1_n}),
    .gtyrxp_in                           ({qsfp_rx4_p, qsfp_rx3_p, qsfp_rx2_p, qsfp_rx1_p}),
    .gtytxn_out                          ({qsfp_tx4_n, qsfp_tx3_n, qsfp_tx2_n, qsfp_tx1_n}),
    .gtytxp_out                          ({qsfp_tx4_p, qsfp_tx3_p, qsfp_tx2_p, qsfp_tx1_p}),
    .gtwiz_userclk_tx_reset_in           (gty_drp_rst),
    .gtwiz_userclk_tx_srcclk_out         (),
    .gtwiz_userclk_tx_usrclk_out         (),
    .gtwiz_userclk_tx_usrclk2_out        (qsfp_gty_txusrclk2),
    .gtwiz_userclk_tx_active_out         (),
    .gtwiz_userclk_rx_reset_in           (gty_drp_rst),
    .gtwiz_userclk_rx_srcclk_out         (),
    .gtwiz_userclk_rx_usrclk_out         (),
    .gtwiz_userclk_rx_usrclk2_out        (qsfp_gty_rxusrclk2),
    .gtwiz_userclk_rx_active_out         (),
    .gtwiz_reset_clk_freerun_in          (gty_drp_clk),
    .gtwiz_reset_all_in                  (gty_drp_rst || qsfp_gty_reset),
    .gtwiz_reset_tx_pll_and_datapath_in  (1'b0),
    .gtwiz_reset_tx_datapath_in          (1'b0),
    .gtwiz_reset_rx_pll_and_datapath_in  (1'b0),
    .gtwiz_reset_rx_datapath_in          (1'b0),
    .gtwiz_reset_rx_cdr_stable_out       (),
    .gtwiz_reset_tx_done_out             (),
    .gtwiz_reset_rx_done_out             (),
    .gtwiz_userdata_tx_in                ({4{64'd0}}),
    .gtwiz_userdata_rx_out               (),
    .drpaddr_common_in                   (qsfp_gty_com_drp_addr),
    .drpclk_common_in                    (gty_drp_clk),
    .drpdi_common_in                     (qsfp_gty_com_drp_do),
    .drpen_common_in                     (qsfp_gty_com_drp_en),
    .drpwe_common_in                     (qsfp_gty_com_drp_we),
    .gtrefclk00_in                       (qsfp_mgt_refclk_0),
    .drpdo_common_out                    (qsfp_gty_com_drp_di),
    .drprdy_common_out                   (qsfp_gty_com_drp_rdy),
    .qpll0outclk_out                     (),
    .qpll0outrefclk_out                  (),
    .drpaddr_in                          (qsfp_gty_drp_addr),
    .drpclk_in                           ({4{gty_drp_clk}}),
    .drpdi_in                            (qsfp_gty_drp_do),
    .drpen_in                            (qsfp_gty_drp_en),
    .drpwe_in                            (qsfp_gty_drp_we),
    .rxpolarity_in                       (qsfp_gty_rxpolarity),
    .rxprbscntreset_in                   (qsfp_gty_rxprbscntreset),
    .rxprbssel_in                        (qsfp_gty_rxprbssel),
    .txdiffctrl_in                       (qsfp_gty_txdiffctrl),
    .txelecidle_in                       (qsfp_gty_txelecidle),
    .txinhibit_in                        (qsfp_gty_txinhibit),
    .txmaincursor_in                     (qsfp_gty_txmaincursor),
    .txpolarity_in                       (qsfp_gty_txpolarity),
    .txpostcursor_in                     (qsfp_gty_txpostcursor),
    .txprbsforceerr_in                   (qsfp_gty_txprbsforceerr),
    .txprbssel_in                        (qsfp_gty_txprbssel),
    .txprecursor_in                      (qsfp_gty_txprecursor),
    .drpdo_out                           (qsfp_gty_drp_di),
    .drprdy_out                          (qsfp_gty_drp_rdy),
    .gtpowergood_out                     (),
    .eyescandataerror_out                (),
    .rxprbserr_out                       (qsfp_gty_rxprbserr),
    .rxprbslocked_out                    (qsfp_gty_rxprbslocked),
    .rxpcsreset_in                       (qsfp_gty_rx_pcs_reset),
    .rxpmareset_in                       (qsfp_gty_rx_pma_reset),
    .rxdfelpmreset_in                    (qsfp_gty_rx_dfe_lpm_reset),
    .eyescanreset_in                     (qsfp_gty_eyescan_reset),
    .rxpmaresetdone_out                  (qsfp_gty_rx_pma_reset_done),
    .rxprgdivresetdone_out               (),
    .rxresetdone_out                     (qsfp_gty_rx_reset_done),
    .txpcsreset_in                       (qsfp_gty_tx_pcs_reset),
    .txpmareset_in                       (qsfp_gty_tx_pma_reset),
    .txpmaresetdone_out                  (qsfp_gty_tx_pma_reset_done),
    .txprgdivresetdone_out               (),
    .txresetdone_out                     (qsfp_gty_tx_reset_done)
);

// CFP2 GTY
assign cfp2_prg_cntl = 3'b111;
assign cfp2_prtadr = 3'b000;
assign cfp2_tx_dis = 1'b0;
assign cfp2_mod_lopwr = 1'b0;
assign cfp2_mod_rstn = 1'b1;
assign cfp2_mdc = 1'b0;
assign cfp2_mdio = 1'bz;

wire [3*10-1:0] cfp2_gty_com_drp_addr;
wire [3*16-1:0] cfp2_gty_com_drp_do;
wire [3*16-1:0] cfp2_gty_com_drp_di;
wire [3-1:0] cfp2_gty_com_drp_en;
wire [3-1:0] cfp2_gty_com_drp_we;
wire [3-1:0] cfp2_gty_com_drp_rdy;

wire [10*10-1:0] cfp2_gty_drp_addr;
wire [10*16-1:0] cfp2_gty_drp_do;
wire [10*16-1:0] cfp2_gty_drp_di;
wire [10-1:0] cfp2_gty_drp_en;
wire [10-1:0] cfp2_gty_drp_we;
wire [10-1:0] cfp2_gty_drp_rdy;

wire [10-1:0] cfp2_gty_reset;
wire [10-1:0] cfp2_gty_tx_pcs_reset;
wire [10-1:0] cfp2_gty_tx_pma_reset;
wire [10-1:0] cfp2_gty_rx_pcs_reset;
wire [10-1:0] cfp2_gty_rx_pma_reset;
wire [10-1:0] cfp2_gty_rx_dfe_lpm_reset;
wire [10-1:0] cfp2_gty_eyescan_reset;
wire [10-1:0] cfp2_gty_tx_reset_done;
wire [10-1:0] cfp2_gty_tx_pma_reset_done;
wire [10-1:0] cfp2_gty_rx_reset_done;
wire [10-1:0] cfp2_gty_rx_pma_reset_done;

wire cfp2_gty_txusrclk2;
wire [10*4-1:0] cfp2_gty_txprbssel;
wire [10-1:0] cfp2_gty_txprbsforceerr;
wire [10-1:0] cfp2_gty_txpolarity;
wire [10-1:0] cfp2_gty_txelecidle;
wire [10-1:0] cfp2_gty_txinhibit;
wire [10*5-1:0] cfp2_gty_txdiffctrl;
wire [10*7-1:0] cfp2_gty_txmaincursor;
wire [10*5-1:0] cfp2_gty_txpostcursor;
wire [10*5-1:0] cfp2_gty_txprecursor;

wire cfp2_gty_rxusrclk2;
wire [10-1:0] cfp2_gty_rxpolarity;
wire [10-1:0] cfp2_gty_rxprbscntreset;
wire [10*4-1:0] cfp2_gty_rxprbssel;
wire [10-1:0] cfp2_gty_rxprbserr;
wire [10-1:0] cfp2_gty_rxprbslocked;

xfcp_gty_quad #(
    .CH(4),
    .SW_XFCP_ID_TYPE(16'h0100),
    .SW_XFCP_ID_STR("GTY QUAD 128"),
    .SW_XFCP_EXT_ID(0),
    .SW_XFCP_EXT_ID_STR("CFP2 GTY QUAD"),
    .COM_XFCP_ID_TYPE(16'h8A82),
    .COM_XFCP_ID_STR("GTY COM X0Y4"),
    .COM_XFCP_EXT_ID(0),
    .COM_XFCP_EXT_ID_STR("CFP2 GTY COM"),
    .CH_0_XFCP_ID_TYPE(16'h8A83),
    .CH_0_XFCP_ID_STR("GTY CH0 X0Y16"),
    .CH_0_XFCP_EXT_ID(0),
    .CH_0_XFCP_EXT_ID_STR("CFP2 CH9"),
    .CH_1_XFCP_ID_TYPE(16'h8A83),
    .CH_1_XFCP_ID_STR("GTY CH1 X0Y17"),
    .CH_1_XFCP_EXT_ID(0),
    .CH_1_XFCP_EXT_ID_STR("CFP2 CH8"),
    .CH_2_XFCP_ID_TYPE(16'h8A83),
    .CH_2_XFCP_ID_STR("GTY CH2 X0Y18"),
    .CH_2_XFCP_EXT_ID(0),
    .CH_2_XFCP_EXT_ID_STR("CFP2 CH7"),
    .CH_3_XFCP_ID_TYPE(16'h8A83),
    .CH_3_XFCP_ID_STR("GTY CH3 X0Y19"),
    .CH_3_XFCP_EXT_ID(0),
    .CH_3_XFCP_EXT_ID_STR("CFP2 CH4"),
    .COM_ADDR_WIDTH(10),
    .CH_ADDR_WIDTH(10)
)
xfcp_cfp2_gty_quad_inst_1 (
    .clk(gty_drp_clk),
    .rst(gty_drp_rst),

    .up_xfcp_in_tdata(xfcp_cfp2_gty_1_down_tdata),
    .up_xfcp_in_tvalid(xfcp_cfp2_gty_1_down_tvalid),
    .up_xfcp_in_tready(xfcp_cfp2_gty_1_down_tready),
    .up_xfcp_in_tlast(xfcp_cfp2_gty_1_down_tlast),
    .up_xfcp_in_tuser(xfcp_cfp2_gty_1_down_tuser),
    .up_xfcp_out_tdata(xfcp_cfp2_gty_1_up_tdata),
    .up_xfcp_out_tvalid(xfcp_cfp2_gty_1_up_tvalid),
    .up_xfcp_out_tready(xfcp_cfp2_gty_1_up_tready),
    .up_xfcp_out_tlast(xfcp_cfp2_gty_1_up_tlast),
    .up_xfcp_out_tuser(xfcp_cfp2_gty_1_up_tuser),

    .gty_com_drp_addr(cfp2_gty_com_drp_addr[0*10 +: 10]),
    .gty_com_drp_do(cfp2_gty_com_drp_do[0*16 +: 16]),
    .gty_com_drp_di(cfp2_gty_com_drp_di[0*16 +: 16]),
    .gty_com_drp_en(cfp2_gty_com_drp_en[0*1 +: 1]),
    .gty_com_drp_we(cfp2_gty_com_drp_we[0*1 +: 1]),
    .gty_com_drp_rdy(cfp2_gty_com_drp_rdy[0*1 +: 1]),

    .gty_drp_addr(cfp2_gty_drp_addr[0*4*10 +: 4*10]),
    .gty_drp_do(cfp2_gty_drp_do[0*4*16 +: 4*16]),
    .gty_drp_di(cfp2_gty_drp_di[0*4*16 +: 4*16]),
    .gty_drp_en(cfp2_gty_drp_en[0*4*1 +: 4*1]),
    .gty_drp_we(cfp2_gty_drp_we[0*4*1 +: 4*1]),
    .gty_drp_rdy(cfp2_gty_drp_rdy[0*4*1 +: 4*1]),

    .gty_reset(cfp2_gty_reset[0*4*1 +: 4*1]),
    .gty_tx_pcs_reset(cfp2_gty_tx_pcs_reset[0*4*1 +: 4*1]),
    .gty_tx_pma_reset(cfp2_gty_tx_pma_reset[0*4*1 +: 4*1]),
    .gty_rx_pcs_reset(cfp2_gty_rx_pcs_reset[0*4*1 +: 4*1]),
    .gty_rx_pma_reset(cfp2_gty_rx_pma_reset[0*4*1 +: 4*1]),
    .gty_rx_dfe_lpm_reset(cfp2_gty_rx_dfe_lpm_reset[0*4*1 +: 4*1]),
    .gty_eyescan_reset(cfp2_gty_eyescan_reset[0*4*1 +: 4*1]),
    .gty_tx_reset_done(cfp2_gty_tx_reset_done[0*4*1 +: 4*1]),
    .gty_tx_pma_reset_done(cfp2_gty_tx_pma_reset_done[0*4*1 +: 4*1]),
    .gty_rx_reset_done(cfp2_gty_rx_reset_done[0*4*1 +: 4*1]),
    .gty_rx_pma_reset_done(cfp2_gty_rx_pma_reset_done[0*4*1 +: 4*1]),

    .gty_txusrclk2({4{cfp2_gty_txusrclk2}}),
    .gty_txprbssel(cfp2_gty_txprbssel[0*4*4 +: 4*4]),
    .gty_txprbsforceerr(cfp2_gty_txprbsforceerr[0*4*1 +: 4*1]),
    .gty_txpolarity(cfp2_gty_txpolarity[0*4*1 +: 4*1]),
    .gty_txelecidle(cfp2_gty_txelecidle[0*4*1 +: 4*1]),
    .gty_txinhibit(cfp2_gty_txinhibit[0*4*1 +: 4*1]),
    .gty_txdiffctrl(cfp2_gty_txdiffctrl[0*4*5 +: 4*5]),
    .gty_txmaincursor(cfp2_gty_txmaincursor[0*4*7 +: 4*7]),
    .gty_txpostcursor(cfp2_gty_txpostcursor[0*4*5 +: 4*5]),
    .gty_txprecursor(cfp2_gty_txprecursor[0*4*5 +: 4*5]),

    .gty_rxusrclk2({4{cfp2_gty_rxusrclk2}}),
    .gty_rxpolarity(cfp2_gty_rxpolarity[0*4*1 +: 4*1]),
    .gty_rxprbscntreset(cfp2_gty_rxprbscntreset[0*4*1 +: 4*1]),
    .gty_rxprbssel(cfp2_gty_rxprbssel[0*4*4 +: 4*4]),
    .gty_rxprbserr(cfp2_gty_rxprbserr[0*4*1 +: 4*1]),
    .gty_rxprbslocked(cfp2_gty_rxprbslocked[0*4*1 +: 4*1])
);

xfcp_gty_quad #(
    .CH(4),
    .SW_XFCP_ID_TYPE(16'h0100),
    .SW_XFCP_ID_STR("GTY QUAD 129"),
    .SW_XFCP_EXT_ID(0),
    .SW_XFCP_EXT_ID_STR("CFP2 GTY QUAD"),
    .COM_XFCP_ID_TYPE(16'h8A82),
    .COM_XFCP_ID_STR("GTY COM X0Y5"),
    .COM_XFCP_EXT_ID(0),
    .COM_XFCP_EXT_ID_STR("CFP2 GTY COM"),
    .CH_0_XFCP_ID_TYPE(16'h8A83),
    .CH_0_XFCP_ID_STR("GTY CH0 X0Y20"),
    .CH_0_XFCP_EXT_ID(0),
    .CH_0_XFCP_EXT_ID_STR("CFP2 CH6"),
    .CH_1_XFCP_ID_TYPE(16'h8A83),
    .CH_1_XFCP_ID_STR("GTY CH1 X0Y21"),
    .CH_1_XFCP_EXT_ID(0),
    .CH_1_XFCP_EXT_ID_STR("CFP2 CH5"),
    .CH_2_XFCP_ID_TYPE(16'h8A83),
    .CH_2_XFCP_ID_STR("GTY CH2 X0Y22"),
    .CH_2_XFCP_EXT_ID(0),
    .CH_2_XFCP_EXT_ID_STR("CFP2 CH2"),
    .CH_3_XFCP_ID_TYPE(16'h8A83),
    .CH_3_XFCP_ID_STR("GTY CH3 X0Y23"),
    .CH_3_XFCP_EXT_ID(0),
    .CH_3_XFCP_EXT_ID_STR("CFP2 CH1"),
    .COM_ADDR_WIDTH(10),
    .CH_ADDR_WIDTH(10)
)
xfcp_cfp2_gty_quad_inst_2 (
    .clk(gty_drp_clk),
    .rst(gty_drp_rst),

    .up_xfcp_in_tdata(xfcp_cfp2_gty_2_down_tdata),
    .up_xfcp_in_tvalid(xfcp_cfp2_gty_2_down_tvalid),
    .up_xfcp_in_tready(xfcp_cfp2_gty_2_down_tready),
    .up_xfcp_in_tlast(xfcp_cfp2_gty_2_down_tlast),
    .up_xfcp_in_tuser(xfcp_cfp2_gty_2_down_tuser),
    .up_xfcp_out_tdata(xfcp_cfp2_gty_2_up_tdata),
    .up_xfcp_out_tvalid(xfcp_cfp2_gty_2_up_tvalid),
    .up_xfcp_out_tready(xfcp_cfp2_gty_2_up_tready),
    .up_xfcp_out_tlast(xfcp_cfp2_gty_2_up_tlast),
    .up_xfcp_out_tuser(xfcp_cfp2_gty_2_up_tuser),

    .gty_com_drp_addr(cfp2_gty_com_drp_addr[1*10 +: 10]),
    .gty_com_drp_do(cfp2_gty_com_drp_do[1*16 +: 16]),
    .gty_com_drp_di(cfp2_gty_com_drp_di[1*16 +: 16]),
    .gty_com_drp_en(cfp2_gty_com_drp_en[1*1 +: 1]),
    .gty_com_drp_we(cfp2_gty_com_drp_we[1*1 +: 1]),
    .gty_com_drp_rdy(cfp2_gty_com_drp_rdy[1*1 +: 1]),

    .gty_drp_addr(cfp2_gty_drp_addr[1*4*10 +: 4*10]),
    .gty_drp_do(cfp2_gty_drp_do[1*4*16 +: 4*16]),
    .gty_drp_di(cfp2_gty_drp_di[1*4*16 +: 4*16]),
    .gty_drp_en(cfp2_gty_drp_en[1*4*1 +: 4*1]),
    .gty_drp_we(cfp2_gty_drp_we[1*4*1 +: 4*1]),
    .gty_drp_rdy(cfp2_gty_drp_rdy[1*4*1 +: 4*1]),

    .gty_reset(cfp2_gty_reset[1*4*1 +: 4*1]),
    .gty_tx_pcs_reset(cfp2_gty_tx_pcs_reset[1*4*1 +: 4*1]),
    .gty_tx_pma_reset(cfp2_gty_tx_pma_reset[1*4*1 +: 4*1]),
    .gty_rx_pcs_reset(cfp2_gty_rx_pcs_reset[1*4*1 +: 4*1]),
    .gty_rx_pma_reset(cfp2_gty_rx_pma_reset[1*4*1 +: 4*1]),
    .gty_rx_dfe_lpm_reset(cfp2_gty_rx_dfe_lpm_reset[1*4*1 +: 4*1]),
    .gty_eyescan_reset(cfp2_gty_eyescan_reset[1*4*1 +: 4*1]),
    .gty_tx_reset_done(cfp2_gty_tx_reset_done[1*4*1 +: 4*1]),
    .gty_tx_pma_reset_done(cfp2_gty_tx_pma_reset_done[1*4*1 +: 4*1]),
    .gty_rx_reset_done(cfp2_gty_rx_reset_done[1*4*1 +: 4*1]),
    .gty_rx_pma_reset_done(cfp2_gty_rx_pma_reset_done[1*4*1 +: 4*1]),

    .gty_txusrclk2({4{cfp2_gty_txusrclk2}}),
    .gty_txprbssel(cfp2_gty_txprbssel[1*4*4 +: 4*4]),
    .gty_txprbsforceerr(cfp2_gty_txprbsforceerr[1*4*1 +: 4*1]),
    .gty_txpolarity(cfp2_gty_txpolarity[1*4*1 +: 4*1]),
    .gty_txelecidle(cfp2_gty_txelecidle[1*4*1 +: 4*1]),
    .gty_txinhibit(cfp2_gty_txinhibit[1*4*1 +: 4*1]),
    .gty_txdiffctrl(cfp2_gty_txdiffctrl[1*4*5 +: 4*5]),
    .gty_txmaincursor(cfp2_gty_txmaincursor[1*4*7 +: 4*7]),
    .gty_txpostcursor(cfp2_gty_txpostcursor[1*4*5 +: 4*5]),
    .gty_txprecursor(cfp2_gty_txprecursor[1*4*5 +: 4*5]),

    .gty_rxusrclk2({4{cfp2_gty_rxusrclk2}}),
    .gty_rxpolarity(cfp2_gty_rxpolarity[1*4*1 +: 4*1]),
    .gty_rxprbscntreset(cfp2_gty_rxprbscntreset[1*4*1 +: 4*1]),
    .gty_rxprbssel(cfp2_gty_rxprbssel[1*4*4 +: 4*4]),
    .gty_rxprbserr(cfp2_gty_rxprbserr[1*4*1 +: 4*1]),
    .gty_rxprbslocked(cfp2_gty_rxprbslocked[1*4*1 +: 4*1])
);

xfcp_gty_quad #(
    .CH(2),
    .SW_XFCP_ID_TYPE(16'h0100),
    .SW_XFCP_ID_STR("GTY QUAD 130"),
    .SW_XFCP_EXT_ID(0),
    .SW_XFCP_EXT_ID_STR("CFP2 GTY QUAD"),
    .COM_XFCP_ID_TYPE(16'h8A82),
    .COM_XFCP_ID_STR("GTY COM X0Y6"),
    .COM_XFCP_EXT_ID(0),
    .COM_XFCP_EXT_ID_STR("CFP2 GTY COM"),
    .CH_0_XFCP_ID_TYPE(16'h8A83),
    .CH_0_XFCP_ID_STR("GTY CH0 X0Y24"),
    .CH_0_XFCP_EXT_ID(0),
    .CH_0_XFCP_EXT_ID_STR("CFP2 CH3"),
    .CH_1_XFCP_ID_TYPE(16'h8A83),
    .CH_1_XFCP_ID_STR("GTY CH1 X0Y25"),
    .CH_1_XFCP_EXT_ID(0),
    .CH_1_XFCP_EXT_ID_STR("CFP2 CH0"),
    .COM_ADDR_WIDTH(10),
    .CH_ADDR_WIDTH(10)
)
xfcp_cfp2_gty_quad_inst_3 (
    .clk(gty_drp_clk),
    .rst(gty_drp_rst),

    .up_xfcp_in_tdata(xfcp_cfp2_gty_3_down_tdata),
    .up_xfcp_in_tvalid(xfcp_cfp2_gty_3_down_tvalid),
    .up_xfcp_in_tready(xfcp_cfp2_gty_3_down_tready),
    .up_xfcp_in_tlast(xfcp_cfp2_gty_3_down_tlast),
    .up_xfcp_in_tuser(xfcp_cfp2_gty_3_down_tuser),
    .up_xfcp_out_tdata(xfcp_cfp2_gty_3_up_tdata),
    .up_xfcp_out_tvalid(xfcp_cfp2_gty_3_up_tvalid),
    .up_xfcp_out_tready(xfcp_cfp2_gty_3_up_tready),
    .up_xfcp_out_tlast(xfcp_cfp2_gty_3_up_tlast),
    .up_xfcp_out_tuser(xfcp_cfp2_gty_3_up_tuser),

    .gty_com_drp_addr(cfp2_gty_com_drp_addr[2*10 +: 10]),
    .gty_com_drp_do(cfp2_gty_com_drp_do[2*16 +: 16]),
    .gty_com_drp_di(cfp2_gty_com_drp_di[2*16 +: 16]),
    .gty_com_drp_en(cfp2_gty_com_drp_en[2*1 +: 1]),
    .gty_com_drp_we(cfp2_gty_com_drp_we[2*1 +: 1]),
    .gty_com_drp_rdy(cfp2_gty_com_drp_rdy[2*1 +: 1]),

    .gty_drp_addr(cfp2_gty_drp_addr[2*4*10 +: 2*10]),
    .gty_drp_do(cfp2_gty_drp_do[2*4*16 +: 2*16]),
    .gty_drp_di(cfp2_gty_drp_di[2*4*16 +: 2*16]),
    .gty_drp_en(cfp2_gty_drp_en[2*4*1 +: 2*1]),
    .gty_drp_we(cfp2_gty_drp_we[2*4*1 +: 2*1]),
    .gty_drp_rdy(cfp2_gty_drp_rdy[2*4*1 +: 2*1]),

    .gty_reset(cfp2_gty_reset[2*4*1 +: 2*1]),
    .gty_tx_pcs_reset(cfp2_gty_tx_pcs_reset[2*4*1 +: 2*1]),
    .gty_tx_pma_reset(cfp2_gty_tx_pma_reset[2*4*1 +: 2*1]),
    .gty_rx_pcs_reset(cfp2_gty_rx_pcs_reset[2*4*1 +: 2*1]),
    .gty_rx_pma_reset(cfp2_gty_rx_pma_reset[2*4*1 +: 2*1]),
    .gty_rx_dfe_lpm_reset(cfp2_gty_rx_dfe_lpm_reset[2*4*1 +: 2*1]),
    .gty_eyescan_reset(cfp2_gty_eyescan_reset[2*4*1 +: 2*1]),
    .gty_tx_reset_done(cfp2_gty_tx_reset_done[2*4*1 +: 2*1]),
    .gty_tx_pma_reset_done(cfp2_gty_tx_pma_reset_done[2*4*1 +: 2*1]),
    .gty_rx_reset_done(cfp2_gty_rx_reset_done[2*4*1 +: 2*1]),
    .gty_rx_pma_reset_done(cfp2_gty_rx_pma_reset_done[2*4*1 +: 2*1]),

    .gty_txusrclk2({2{cfp2_gty_txusrclk2}}),
    .gty_txprbssel(cfp2_gty_txprbssel[2*4*4 +: 2*4]),
    .gty_txprbsforceerr(cfp2_gty_txprbsforceerr[2*4*1 +: 2*1]),
    .gty_txpolarity(cfp2_gty_txpolarity[2*4*1 +: 2*1]),
    .gty_txelecidle(cfp2_gty_txelecidle[2*4*1 +: 2*1]),
    .gty_txinhibit(cfp2_gty_txinhibit[2*4*1 +: 2*1]),
    .gty_txdiffctrl(cfp2_gty_txdiffctrl[2*4*5 +: 2*5]),
    .gty_txmaincursor(cfp2_gty_txmaincursor[2*4*7 +: 2*7]),
    .gty_txpostcursor(cfp2_gty_txpostcursor[2*4*5 +: 2*5]),
    .gty_txprecursor(cfp2_gty_txprecursor[2*4*5 +: 2*5]),

    .gty_rxusrclk2({2{cfp2_gty_rxusrclk2}}),
    .gty_rxpolarity(cfp2_gty_rxpolarity[2*4*1 +: 2*1]),
    .gty_rxprbscntreset(cfp2_gty_rxprbscntreset[2*4*1 +: 2*1]),
    .gty_rxprbssel(cfp2_gty_rxprbssel[2*4*4 +: 2*4]),
    .gty_rxprbserr(cfp2_gty_rxprbserr[2*4*1 +: 2*1]),
    .gty_rxprbslocked(cfp2_gty_rxprbslocked[2*4*1 +: 2*1])
);

wire cfp2_mgt_refclk_0;

IBUFDS_GTE3 ibufds_gte3_cfp2_mgt_refclk_0_inst (
    .I             (cfp2_mgt_refclk_0_p),
    .IB            (cfp2_mgt_refclk_0_n),
    .CEB           (1'b0),
    .O             (cfp2_mgt_refclk_0),
    .ODIV2         ()
);

gtwizard_ultrascale_1 gtwizard_ultrascale_1_inst (
    .gtyrxn_in                           ({cfp2_rx0_n, cfp2_rx3_n, cfp2_rx1_n, cfp2_rx2_n, cfp2_rx5_n, cfp2_rx6_n, cfp2_rx4_n, cfp2_rx7_n, cfp2_rx8_n, cfp2_rx9_n}),
    .gtyrxp_in                           ({cfp2_rx0_p, cfp2_rx3_p, cfp2_rx1_p, cfp2_rx2_p, cfp2_rx5_p, cfp2_rx6_p, cfp2_rx4_p, cfp2_rx7_p, cfp2_rx8_p, cfp2_rx9_p}),
    .gtytxn_out                          ({cfp2_tx0_n, cfp2_tx3_n, cfp2_tx1_n, cfp2_tx2_n, cfp2_tx5_n, cfp2_tx6_n, cfp2_tx4_n, cfp2_tx7_n, cfp2_tx8_n, cfp2_tx9_n}),
    .gtytxp_out                          ({cfp2_tx0_p, cfp2_tx3_p, cfp2_tx1_p, cfp2_tx2_p, cfp2_tx5_p, cfp2_tx6_p, cfp2_tx4_p, cfp2_tx7_p, cfp2_tx8_p, cfp2_tx9_p}),
    .gtwiz_userclk_tx_reset_in           (gty_drp_rst),
    .gtwiz_userclk_tx_srcclk_out         (),
    .gtwiz_userclk_tx_usrclk_out         (),
    .gtwiz_userclk_tx_usrclk2_out        (cfp2_gty_txusrclk2),
    .gtwiz_userclk_tx_active_out         (),
    .gtwiz_userclk_rx_reset_in           (gty_drp_rst),
    .gtwiz_userclk_rx_srcclk_out         (),
    .gtwiz_userclk_rx_usrclk_out         (),
    .gtwiz_userclk_rx_usrclk2_out        (cfp2_gty_rxusrclk2),
    .gtwiz_userclk_rx_active_out         (),
    .gtwiz_reset_clk_freerun_in          (gty_drp_clk),
    .gtwiz_reset_all_in                  (gty_drp_rst || cfp2_gty_reset),
    .gtwiz_reset_tx_pll_and_datapath_in  (1'b0),
    .gtwiz_reset_tx_datapath_in          (1'b0),
    .gtwiz_reset_rx_pll_and_datapath_in  (1'b0),
    .gtwiz_reset_rx_datapath_in          (1'b0),
    .gtwiz_reset_rx_cdr_stable_out       (),
    .gtwiz_reset_tx_done_out             (),
    .gtwiz_reset_rx_done_out             (),
    .gtwiz_userdata_tx_in                ({10{64'd0}}),
    .gtwiz_userdata_rx_out               (),
    .drpaddr_common_in                   (cfp2_gty_com_drp_addr),
    .drpclk_common_in                    ({3{gty_drp_clk}}),
    .drpdi_common_in                     (cfp2_gty_com_drp_do),
    .drpen_common_in                     (cfp2_gty_com_drp_en),
    .drpwe_common_in                     (cfp2_gty_com_drp_we),
    .gtrefclk00_in                       ({3{cfp2_mgt_refclk_0}}),
    .drpdo_common_out                    (cfp2_gty_com_drp_di),
    .drprdy_common_out                   (cfp2_gty_com_drp_rdy),
    .qpll0outclk_out                     (),
    .qpll0outrefclk_out                  (),
    .drpaddr_in                          (cfp2_gty_drp_addr),
    .drpclk_in                           ({10{gty_drp_clk}}),
    .drpdi_in                            (cfp2_gty_drp_do),
    .drpen_in                            (cfp2_gty_drp_en),
    .drpwe_in                            (cfp2_gty_drp_we),
    .rxpolarity_in                       (cfp2_gty_rxpolarity),
    .rxprbscntreset_in                   (cfp2_gty_rxprbscntreset),
    .rxprbssel_in                        (cfp2_gty_rxprbssel),
    .txdiffctrl_in                       (cfp2_gty_txdiffctrl),
    .txelecidle_in                       (cfp2_gty_txelecidle),
    .txinhibit_in                        (cfp2_gty_txinhibit),
    .txmaincursor_in                     (cfp2_gty_txmaincursor),
    .txpolarity_in                       (cfp2_gty_txpolarity),
    .txpostcursor_in                     (cfp2_gty_txpostcursor),
    .txprbsforceerr_in                   (cfp2_gty_txprbsforceerr),
    .txprbssel_in                        (cfp2_gty_txprbssel),
    .txprecursor_in                      (cfp2_gty_txprecursor),
    .drpdo_out                           (cfp2_gty_drp_di),
    .drprdy_out                          (cfp2_gty_drp_rdy),
    .gtpowergood_out                     (),
    .eyescandataerror_out                (),
    .rxprbserr_out                       (cfp2_gty_rxprbserr),
    .rxprbslocked_out                    (cfp2_gty_rxprbslocked),
    .rxpcsreset_in                       (cfp2_gty_rx_pcs_reset),
    .rxpmareset_in                       (cfp2_gty_rx_pma_reset),
    .rxdfelpmreset_in                    (cfp2_gty_rx_dfe_lpm_reset),
    .eyescanreset_in                     (cfp2_gty_eyescan_reset),
    .rxpmaresetdone_out                  (cfp2_gty_rx_pma_reset_done),
    .rxprgdivresetdone_out               (),
    .rxresetdone_out                     (cfp2_gty_rx_reset_done),
    .txpcsreset_in                       (cfp2_gty_tx_pcs_reset),
    .txpmareset_in                       (cfp2_gty_tx_pma_reset),
    .txpmaresetdone_out                  (cfp2_gty_tx_pma_reset_done),
    .txprgdivresetdone_out               (),
    .txresetdone_out                     (cfp2_gty_tx_reset_done)
);

// Bullseye GTY
wire [9:0] bullseye_gty_com_drp_addr;
wire [15:0] bullseye_gty_com_drp_do;
wire [15:0] bullseye_gty_com_drp_di;
wire bullseye_gty_com_drp_en;
wire bullseye_gty_com_drp_we;
wire bullseye_gty_com_drp_rdy;

wire [4*10-1:0] bullseye_gty_drp_addr;
wire [4*16-1:0] bullseye_gty_drp_do;
wire [4*16-1:0] bullseye_gty_drp_di;
wire [4-1:0] bullseye_gty_drp_en;
wire [4-1:0] bullseye_gty_drp_we;
wire [4-1:0] bullseye_gty_drp_rdy;

wire [4-1:0] bullseye_gty_reset;
wire [4-1:0] bullseye_gty_tx_pcs_reset;
wire [4-1:0] bullseye_gty_tx_pma_reset;
wire [4-1:0] bullseye_gty_rx_pcs_reset;
wire [4-1:0] bullseye_gty_rx_pma_reset;
wire [4-1:0] bullseye_gty_rx_dfe_lpm_reset;
wire [4-1:0] bullseye_gty_eyescan_reset;
wire [4-1:0] bullseye_gty_tx_reset_done;
wire [4-1:0] bullseye_gty_tx_pma_reset_done;
wire [4-1:0] bullseye_gty_rx_reset_done;
wire [4-1:0] bullseye_gty_rx_pma_reset_done;

wire bullseye_gty_txusrclk2;
wire [4*4-1:0] bullseye_gty_txprbssel;
wire [4-1:0] bullseye_gty_txprbsforceerr;
wire [4-1:0] bullseye_gty_txpolarity;
wire [4-1:0] bullseye_gty_txelecidle;
wire [4-1:0] bullseye_gty_txinhibit;
wire [4*5-1:0] bullseye_gty_txdiffctrl;
wire [4*7-1:0] bullseye_gty_txmaincursor;
wire [4*5-1:0] bullseye_gty_txpostcursor;
wire [4*5-1:0] bullseye_gty_txprecursor;

wire bullseye_gty_rxusrclk2;
wire [4-1:0] bullseye_gty_rxpolarity;
wire [4-1:0] bullseye_gty_rxprbscntreset;
wire [4*4-1:0] bullseye_gty_rxprbssel;
wire [4-1:0] bullseye_gty_rxprbserr;
wire [4-1:0] bullseye_gty_rxprbslocked;

xfcp_gty_quad #(
    .CH(4),
    .SW_XFCP_ID_TYPE(16'h0100),
    .SW_XFCP_ID_STR("GTY QUAD 126"),
    .SW_XFCP_EXT_ID(0),
    .SW_XFCP_EXT_ID_STR("BEYE GTY QUAD"),
    .COM_XFCP_ID_TYPE(16'h8A82),
    .COM_XFCP_ID_STR("GTY COM X0Y2"),
    .COM_XFCP_EXT_ID(0),
    .COM_XFCP_EXT_ID_STR("BEYE GTY COM"),
    .CH_0_XFCP_ID_TYPE(16'h8A83),
    .CH_0_XFCP_ID_STR("GTY CH0 X0Y8"),
    .CH_0_XFCP_EXT_ID(0),
    .CH_0_XFCP_EXT_ID_STR("BEYE CH0"),
    .CH_1_XFCP_ID_TYPE(16'h8A83),
    .CH_1_XFCP_ID_STR("GTY CH1 X0Y9"),
    .CH_1_XFCP_EXT_ID(0),
    .CH_1_XFCP_EXT_ID_STR("BEYE CH1"),
    .CH_2_XFCP_ID_TYPE(16'h8A83),
    .CH_2_XFCP_ID_STR("GTY CH2 X0Y10"),
    .CH_2_XFCP_EXT_ID(0),
    .CH_2_XFCP_EXT_ID_STR("BEYE CH2"),
    .CH_3_XFCP_ID_TYPE(16'h8A83),
    .CH_3_XFCP_ID_STR("GTY CH3 X0Y11"),
    .CH_3_XFCP_EXT_ID(0),
    .CH_3_XFCP_EXT_ID_STR("BEYE CH3"),
    .COM_ADDR_WIDTH(10),
    .CH_ADDR_WIDTH(10)
)
xfcp_bullseye_gty_quad_inst(
    .clk(gty_drp_clk),
    .rst(gty_drp_rst),

    .up_xfcp_in_tdata(xfcp_bullseye_gty_down_tdata),
    .up_xfcp_in_tvalid(xfcp_bullseye_gty_down_tvalid),
    .up_xfcp_in_tready(xfcp_bullseye_gty_down_tready),
    .up_xfcp_in_tlast(xfcp_bullseye_gty_down_tlast),
    .up_xfcp_in_tuser(xfcp_bullseye_gty_down_tuser),
    .up_xfcp_out_tdata(xfcp_bullseye_gty_up_tdata),
    .up_xfcp_out_tvalid(xfcp_bullseye_gty_up_tvalid),
    .up_xfcp_out_tready(xfcp_bullseye_gty_up_tready),
    .up_xfcp_out_tlast(xfcp_bullseye_gty_up_tlast),
    .up_xfcp_out_tuser(xfcp_bullseye_gty_up_tuser),

    .gty_com_drp_addr(bullseye_gty_com_drp_addr),
    .gty_com_drp_do(bullseye_gty_com_drp_do),
    .gty_com_drp_di(bullseye_gty_com_drp_di),
    .gty_com_drp_en(bullseye_gty_com_drp_en),
    .gty_com_drp_we(bullseye_gty_com_drp_we),
    .gty_com_drp_rdy(bullseye_gty_com_drp_rdy),

    .gty_drp_addr(bullseye_gty_drp_addr),
    .gty_drp_do(bullseye_gty_drp_do),
    .gty_drp_di(bullseye_gty_drp_di),
    .gty_drp_en(bullseye_gty_drp_en),
    .gty_drp_we(bullseye_gty_drp_we),
    .gty_drp_rdy(bullseye_gty_drp_rdy),

    .gty_reset(bullseye_gty_reset),
    .gty_tx_pcs_reset(bullseye_gty_tx_pcs_reset),
    .gty_tx_pma_reset(bullseye_gty_tx_pma_reset),
    .gty_rx_pcs_reset(bullseye_gty_rx_pcs_reset),
    .gty_rx_pma_reset(bullseye_gty_rx_pma_reset),
    .gty_rx_dfe_lpm_reset(bullseye_gty_rx_dfe_lpm_reset),
    .gty_eyescan_reset(bullseye_gty_eyescan_reset),
    .gty_tx_reset_done(bullseye_gty_tx_reset_done),
    .gty_tx_pma_reset_done(bullseye_gty_tx_pma_reset_done),
    .gty_rx_reset_done(bullseye_gty_rx_reset_done),
    .gty_rx_pma_reset_done(bullseye_gty_rx_pma_reset_done),

    .gty_txusrclk2({4{bullseye_gty_txusrclk2}}),
    .gty_txprbssel(bullseye_gty_txprbssel),
    .gty_txprbsforceerr(bullseye_gty_txprbsforceerr),
    .gty_txpolarity(bullseye_gty_txpolarity),
    .gty_txelecidle(bullseye_gty_txelecidle),
    .gty_txinhibit(bullseye_gty_txinhibit),
    .gty_txdiffctrl(bullseye_gty_txdiffctrl),
    .gty_txmaincursor(bullseye_gty_txmaincursor),
    .gty_txpostcursor(bullseye_gty_txpostcursor),
    .gty_txprecursor(bullseye_gty_txprecursor),

    .gty_rxusrclk2({4{bullseye_gty_rxusrclk2}}),
    .gty_rxpolarity(bullseye_gty_rxpolarity),
    .gty_rxprbscntreset(bullseye_gty_rxprbscntreset),
    .gty_rxprbssel(bullseye_gty_rxprbssel),
    .gty_rxprbserr(bullseye_gty_rxprbserr),
    .gty_rxprbslocked(bullseye_gty_rxprbslocked)
);

wire bullseye_mgt_refclk_1;

IBUFDS_GTE3 ibufds_gte3_bullseye_mgt_refclk_1_inst (
    .I             (bullseye_mgt_refclk_1_p),
    .IB            (bullseye_mgt_refclk_1_n),
    .CEB           (1'b0),
    .O             (bullseye_mgt_refclk_1),
    .ODIV2         ()
);

gtwizard_ultrascale_2 gtwizard_ultrascale_2_inst (
    .gtyrxn_in                           ({bullseye_rx3_n, bullseye_rx2_n, bullseye_rx1_n, bullseye_rx0_n}),
    .gtyrxp_in                           ({bullseye_rx3_p, bullseye_rx2_p, bullseye_rx1_p, bullseye_rx0_p}),
    .gtytxn_out                          ({bullseye_tx3_n, bullseye_tx2_n, bullseye_tx1_n, bullseye_tx0_n}),
    .gtytxp_out                          ({bullseye_tx3_p, bullseye_tx2_p, bullseye_tx1_p, bullseye_tx0_p}),
    .gtwiz_userclk_tx_reset_in           (gty_drp_rst),
    .gtwiz_userclk_tx_srcclk_out         (),
    .gtwiz_userclk_tx_usrclk_out         (),
    .gtwiz_userclk_tx_usrclk2_out        (bullseye_gty_txusrclk2),
    .gtwiz_userclk_tx_active_out         (),
    .gtwiz_userclk_rx_reset_in           (gty_drp_rst),
    .gtwiz_userclk_rx_srcclk_out         (),
    .gtwiz_userclk_rx_usrclk_out         (),
    .gtwiz_userclk_rx_usrclk2_out        (bullseye_gty_rxusrclk2),
    .gtwiz_userclk_rx_active_out         (),
    .gtwiz_reset_clk_freerun_in          (gty_drp_clk),
    .gtwiz_reset_all_in                  (gty_drp_rst || bullseye_gty_reset),
    .gtwiz_reset_tx_pll_and_datapath_in  (1'b0),
    .gtwiz_reset_tx_datapath_in          (1'b0),
    .gtwiz_reset_rx_pll_and_datapath_in  (1'b0),
    .gtwiz_reset_rx_datapath_in          (1'b0),
    .gtwiz_reset_rx_cdr_stable_out       (),
    .gtwiz_reset_tx_done_out             (),
    .gtwiz_reset_rx_done_out             (),
    .gtwiz_userdata_tx_in                ({4{64'd0}}),
    .gtwiz_userdata_rx_out               (),
    .drpaddr_common_in                   (bullseye_gty_com_drp_addr),
    .drpclk_common_in                    (gty_drp_clk),
    .drpdi_common_in                     (bullseye_gty_com_drp_do),
    .drpen_common_in                     (bullseye_gty_com_drp_en),
    .drpwe_common_in                     (bullseye_gty_com_drp_we),
    .gtrefclk01_in                       (bullseye_mgt_refclk_1),
    .drpdo_common_out                    (bullseye_gty_com_drp_di),
    .drprdy_common_out                   (bullseye_gty_com_drp_rdy),
    .qpll1outclk_out                     (),
    .qpll1outrefclk_out                  (),
    .drpaddr_in                          (bullseye_gty_drp_addr),
    .drpclk_in                           ({4{gty_drp_clk}}),
    .drpdi_in                            (bullseye_gty_drp_do),
    .drpen_in                            (bullseye_gty_drp_en),
    .drpwe_in                            (bullseye_gty_drp_we),
    .rxpolarity_in                       (bullseye_gty_rxpolarity),
    .rxprbscntreset_in                   (bullseye_gty_rxprbscntreset),
    .rxprbssel_in                        (bullseye_gty_rxprbssel),
    .txdiffctrl_in                       (bullseye_gty_txdiffctrl),
    .txelecidle_in                       (bullseye_gty_txelecidle),
    .txinhibit_in                        (bullseye_gty_txinhibit),
    .txmaincursor_in                     (bullseye_gty_txmaincursor),
    .txpolarity_in                       (bullseye_gty_txpolarity),
    .txpostcursor_in                     (bullseye_gty_txpostcursor),
    .txprbsforceerr_in                   (bullseye_gty_txprbsforceerr),
    .txprbssel_in                        (bullseye_gty_txprbssel),
    .txprecursor_in                      (bullseye_gty_txprecursor),
    .drpdo_out                           (bullseye_gty_drp_di),
    .drprdy_out                          (bullseye_gty_drp_rdy),
    .gtpowergood_out                     (),
    .eyescandataerror_out                (),
    .rxprbserr_out                       (bullseye_gty_rxprbserr),
    .rxprbslocked_out                    (bullseye_gty_rxprbslocked),
    .rxpcsreset_in                       (bullseye_gty_rx_pcs_reset),
    .rxpmareset_in                       (bullseye_gty_rx_pma_reset),
    .rxdfelpmreset_in                    (bullseye_gty_rx_dfe_lpm_reset),
    .eyescanreset_in                     (bullseye_gty_eyescan_reset),
    .rxpmaresetdone_out                  (bullseye_gty_rx_pma_reset_done),
    .rxprgdivresetdone_out               (),
    .rxresetdone_out                     (bullseye_gty_rx_reset_done),
    .txpcsreset_in                       (bullseye_gty_tx_pcs_reset),
    .txpmareset_in                       (bullseye_gty_tx_pma_reset),
    .txpmaresetdone_out                  (bullseye_gty_tx_pma_reset_done),
    .txprgdivresetdone_out               (),
    .txresetdone_out                     (bullseye_gty_tx_reset_done)
);

// SGMII interface to PHY
wire phy_gmii_clk_int;
wire phy_gmii_rst_int;
wire phy_gmii_clk_en_int;
wire [7:0] phy_gmii_txd_int;
wire phy_gmii_tx_en_int;
wire phy_gmii_tx_er_int;
wire [7:0] phy_gmii_rxd_int;
wire phy_gmii_rx_dv_int;
wire phy_gmii_rx_er_int;

wire [15:0] gig_eth_pcspma_status_vector;

wire gig_eth_pcspma_status_link_status              = gig_eth_pcspma_status_vector[0];
wire gig_eth_pcspma_status_link_synchronization     = gig_eth_pcspma_status_vector[1];
wire gig_eth_pcspma_status_rudi_c                   = gig_eth_pcspma_status_vector[2];
wire gig_eth_pcspma_status_rudi_i                   = gig_eth_pcspma_status_vector[3];
wire gig_eth_pcspma_status_rudi_invalid             = gig_eth_pcspma_status_vector[4];
wire gig_eth_pcspma_status_rxdisperr                = gig_eth_pcspma_status_vector[5];
wire gig_eth_pcspma_status_rxnotintable             = gig_eth_pcspma_status_vector[6];
wire gig_eth_pcspma_status_phy_link_status          = gig_eth_pcspma_status_vector[7];
wire [1:0] gig_eth_pcspma_status_remote_fault_encdg = gig_eth_pcspma_status_vector[9:8];
wire [1:0] gig_eth_pcspma_status_speed              = gig_eth_pcspma_status_vector[11:10];
wire gig_eth_pcspma_status_duplex                   = gig_eth_pcspma_status_vector[12];
wire gig_eth_pcspma_status_remote_fault             = gig_eth_pcspma_status_vector[13];
wire [1:0] gig_eth_pcspma_status_pause              = gig_eth_pcspma_status_vector[15:14];

wire [4:0] gig_eth_pcspma_config_vector;

assign gig_eth_pcspma_config_vector[4] = 1'b1; // autonegotiation enable
assign gig_eth_pcspma_config_vector[3] = 1'b0; // isolate
assign gig_eth_pcspma_config_vector[2] = 1'b0; // power down
assign gig_eth_pcspma_config_vector[1] = 1'b0; // loopback enable
assign gig_eth_pcspma_config_vector[0] = 1'b0; // unidirectional enable

wire [15:0] gig_eth_pcspma_an_config_vector;

assign gig_eth_pcspma_an_config_vector[15]    = 1'b1;    // SGMII link status
assign gig_eth_pcspma_an_config_vector[14]    = 1'b1;    // SGMII Acknowledge
assign gig_eth_pcspma_an_config_vector[13:12] = 2'b01;   // full duplex
assign gig_eth_pcspma_an_config_vector[11:10] = 2'b10;   // SGMII speed
assign gig_eth_pcspma_an_config_vector[9]     = 1'b0;    // reserved
assign gig_eth_pcspma_an_config_vector[8:7]   = 2'b00;   // pause frames - SGMII reserved
assign gig_eth_pcspma_an_config_vector[6]     = 1'b0;    // reserved
assign gig_eth_pcspma_an_config_vector[5]     = 1'b0;    // full duplex - SGMII reserved
assign gig_eth_pcspma_an_config_vector[4:1]   = 4'b0000; // reserved
assign gig_eth_pcspma_an_config_vector[0]     = 1'b1;    // SGMII

gig_ethernet_pcs_pma_0
gig_eth_pcspma (
    // SGMII
    .txp                    (phy_sgmii_tx_p),
    .txn                    (phy_sgmii_tx_n),
    .rxp                    (phy_sgmii_rx_p),
    .rxn                    (phy_sgmii_rx_n),

    // Ref clock from PHY
    .refclk625_p            (phy_sgmii_clk_p),
    .refclk625_n            (phy_sgmii_clk_n),

    // async reset
    .reset                  (rst_125mhz_int),

    // clock and reset outputs
    .clk125_out             (phy_gmii_clk_int),
    .clk625_out             (),
    .clk312_out             (),
    .rst_125_out            (phy_gmii_rst_int),
    .idelay_rdy_out         (),
    .mmcm_locked_out        (),

    // MAC clocking
    .sgmii_clk_r            (),
    .sgmii_clk_f            (),
    .sgmii_clk_en           (phy_gmii_clk_en_int),
    
    // Speed control
    .speed_is_10_100        (gig_eth_pcspma_status_speed != 2'b10),
    .speed_is_100           (gig_eth_pcspma_status_speed == 2'b01),

    // Internal GMII
    .gmii_txd               (phy_gmii_txd_int),
    .gmii_tx_en             (phy_gmii_tx_en_int),
    .gmii_tx_er             (phy_gmii_tx_er_int),
    .gmii_rxd               (phy_gmii_rxd_int),
    .gmii_rx_dv             (phy_gmii_rx_dv_int),
    .gmii_rx_er             (phy_gmii_rx_er_int),
    .gmii_isolate           (),

    // Configuration
    .configuration_vector   (gig_eth_pcspma_config_vector),

    .an_interrupt           (),
    .an_adv_config_vector   (gig_eth_pcspma_an_config_vector),
    .an_restart_config      (1'b0),

    // Status
    .status_vector          (gig_eth_pcspma_status_vector),
    .signal_detect          (1'b1)
);

fpga_core
core_inst (
    /*
     * Clock: 125MHz
     * Synchronous reset
     */
    .clk(clk_125mhz_int),
    .rst(rst_125mhz_int),
    /*
     * GPIO
     */
    .btnu(btnu_int),
    .btnl(btnl_int),
    .btnd(btnd_int),
    .btnr(btnr_int),
    .btnc(btnc_int),
    .sw(sw_int),
    .led(led),
    /*
     * I2C
     */
    .i2c_scl_i(i2c_scl_i),
    .i2c_scl_o(i2c_scl_o),
    .i2c_scl_t(i2c_scl_t),
    .i2c_sda_i(i2c_sda_i),
    .i2c_sda_o(i2c_sda_o),
    .i2c_sda_t(i2c_sda_t),
    /*
     * Ethernet: 1000BASE-T SGMII
     */
    .phy_gmii_clk(phy_gmii_clk_int),
    .phy_gmii_rst(phy_gmii_rst_int),
    .phy_gmii_clk_en(phy_gmii_clk_en_int),
    .phy_gmii_rxd(phy_gmii_rxd_int),
    .phy_gmii_rx_dv(phy_gmii_rx_dv_int),
    .phy_gmii_rx_er(phy_gmii_rx_er_int),
    .phy_gmii_txd(phy_gmii_txd_int),
    .phy_gmii_tx_en(phy_gmii_tx_en_int),
    .phy_gmii_tx_er(phy_gmii_tx_er_int),
    .phy_reset_n(phy_reset_n),
    .phy_int_n(phy_int_n),
    /*
     * UART: 115200 bps, 8N1
     */
    .uart_rxd(uart_rxd_int),
    .uart_txd(uart_txd),
    .uart_rts(uart_rts),
    .uart_cts(uart_cts_int),
    /*
     * Transceiver control
     */
    .xfcp_mgt_up_tdata(xfcp_mgt_up_tdata),
    .xfcp_mgt_up_tvalid(xfcp_mgt_up_tvalid),
    .xfcp_mgt_up_tready(xfcp_mgt_up_tready),
    .xfcp_mgt_up_tlast(xfcp_mgt_up_tlast),
    .xfcp_mgt_up_tuser(xfcp_mgt_up_tuser),
    .xfcp_mgt_down_tdata(xfcp_mgt_down_tdata),
    .xfcp_mgt_down_tvalid(xfcp_mgt_down_tvalid),
    .xfcp_mgt_down_tready(xfcp_mgt_down_tready),
    .xfcp_mgt_down_tlast(xfcp_mgt_down_tlast),
    .xfcp_mgt_down_tuser(xfcp_mgt_down_tuser)
);

endmodule
