// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 检测某一输入激励信号发生变化时的上升沿或下降沿变化的验证平台代码
//

`timescale 1ns/1ps
module testbench_posenege(

);

parameter CLK_PERIOD = 10;

reg         clk;
reg         rst;
reg         pulse;
wire        rise_edge;
wire        fall_edge;

posenege posenege_test(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse),
    .rise_edge  (rise_edge),
    .fall_edge  (fall_edge)
);

// 初始化复位和时钟
initial begin
    clk <= 0;
    rst <= 0;
    #1000;
    rst <= 1;
end

always #(CLK_PERIOD/2) clk = ~clk;

initial begin
    pulse <= 1'b0;      // 上电就赋初值 0
    @(posedge rst)

    @(posedge clk) 

    repeat(10) begin
        @(posedge clk);
    end
    #4;                 // 使激励信号与时钟不同步
    pulse <= 1'b1;

    // 延迟 10 个时钟周期
    repeat(10) begin
        @(posedge clk);
    end
    #4;
    pulse <= 1'b0;

    repeat(10) begin
        @(posedge clk);
    end

    #10_000;
    $stop;
end

endmodule