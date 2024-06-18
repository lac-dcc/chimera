// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 串口接收,起始位1bit,数据位8bit,停止位2bit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_rx
#(
	parameter BAUDRATE = 115200,
	parameter CLK_RATE = 50000000
)
(
    input	wire		clk,
	
	// uart
    input	wire		rx,
	
	// data
    output  reg			rx_en,
    output  reg [7:0]	rx_data
);

reg start;
reg clk_en;
reg [3:0] cnt;
reg [7:0] data;
reg [1:0] rx_d;
reg [31:0] clk_cnt;

initial
begin
    start = 0;
end

// 边沿检测
always@(posedge clk)
begin
    rx_d <= {rx_d[0],rx};
end

// 数据传输控制
always@(posedge clk)
begin
    if(rx_d == 2'b10) // 检测到下降沿传输开始
        start <= 1;
    else if(cnt == 9) // 数据接收完成
        start <= 0;
end

// 波特率计数器
always@(posedge clk)
begin
	if(!start)
		clk_cnt <= (CLK_RATE / (BAUDRATE*2)); // 中间采样
	else if(clk_cnt == CLK_RATE / BAUDRATE - 1)
		clk_cnt <= 0;
	else
		clk_cnt <= clk_cnt + 1;
end

// 波特率计数器
always@(posedge clk)
begin
	clk_en <= (clk_cnt == CLK_RATE / BAUDRATE - 1);
end

// 接收数据计数器
always@(posedge clk)
begin
	if(!start)
        cnt <= 0;
	else if(clk_en)
        cnt <= cnt + 1;
end

// 接收数据采样
always@(posedge clk)
if(clk_en)
begin
    case(cnt)
        1: data[0] <= rx;
        2: data[1] <= rx;
        3: data[2] <= rx;
        4: data[3] <= rx;
        5: data[4] <= rx;
        6: data[5] <= rx;  
        7: data[6] <= rx;    
        8: data[7] <= rx;
    endcase   
end

// 数据输出使能
always@(posedge clk)
begin
    rx_en <= (start && cnt == 9);
end

// 数据输出
always@(posedge clk)
begin
    if(cnt == 9)
        rx_data <= data;
end

endmodule
