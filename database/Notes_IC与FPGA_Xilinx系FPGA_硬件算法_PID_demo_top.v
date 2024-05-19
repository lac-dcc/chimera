// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

/*
	PID硬件加速的顶层RTL
*/

`include "setting.v"

module  demo_top(
	input						clk		, // 时钟信号
	input					 	rst_n	, // 复位信号，低电平有效
	input	signed   [`TARGET_REG:0]	 	target	, // 目标值
	input	signed   [`TARGET_REG:0]	 	y		, // 实际输出值
	input			 [`PARA_REG:0]		kp		, // 比例系数
	input			 [`PARA_REG:0]		ki		, // 积分系数
	input			 [`PARA_REG:0]		kd		, // 微分系数

	output	signed   [`PID_OUT:0]	    uk0       // PID输出值
);

wire	signed	 [9:0]  	ek0     ; // e(k)
wire	signed	 [9:0]      ek1     ; // e(k-1)
wire	signed	 [9:0] 		ek2     ; // e(k-2)

//例化误差模块
PID_error PID_error_t(
	.clk(clk),
	.rst_n(rst_n),
	.target(target),
	.y(y),
	.ek0(ek0),
	.ek1(ek1),
	.ek2(ek2)
);

wire signed [14:0] d_uk; // PID增量
//例化增量模块
PID_incre_value PID_incre_value_t(
	.ek0(ek0),
	.ek1(ek1),
	.ek2(ek2),
	.kp(kp),
	.ki(ki),
	.kd(kd),
	.d_uk(d_uk)
);

//例化输出模块
PID_value PID_value_t(
	.clk(clk),
	.rst_n(rst_n),
	.d_uk(d_uk),
	.uk0(uk0)
);
endmodule