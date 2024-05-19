// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: key
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module key
(
	input	wire		clk,
	
	// cpu握手信号
	input	wire		clear,
	
	// 按键处理
	input	wire [5:0]	key_i, // 按键按下为低电平输入
	output	reg  [5:0]	key_o  // 按键按下为高电平输出
);

reg [18:0] cnt;
reg [5:0] key_d0;
reg [5:0] key_d1;
reg key_flag;

// 按键采样计数器(采样时间20ms左右)
always@(posedge clk)
begin
    cnt <= cnt + 1;
end

// 按键采样(消除抖动)
always@(posedge clk)
begin
    if(&cnt)
        key_d0 <= ~key_i;
end

// 下降沿提取
always@(posedge clk)
begin
    key_d1 <= key_d0;
	key_flag <= !key_d1 && key_d0;
end

// 按键握手处理
always@(posedge clk)
begin
	if(clear)
		key_o <= 0;
	else if(key_flag)
		key_o <= key_d1;
end

endmodule
