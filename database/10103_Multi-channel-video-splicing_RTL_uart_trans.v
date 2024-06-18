// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <NULL>
*
* If there is no OPEN-SOURCE licenses are listed, it indicates none of
* content in this Code document is sourced from OPEN-SOURCE communities. 
*
* In this case, the document is protected by copyright, and any use of
* all or part of its content by individuals, organizations, or companies
* without authorization is prohibited, unless the project repository
* associated with this document has added relevant OPEN-SOURCE licenses
* by github.com/MongooseOrion. 
*
* Please make sure using the content of this document in accordance with 
* the respective OPEN-SOURCE licenses. 
* 
* THIS CODE IS PROVIDED BY https://github.com/MongooseOrion. 
* FILE ENCODER TYPE: UTF-8
* ========================================================================
*/
// UART 指令控制模块
// 
module uart_trans(
    input           clk,
    input           rst,  
    input           uart_rx,
    input   [7:0]   command_in, 
    input           command_in_flag,  
    output          uart_tx,
    output  [3:0]   ctrl_command_out/*synthesis PAP_MARK_DEBUG="1"*/,
    output  [3:0]   value_command_out/*synthesis PAP_MARK_DEBUG="1"*/,
    output reg      command_out_flag/*synthesis PAP_MARK_DEBUG="1"*/
);

wire            data_out_flag;
wire [7:0]      command_out;

reg [3:0]       reg_ctrl_command;
reg [3:0]       reg_value_command;

assign ctrl_command_out = reg_ctrl_command;
assign value_command_out = reg_value_command;


// 从电脑接收控制信号
uart_rx command_recv(
    .clk            (clk),
    .rst            (rst),
    .data_out       (command_out),
    .data_out_flag  (data_out_flag),
    .uart_rx        (uart_rx)
);

// 延迟一个周期
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        command_out_flag <= 'b0;
    end
    else begin
        command_out_flag <= data_out_flag;
    end
end


// 控制信号只有效一个时钟周期
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_ctrl_command <= 'b0;
        reg_value_command <= 'b0;
    end
    else if(data_out_flag) begin
        reg_ctrl_command <= command_out[7:4];
        reg_value_command <= command_out[3:0];
    end
    else begin
        reg_ctrl_command <= reg_ctrl_command;
        reg_value_command <= 4'b0;
    end
end


// 板上反馈信息
uart_tx command_deliver(
    .clk            (clk),
    .rst            (rst),
    .data_in        (command_in),
    .data_in_flag   (command_in_flag),
    .uart_tx        (uart_tx)
);


endmodule