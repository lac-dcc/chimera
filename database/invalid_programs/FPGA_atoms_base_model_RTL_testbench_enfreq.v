// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 使能时钟的验证平台代码
//

`timescale 1ns/1ps
module testbench_enfreq(

);

parameter   CLK_PERIOD = 10;

reg     clk;
reg     rst;
wire    syscnt;

// 连接测试模块
enfreq enfreq_test(
    .clk    (clk),
    .rst    (rst),
    .syscnt (syscnt)
);

// 初始化时钟和复位信号
initial begin
    clk <= 0;
    rst <= 0;
    #1000;
    rst <= 1;
end

always #(CLK_PERIORD / 2) clk = ~clk;


// 产生测试激励
initial begin
    @(posedge rst);
    @(posedge clk);

    repeat(10) begin
        @(posedge clk);
    end

    #10_000;

    $stop;
end

endmodule
