// This program was cloned from: https://github.com/sspku-mzj/Verilog_Module
// License: Apache License 2.0

`timescale 1ns/1ns
`define halfperiod 50
module sigdata (
    rst,
    sclk,
    data,
    ask_for_data
);
    output          rst;                // 复位信号
    output          sclk;               // 输出的时钟信号
    output  [3:0]   data;               // 输出的数据信号
    input           ask_for_data;       // 从串并转换器来的请求数据信号

    reg             sclk;
    reg             rst;
    reg     [3:0]   data;

    initial begin
        rst = 1;
        #10 rst = 0;
        #(`halfperiod * 2 + 3) rst = 1;
    end

    initial begin                       // 寄存器变量初始化
        sclk = 0;
        data = 0;
        #(`halfperiod * 1000) $stop;
    end

    always #(`halfperiod) sclk = ~sclk; // 产生第一个模块需要的输入时钟
    
    // 每次请求新数据信号的正跳变沿, 等一段时间后将输出数据增加1
    always @(posedge ask_for_data) begin
        #(`halfperiod/2 + 3) data = data + 1;
    end 
    
endmodule