// This program was cloned from: https://github.com/JeredGong/codsinglecyclecpu
// License: Apache License 2.0

`include "xgriscv_defines.v"

module control(
    input [6:0] Opcode,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output jump,
    output [1:0] Aluop,
    output [2:0] WriteBackSel
);


// WriteBackSel解释： 000 不写入 001写入的值来自ALU 011写入值来自内存 010写入值PC+4 110写入值来自imm 111写入值来自imm+PC
// 编码方式采用格雷码
// 组合逻辑实现控制信号
assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, jump, Aluop,WriteBackSel} =
    (Opcode == 7'b0110011) ? 12'b0010000_10_001 :  // R-type
    (Opcode == 7'b0000011) ? 12'b1111000_00_011 :  // lw-type
    (Opcode == 7'b0100011) ? 12'b1000100_00_000:  // s-type
    (Opcode == 7'b1100011) ? 12'b0000010_01_000 :  // sb-type
    (Opcode == 7'b0010011) ? 12'b1010000_11_001 :  // I-type
    (Opcode == 7'b1100111) ? 12'b1010001_00_010 :  // jalr-type
    (Opcode == 7'b1101111) ? 12'b1010001_00_010 :  // jal-type
    (Opcode == 7'b0110111) ? 12'b0010000_00_110 :  // lui-type
    (Opcode == 7'b0010111) ? 12'b0010000_00_111 :  // auipc
    12'b00000000000;  // 默认值

endmodule
