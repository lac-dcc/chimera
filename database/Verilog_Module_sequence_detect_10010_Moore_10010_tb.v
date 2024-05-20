// This program was cloned from: https://github.com/sspku-mzj/Verilog_Module
// License: Apache License 2.0

`timescale 1ns/1ns

module Moore_10010_tb;

    reg     data_in;
    reg     clk;
    reg     rst_n;

    wire    data_out0;                      // 重复检测
    wire    data_out1;                      // 非重复检测

    parameter REPEAT0 = 1'b1;               // 重复检测
    parameter REPEAT1 = 1'b0;               // 非重复检测

    initial begin
        clk <= 1'b1;
        rst_n <= 1'b0;
        data_in <= 1'b0;
        #30 rst_n <= 1'b1;
        forever begin
            #20 data_in <= ({$random} % 2);  // 生成1bit随机数
        end
    end

    always #10 clk <= ~clk;                 // 时钟信号50MHz

    Moore_10010 #(
        .REPEAT (REPEAT0)
    ) uMoore_10010_instance0(
        .data_in    (data_in),
        .clk        (clk),
        .rst_n      (rst_n),
        .data_out   (data_out0)
    );

    Moore_10010 #(
        .REPEAT (REPEAT1)
    ) uMoore_10010_instance1(
        .data_in    (data_in),
        .clk        (clk),
        .rst_n      (rst_n),
        .data_out   (data_out1)
    );
endmodule