`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:29 11/24/2020 
// Design Name: 
// Module Name:    macros 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//about instrction 31:0
`define instr 31:0
`define rs 25:21
`define base 25:21
`define rt 20:16
`define rd 15:11
`define imm16 15:0
`define imm26 25:0
`define op 31:26
`define funct 5:0
`define shamt 10:6

//instruction infomation:

// R-Type only the funct
`define R 		6'h0
`define ADDU 	6'b100001
`define ADD		6'b100000

`define SUBU	6'b100011
`define SUB		6'b100010

`define AND		6'b100100
`define OR		6'b100101
`define XOR		6'b100110
`define NOR		6'b100111

	// mult and div
`define MULT	6'b011000
`define MULTU	6'b011001

`define	DIV		6'b011010
`define DIVU	6'b011011

`define SLL		6'b000000
`define SRL		6'b000010
`define SRA		6'b000011
`define SLLV	6'b000100
`define SRLV	6'b000110
`define SRAV	6'b000111

	// set less than
`define SLT		6'b101010
`define SLTU	6'b101011

	//  read/write HI/LO
`define MFHI	6'b010000
`define MFLO	6'b010010
`define MTHI	6'b010001
`define MTLO	6'b010011

// I-Type	only the op
`define LUI		6'b001111

`define ADDI	6'b001000
`define ADDIU	6'b001001

`define ANDI	6'b001100

`define ORI		6'b001101
`define XORI	6'b001110

	// set less then
`define SLTI	6'b001010
`define SLTIU	6'b001011

// MEM	only op
`define LW		6'b100011
`define SW		6'b101011
`define LB		6'b100000
`define LBU		6'b100100
`define LH		6'b100001
`define LHU		6'b100101
`define SB		6'b101000
`define SH		6'b101001

// Branch only op
`define BEQ		6'b000100	
`define BNE		6'b000101
`define BLEZ	6'b000110
`define BGTZ	6'b000111
`define BLTZ	6'b000001
`define BGEZ	6'b000001

// JUMP
	// the JType
`define J		6'b000010	// only op
`define JAL		6'b000011	// only op

	// op `R
`define JR		6'b001000	// the funct
`define JALR	6'b001001	// the funct

// Exc and Int
`define COP0 6'b010000	// the op
`define ERET 6'b011000	// the funct

