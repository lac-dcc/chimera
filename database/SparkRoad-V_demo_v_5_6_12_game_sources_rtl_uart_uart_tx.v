`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: uart_tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 串口发送,起始位1,数据位8,停止位2.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_tx
#(
	parameter BAUDRATE = 115200,
	parameter CLK_RATE = 50000000
)
(
    input	wire		clk,
	
	// uart
    output  reg			tx,
	
	// data
    input	wire		tx_en,
    input	wire [7:0]	tx_data,
	output	reg			tx_ready
);

reg start;
reg clk_en;
reg [3:0] cnt;
reg [7:0] data;
reg [31:0] clk_cnt;

initial
begin
	start = 0;
end

// 波特率计数器
always@(posedge clk)
begin
	if(!start)
		clk_cnt <= 0;
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

// 数据传输控制
always@(posedge clk)
begin
    if(tx_en) // 传输开始
        start <= 1;
    else if(cnt == 10) // 传输结束
        start <= 0;
end

// 数据寄存
always@(posedge clk)
begin
	if(tx_en && !start)
		data <= tx_data;
end

// 状态计数器
always@(posedge clk)
begin
    if(!start)
		cnt <= 0;
	else if(clk_en)
        cnt <= cnt + 1;
end

// 串口发送
always@(posedge clk)
begin
    case(cnt)
		0: tx <= 1'b1;    // 发送停止位(上电状态).
        1: tx <= 1'b0;    // 传输开始
        2: tx <= data[0]; // 发送数据位的第1位bit0
        3: tx <= data[1]; // 发送数据位的第2位bit1
        4: tx <= data[2]; // 发送数据位的第3位bit2
        5: tx <= data[3]; // 发送数据位的第4位bit3
        6: tx <= data[4]; // 发送数据位的第5位bit4
        7: tx <= data[5]; // 发送数据位的第6位bit5
        8: tx <= data[6]; // 发送数据位的第7位bit6
        9: tx <= data[7]; // 发送数据位的第8位bit7
        10:tx <= 1'b1;    // 发送停止位
    endcase
end

// 发送模块可用
always@(posedge clk)
begin
	if(tx_en)
		tx_ready <= 0;
	else
		tx_ready <= !start;
end

endmodule
