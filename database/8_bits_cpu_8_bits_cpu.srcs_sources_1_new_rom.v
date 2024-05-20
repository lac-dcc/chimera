// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/10 08:56:54
// Design Name: 
// Module Name: rom
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

// ROM只读
module rom(
        input rom_en, // rom使能信号
        input [7:0] addr, // 读取数据的目标地址
        input [7:0] pc_addr, // PC指向的指令地址

        output reg [7:0] rom_out, // 输出的数据
        output reg [7:0] instruct // 依据pc_addr取出的指令
    );

    // 8x256=2048(bits)=256(bytes)
    reg  [7:0] rom [255:0];

    initial begin
        rom[0]  = 8'b0000_0000; // NOP
        
        rom[1]  = 8'b1100_0001; // ADDI 1
        rom[2]  = 8'b0000_0001;

        rom[3]  = 8'b1010_0000;  //LDM reg[0]

        rom[4] = 8'b0101_0001; // LDO reg[1], rom[22]
        rom[5] = 8'd22;

        rom[6]  = 8'b1100_0001; // ADDI 4
        rom[7]  = 8'b0000_0100;

        rom[8]  = 8'b1110_0000; // LS reg[0]

        rom[9]  = 8'b1111_0000; // RS reg[0]

        rom[10]  = 8'b0101_0000; // LDO reg[0],rom[22]
        rom[11]  = 8'd22;

        rom[12]  = 8'b1101_0000; // ADD reg[0],ac = ac + reg[0]

        rom[13]  = 8'b1100_0000; // CPL, ac = ~ac
        rom[14]  = 8'b0000_0000;

        rom[15]  = 8'b0001_0000;  // B 8'd20
        rom[16]  = 8'd22;

        rom[17]  = 8'b0000_0000;
        rom[18]  = 8'b0000_0000;
        rom[19]  = 8'b0000_0000;

        rom[20]  = 8'b1100_0001; // ADDI 1
        rom[21]  = 8'b0000_0001;

        rom[22]  = 8'b0000_0010; // HALT, 数据：2
        rom[23]  = 8'b0000_0000;
        // rom[22]  = 8'b1100_0000; // CPL, ac = ~ac
        // rom[23]  = 8'b0000_0000;
    end 

    // 使能信号的上升沿更新输出数据
    always @(posedge rom_en) begin
        rom_out <= rom[addr];
        instruct <= rom[pc_addr];
    end
endmodule
