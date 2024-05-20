// This program was cloned from: https://github.com/idea-fasoc/openfasoc-tapeouts
// License: Apache License 2.0

module pulpino_top (
  // Clock and Reset
  input                clk,
  input                rst_n,

  input                clk_sel_i,
  input                clk_standalone_i,
  input                testmode_i,
  input                fetch_enable_i,
  input                scan_enable_i,

  //SPI Slave
  input                spi_clk_i,
  input                spi_cs_i,
  output  [1:0]        spi_mode_o,
  output               spi_sdo0_o,
  output               spi_sdo1_o,
  output               spi_sdo2_o,
  output               spi_sdo3_o,
  input                spi_sdi0_i,
  input                spi_sdi1_i,
  input                spi_sdi2_i,
  input                spi_sdi3_i,

  //SPI Master
  output               spi_master_clk_o,
  output               spi_master_csn0_o,
  output               spi_master_csn1_o,
  output               spi_master_csn2_o,
  output               spi_master_csn3_o,
  output  [1:0]        spi_master_mode_o,
  output               spi_master_sdo0_o,
  output               spi_master_sdo1_o,
  output               spi_master_sdo2_o,
  output               spi_master_sdo3_o,
  input                spi_master_sdi0_i,
  input                spi_master_sdi1_i,
  input                spi_master_sdi2_i,
  input                spi_master_sdi3_i,

  input                scl_pad_i,
  output               scl_pad_o,
  output               scl_padoen_o,
  input                sda_pad_i,
  output               sda_pad_o,
  output               sda_padoen_o,

  output               uart_tx,
  input                uart_rx,
  output               uart_rts,
  output               uart_dtr,
  input                uart_cts,
  input                uart_dsr,

  input         [31:0] gpio_in,
  output        [31:0] gpio_out,
  // output        [31:0] gpio_dir,
  // output       [191:0] gpio_padcfg,

  // JTAG signals
  input                tck_i,
  input                trstn_i,
  input                tms_i,
  input                tdi_i,
  output               tdo_o,

  // PULPino specific pad config
  // output       [191:0] pad_cfg_o,
  // output        [31:0] pad_mux_o,

  // drive low to enable output
  output        [32:0] io_oeb
);

endmodule