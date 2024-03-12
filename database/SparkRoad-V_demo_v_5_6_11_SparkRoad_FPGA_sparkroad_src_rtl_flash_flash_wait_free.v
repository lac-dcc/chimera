`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 22:57:08
// Design Name: 
// Module Name: flash_wait_free
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

module flash_wait_free
(
    input   wire    clk,
    
    // SPI
    output  reg     fls_sck,
    output  reg     fls_ncs,
    output  reg     fls_sdo,
    input   wire    fls_sdi,

    input   wire    start,
    output  reg     busy
);

reg [31:0] cnt;
reg [28:0] cycle_cnt; 
reg [2:0] phase_cnt;
reg [7:0] tx_reg;
reg [7:0] rx_reg;
reg sft_wen;
reg sft_ren;
reg byte_flag;
reg fls_busy;

initial
begin
    cnt = 0;
    tx_reg = 0;
    rx_reg = 0;
    busy = 0;
    fls_busy = 1;
end

// 总计数器
always@(posedge clk)
begin
    if(busy)
        cnt <= cnt + 1;
    else
        cnt <= 0;
end

// 周期计数器
always@(posedge clk)
begin
    cycle_cnt <= cnt[31:3];
end

// 相位计数器
always@(posedge clk)
begin
    phase_cnt <= cnt[2:0];
end

// SPI时钟
always@(posedge clk)
begin
    fls_sck <= cnt[2];
end

// SPI片选
always@(posedge clk)
begin
    if(busy)
        fls_ncs <= 0;
    else
        fls_ncs <= 1;
end

// 初始化数据
always@(posedge clk)
begin
    if(start)
        tx_reg <= {8'h05}; // 等待flash空闲命令
    else if(sft_wen)
        tx_reg <= {tx_reg[6:0],1'b0};
end

// 写数据移位使能(sck下降沿产生一个移位).
always@(posedge clk)
begin
    sft_wen <= (phase_cnt == 6);
end

// 读数据移位使能(sck上升沿产生一个移位).
always@(posedge clk)
begin
    sft_ren <= (phase_cnt == 3) && (cycle_cnt > 7);
end

// 接收完1byte数据
always@(posedge clk)
begin
    byte_flag <= (cycle_cnt > 7) && (cycle_cnt[2:0] == 7) && (phase_cnt == 5);
end

// sdo
always@(posedge clk)
begin
    fls_sdo <= tx_reg[7];
end

// sdi
always@(posedge clk)
begin
    if(sft_ren)
        rx_reg <= {rx_reg[6:0],fls_sdi};
end

// fls_busy
always@(posedge clk)
begin
    if(start)
        fls_busy <= 1;
    else if(byte_flag)
        fls_busy <= rx_reg[0]; // 1 for busy. 0 for free
end

// busy
always@(posedge clk)
begin
    if(start)
        busy <= 1;
    else if((fls_busy == 0) && (phase_cnt == 0))
        busy <= 0;
end

endmodule