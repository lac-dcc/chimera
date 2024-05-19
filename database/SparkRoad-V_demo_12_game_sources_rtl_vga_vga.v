// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: vga
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
/* VGA参数配置表
************	clk			A 		B 		C 		D 		E 		F 		G 		H 		I 		K		*
640x480@60Hz	25.2MHz		96		48 		640 	16 		800 	2		33		480 	10		525		*
800x600@60Hz	40MHz		128		88 		800 	40 		1056	4		23		600 	1		628		*
1024x768@60Hz	65MHz		136		160 	1024 	24 		1344	6		29		768 	3		806		*
1280x720@60Hz	74.25MHz	40		220 	1280 	110		1650	5		20		720 	5		750		*
1280x1024@60Hz	108MHz		112		248 	1280 	48 		1688	3		38		1024	1		1066	*
1920x1080@60Hz	148.5MHz	44		148 	1920 	88 		2200	5		36		1080	4		1125	*
*/
//////////////////////////////////////////////////////////////////////////////////

module vga
#(
	parameter A = 96	, // 行同步信号时间
	parameter B = 48	, // 行消隐后肩时间
	parameter C = 640	, // 行数据有效时间
	parameter D = 16	, // 行消隐前肩时间
	parameter E = 800	, // 行扫描总时间
	parameter F = 2		, // 列同步信号时间
	parameter G = 33	, // 列消隐后肩时间
	parameter H = 480	, // 列数据有效时间
	parameter I = 10	, // 列消隐前肩时间
	parameter K = 525	  // 列扫描总时间
)
(
	input	wire		clk,
	
	// VGA时序输出
	output	reg			hsyn,
	output	reg			vsyn,
	
	// VGA时序伴随坐标
	output	reg			axis_en,
	output	reg [10:0]	axis_x,
	output	reg [10:0]	axis_y
);

reg [12:0] hsyn_cnt;
reg [12:0] vsyn_cnt;

// 行扫描计数器
always@(posedge clk)
begin
	if(hsyn_cnt == E-1)
        hsyn_cnt <= 0;
    else
        hsyn_cnt <= hsyn_cnt + 1;
end

// 列扫描计数器
always@(posedge clk)
begin
	if(hsyn_cnt == E-1)
	begin
        if(vsyn_cnt == K-1)
            vsyn_cnt <= 0;
        else
            vsyn_cnt <= vsyn_cnt + 1;
	end
end

// 行控制
always@(posedge clk)
begin
    if(hsyn_cnt < A)
        hsyn <= 0;
    else
        hsyn <= 1;
end

// 场控制
always@(posedge clk)
begin
    if(vsyn_cnt < F)
        vsyn <= 0;
    else
        vsyn <= 1;
end

// 时序伴随坐标使能.
always@(posedge clk)
begin
    if(vsyn_cnt >= F + G && vsyn_cnt < F + G + H)
    begin
        if(hsyn_cnt >= A + B && hsyn_cnt < A + B + C)
            axis_en <= 1;
        else
            axis_en <= 0;
    end
    else
        axis_en <= 0;
end

//数据x坐标
always@(posedge clk)
begin
    if(vsyn_cnt >= F + G && vsyn_cnt < F + G + H)
    begin
        if(hsyn_cnt >= A + B && hsyn_cnt < A + B + C)
            axis_x <= hsyn_cnt - (A + B);
        else
            axis_x <= 0;
    end
    else
        axis_x <= 0;
end

//数据y坐标
always@(posedge clk)
begin
    if(vsyn_cnt >= F + G && vsyn_cnt < F + G + H)
        axis_y <= vsyn_cnt - (F + G);
    else
        axis_y <= 0;
end

endmodule
