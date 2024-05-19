// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module Top(
    input clk,
    input rst,
    // GPIO
    input [7:0] switch,
    input [3:0] keypad_row,
    output [3:0] keypad_col,
    output [1:0] bicolor_led_0,
    output [1:0] bicolor_led_1,
    output [15:0] led,
    output [7:0] seg_sel,
    output [7:0] seg_bit,
    // SPI
    inout spi_mosi,
    inout spi_miso,
    output spi_sck,
    output spi_ss,
    // UART
    input uart_rxd,
    output uart_txd,
    // DDR3
    inout [15:0] ddr3_dq,
    inout [1:0] ddr3_dqs_p,
    inout [1:0] ddr3_dqs_n,
    output [12:0] ddr3_addr,
    output [2:0] ddr3_ba,
    output ddr3_ras_n,
    output ddr3_cas_n,
    output ddr3_we_n,
    output ddr3_reset_n,
    output ddr3_ck_p,
    output ddr3_ck_n,
    output ddr3_cke,
    output [1:0] ddr3_dm,
    output ddr3_odt,
    // VGA
    inout [3:0] vga_r,
    inout [3:0] vga_g,
    inout [3:0] vga_b,
    output vga_hsync,
    output vga_vsync,
    // MAC
    input mii_col,
    input mii_crs,
    output mii_rst_n,
    input mii_rx_clk,
    input mii_rx_dv,
    input mii_rx_er,
    input [3:0] mii_rxd,
    input mii_tx_clk,
    output mii_tx_en,
    output mii_tx_er,
    output [3:0] mii_txd,
    output mdio_mdc,
    inout mdio
);

    // SPI
    wire[3:0] spi_csn_o, spi_csn_en;
    wire spi_sck_o;
    wire spi_sdo_i, spi_sdo_o, spi_sdo_en;
    wire spi_sdi_i, spi_sdi_o, spi_sdi_en;

    assign spi_sck = spi_sck_o;
    assign spi_ss = ~spi_csn_en[0] & spi_csn_o[0];
    assign spi_mosi = spi_sdo_en ? 1'bz : spi_sdo_o;
    assign spi_miso = spi_sdi_en ? 1'bz : spi_sdi_o;
    assign spi_sdo_i = spi_mosi;
    assign spi_sdi_i = spi_miso;

    // VGA
    wire[5:0] vga_red, vga_green, vga_blue;

    assign vga_r[0] = vga_red[2] ? 1'b1 : 1'bz; assign vga_r[1] = vga_red[3] ? 1'b1 : 1'bz;
    assign vga_r[2] = vga_red[4] ? 1'b1 : 1'bz; assign vga_r[3] = vga_red[5] ? 1'b1 : 1'bz;
    assign vga_g[0] = vga_green[2] ? 1'b1 : 1'bz; assign vga_g[1] = vga_green[3] ? 1'b1 : 1'bz;
    assign vga_g[2] = vga_green[4] ? 1'b1 : 1'bz; assign vga_g[3] = vga_green[5] ? 1'b1 : 1'bz;
    assign vga_b[0] = vga_blue[2] ? 1'b1 : 1'bz; assign vga_b[1] = vga_blue[3] ? 1'b1 : 1'bz;
    assign vga_b[2] = vga_blue[4] ? 1'b1 : 1'bz; assign vga_b[3] = vga_blue[5] ? 1'b1 : 1'bz;

    // MAC
    wire mdio_i, mdio_o, mdio_t;

    IOBUF iob_mdio(.IO(mdio), .I(mdio_o), .O(mdio_i), .T(mdio_t));
    assign mii_tx_er = 1'b0;

    // SoC
    SoC soc(
        // clock & reset
        .clk(clk),
        .rstn(rst),
        // GPIO
        .gpio_switch(switch),
        .gpio_keypad_row(keypad_row),
        .gpio_keypad_col(keypad_col),
        .gpio_bicolor_led_0(bicolor_led_0),
        .gpio_bicolor_led_1(bicolor_led_1),
        .gpio_led(led),
        .gpio_seg_sel(seg_sel),
        .gpio_seg_bit(seg_bit),
        // SPI
        .spi_csn_o(spi_csn_o),
        .spi_csn_en(spi_csn_en),
        .spi_sck_o(spi_sck_o),
        .spi_sdo_i(spi_sdo_i),
        .spi_sdo_o(spi_sdo_o),
        .spi_sdo_en(spi_sdo_en),
        .spi_sdi_i(spi_sdi_i),
        .spi_sdi_o(spi_sdi_o),
        .spi_sdi_en(spi_sdi_en),
        // UART
        .uart_ctsn(1'b0),
        .uart_dcdn(1'b0),
        .uart_dsrn(1'b0),
        .uart_ri(1'b1),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd),
        // DDR3
        .ddr3_dq(ddr3_dq),
        .ddr3_dqs_p(ddr3_dqs_p),
        .ddr3_dqs_n(ddr3_dqs_n),
        .ddr3_addr(ddr3_addr),
        .ddr3_ba(ddr3_ba),
        .ddr3_ras_n(ddr3_ras_n),
        .ddr3_cas_n(ddr3_cas_n),
        .ddr3_we_n(ddr3_we_n),
        .ddr3_reset_n(ddr3_reset_n),
        .ddr3_ck_p(ddr3_ck_p),
        .ddr3_ck_n(ddr3_ck_n),
        .ddr3_cke(ddr3_cke),
        .ddr3_dm(ddr3_dm),
        .ddr3_odt(ddr3_odt),
        // VGA
        .vga_red(vga_red),
        .vga_green(vga_green),
        .vga_blue(vga_blue),
        .vga_hsync(vga_hsync),
        .vga_vsync(vga_vsync),
        // MAC
        .mii_col(mii_col),
        .mii_crs(mii_crs),
        .mii_rst_n(mii_rst_n),
        .mii_rx_clk(mii_rx_clk),
        .mii_rx_dv(mii_rx_dv),
        .mii_rx_er(mii_rx_er),
        .mii_rxd(mii_rxd),
        .mii_tx_clk(mii_tx_clk),
        .mii_tx_en(mii_tx_en),
        .mii_txd(mii_txd),
        .mdio_mdc(mdio_mdc),
        .mdio_mdio_i(mdio_i),
        .mdio_mdio_o(mdio_o),
        .mdio_mdio_t(mdio_t)
    );

endmodule // Top
