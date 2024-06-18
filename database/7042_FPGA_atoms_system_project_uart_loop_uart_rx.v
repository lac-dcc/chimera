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
* ========================================================================
*/
//
// uart 接收模块，电脑 to 板上

module uart_rx#(
    parameter CLK_FEQ = 26'd50_000_000,
    parameter UART_BOT = 15'd9600
)(
    input               clk,
    input               rst,
    input               uart_rx,
    output reg  [7:0]   data_out,
    output reg          data_out_flag
);

reg         rx_reg1;
reg         rx_reg2;
reg         rx_reg3;
reg         start_nedge;
reg         work_en;
reg [15:0]  baud_cnt;
reg         bit_flag;
reg [3:0]   bit_cnt;
reg [7:0]   rx_data;
reg         rx_flag;

localparam BIT_CNT_MAX = CLK_FEQ / UART_BOT;


// 延迟 3 个时钟周期
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rx_reg1 <= 1'b1;
        rx_reg2 <= 1'b1;
        rx_reg3 <= 1'b1;
    end
    else begin
        rx_reg1 <= uart_rx;
        rx_reg2 <= rx_reg1;
        rx_reg3 <= rx_reg2;
    end
end


// 下降沿检测
always @(posedge clk or negedge rst) begin  
    if(!rst) begin
        start_nedge <= 1'b0;
    end
    else if((~rx_reg2) && (rx_reg3)) begin
        start_nedge <= 1'b1;
    end
    else begin
        start_nedge <= 1'b0;
    end
end


// 数据传输使能
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        work_en <= 1'b0;
    end
    else if(start_nedge) begin
        work_en <= 1'b1;
    end
    else if((bit_flag == 1'b1) && (bit_cnt == 4'd8)) begin
        work_en <= 1'b0;
    end
    else begin
        work_en <= work_en;
    end
end


// 波特率设定
always @(posedge clk or negedge rst) begin 
    if(!rst) begin
        baud_cnt <= 13'd0;
    end
    else if((baud_cnt == BIT_CNT_MAX - 1'b1) || (work_en == 1'b0)) begin
        baud_cnt <= 13'd0;
    end
    else begin
        baud_cnt <= baud_cnt + 1'b1;
    end
end


// 读取数据标志信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        bit_flag <= 1'b0;
    end
    else if(baud_cnt == BIT_CNT_MAX/2 - 1'b1) begin
        bit_flag <= 1'b1;
    end
    else begin
        bit_flag <= 1'b0;
    end
end


// 读取数据位数计数
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        bit_cnt <= 4'b0;
    end
    else if((bit_cnt == 4'd8) && (bit_flag == 1'b1)) begin
        bit_cnt <= 4'b0;
    end
    else if(bit_flag) begin
        bit_cnt <= bit_cnt + 1'b1;
    end
    else begin
        bit_cnt <= bit_cnt;
    end
end


// 串行接收数据
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rx_data <= 8'd0;
    end
    else if((bit_flag == 1'b1) && (bit_cnt > 4'd0)) begin
        rx_data <= {rx_reg3, rx_data[7:1]};
    end
    else begin
        rx_data <= rx_data;
    end
end


// 数据接收完成标志信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rx_flag <= 1'b0;
    end
    else if((bit_cnt == 4'd8) && (bit_flag == 1'b1)) begin
        rx_flag <= 1'b1;
    end
    else begin
        rx_flag <= 1'b0;
    end
end


// 保存数据
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        data_out <= 8'd0;
    end
    else if(rx_flag) begin
        data_out <= rx_data;
    end
    else begin
        data_out <= data_out;
    end
end


// 输出有效标志信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        data_out_flag <= 1'b0;
    end
    else begin
        data_out_flag <= rx_flag;
    end
end

endmodule