// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/20 22:28:46
// Design Name: 
// Module Name: flash_write_enable
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

module flash_write_enable
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

reg [9:0] cnt;
reg [6:0] cycle_cnt; 
reg [2:0] phase_cnt;
reg [7:0] tx_reg;
reg sft_wen;
reg byte_flag;

initial
begin
    cnt = 0;
    tx_reg = 0;
    busy = 0;
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
    cycle_cnt <= cnt[9:3];
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
        tx_reg <= {8'h06}; // 读使能命令
    else if(sft_wen)
        tx_reg <= {tx_reg[6:0],1'b0};
end

// 写数据移位使能(sck下降沿产生一个移位).
always@(posedge clk)
begin
    sft_wen <= (phase_cnt == 6);
end

// 发送或者接收完1byte数据
always@(posedge clk)
begin
    byte_flag <= (cycle_cnt[2:0] == 7) && (phase_cnt == 5);
end

// sdo
always@(posedge clk)
begin
    fls_sdo <= tx_reg[7];
end

// busy
always@(posedge clk)
begin
    if(start)
        busy <= 1;
    else if(cycle_cnt == 8)
        busy <= 0;
end

endmodule