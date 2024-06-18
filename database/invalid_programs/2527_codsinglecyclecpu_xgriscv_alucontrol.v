// This program was cloned from: https://github.com/JeredGong/codsinglecyclecpu
// License: Apache License 2.0

`include "xgriscv_defines.v"
module alucontrol(
    input [6:0] funct7,
    input [2:0] funct3,
    input [1:0] PreALUop,
    output wire [3:0] ALUop
);
// 定义操作码
localparam ALU_ADD  = 4'b0000;
localparam ALU_SUB  = 4'b0001;
localparam ALU_AND  = 4'b0010;
localparam ALU_OR   = 4'b0011;
localparam ALU_XOR  = 4'b0100;
localparam ALU_SLL  = 4'b0101;
localparam ALU_SRL  = 4'b0110;
localparam ALU_SRA  = 4'b0111;
localparam ALU_SLT  = 4'b1000;
localparam ALU_SLTU = 4'b1001;
localparam ALU_GE   = 4'b1010;
localparam ALU_GEU  = 4'b1011;

//根据不同指令实现不同的ALU操作

// Calculate ALU operation based on funct7, funct3, and PreALUop
assign ALUop = 
    (PreALUop == 2'b00) ? (funct3 == 3'b000 && funct7 == 7'b0000000 ? ALU_ADD : 
                            funct3 == 3'b000 && funct7 == 7'b0100000 ? ALU_SUB :
                            ALU_ADD) : // 默认值是ADD
    (PreALUop == 2'b01) ? ( 
        (funct3 == 3'b000 && funct3 == 3'b001) ? ALU_SUB : (funct3 == 3'b100 ) ? ALU_SLT : (funct3 == 3'b101) ? ALU_GE :
        (funct3 == 3'b110) ? ALU_SLTU : (funct3 == 3'b111) ? ALU_GEU : ALU_SUB
     ) :           //分支指令，beq, bne, blt, bge, bltu, bgeu
    (PreALUop == 2'b10) ? // R-type operations detailed decoding
        (funct3 == 3'b000 ? (funct7 == 7'b0000000 ? ALU_ADD : funct7 == 7'b0100000 ? ALU_SUB : ALU_ADD) :
         funct3 == 3'b111 ? ALU_AND :
         funct3 == 3'b110 ? ALU_OR :
         funct3 == 3'b100 ? ALU_XOR :
         funct3 == 3'b001 ? ALU_SLL :
         funct3 == 3'b101 ? (funct7 == 7'b0000000 ? ALU_SRL : ALU_SRA) :
         funct3 == 3'b010 ? ALU_SLT :
         funct3 == 3'b011 ? ALU_SLTU : 4'b0000) : // undefined operation
    (PreALUop == 2'b11) ? // I-type operations with immediate values
        (funct3 == 3'b000 ? ALU_ADD :
         funct3 == 3'b111 ? ALU_AND :
         funct3 == 3'b110 ? ALU_OR :
         funct3 == 3'b100 ? ALU_XOR :
         funct3 == 3'b001 ? ALU_SLL :
         funct3 == 3'b101 ? (funct7[5] ? ALU_SRA : ALU_SRL) :
         funct3 == 3'b010 ? ALU_SLT :
         funct3 == 3'b011 ? ALU_SLTU : 4'b0000) : // undefined operation
    4'bxxxx; // Default case for unhandled PreALUop values
endmodule