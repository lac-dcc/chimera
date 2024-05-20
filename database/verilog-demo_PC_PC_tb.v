// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module PC_tb;

    // 生成时钟信号
    reg clk;
    always #5 clk = ~clk;  // 时钟周期为10个时间单位

    // 信号定义
    reg reset;
    wire [7:0] pc_out;

    // 实例化程序计数器模块
    PC pc_inst (
        .clk(clk),
        .reset(reset),
        .pc(pc_out)
    );

    // 初始化
    initial begin
        clk = 0;
        reset = 1;  // 置位复位信号
        #10 reset = 0; // 持续10个时间单位后取消复位
    end

    // 打印计数器输出
    always @(posedge clk)
        $display("PC = %h", pc_out);

    // 模拟时钟运行
    initial begin
        #100; // 模拟100个时间单位
        $finish; // 结束仿真
    end

endmodule
