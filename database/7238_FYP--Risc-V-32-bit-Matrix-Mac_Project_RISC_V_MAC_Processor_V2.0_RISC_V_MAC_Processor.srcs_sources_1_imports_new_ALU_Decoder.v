// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 10:41:25 AM
// Design Name: 
// Module Name: ALU_Decoder
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



module ALU_Decoder(ALUOp,funct3,funct7,op,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7,op;
    
    output [5:0]ALUControl;
    // I-Type Basic Instructions => SLLI, SRLI, SRAI, ADDI, LI ETC => OP => 0010011
        // parameter I_ADDI_op = 7'b0010011;   //ADDI  => OP => 0010011 => I-TYPE
        parameter I_op_basic = 7'b0010011;   //ADDI  => OP => 0010011 => I-TYPE
          
                                                   
        // R-type Instructions: => ADD, SUB, AND, OR, XOR, SLL, SRL, SLT => SAME OPCODE => 0110011
        parameter R_op_basic = 7'b0110011;  
                                        
       
       //B-TYPE INSTRUCTIONS
        parameter B_op_basic = 7'b1100011;  //BEQ = BNE = BLT = BGE => OP => 1100011 SAME OP CODE
                
        //Ecall, Ebreak, END
        parameter ECALL = 7'b1110011;
    
        //MATRUX-TYPE INSTRUCTIONS
        parameter MAC_OP = 7'b1110111;  //LOAD A, LOAD B, CLR A, CLR B, CLR R, CLR ALL, MAC MULTIPLY, MAC ADD, MAC SUB, SUB MAC, STORE R

    // Method 2
  assign ALUControl = ((ALUOp == 2'b00) & (funct3 == 3'b010) ) ? 6'b000000 :    //lw, sw
                      ((ALUOp == 2'b00) & ( op == I_op_basic ) & (funct3 == 3'b001) ) ? 6'b000111 :    //SLLI
                      ((ALUOp == 2'b00) & ( op == I_op_basic ) & (funct3 == 3'b101) ) ? 6'b000110 :    //SRLI
                      ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b000) ) ? 6'b001001 :   // beq, branch if equal
                      ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b001) ) ? 6'b001010 :   // bne, branch if equal
                      ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b100) ) ? 6'b001011 :   // blt, branch if equal
                      ((ALUOp == 2'b01) & ( op == B_op_basic ) & (funct3 == 3'b101) ) ? 6'b001000 :   // bge, branch if equal
                      ((ALUOp == 2'b10) & (funct3 == 3'b000) & ( op == R_op_basic & funct7 == 7'b0100000 )) ? 6'b000001 : //arithmetic subtraction 
                      ((ALUOp == 2'b10) & (funct3 == 3'b000 | op == MAC_OP) & ( op == (R_op_basic | MAC_OP) & funct7 == 7'b0000000 )) ? 6'b000000 : //arithmetic addition
                      ((ALUOp == 2'b10) & (funct3 == 3'b000) & ( op == R_op_basic & funct7 == 7'b0000001 )) ? 6'b000010 : //arithmetic signed Multiplication
                      ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 6'b001100 : //slt 
                      ((ALUOp == 2'b10) & (funct3 == 3'b100)) ? 6'b000101 : //xor
                      ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 6'b000100 : //or
                      ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 6'b000011 : //and
                      (op == ECALL )    ? 6'b111111 : //ECALL, EBREAK, END
                                          6'b000000 ; //lw,sw
    


endmodule
