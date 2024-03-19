module top (
  input  clk_25mhz,
  input  ftdi_txd,
  output ftdi_rxd,
  output wifi_gpio0);   

  wire rx_valid;
  wire [7:0] uart_out;
  
  uart_rx uart_receive(
    .clk(clk_25mhz),
    .resetn(1'b1),
    .ser_rx(ftdi_txd),
    .cfg_divider(25000000/115200),
    .data(uart_out),
    .valid(rx_valid)
  );

  uart_tx uart_transmit(
    .clk(clk_25mhz),
    .resetn(1'b1),
    .ser_tx(ftdi_rxd),
    .cfg_divider(25000000/115200),
    .data(uart_out),
    .data_we(rx_valid)
  );

  assign wifi_gpio0 = 1'b1;

endmodule