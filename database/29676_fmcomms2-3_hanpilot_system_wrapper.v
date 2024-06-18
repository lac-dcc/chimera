// This program was cloned from: https://github.com/johnathan-convertino-afrl/fmcomms2-3
// License: MIT License

//******************************************************************************
/// @FILE    system_wrapper.v
/// @AUTHOR  JAY CONVERTINO
/// @DATE    2023.11.02
/// @BRIEF   System wrapper for pl and ps.
///
/// @LICENSE MIT
///  Copyright 2023 Jay Convertino
///
///  Permission is hereby granted, free of charge, to any person obtaining a copy
///  of this software and associated documentation files (the "Software"), to
///  deal in the Software without restriction, including without limitation the
///  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
///  sell copies of the Software, and to permit persons to whom the Software is
///  furnished to do so, subject to the following conditions:
///
///  The above copyright notice and this permission notice shall be included in
///  all copies or substantial portions of the Software.
///
///  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
///  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
///  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
///  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
///  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
///  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
///  IN THE SOFTWARE.
//******************************************************************************

module system_wrapper #(
    parameter FPGA_TECHNOLOGY = 103,
    parameter FPGA_FAMILY = 1,
    parameter SPEED_GRADE = 2,
    parameter DEV_PACKAGE = 3,
    parameter DELAY_REFCLK_FREQUENCY = 200,
    parameter ADC_INIT_DELAY = 23,
    parameter DAC_INIT_DELAY = 0
  ) (
    // clock and resets

    input             sys_clk,
    input             sys_resetn,

    // hps-ddr4 (32)

    input             hps_ddr_ref_clk,
    output  [  0:0]   hps_ddr_clk_p,
    output  [  0:0]   hps_ddr_clk_n,
    output  [ 16:0]   hps_ddr_a,
    output  [  1:0]   hps_ddr_ba,
    output  [  0:0]   hps_ddr_bg,
    output  [  0:0]   hps_ddr_cke,
    output  [  0:0]   hps_ddr_cs_n,
    output  [  0:0]   hps_ddr_odt,
    output  [  0:0]   hps_ddr_reset_n,
    output  [  0:0]   hps_ddr_act_n,
    output  [  0:0]   hps_ddr_par,
    input   [  0:0]   hps_ddr_alert_n,
    inout   [  3:0]   hps_ddr_dqs_p,
    inout   [  3:0]   hps_ddr_dqs_n,
    inout   [ 31:0]   hps_ddr_dq,
    inout   [  3:0]   hps_ddr_dbi_n,
    input             hps_ddr_rzq,

    // hps-ethernet

    input   [  0:0]   hps_eth_rxclk,
    input   [  0:0]   hps_eth_rxctl,
    input   [  3:0]   hps_eth_rxd,
    output  [  0:0]   hps_eth_txclk,
    output  [  0:0]   hps_eth_txctl,
    output  [  3:0]   hps_eth_txd,
    output  [  0:0]   hps_eth_mdc,
    inout   [  0:0]   hps_eth_mdio,

    // hps-sdio

    output  [  0:0]   hps_sdio_clk,
    inout   [  0:0]   hps_sdio_cmd,
    inout   [  3:0]   hps_sdio_d,

    // hps-usb

    input   [  0:0]   hps_usb_clk,
    input   [  0:0]   hps_usb_dir,
    input   [  0:0]   hps_usb_nxt,
    output  [  0:0]   hps_usb_stp,
    inout   [  7:0]   hps_usb_d,

    // hps-uart

    input   [  0:0]   hps_uart_rx,
    output  [  0:0]   hps_uart_tx,

    // hps-i2c

    inout   [  0:0]   hps_i2c_sda,
    inout   [  0:0]   hps_i2c_scl,

    // gpio (HPS)

    inout   [  3:0]   hps_gpio,
    inout             hps_led,
    inout             hps_key,

    // gpio (FPGA)

    input   [  3:0]   gpio_bd_i,
    output  [ 17:0]   gpio_bd_o,

    // FPGA i2c

    inout             fpga_i2c_sda,
    inout             fpga_i2c_scl,

    //alerts
  //   input             pm_alert_n,
  //   input             fan_alert_n,

    //interrupt
    inout            mpu_int,

    // ad9361-interface

    inout             fmc_i2c_sda,
    inout             fmc_i2c_scl,

    input             rx_clk_in,
    input             rx_frame_in_p,
    input             rx_frame_in_n,
    input   [ 5:0]    rx_data_in_p,
    input   [ 5:0]    rx_data_in_n,
    output            tx_clk_out_p,
    output            tx_clk_out_n,
    output            tx_frame_out_p,
    output            tx_frame_out_n,
    output  [ 5:0]    tx_data_out_p,
    output  [ 5:0]    tx_data_out_n,
    output            enable,
    output            txnrx,

    output            gpio_resetb,
    output            gpio_sync,
    output            gpio_en_agc,
    output  [  3:0]   gpio_ctl,
    input   [  7:0]   gpio_status,

    output            spi_csn,
    output            spi_clk,
    output            spi_mosi,
    input             spi_miso
  );

  // internal signals

  //PS TO PL / PL TO PS signals

  wire        s_delay_clk;
  wire        s_axi_clk;
  wire        s_axi_aresetn;
  wire        s_adc_dma_irq;
  wire        s_dac_dma_irq;

  //axi h2f
  wire        w_axi_awvalid;
  wire [31:0] w_axi_awaddr;
  wire        w_axi_awready;
  wire [ 2:0] w_axi_awprot;
  wire        w_axi_wvalid;
  wire [31:0] w_axi_wdata;
  wire [ 3:0] w_axi_wstrb;
  wire        w_axi_wready;
  wire        w_axi_bvalid;
  wire [ 1:0] w_axi_bresp;
  wire        w_axi_bready;
  wire        w_axi_arvalid;
  wire [31:0] w_axi_araddr;
  wire        w_axi_arready;
  wire [ 2:0] w_axi_arprot;
  wire        w_axi_rvalid;
  wire        w_axi_rready;
  wire [ 1:0] w_axi_rresp;
  wire [31:0] w_axi_rdata;

  //axi interface for the adc to the hp0 interface
  wire [31:0]   adc_hp0_axi_awaddr;
  wire [ 3:0]   adc_hp0_axi_awlen;
  wire [ 2:0]   adc_hp0_axi_awsize;
  wire [ 1:0]   adc_hp0_axi_awburst;
  wire [ 2:0]   adc_hp0_axi_awprot;
  wire [ 3:0]   adc_hp0_axi_awcache;
  wire          adc_hp0_axi_awvalid;
  wire          adc_hp0_axi_awready;
  wire [63:0]   adc_hp0_axi_wdata;
  wire [ 7:0]   adc_hp0_axi_wstrb;
  wire          adc_hp0_axi_wready;
  wire          adc_hp0_axi_wvalid;
  wire          adc_hp0_axi_wlast;
  wire          adc_hp0_axi_bvalid;
  wire [ 1:0]   adc_hp0_axi_bresp;
  wire          adc_hp0_axi_bready;

  //axi interface for dac to the hp1 interface
  wire          dac_hp1_axi_arready;
  wire          dac_hp1_axi_arvalid;
  wire [31:0]   dac_hp1_axi_araddr;
  wire [ 3:0]   dac_hp1_axi_arlen;
  wire [ 2:0]   dac_hp1_axi_arsize;
  wire [ 1:0]   dac_hp1_axi_arburst;
  wire [ 2:0]   dac_hp1_axi_arprot;
  wire [ 3:0]   dac_hp1_axi_arcache;
  wire [63:0]   dac_hp1_axi_rdata;
  wire          dac_hp1_axi_rready;
  wire          dac_hp1_axi_rvalid;
  wire [ 1:0]   dac_hp1_axi_rresp;
  wire          dac_hp1_axi_rlast;

  // instantiations... copy pasta
  wire              sys_hps_resetn;
  wire              sys_resetn_s;
  wire    [ 63:0]   gpio_i;
  wire    [ 63:0]   gpio_o;
  wire              fpga_i2c_scl_in;
  wire              fpga_i2c_sda_in;
  wire              fpga_i2c_scl_oe;
  wire              fpga_i2c_sda_oe;
  wire              fmc_i2c_scl_in;
  wire              fmc_i2c_sda_in;
  wire              fmc_i2c_scl_oe;
  wire              fmc_i2c_sda_oe;

  // ad_iobuf #(.DATA_WIDTH(49)) i_iobuf_gpio (
  //   .dio_t ({gpio_t[50:49], gpio_t[46:0]}),
  //   .dio_i ({gpio_o[50:49], gpio_o[46:0]}),
  //   .dio_o ({gpio_i[50:49], gpio_i[46:0]}),
  //   .dio_p ({ gpio_muxout_tx,
  //             gpio_muxout_rx,
  //             gpio_resetb,
  //             gpio_sync,
  //             gpio_en_agc,
  //             gpio_ctl,
  //             gpio_status,
  //             gpio_bd}));

  // assignments

  assign gpio_i[63:40] = gpio_o[63:40];

  assign gpio_resetb    = gpio_o[46];
  assign gpio_sync      = gpio_o[45];
  assign gpio_en_agc    = gpio_o[44];
  assign gpio_ctl       = gpio_o[43:40];
  assign gpio_i[39:32]  = gpio_status;

  // board stuff

  assign gpio_i[31:12] = gpio_o[31:12];
  assign gpio_i[11: 6] = 0;
  assign gpio_i[ 5: 2] = gpio_bd_i;
  assign gpio_i[ 1: 0] = gpio_o[1:0];

  assign gpio_bd_o[1:0] = gpio_o[1:0];
  assign gpio_bd_o[17:2] = gpio_o[29:14];

  // Intel application note UG-01085
  assign fpga_i2c_scl = fpga_i2c_scl_oe ? 1'b0 : 1'bz;
  assign fpga_i2c_sda = fpga_i2c_sda_oe ? 1'b0 : 1'bz;
  assign fpga_i2c_scl_in = fpga_i2c_scl;
  assign fpga_i2c_sda_in = fpga_i2c_sda;

  // Intel application note UG-01085
  assign fmc_i2c_scl = fmc_i2c_scl_oe ? 1'b0 : 1'bz;
  assign fmc_i2c_sda = fmc_i2c_sda_oe ? 1'b0 : 1'bz;
  assign fmc_i2c_scl_in = fmc_i2c_scl;
  assign fmc_i2c_sda_in = fmc_i2c_sda;

  // peripheral reset

  assign sys_resetn_s = sys_resetn & sys_hps_resetn;

  system_pl_wrapper #(
    .FPGA_TECHNOLOGY(FPGA_TECHNOLOGY),
    .FPGA_FAMILY(FPGA_FAMILY),
    .SPEED_GRADE(SPEED_GRADE),
    .DEV_PACKAGE(DEV_PACKAGE),
    .ADC_INIT_DELAY(ADC_INIT_DELAY),
    .DAC_INIT_DELAY(DAC_INIT_DELAY),
    .DELAY_REFCLK_FREQUENCY(DELAY_REFCLK_FREQUENCY)
  ) inst_system_pl_wrapper (
    //AXI4LITE SLAVE INTERFACE TO CROSSBAR
    .axi_aclk(s_axi_clk),
    .axi_aresetn(s_axi_aresetn),

    .s_axi_awvalid(w_axi_awvalid),
    .s_axi_awaddr(w_axi_awaddr),
    .s_axi_awready(w_axi_awready),
    .s_axi_awprot(w_axi_awprot),
    .s_axi_wvalid(w_axi_wvalid),
    .s_axi_wdata(w_axi_wdata),
    .s_axi_wstrb(w_axi_wstrb),
    .s_axi_wready(w_axi_wready),
    .s_axi_bvalid(w_axi_bvalid),
    .s_axi_bresp(w_axi_bresp),
    .s_axi_bready(w_axi_bready),
    .s_axi_arvalid(w_axi_arvalid),
    .s_axi_araddr(w_axi_araddr),
    .s_axi_arready(w_axi_arready),
    .s_axi_arprot(w_axi_arprot),
    .s_axi_rvalid(w_axi_rvalid),
    .s_axi_rready(w_axi_rready),
    .s_axi_rresp(w_axi_rresp),
    .s_axi_rdata(w_axi_rdata),

    //irq
    .adc_dma_irq(s_adc_dma_irq),
    .dac_dma_irq(s_dac_dma_irq),

    //AD9361 IO
    //clocks
    .delay_clk(s_delay_clk),
    //RX LVDS
    .rx_clk_in_p(rx_clk_in),
    .rx_clk_in_n(1'b0),
    .rx_frame_in_p(rx_frame_in_p),
    .rx_frame_in_n(rx_frame_in_n),
    .rx_data_in_p(rx_data_in_p),
    .rx_data_in_n(rx_data_in_n),
    //TX LVDS
    .tx_clk_out_p(tx_clk_out_p),
    .tx_clk_out_n(tx_clk_out_n),
    .tx_frame_out_p(tx_frame_out_p),
    .tx_frame_out_n(tx_frame_out_n),
    .tx_data_out_p(tx_data_out_p),
    .tx_data_out_n(tx_data_out_n),
    //MISC
    .enable(enable),
    .txnrx(txnrx),
    .up_enable(gpio_o[47]),
    .up_txnrx(gpio_o[48]),
    //sync
    .tdd_sync_t(),
    .tdd_sync_i(1'b0),
    .tdd_sync_o(),

    //axi interface for the adc to the hp interface
    .adc_m_dest_axi_awaddr(adc_hp0_axi_awaddr),
    .adc_m_dest_axi_awlen(adc_hp0_axi_awlen),
    .adc_m_dest_axi_awsize(adc_hp0_axi_awsize),
    .adc_m_dest_axi_awburst(adc_hp0_axi_awburst),
    .adc_m_dest_axi_awprot(adc_hp0_axi_awprot),
    .adc_m_dest_axi_awcache(adc_hp0_axi_awcache),
    .adc_m_dest_axi_awvalid(adc_hp0_axi_awvalid),
    .adc_m_dest_axi_awready(adc_hp0_axi_awready),
    .adc_m_dest_axi_wdata(adc_hp0_axi_wdata),
    .adc_m_dest_axi_wstrb(adc_hp0_axi_wstrb),
    .adc_m_dest_axi_wready(adc_hp0_axi_wready),
    .adc_m_dest_axi_wvalid(adc_hp0_axi_wvalid),
    .adc_m_dest_axi_wlast(adc_hp0_axi_wlast),
    .adc_m_dest_axi_bvalid(adc_hp0_axi_bvalid),
    .adc_m_dest_axi_bresp(adc_hp0_axi_bresp),
    .adc_m_dest_axi_bready(adc_hp0_axi_bready),

    //axi interface for dac to the hp interface
    .dac_m_src_axi_arready(dac_hp1_axi_arready),
    .dac_m_src_axi_arvalid(dac_hp1_axi_arvalid),
    .dac_m_src_axi_araddr(dac_hp1_axi_araddr),
    .dac_m_src_axi_arlen(dac_hp1_axi_arlen),
    .dac_m_src_axi_arsize(dac_hp1_axi_arsize),
    .dac_m_src_axi_arburst(dac_hp1_axi_arburst),
    .dac_m_src_axi_arprot(dac_hp1_axi_arprot),
    .dac_m_src_axi_arcache(dac_hp1_axi_arcache),
    .dac_m_src_axi_rdata(dac_hp1_axi_rdata),
    .dac_m_src_axi_rready(dac_hp1_axi_rready),
    .dac_m_src_axi_rvalid(dac_hp1_axi_rvalid),
    .dac_m_src_axi_rresp(dac_hp1_axi_rresp),
    .dac_m_src_axi_rlast(dac_hp1_axi_rlast)
  );

  system_ps_wrapper inst_system_ps_wrapper (
    .s_axi_clk_clk(s_axi_clk),
    .s_axi_aresetn_reset_n(s_axi_aresetn),
    .m_axi_awaddr(w_axi_awaddr),
    .m_axi_awprot(w_axi_awprot),
    .m_axi_awvalid(w_axi_awvalid),
    .m_axi_awready(w_axi_awready),
    .m_axi_wdata(w_axi_wdata),
    .m_axi_wstrb(w_axi_wstrb),
    .m_axi_wvalid(w_axi_wvalid),
    .m_axi_wready(w_axi_wready),
    .m_axi_bresp(w_axi_bresp),
    .m_axi_bvalid(w_axi_bvalid),
    .m_axi_bready(w_axi_bready),
    .m_axi_araddr(w_axi_araddr),
    .m_axi_arprot(w_axi_arprot),
    .m_axi_arvalid(w_axi_arvalid),
    .m_axi_arready(w_axi_arready),
    .m_axi_rdata(w_axi_rdata),
    .m_axi_rresp(w_axi_rresp),
    .m_axi_rvalid(w_axi_rvalid),
    .m_axi_rready(w_axi_rready),

    .sys_delay_clk_clk(s_delay_clk),

    .sys_clk_clk(sys_clk),

    .sys_gpio_bd_in_port(gpio_i[31:0]),
    .sys_gpio_bd_out_port(gpio_o[31:0]),
    .sys_gpio_in_export(gpio_i[63:32]),
    .sys_gpio_out_export(gpio_o[63:32]),

    .sys_hps_rstn_reset_n (sys_resetn),
    .sys_rstn_reset_n (sys_resetn_s),
    .sys_hps_io_hps_io_phery_emac0_TX_CLK (hps_eth_txclk),
    .sys_hps_io_hps_io_phery_emac0_TXD0 (hps_eth_txd[0]),
    .sys_hps_io_hps_io_phery_emac0_TXD1 (hps_eth_txd[1]),
    .sys_hps_io_hps_io_phery_emac0_TXD2 (hps_eth_txd[2]),
    .sys_hps_io_hps_io_phery_emac0_TXD3 (hps_eth_txd[3]),
    .sys_hps_io_hps_io_phery_emac0_RX_CTL (hps_eth_rxctl),
    .sys_hps_io_hps_io_phery_emac0_TX_CTL (hps_eth_txctl),
    .sys_hps_io_hps_io_phery_emac0_RX_CLK (hps_eth_rxclk),
    .sys_hps_io_hps_io_phery_emac0_RXD0 (hps_eth_rxd[0]),
    .sys_hps_io_hps_io_phery_emac0_RXD1 (hps_eth_rxd[1]),
    .sys_hps_io_hps_io_phery_emac0_RXD2 (hps_eth_rxd[2]),
    .sys_hps_io_hps_io_phery_emac0_RXD3 (hps_eth_rxd[3]),
    .sys_hps_io_hps_io_phery_emac0_MDIO (hps_eth_mdio),
    .sys_hps_io_hps_io_phery_emac0_MDC (hps_eth_mdc),
    .sys_hps_io_hps_io_phery_sdmmc_CMD (hps_sdio_cmd),
    .sys_hps_io_hps_io_phery_sdmmc_D0 (hps_sdio_d[0]),
    .sys_hps_io_hps_io_phery_sdmmc_D1 (hps_sdio_d[1]),
    .sys_hps_io_hps_io_phery_sdmmc_D2 (hps_sdio_d[2]),
    .sys_hps_io_hps_io_phery_sdmmc_D3 (hps_sdio_d[3]),
    .sys_hps_io_hps_io_phery_sdmmc_CCLK (hps_sdio_clk),
    .sys_hps_io_hps_io_phery_usb0_DATA0 (hps_usb_d[0]),
    .sys_hps_io_hps_io_phery_usb0_DATA1 (hps_usb_d[1]),
    .sys_hps_io_hps_io_phery_usb0_DATA2 (hps_usb_d[2]),
    .sys_hps_io_hps_io_phery_usb0_DATA3 (hps_usb_d[3]),
    .sys_hps_io_hps_io_phery_usb0_DATA4 (hps_usb_d[4]),
    .sys_hps_io_hps_io_phery_usb0_DATA5 (hps_usb_d[5]),
    .sys_hps_io_hps_io_phery_usb0_DATA6 (hps_usb_d[6]),
    .sys_hps_io_hps_io_phery_usb0_DATA7 (hps_usb_d[7]),
    .sys_hps_io_hps_io_phery_usb0_CLK (hps_usb_clk),
    .sys_hps_io_hps_io_phery_usb0_STP (hps_usb_stp),
    .sys_hps_io_hps_io_phery_usb0_DIR (hps_usb_dir),
    .sys_hps_io_hps_io_phery_usb0_NXT (hps_usb_nxt),
    .sys_hps_io_hps_io_phery_uart1_RX (hps_uart_rx),
    .sys_hps_io_hps_io_phery_uart1_TX (hps_uart_tx),
    .sys_hps_io_hps_io_phery_i2c0_SDA (hps_i2c_sda),
    .sys_hps_io_hps_io_phery_i2c0_SCL (hps_i2c_scl),
    .sys_hps_io_hps_io_gpio_gpio1_io1 (hps_led),
    .sys_hps_io_hps_io_gpio_gpio1_io4 (hps_key),
    .sys_hps_io_hps_io_gpio_gpio1_io15(mpu_int),
    .sys_hps_io_hps_io_gpio_gpio2_io8 (hps_gpio[0]),
    .sys_hps_io_hps_io_gpio_gpio2_io9 (hps_gpio[1]),
    .sys_hps_io_hps_io_gpio_gpio2_io10 (hps_gpio[2]),
    .sys_hps_io_hps_io_gpio_gpio2_io11 (hps_gpio[3]),
    .sys_hps_out_rstn_reset_n (sys_hps_resetn),
    .sys_hps_fpga_irq1_irq ({{30{1'b0}}, s_adc_dma_irq, s_dac_dma_irq}),

    .sys_hps_dma_data_awid(0),
    .sys_hps_dma_data_awaddr(adc_hp0_axi_awaddr),
    .sys_hps_dma_data_awlen(adc_hp0_axi_awlen),
    .sys_hps_dma_data_awsize(adc_hp0_axi_awsize),
    .sys_hps_dma_data_awburst(adc_hp0_axi_awburst),
    .sys_hps_dma_data_awlock(0),
    .sys_hps_dma_data_awcache(adc_hp0_axi_awcache),
    .sys_hps_dma_data_awprot(adc_hp0_axi_awprot),
    .sys_hps_dma_data_awvalid(adc_hp0_axi_awvalid),
    .sys_hps_dma_data_awready(adc_hp0_axi_awready),
    .sys_hps_dma_data_awuser(0),
    .sys_hps_dma_data_wid(0),
    .sys_hps_dma_data_wdata(adc_hp0_axi_wdata),
    .sys_hps_dma_data_wstrb(adc_hp0_axi_wstrb),
    .sys_hps_dma_data_wlast(adc_hp0_axi_wlast),
    .sys_hps_dma_data_wvalid(adc_hp0_axi_wvalid),
    .sys_hps_dma_data_wready(adc_hp0_axi_wready),
    .sys_hps_dma_data_bid(),
    .sys_hps_dma_data_bresp(adc_hp0_axi_bresp),
    .sys_hps_dma_data_bvalid(adc_hp0_axi_bvalid),
    .sys_hps_dma_data_bready(adc_hp0_axi_bready),
    .sys_hps_dma_data_arid(0),
    .sys_hps_dma_data_araddr(dac_hp1_axi_araddr),
    .sys_hps_dma_data_arlen(dac_hp1_axi_arlen),
    .sys_hps_dma_data_arsize(dac_hp1_axi_arsize),
    .sys_hps_dma_data_arburst(dac_hp1_axi_arburst),
    .sys_hps_dma_data_arlock(0),
    .sys_hps_dma_data_arcache(dac_hp1_axi_arcache),
    .sys_hps_dma_data_arprot(dac_hp1_axi_arprot),
    .sys_hps_dma_data_arvalid(dac_hp1_axi_arvalid),
    .sys_hps_dma_data_arready(dac_hp1_axi_arready),
    .sys_hps_dma_data_aruser(0),
    .sys_hps_dma_data_rid(),
    .sys_hps_dma_data_rdata(dac_hp1_axi_rdata),
    .sys_hps_dma_data_rresp(dac_hp1_axi_rresp),
    .sys_hps_dma_data_rlast(dac_hp1_axi_rlast),
    .sys_hps_dma_data_rvalid(dac_hp1_axi_rvalid),
    .sys_hps_dma_data_rready(dac_hp1_axi_rready),

    .sys_hps_ddr_mem_ck(hps_ddr_clk_p),
    .sys_hps_ddr_mem_ck_n(hps_ddr_clk_n),
    .sys_hps_ddr_mem_a(hps_ddr_a),
    .sys_hps_ddr_mem_act_n(hps_ddr_act_n),
    .sys_hps_ddr_mem_ba(hps_ddr_ba),
    .sys_hps_ddr_mem_bg(hps_ddr_bg),
    .sys_hps_ddr_mem_cke(hps_ddr_cke),
    .sys_hps_ddr_mem_cs_n(hps_ddr_cs_n),
    .sys_hps_ddr_mem_odt(hps_ddr_odt),
    .sys_hps_ddr_mem_reset_n(hps_ddr_reset_n),
    .sys_hps_ddr_mem_par(hps_ddr_par),
    .sys_hps_ddr_mem_alert_n(hps_ddr_alert_n),
    .sys_hps_ddr_mem_dqs(hps_ddr_dqs_p),
    .sys_hps_ddr_mem_dqs_n(hps_ddr_dqs_n),
    .sys_hps_ddr_mem_dq(hps_ddr_dq),
    .sys_hps_ddr_mem_dbi_n(hps_ddr_dbi_n),
    .sys_hps_ddr_oct_oct_rzqin(hps_ddr_rzq),
    .sys_hps_ddr_ref_clk_clk(hps_ddr_ref_clk),
    .sys_hps_ddr_rstn_reset_n(sys_resetn),

    .sys_spi_MISO(spi_miso),
    .sys_spi_MOSI(spi_mosi),
    .sys_spi_SCLK(spi_clk),
    .sys_spi_SS_n(spi_csn),

    .sys_i2c_sda_in(fpga_i2c_sda_in),
    .sys_i2c_scl_in(fpga_i2c_scl_in),
    .sys_i2c_sda_oe(fpga_i2c_sda_oe),
    .sys_i2c_scl_oe(fpga_i2c_scl_oe),

    .fmc_i2c_sda_in(fmc_i2c_sda_in),
    .fmc_i2c_scl_in(fmc_i2c_scl_in),
    .fmc_i2c_sda_oe(fmc_i2c_sda_oe),
    .fmc_i2c_scl_oe(fmc_i2c_scl_oe)
  );


endmodule
