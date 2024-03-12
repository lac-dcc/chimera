`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:16 12/30/2016 
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
`define     NOP             32'h0
`define	    ALU_AND			4'b0000
`define	    ALU_OR			4'b0001
`define	    ALU_ADD			4'b0010
`define	    ALU_SUB			4'b0011
`define	    ALU_SLT			4'b0100
`define	    ALU_NOR			4'b0101
`define	    ALU_XOR			4'b0110
`define	    ALU_LU			4'b0111
`define	    ALU_SLLV			4'b1000
`define	    ALU_SRLV			4'b1001	

`define	    R_OP_AND   		6'b100100
`define	    R_OP_OR			6'b100101
`define	    R_OP_ADD			6'b100000
`define	    R_OP_SUB			6'b100010
`define	    R_OP_SLT			6'b101010
`define	    R_OP_NOR			6'b100111
`define	    R_OP_SLLV		6'b000100
`define	    R_OP_SRLV		6'b000110
`define	    R_SHAMPT			5'b00000

`define	    BRANCH_OP_BEQ	2'b01
`define	    BRANCH_OP_BNE	2'b10

`define     JUMP_J          2'b01
`define     JUMP_JAL        2'b11
`define     JUMP_JR         2'b10


`define	    OPCODE_R			6'b000000
`define	    OPCODE_I_LW		    6'b100011
`define	    OPCODE_I_SW		    6'b101011
`define	    OPCODE_I_BEQ	    6'b000100
`define	    OPCODE_I_BNE	    6'b000101
`define	    OPCODE_J_JUMP	    6'b000010
`define    OPCODE_JAL_JUMP     6'b000011
`define    R_FUNC_JR            6'b001000

`define	    OPCODE_I_MASK	3'b001
`define	    OPCODE_I_ADDI	6'b001000
`define	    OPCODE_I_ANDI	6'b001100
`define	    OPCODE_I_ORI	6'b001101
`define	    OPCODE_I_XORI	6'b001110
`define	    OPCODE_I_LUI	6'b001111

`define	    REG_ADDI			3'b001
`define	    REG_ADNI			3'b010
`define	    REG_ORI			    3'b100
`define	    REG_XORI			3'b101
`define	    REG_LUI			    3'b110

