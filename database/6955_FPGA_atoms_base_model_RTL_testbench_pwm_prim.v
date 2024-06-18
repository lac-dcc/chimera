// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 可配置参数的 pwm 设计代码验证平台模块
//

`timescale 1ns/1ps
module testbench_pwm_prim(

);

parameter CLK_PERIOD = 10;

reg         clk;
reg         rst;
reg         i_en;
reg  [31:0] i_period;
reg  [31:0] i_high;
reg  [15:0] i_times;
wire        o_pwm;

// 连接测试模块
pwm_prim pwm_prim_test(
    .clk            (clk),
    .rst            (clk),
    .i_en           (i_en),
    .i_period       (i_period),
    .i_high         (i_high),
    .i_times        (i_times),
    .o_pwm          (o_pwm)
);

// 初始化时钟和复位
initial begin
    clk <= 0;
    rst <= 0;
    i_en <= 0;
    i_period <= 0;
    i_high <= 0;
    i_times <= 0;
    #1000;
    rst <= 1;
end
always #(CLK_PERIOD/2) clk = ~clk;


// 封装激励参数内容
task task_1;
    input  [31:0]   pwm_period;
    input  [31:0]   pwm_high;
    input  [15:0]   pwm_times;
    begin
        i_period <= pwm_period;
        i_high <= pwm_high;
        i_times <= pwm_times;
    end
endtask


// 产生激励信号
initial begin
    @(posedge rst);

    @(posedge clk);

    #100;
    i_en <= 1;
    task_1(CLK_PERIOD*8,CLK_PERIOD*5,CLK_PERIOD*80);

    
    #10000;
    i_period <= 100;
    i_high <= 40;
    i_times <= 1000;

    #100_000;
    $stop;
end


// 测试使能信号是否起到了开启和关断效果
initial begin
    #5000;
    i_en <= 0;
    #6000;
    i_en <= 1;
end

endmodule