module top (
  input  clk_25mhz,
  output ftdi_rxd,
  input [6:0] btn,
  output wifi_gpio0);   

  uart_tx uart_transmit(
    .clk(clk_25mhz),
    .resetn(1'b1),
    .ser_tx(ftdi_rxd),
    .cfg_divider(25000000/115200),
    .data(8'd65),
    .data_we(btn[1])
  );

  assign wifi_gpio0 = 1'b1;

endmodule