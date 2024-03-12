// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		拨码开关使用 控制 LED 显示
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
`timescale 1ns / 1ps

module switch_led
(
	input	wire [15:0]		switch,
	output	wire [15:0]		led
);

assign led = switch;

endmodule