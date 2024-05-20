// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/10 09:24:18
// Design Name: 
// Module Name: rom_test
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


module rom_test();
    reg rom_en = 0;
    reg [7:0] addr;
    reg [7:0] pc_addr;


    wire [7:0] rom_out;
    wire [7:0] instruct;
    rom rom(
        .rom_en(rom_en), // rom使能信号
        .addr(addr), // 读取数据的目标地址
        .pc_addr(pc_addr), // PC指向的指令地址

        .rom_out(rom_out), // 输出的数据
        .instruct(instruct) // 依据pc_addr取出的指令
    );

    integer i = 0;
    initial begin
        #5;
        for (i = 0; i < 16; i = i + 1) begin
            addr = i; pc_addr = i;
            #5;
            rom_en = 1;
            #5;
            rom_en = 0;
            #5;
        end
        $finish;
    end
endmodule
