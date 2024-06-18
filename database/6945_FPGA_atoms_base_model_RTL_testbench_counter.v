// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 对脉冲信号使能时计数的验证平台代码
//

`timescale 1ns/1ps
module testbench_counter(

);

parameter CLK_PERIOD = 10;

reg         clk;
reg         rst;
reg         pulse;
reg         en_count;
wire [15:0] count;

// 连接测试模块
counter counter_test(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse),
    .en_count   (en_count),
    .count      (count)
);

// 初始化复位和时钟
initial begin
    clk <= 0;
    rst <= 0;
    #1000
    rst <= 1;
end

always #(CLK_PERIOD/2) clk = ~clk;

// 产生测试激励
initial begin
    en_count <= 0;
    pulse <= 0;

    @(posedge rst);

    @(posedge clk);
    #10;
    en_count <= 1;
    repeat(1000) begin
        @(posedge clk);
    end
    en_count <= 0;

    #10000;

    $stop;
end

// 产生脉冲信号流，周期为 40 个时间单位
always begin
    #(CLK_PERIOD*2);
    pulse = ~pulse;
end

// 计数了 250 次
// 重复了 1000 次捕获上升沿，那么使能信号处于上升沿的时间应该是
// 1000*10 个时间单位，然后 10000/40 =250 结果正确

endmodule