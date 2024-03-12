module top(
	input clk_25mhz,
	output [7:0] led,
	output wifi_gpio0
);

assign wifi_gpio0 = 1'b1;

attosoc soc(
	.clk(clk_25mhz),
	.led(led)
);

endmodule
