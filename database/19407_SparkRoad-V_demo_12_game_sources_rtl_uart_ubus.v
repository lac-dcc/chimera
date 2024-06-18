// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: ubus
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

module ubus
(
    input   wire		clk,
    
    // uart-rx
    input   wire		rx_en,
    input   wire [7:0]	rx_data,
    
    // uart-tx
    output  reg			tx_en,
    output  reg [7:0]	tx_data,
    input   wire		tx_ready,
    
	// uart recv
	output	reg			recv_en,
	output	reg [7:0]	recv_cmd,
	output	reg [7:0]	recv_data,
	
    // uart send
    input   wire		send_en,
    input   wire [7:0]	send_cmd,
    input   wire [7:0]	send_data,
    output  reg			send_ready
);

// 帧头常量
localparam HEAD_0 = "A";
localparam HEAD_1 = "B";
localparam HEAD_2 = "C";
localparam HEAD_3 = "D";
localparam HEAD_4 = "E";
localparam HEAD_5 = "F";

// 数据变量
reg rx_en_d;
reg [7:0] shift_reg0;
reg [7:0] shift_reg1;
reg [7:0] shift_reg2;
reg [7:0] shift_reg3;
reg [7:0] shift_reg4;
reg [7:0] shift_reg5;
reg [7:0] shift_reg6;
reg [7:0] shift_reg7;
reg frame_head_flag0;
reg frame_head_flag1;
reg frame_head_flag2;
reg frame_head_flag3;
reg frame_head_flag4;
reg frame_head_flag5;
reg frame_head_flag;
reg send_start;
reg send_finish;
reg [3:0] send_cnt;
reg send_flag;
reg [15:0] tx_buffer;
reg [2:0] tx_ready_cnt;
reg tx_ready_flag;

initial
begin
	send_start = 0;
	send_finish = 1;
end

//////////////////////////////////////// 接收逻辑 ///////////////////////////////////////////
// 数据移位寄存
always@(posedge clk)
begin
    if(rx_en)
    begin
        shift_reg0 <= rx_data;
        shift_reg1 <= shift_reg0;
        shift_reg2 <= shift_reg1;
        shift_reg3 <= shift_reg2;
        shift_reg4 <= shift_reg3;
        shift_reg5 <= shift_reg4;
        shift_reg6 <= shift_reg5;
        shift_reg7 <= shift_reg6;
    end
end

// 数据延时对齐
always@(posedge clk)
begin
    rx_en_d <= rx_en;
end

// 数据帧头判断
always@(posedge clk)
begin
    frame_head_flag0 <= rx_en_d && (shift_reg2 == HEAD_5);
    frame_head_flag1 <= rx_en_d && (shift_reg3 == HEAD_4);
    frame_head_flag2 <= rx_en_d && (shift_reg4 == HEAD_3);
    frame_head_flag3 <= rx_en_d && (shift_reg5 == HEAD_2);
    frame_head_flag4 <= rx_en_d && (shift_reg6 == HEAD_1);
    frame_head_flag5 <= rx_en_d && (shift_reg7 == HEAD_0);
end

// 数据帧头脉冲
always@(posedge clk)
begin
    frame_head_flag <= frame_head_flag0 & frame_head_flag1 & frame_head_flag2 & frame_head_flag3 & frame_head_flag4 & frame_head_flag5;
end

// 接收命令、数据提取
always@(posedge clk)
begin
    recv_en <= frame_head_flag;
    if(frame_head_flag)
    begin
		recv_cmd <= shift_reg1;
		recv_data <= shift_reg0;
    end
end

//////////////////////////////////////// 发送逻辑 ///////////////////////////////////////////
// 发送地址/数据寄存
always@(posedge clk)
begin
    if(send_en)
        tx_buffer <= {send_cmd,send_data};
end

// 数据发送开始
always@(posedge clk)
begin
	if(send_en)
        send_start <= 1;
    else if(send_finish)
        send_start <= 0;
end

// 数据发送完成
always@(posedge clk)
begin
	if(send_en)
        send_finish <= 0;
    else if(tx_en && send_cnt == 8)
        send_finish <= 1;
end

// 串口发送可用脉冲计数器
always@(posedge clk)
begin
	if(tx_ready)
		tx_ready_cnt <= tx_ready_cnt + 1;
	else
		tx_ready_cnt <= 0;
end

// 串口发送可用脉冲
always@(posedge clk)
begin
	tx_ready_flag <= &tx_ready_cnt;
end

// 数据发送使能
always@(posedge clk)
begin
    send_flag <= (send_start && tx_ready_flag);
    tx_en <= send_flag;
end

// 发送计数器
always@(posedge clk)
begin
	if(send_finish)
        send_cnt <= 0;
    else if(send_start && tx_ready_flag)
        send_cnt <= send_cnt + 1;
end

// 数据发送使能
always@(posedge clk)
begin
    case(send_cnt)
     1:  tx_data <= HEAD_0;
     2:  tx_data <= HEAD_1;
     3:  tx_data <= HEAD_2;
     4:  tx_data <= HEAD_3;
     5:  tx_data <= HEAD_4;
     6:  tx_data <= HEAD_5;
     7:  tx_data <= tx_buffer[15:8];
     8:  tx_data <= tx_buffer[7:0];
    endcase
end

// 串口发送空闲
always@(posedge clk)
begin
	if(send_en)
        send_ready <= 0;
    else if(tx_ready_flag && send_finish)
        send_ready <= 1;
end

endmodule
