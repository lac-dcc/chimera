module top
(
  input clk_25mhz,
  input ftdi_txd,
  output ftdi_rxd,
  output [7:0] led,
  output wifi_gpio0
);

  reg [5:0] reset_cnt;
  wire resetn = &reset_cnt;

  always @(posedge clk_25mhz) begin
    reset_cnt <= reset_cnt + !resetn;
  end

  altair machine(
    .clk(clk_25mhz),
    .reset(~resetn),
    .rx(ftdi_txd),
    .tx(ftdi_rxd),
    .led(led)
  );

  assign wifi_gpio0 = 1'b1;
endmodule
