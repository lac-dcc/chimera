// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

/*
	PID输出模块
*/
`include "setting.v"

module PID_value (
	input									clk		, // 时钟信号
	input									rst_n	, // 复位信号，低电平有效
	input		signed		 [`PID_OUT:0]	d_uk	, // PID增量

	output	    reg signed	 [`PID_OUT:0]   uk0		  // PID输出值
);

reg signed [14:0] uk1 = 15'd0; // 上一时刻u(k-1)的值
 
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
	  	uk0 <= 15'd0;
	end
	else begin
		uk0 = uk1 + d_uk; // 计算PID输出值
		uk1 = uk0; // 寄存上一时刻 u(k-1)的值
	end
end
endmodule
