// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module RegisterFile(
    input wire clk,
    input wire [3:0] readAddr1, // 读端口1的读地址
    input wire [3:0] readAddr2, // 读端口2的读地址
    input wire [3:0] writeAddr, // 写端口的写地址
    input wire writeEnable,     // 写使能信号
    input wire [15:0] writeData, // 写数据
    output reg [15:0] readData1, // 读端口1的读数据
    output reg [15:0] readData2  // 读端口2的读数据
);

reg [15:0] registers [7:0]; // 8个16位寄存器数组

// 读操作
always @ (posedge clk) begin
    readData1 <= registers[readAddr1];
    readData2 <= registers[readAddr2];
end

// 写操作
always @ (posedge clk) begin
    if (writeEnable)
        registers[writeAddr] <= writeData;
end

endmodule
