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

    reg [7:0] mem [0:2400];

    integer k;

    initial
    begin
      for (k = 0; k < 2400; k = k + 1)
        mem[k] <= 32;
      mem[0] <= 8'd65;
      mem[1] <= 8'd66;
      mem[2] <= 8'd67;
    end

    wire [7:0] data_out;

    font_rom vga_font(
        .clk(clk_25mhz),
        .addr({ mem[(y >> 4) * 80 + (x>>3)], y[3:0] }),
        .data_out(data_out)
    );

    assign color = data_out[7-x[2:0]+1] ? 24'hffffff : 24'h000000; // +1 for sync

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
