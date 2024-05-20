// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/10 09:08:07
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// RAM可读，可写
module ram(
        input ram_en, // ram使能信号
        input w_r, // w(0)表示写，r(1)表示读
        input [7:0] addr, // 目标地址
        input [7:0] ram_in, // 输入ram的数据

        output reg [7:0] ram_out // 输出ram的数据
    );

    // 8x256=2048(bits)=256(bytes)
    reg [7:0] ram [255:0];

    always @(posedge ram_en) begin
        if (w_r) begin // w_r为1时，进行读操作，更新输出数据
            ram_out <= ram[addr];
        end else if (!w_r) begin // w_r为0时，进行写操作
            ram[addr] <= ram_in;
            ram_out <= ram_in; // 因为改变的可能就是当前指向的值，所以ram_out输出高阻态以免出现意外
        end else begin // w_r为高阻态或未知则输出高阻态
            ram_out <= 8'hzz;
        end
    end
endmodule
