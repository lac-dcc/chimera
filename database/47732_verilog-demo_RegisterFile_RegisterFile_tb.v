// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module RegisterFile_tb;

reg clk;
reg [3:0] readAddr1, readAddr2, writeAddr;
reg writeEnable;
reg [15:0] writeData;
wire [15:0] readData1, readData2;

// 实例化被测试的寄存器堆
RegisterFile dut (
    .clk(clk),
    .readAddr1(readAddr1),
    .readAddr2(readAddr2),
    .writeAddr(writeAddr),
    .writeEnable(writeEnable),
    .writeData(writeData),
    .readData1(readData1),
    .readData2(readData2)
);

// 时钟生成
always #5 clk = ~clk;

// 初始化
initial begin
    clk = 0;
    readAddr1 = 0;
    readAddr2 = 1;
    writeAddr = 2;
    writeEnable = 0;
    writeData = 16'h0000;

    // 写入数据到寄存器
    #10 writeEnable = 1;
    writeData = 16'h1234;
    writeAddr = 2;
    #10 writeEnable = 0;

    // 写入数据到寄存器
    #10 writeEnable = 1;
    writeData = 16'habcd;
    writeAddr = 0;
    #10 writeEnable = 0;

    // 读取寄存器数据
    readAddr1 = 2;
    readAddr2 = 0;
    #10 $display("Read data from port 1: %h, port 2: %h", readData1, readData2);

    // 更多测试操作...
    // 可以在这里添加更多的测试用例来验证寄存器堆的功能
    // 例如：连续写入、读取数据、多个并发读写操作等
    // End simulation
    $finish;
end

endmodule
