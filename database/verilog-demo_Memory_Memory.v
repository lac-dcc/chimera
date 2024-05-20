// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module Memory (
    input wire clk,            // 时钟输入
    input wire rw_enable,      // 读写使能，低电平有效
    input wire [8:0] address,  // 存储器地址，1K容量需要9位地址
    input wire [15:0] data_in, // 写入数据
    output reg [15:0] data_out // 读出数据
);

// 存储器数组，1K字节，每个存储位置16位
reg [15:0] memory [0:511];

// 读写操作
always @(posedge clk)
begin
    if (rw_enable) begin  // 读操作，低电平有效
        data_out <= memory[address];
    end
    else begin  // 写操作
        memory[address] <= data_in;
    end
end

endmodule
