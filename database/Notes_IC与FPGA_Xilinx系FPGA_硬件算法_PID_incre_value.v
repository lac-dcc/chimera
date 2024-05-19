// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

/*
	增量模块
*/
`include "setting.v"

module  PID_incre_value(
	input	signed  [9:0]			ek0	, // e(k)
	input	signed  [9:0]			ek1	, // e(k-1)
	input	signed  [9:0]			ek2	, // e(k-2)
	input			[`PARA_REG:0]	kp	, // 比例系数
	input		   	[`PARA_REG:0]	ki	, // 积分系数
	input			[`PARA_REG:0]	kd	, // 微分系数

	output	signed	[`PID_OUT:0]	d_uk  // PID增量输出
);

assign  d_uk = kp*(ek0 -ek1) + ki*ek0 + kd*((ek0 - ek1)-(ek1 - ek2)); // 计算PID增量
endmodule