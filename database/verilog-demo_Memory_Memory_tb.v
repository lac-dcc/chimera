// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module Memory_tb;

// 时钟信号
reg clk;
always #5 clk = ~clk; // 5个时间单位翻转一次时钟

// 模块实例化
reg rw_enable;
reg [8:0] address;
reg [15:0] data_in;
wire [15:0] data_out;

// 调用被测试的模块
Memory dut (
    .clk(clk),
    .rw_enable(rw_enable),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

// 初始化
initial begin
    clk = 0;
    rw_enable = 0;
    address = 0;
    data_in = 16'h0000;

    // 读写操作测试
    // 写入数据
    rw_enable = 0; // 写入使能
    address = 10'b000000000; // 写入地址
    data_in = 16'h1234; // 写入数据
    #10; // 等待时钟上升沿

    // 写入数据
    rw_enable = 0; // 写入使能
    address = 10'b111111111; // 写入地址
    data_in = 16'h4321; // 写入数据
    #10; // 等待时钟上升沿

    rw_enable = 1; // 读取使能
    address = 10'h000; // 读取地址
    #10; // 等待时钟上升沿
    $display("Memory[%d] = %h", address, data_out);

    rw_enable = 1; // 读取使能
    address = 10'b111111111; // 读取地址
    #10; // 等待时钟上升沿
    $display("Memory[%d] = %h", address, data_out);

    $finish; // 测试结束
end

endmodule
