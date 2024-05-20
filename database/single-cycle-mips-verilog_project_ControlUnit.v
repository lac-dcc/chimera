// This program was cloned from: https://github.com/conneroisu/single-cycle-mips-verilog
// License: MIT License

`timescale 1ns / 1ps
module ControlUnit (
    input [31:0] i_instruction,
    output reg o_RegDst,
    output reg o_Jump,
    output reg o_Branch,
    output reg o_Bne,
    output reg o_MemRead,
    output reg o_MemtoReg,
    output reg [1:0] o_ALUOp,
    output reg o_MemWrite,
    output reg o_ALUSrc,
    output reg o_RegWrite,
    output reg [6:0] o_seg_first,
    output reg [6:0] o_seg_second,
    output reg [6:0] o_seg_third,
    output reg [6:0] o_seg_fourth,
    output reg [6:0] o_seg_fifth
);
  initial begin
    o_RegDst = 0;
    o_Jump = 0;
    o_Branch = 0;
    o_MemRead = 0;
    o_MemtoReg = 0;
    o_ALUOp = 2'b00;
    o_MemWrite = 0;
    o_ALUSrc = 0;
    o_RegWrite = 0;
    o_seg_first = 7'b1111111;  // Blank
    o_seg_second = 7'b1111111;  // Blank
    o_seg_third = 7'b1111111;  // Blank
    o_seg_fourth = 7'b1111111;  // Blank
    o_seg_fifth = 7'b1111111;  // Blank
  end
  always @(i_instruction) begin
    case (i_instruction[31:26])
      6'b000000: begin  // ARITHMETIC
        o_RegDst = 1;
        o_ALUSrc = 0;
        o_MemtoReg = 0;
        o_RegWrite = 1;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b10;
        o_Jump = 0;
        o_seg_first =  7'b0001000;  // A
        o_seg_second = 7'b1111010;  // R
        o_seg_third =  7'b1111001;  // I
        o_seg_fourth = 7'b0001111;  // T
        o_seg_fifth =  7'b0001001;  // H
      end
      6'b001000: begin  // addi
        o_RegDst = 0;
        o_ALUSrc = 1;
        o_MemtoReg = 0;
        o_RegWrite = 1;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b00;
        o_Jump = 0;
        o_seg_first = 7'b0001000;  // A
        o_seg_second = 7'b1000010;  // d
        o_seg_third = 7'b1000010;  // d
        o_seg_fourth = 7'b1001111;  // i
        o_seg_fifth = 7'b1111111;  // Blank
      end
      6'b001100: begin  // andi
        o_RegDst = 0;
        o_ALUSrc = 1;
        o_MemtoReg = 0;
        o_RegWrite = 1;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b11;
        o_Jump = 0;
        o_seg_first = 7'b0001000;  // A
        o_seg_second = 7'b0101011;  // n
        o_seg_third = 7'b1000010;  // d
        o_seg_fourth = 7'b1001111;  // i
        o_seg_fifth = 7'b1111111;  // Blank
      end
      6'b100011: begin  // lw
        o_RegDst = 0;
        o_ALUSrc = 1;
        o_MemtoReg = 1;
        o_RegWrite = 1;
        o_MemRead = 1;
        o_MemWrite = 0;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b00;
        o_Jump = 0;
        o_seg_first = 7'b1000111;  // L
        o_seg_second = 7'b1001001;  // w
        o_seg_third = 7'b1111111;  // Blank
        o_seg_fourth = 7'b1111111;  // Blank
        o_seg_fifth = 7'b1111111;  // Blank
      end
      6'b101011: begin  // sw
        o_RegDst = 0;  // X
        o_ALUSrc = 1;
        o_MemtoReg = 0;  // X
        o_RegWrite = 0;
        o_MemRead = 0;
        o_MemWrite = 1;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b00;
        o_Jump = 0;
        o_seg_first = 7'b0010010;  // S
        o_seg_second = 7'b1001001;  // w
        o_seg_third = 7'b1111111;  // Blank
        o_seg_fourth = 7'b1111111;  // Blank
        o_seg_fifth = 7'b1111111;  // Blank
      end
      6'b000100: begin  // beq
        o_RegDst = 0;  // X
        o_ALUSrc = 0;
        o_MemtoReg = 0;  // X
        o_RegWrite = 0;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 1;
        o_Bne = 0;
        o_ALUOp = 2'b01;
        o_Jump = 0;
        o_seg_first = 7'b1100000;  // b
        o_seg_second = 7'b0110000;  // e
        o_seg_third = 7'b0001100;  // q
        o_seg_fourth = 7'b1111111;  // Blank
        o_seg_fifth = 7'b1111111;  // Blank
      end
      6'b000101: begin  // bne
        o_RegDst = 0;  // X
        o_ALUSrc = 0;
        o_MemtoReg = 0;  // X
        o_RegWrite = 0;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 1;
        o_Bne = 1;
        o_ALUOp = 2'b01;
        o_Jump = 0;
        o_seg_first = 7'b1100000;  // b
        o_seg_second = 7'b0101011;  // n
        o_seg_third = 7'b0110000;  // e
        o_seg_fourth = 7'b1111111;  // Blank
        o_seg_fifth = 7'b1111111;  // Blank
      end
      6'b000010: begin  // j
        o_RegDst = 0;  // X
        o_ALUSrc = 0;
        o_MemtoReg = 0;  // X
        o_RegWrite = 0;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b01;
        o_Jump = 1;
        o_seg_first = 7'b1100001;  // J
        o_seg_second = 7'b1111111;  // Blank
        o_seg_third = 7'b1111111;  // Blank
        o_seg_fourth = 7'b1111111;  // Blank
        o_seg_fifth = 7'b1111111;  // Blank
      end
      default: begin
        o_RegDst = 0;  // X
        o_ALUSrc = 0;
        o_MemtoReg = 0;  // X
        o_RegWrite = 0;
        o_MemRead = 0;
        o_MemWrite = 0;
        o_Branch = 0;
        o_Bne = 0;
        o_ALUOp = 2'b00;
        o_Jump = 0;
        o_seg_first = 7'b1111111;  // Blank
        o_seg_second = 7'b1111111;  // Blank
        o_seg_third = 7'b1111111;  // Blank
        o_seg_fourth = 7'b1111111;  // Blank
        o_seg_fifth = 7'b1111111;  // Blank
      end
    endcase
  end
endmodule
