// This program was cloned from: https://github.com/buttfa/8_bits_cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/12 10:41:25
// Design Name: 
// Module Name: regs
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


module regs(
        input rst, // 复位信号
        input reg_en, // 寄存器使能信号
        input [3:0] reg_addr, // 目标寄存器地址
        input [1:0] reg_source, // 指明寄存器操作
        input [7:0] rom_out, // 来自ROM的数据
        input [7:0] ram_out, // 来自RAM的数据
        input [7:0] ac_out, // 来自AC的数据

        output reg [7:0] reg_out // 寄存器输出的数据
    );

    // 16个8位通用寄存器
    reg [7:0] regs [15:0];

    parameter 
        REG_OUT = 2'b00,
        ROM     = 2'b01,
        RAM     = 2'b10,
        AC      = 2'b11;

    always @(negedge rst or posedge reg_en) begin
        if (!rst) begin
            regs[0]  <= 8'b0000_0000;
            regs[1]  <= 8'b0000_0000;
            regs[2]  <= 8'b0000_0000;
            regs[3]  <= 8'b0000_0000;
            regs[4]  <= 8'b0000_0000;
            regs[5]  <= 8'b0000_0000;
            regs[6]  <= 8'b0000_0000;
            regs[7]  <= 8'b0000_0000;
            regs[8]  <= 8'b0000_0000;
            regs[9]  <= 8'b0000_0000;
            regs[10] <= 8'b0000_0000;
            regs[11] <= 8'b0000_0000;
            regs[12] <= 8'b0000_0000;
            regs[13] <= 8'b0000_0000;
            regs[14] <= 8'b0000_0000;
            regs[15] <= 8'b0000_0000;
        end else if (reg_en) begin
            case (reg_source)
                REG_OUT: begin
                    reg_out <= regs[reg_addr]; 
                end
                ROM: begin
                    regs[reg_addr] <= rom_out;
                    reg_out <= rom_out;
                end
                RAM: begin
                    regs[reg_addr] <= ram_out;
                    reg_out <= ram_out;
                end
                AC : begin
                    regs[reg_addr] <= ac_out;
                    reg_out <= ac_out;
                end
                default: begin
                    reg_out <= 8'bZZZZ_ZZZZ;
                end 
            endcase
        end
    end

endmodule
