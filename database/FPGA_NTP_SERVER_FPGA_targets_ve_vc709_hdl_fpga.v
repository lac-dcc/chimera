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
module fpga (
    /*
     * Clock: 200MHz LVDS
     */
    input  wire       clk_200mhz_p,
    input  wire       clk_200mhz_n,

    /*
     * I2C
     */
    inout  wire       i2c_scl,
    inout  wire       i2c_sda,
    output wire       i2c_mux_reset,

    /*
     * Ethernet: SFP+
     */
    input  wire       sfp_1_rx_p,
    input  wire       sfp_1_rx_n,
    output wire       sfp_1_tx_p,
    output wire       sfp_1_tx_n,
    input  wire       sfp_2_rx_p,
    input  wire       sfp_2_rx_n,
    output wire       sfp_2_tx_p,
    output wire       sfp_2_tx_n,
    input  wire       sfp_3_rx_p,
    input  wire       sfp_3_rx_n,
    output wire       sfp_3_tx_p,
    output wire       sfp_3_tx_n,
    input  wire       sfp_4_rx_p,
    input  wire       sfp_4_rx_n,
    output wire       sfp_4_tx_p,
    output wire       sfp_4_tx_n,
    input  wire       sfp_mgt_refclk_p,
    input  wire       sfp_mgt_refclk_n,
    output wire       sfp_clk_rst,
    input  wire       sfp_1_mod_detect,
    input  wire       sfp_2_mod_detect,
    input  wire       sfp_3_mod_detect,
    input  wire       sfp_4_mod_detect,
    output wire [1:0] sfp_1_rs,
    output wire [1:0] sfp_2_rs,
    output wire [1:0] sfp_3_rs,
    output wire [1:0] sfp_4_rs,
    input  wire       sfp_1_los,
    input  wire       sfp_2_los,
    input  wire       sfp_3_los,
    input  wire       sfp_4_los,
    output wire       sfp_1_tx_disable,
    output wire       sfp_2_tx_disable,
    output wire       sfp_3_tx_disable,
    output wire       sfp_4_tx_disable,
    input  wire       sfp_1_tx_fault,
    input  wire       sfp_2_tx_fault,
    input  wire       sfp_3_tx_fault,
    input  wire       sfp_4_tx_fault
);

// Clock and reset

wire clk_200mhz_ibufg;

// Internal 125 MHz clock
wire clk_125mhz_mmcm_out;
wire clk_125mhz_int;
wire rst_125mhz_int;

// Internal 156.25 MHz clock
wire clk_156mhz_int;
wire rst_156mhz_int;

wire mmcm_rst = 1'b0;
wire mmcm_locked;
wire mmcm_clkfb;

IBUFGDS #(
   .DIFF_TERM("FALSE"),
   .IBUF_LOW_PWR("FALSE")
)
clk_200mhz_ibufg_inst (
   .O   (clk_200mhz_ibufg),
   .I   (clk_200mhz_p),
   .IB  (clk_200mhz_n)
);

// MMCM instance
// 200 MHz in, 125 MHz out
// PFD range: 10 MHz to 500 MHz
// VCO range: 600 MHz to 1440 MHz
// M = 5, D = 1 sets Fvco = 1000 MHz (in range)
// Divide by 8 to get output frequency of 125 MHz
MMCME2_BASE #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKOUT0_DIVIDE_F(8),
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT0_PHASE(0),
    .CLKOUT1_DIVIDE(1),
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
    .CLKIN1_PERIOD(5.0),
    .STARTUP_WAIT("FALSE"),
    .CLKOUT4_CASCADE("FALSE")
)
clk_mmcm_inst (
    .CLKIN1(clk_200mhz_ibufg),
    .CLKFBIN(mmcm_clkfb),
    .RST(mmcm_rst),
    .PWRDWN(1'b0),
    .CLKOUT0(clk_125mhz_mmcm_out),
    .CLKOUT0B(),
    .CLKOUT1(),
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

sync_reset #(
    .N(4)
)
sync_reset_125mhz_inst (
    .clk(clk_125mhz_int),
    .rst(~mmcm_locked),
    .out(rst_125mhz_int)
);

ntps_top ntps_top_1 (
             .clk_125mhz_int(          clk_125mhz_int),
             .rst_125mhz_int(          rst_125mhz_int),

             .qsfp1_tx1_p(           qsfp1_tx1_p),
             .qsfp1_tx1_n(           qsfp1_tx1_n),
             .qsfp1_rx1_p(           qsfp1_rx1_p),
             .qsfp1_rx1_n(           qsfp1_rx1_n),
             .qsfp1_tx2_p(           qsfp1_tx2_p),
             .qsfp1_tx2_n(           qsfp1_tx2_n),
             .qsfp1_rx2_p(           qsfp1_rx2_p),
             .qsfp1_rx2_n(           qsfp1_rx2_n),
             .qsfp1_tx3_p(           qsfp1_tx3_p),
             .qsfp1_tx3_n(           qsfp1_tx3_n),
             .qsfp1_rx3_p(           qsfp1_rx3_p),
             .qsfp1_rx3_n(           qsfp1_rx3_n),
             .qsfp1_tx4_p(           qsfp1_tx4_p),
             .qsfp1_tx4_n(           qsfp1_tx4_n),
             .qsfp1_rx4_p(           qsfp1_rx4_p),
             .qsfp1_rx4_n(           qsfp1_rx4_n),
             .qsfp1_mgt_refclk_0(  qsfp1_mgt_refclk_0),
             .qsfp1_modsell(         qsfp1_modsell),
             .qsfp1_resetl(          qsfp1_resetl),
             .qsfp1_modprsl(         qsfp1_modprsl),
             .qsfp1_intl(            qsfp1_intl),
             .qsfp1_lpmode(          qsfp1_lpmode)
             );

endmodule
