// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		rgbµÆ
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
`timescale 1ns / 1ps
module rgb_led( 
input	wire 	clk_24m,
output	wire 	led_r,
output	wire 	led_g,
output	wire 	led_b
);

wire rst_n;
reg [2:0] led_rgb;
//--------rst_n---------------
rst_n ux_rst_n(
	.sclk(clk_24m),
	.rst_n(rst_n)
);

parameter CNT = 24_000_000;//

reg [24:0] cnt_time;

always @(posedge clk_24m or negedge rst_n)
begin 
	if (!rst_n)
	    cnt_time <= 0; 
	else if(cnt_time == CNT - 1) 
		cnt_time <= 0; 
	else 
		cnt_time <= cnt_time + 1'b1; 
end

always @(posedge clk_24m or negedge rst_n)
begin
	if (!rst_n)
		led_rgb <= 3'b101; 
	else if(cnt_time == CNT - 1)
		led_rgb <= {led_rgb[0],led_rgb[2:1]};
	else
		led_rgb <= led_rgb;
end

assign led_r = led_rgb[0];
assign led_g = led_rgb[1];
assign led_b = led_rgb[2];

endmodule
