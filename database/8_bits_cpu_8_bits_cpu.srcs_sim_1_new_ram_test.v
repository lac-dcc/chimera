// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/10 11:15:52
// Design Name: 
// Module Name: ram_test
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


module ram_test();
    
    reg ram_en = 0;
    reg w_r;
    reg [7:0] addr;
    reg [7:0] ram_in;
    
    
    wire [7:0] ram_out;
    ram ram(
        .ram_en(ram_en), // ram使能信号
        .w_r(w_r), // w(0)表示写，r(1)表示读
        .addr(addr), // 目标地址
        .ram_in(ram_in), // 输入ram的数据

        .ram_out(ram_out) // 输出ram的数据
    );

    integer i;
    initial begin
        // 向RAM前16字节写入随机数据
        #5;
        for (i = 0; i < 16; i = i + 1) begin
            addr = i; ram_in = $random % 100; w_r = 0;
            #5;
            ram_en = 1;
            #5;
            ram_en = 0;
            #5;
        end


        // 读取RAM前16字节数据
        for (i = 0; i < 16; i = i + 1) begin
            addr = i; w_r = 1;
            #5;
            ram_en = 1;
            #5;
            ram_en = 0;
            #5;
        end
        $finish;
    end

endmodule
