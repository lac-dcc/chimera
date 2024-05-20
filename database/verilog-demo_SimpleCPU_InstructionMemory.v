// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module InstructionMemory (
    input wire clk,            // 时钟输入
    input wire rw_enable,      // 读写使能，低电平有效
    input wire [7:0] address,  // 8位地址
    input wire [15:0] data_in, // 写入数据
    output wire [15:0] data_out // 读出数据
);

reg [15:0] data_out_r;
assign data_out = data_out_r;
// 存储器数组，1K字节，每个存储位置16位
reg [15:0] memory [0:255];

// 读写操作
always @(posedge clk)
begin
    if (rw_enable) begin  // 读操作，低电平有效
        data_out_r <= memory[address];
    end
    else begin  // 写操作
        memory[address] <= data_in;
    end
end

endmodule
