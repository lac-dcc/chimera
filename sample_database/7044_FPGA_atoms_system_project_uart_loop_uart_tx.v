// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

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
// uart uart_tx 模块
// 
module uart_tx#(
    parameter CLK_FEQ = 26'd50_000_000,
    parameter UART_BOT = 15'd9600
)(
    input               clk,
    input               rst,
    input       [7:0]   data_in,
    input               data_in_flag,
    output reg          uart_tx
);

localparam BIT_CNT_MAX = CLK_FEQ / UART_BOT;

reg         work_en;
reg [15:0]  baud_cnt;
reg [3:0]   bit_cnt;


// 发送使能
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        work_en <= 1'b0;
    end
    else if(data_in_flag) begin
        work_en <= 1'b1;
    end
    else if((bit_cnt == 4'd9) && (baud_cnt == BIT_CNT_MAX/2 - 1'b1)) begin
        work_en <= 1'b0;
    end
end


// 发送周期（波特率9600）
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        baud_cnt <= 16'd0;
    end
    else if((work_en==1'b0) || (baud_cnt==BIT_CNT_MAX - 1'b1)) begin
        baud_cnt <= 16'd0;
    end
    else if(work_en) begin
        baud_cnt <= baud_cnt + 1'b1;
    end
    else begin
        baud_cnt <= baud_cnt;
    end
end


// 发送数据位置计数
always @(posedge clk or negedge rst) begin 
    if(!rst) begin
        bit_cnt <= 4'b0;
    end
    else if((bit_cnt==4'd9) && (baud_cnt==BIT_CNT_MAX/2 - 1'b1)) begin
        bit_cnt <= 4'b0;
    end
    else if(baud_cnt==BIT_CNT_MAX/2 - 1'b1) begin
        bit_cnt <= bit_cnt+1'b1;
    end
    else begin
        bit_cnt <= bit_cnt;
    end
end


always @(posedge clk or negedge rst) begin
    if(!rst) 
        uart_tx <= 1'b1;
    else if(bit_cnt==4'b1)
        uart_tx <= 1'b0;
    else if(bit_cnt==4'd2)
        uart_tx <= data_in[0];
    else if(bit_cnt==4'd3)
        uart_tx <= data_in[1];
    else if(bit_cnt==4'd4)
        uart_tx <= data_in[2];
    else if(bit_cnt==4'd5)
        uart_tx <= data_in[3];
    else if(bit_cnt==4'd6)
        uart_tx <= data_in[4];
    else if(bit_cnt==4'd7)
        uart_tx <= data_in[5];
    else if(bit_cnt==4'd8)
        uart_tx <= data_in[6];
    else if(bit_cnt==4'd9)
        uart_tx <= data_in[7];
    else
        uart_tx <= 1'b1;
end


endmodule
