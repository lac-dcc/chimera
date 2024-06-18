// This program was cloned from: https://github.com/HEP-Alliance/hsm
// License: Apache License 2.0

module HEPv3 (
  p_jtag_tms,
  p_jtag_tdi,
  p_jtag_tdo,
  p_jtag_tck,
  p_uart_txd,
  p_uart_rxd,
  p_gpio,
  p_spi_sclk,
  p_spi_mosi,
  p_spi_miso_write,
  p_spi_miso_writeEnable,
  p_spi_ss,
  p_clk,
  p_reset
);

  input  p_jtag_tms;
  input  p_jtag_tdi;
  output p_jtag_tdo;
  input  p_jtag_tck;
  output p_uart_txd;
  input  p_uart_rxd;
  inout  [7:0] p_gpio;
  input  p_spi_sclk;
  input  p_spi_mosi;
  output p_spi_miso_write;
  output p_spi_miso_writeEnable;
  input  p_spi_ss;
  input  p_clk;
  input  p_reset;

  PQVexRiscvVEHEP u_design (
    .jtag_tms(core_jtag_tms),
    .jtag_tdi(core_jtag_tdi),
    .jtag_tdo(core_jtag_tdo),
    .jtag_tck(core_jtag_tck),
    .uart_txd(core_uart_txd),
    .uart_rxd(core_uart_rxd),
    .gpio_read(core_gpio_read),
    .gpio_write(core_gpio_write),
    .gpio_writeEnable(core_gpio_writeEnable),
    .spi_sclk(core_spi_sclk),
    .spi_mosi(core_spi_mosi),
    .spi_miso_write(core_spi_miso_write),
    .spi_miso_writeEnable(core_spi_miso_writeEnable),
    .spi_ss(core_spi_ss),
    .clk(core_clk),
    .reset(core_reset)
  ) ;

  wire core_jtag_tms;
  wire core_jtag_tdi;
  wire core_jtag_tdo;
  wire core_jtag_tck;
  wire core_uart_txd;
  wire core_uart_rxd;

  wire [31:0] core_gpio_read;
  wire [31:0] core_gpio_write;
  wire [31:0] core_gpio_writeEnable;

  wire core_spi_sclk;
  wire core_spi_mosi;
  wire core_spi_miso_write;
  wire core_spi_miso_writeEnable;
  wire core_spi_ss;
  wire core_clk;
  wire core_reset;

  assign core_gpio_read[31:8] = 24'h000000;

  IOPadIn u_pad_jtag_tms (.pad(p_jtag_tms), .p2c(core_jtag_tms)) ;
  IOPadIn u_pad_jtag_tdi (.pad(p_jtag_tdi), .p2c(core_jtag_tdi)) ;
  IOPadOut4mA u_pad_jtag_tdo (.pad(p_jtag_tdo), .c2p(core_jtag_tdo)) ;
  IOPadIn u_pad_jtag_tck (.pad(p_jtag_tck), .p2c(core_jtag_tck)) ;
  IOPadOut4mA u_pad_uart_txd (.pad(p_uart_txd), .c2p(core_uart_txd)) ;
  IOPadIn u_pad_uart_rxd (.pad(p_uart_rxd), .p2c(core_uart_rxd)) ;

  IOPadInOut4mA u_pad_gpio0 (
    .pad(p_gpio[0]),
    .p2c(core_gpio_read[0]),
    .c2p(core_gpio_write[0]),
    .c2p_en(core_gpio_writeEnable[0])
  ) ;
  IOPadInOut4mA u_pad_gpio1 (
    .pad(p_gpio[1]),
    .p2c(core_gpio_read[1]),
    .c2p(core_gpio_write[1]),
    .c2p_en(core_gpio_writeEnable[1])
  ) ;
  IOPadInOut4mA u_pad_gpio2 (
    .pad(p_gpio[2]),
    .p2c(core_gpio_read[2]),
    .c2p(core_gpio_write[2]),
    .c2p_en(core_gpio_writeEnable[2])
  ) ;
  IOPadInOut4mA u_pad_gpio3 (
    .pad(p_gpio[3]),
    .p2c(core_gpio_read[3]),
    .c2p(core_gpio_write[3]),
    .c2p_en(core_gpio_writeEnable[3])
  ) ;
  IOPadInOut4mA u_pad_gpio4 (
    .pad(p_gpio[4]),
    .p2c(core_gpio_read[4]),
    .c2p(core_gpio_write[4]),
    .c2p_en(core_gpio_writeEnable[4])
  ) ;
  IOPadInOut4mA u_pad_gpio5 (
    .pad(p_gpio[5]),
    .p2c(core_gpio_read[5]),
    .c2p(core_gpio_write[5]),
    .c2p_en(core_gpio_writeEnable[5])
  ) ;
  IOPadInOut4mA u_pad_gpio6 (
    .pad(p_gpio[6]),
    .p2c(core_gpio_read[6]),
    .c2p(core_gpio_write[6]),
    .c2p_en(core_gpio_writeEnable[6])
  ) ;
  IOPadInOut4mA u_pad_gpio7 (
    .pad(p_gpio[7]),
    .p2c(core_gpio_read[7]),
    .c2p(core_gpio_write[7]),
    .c2p_en(core_gpio_writeEnable[7])
  ) ;

  IOPadIn u_pad_spi_sclk (.pad(p_spi_sclk), .p2c(core_spi_sclk)) ;
  IOPadIn u_pad_spi_mosi (.pad(p_spi_mosi), .p2c(core_spi_mosi)) ;
  IOPadOut4mA u_pad_spi_miso_write (.pad(p_spi_miso_write), .c2p(core_spi_miso_write)) ;
  IOPadOut4mA u_pad_spi_miso_writeEnable (.pad(p_spi_miso_writeEnable), .c2p(core_spi_miso_writeEnable)) ;
  IOPadIn u_pad_spi_ss (.pad(p_spi_ss), .p2c(core_spi_ss)) ;
  IOPadIn u_pad_clk (.pad(p_clk), .p2c(core_clk)) ;
  IOPadIn u_pad_reset (.pad(p_reset), .p2c(core_reset)) ;

  (* keep *) IOPadIOVdd u_pad_vddpad_n0 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_n1 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_e0 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_e1 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_s0 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_s1 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_w0 () ;
  (* keep *) IOPadIOVdd u_pad_vddpad_w1 () ;

  (* keep *) IOPadVdd u_pad_vddcore_n0 () ;
  (* keep *) IOPadVdd u_pad_vddcore_n1 () ;
  (* keep *) IOPadVdd u_pad_vddcore_e0 () ;
  (* keep *) IOPadVdd u_pad_vddcore_e1 () ;
  (* keep *) IOPadVdd u_pad_vddcore_s0 () ;
  (* keep *) IOPadVdd u_pad_vddcore_s1 () ;
  (* keep *) IOPadVdd u_pad_vddcore_w0 () ;
  (* keep *) IOPadVdd u_pad_vddcore_w1 () ;

  (* keep *) IOPadIOVss u_pad_gndpad_n0 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_n1 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_e0 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_e1 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_s0 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_s1 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_w0 () ;
  (* keep *) IOPadIOVss u_pad_gndpad_w1 () ;

  (* keep *) IOPadVss u_pad_gndcore_n0 () ;
  (* keep *) IOPadVss u_pad_gndcore_n1 () ;
  (* keep *) IOPadVss u_pad_gndcore_e0 () ;
  (* keep *) IOPadVss u_pad_gndcore_e1 () ;
  (* keep *) IOPadVss u_pad_gndcore_s0 () ;
  (* keep *) IOPadVss u_pad_gndcore_s1 () ;
  (* keep *) IOPadVss u_pad_gndcore_w0 () ;
  (* keep *) IOPadVss u_pad_gndcore_w1 () ;

endmodule
