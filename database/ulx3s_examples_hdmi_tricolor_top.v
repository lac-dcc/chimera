module top
(
	input clk_25mhz,
	output [3:0] gpdi_dp, gpdi_dn,
	output wifi_gpio0
);
	assign wifi_gpio0 = 1'b1;

	wire [23:0] color;
	wire [9:0] x;
	wire [9:0] y;

    assign color = (x<213) ? 24'hff0000 : (x<426) ? 24'hffffff : 24'h0000ff;

	hdmi_video hdmi_video
	(
		.clk_25mhz(clk_25mhz),
		.x(x),
		.y(y),
		.color(color),
		.gpdi_dp(gpdi_dp),
		.gpdi_dn(gpdi_dn)	
	);
endmodule
