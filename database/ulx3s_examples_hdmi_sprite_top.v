module top
(
	input clk_25mhz,
	output [3:0] gpdi_dp, gpdi_dn,
    input [6:0] btn,
	output wifi_gpio0
);
	assign wifi_gpio0 = 1'b1;

    wire locked;
	wire [23:0] color;
	wire [9:0] x;
	wire [9:0] y;

    reg [9:0] pos_x;
    reg [9:0] pos_y;

    wire [23:0] sprite_rgb;

    wire [9:0] sprite_x;
    wire [9:0] sprite_y;

    assign sprite_x = x - pos_x;
    assign sprite_y = y - pos_y;

    sprite_rom sprite(
        .clk(clk_25mhz),
        .addr({ sprite_y[5:0], sprite_x[5:0] }),
        .data_out(sprite_rgb));

    assign color = (x > pos_x && x < pos_x + 64 && y > pos_y && y < pos_y + 64) ? sprite_rgb : 24'hffffff;

    reg [15:0] counter;

    always @(posedge clk_25mhz) begin
        counter <= counter + 1;
    end

    always @(posedge counter[15])
    begin
        if (!locked)
        begin
            pos_x <= 0;
            pos_y <= 0;
        end
        if (btn[5]==1'b1)
            pos_x <= (pos_x > 0) ? pos_x - 1 : pos_x;
        if (btn[6]==1'b1)
            pos_x <= (pos_x < 640-64) ? pos_x +1 : pos_x;
        if (btn[3]==1'b1)
            pos_y <= (pos_y > 0) ? pos_y - 1 : pos_y;
        if (btn[4]==1'b1)
            pos_y <= (pos_y < 480-64) ? pos_y +1 : pos_y;
    end 

	hdmi_video hdmi_video
	(
		.clk_25mhz(clk_25mhz),
		.x(x),
		.y(y),
		.color(color),
		.gpdi_dp(gpdi_dp),
		.gpdi_dn(gpdi_dn),
        .clk_locked(locked)
	);
endmodule
