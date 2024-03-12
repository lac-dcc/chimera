`timescale 1ns / 1ps

module Anti_jitter(
		input clk,	// 按钮输入
		input [3:0] button,	// 开关输入
		input [7:0] SW,	// 按钮输出
		output reg [3:0] button_out,	// 脉冲输出
		output reg [3:0] button_pulse,	// 开关输出
		output reg [7:0] SW_OK,	// button 长按
		output reg rst
	);
endmodule
