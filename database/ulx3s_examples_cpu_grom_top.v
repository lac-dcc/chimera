module grom_top(
  input  clk_25mhz,
  output [7:0] led,
  input [6:0] btn,
  output wifi_gpio0
);

  wire [7:0] display_out;
  wire hlt;

  grom_computer computer(.clk(clk_25mhz),.reset(btn[1]),.hlt(hlt),.display_out(display_out));

  assign led = display_out;
  assign wifi_gpio0 = 1'b1;
endmodule
