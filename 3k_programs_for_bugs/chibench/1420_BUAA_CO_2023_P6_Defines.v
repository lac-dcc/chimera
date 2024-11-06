// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

//Control Signals

`define OP_ZERO  6'b000000
`define OP_ADDI  6'b001000
`define OP_ANDI  6'b001100
`define OP_ORI   6'b001101
`define OP_SLTI  6'b001010
`define OP_BEQ   6'b000100
`define OP_J     6'b000010
`define OP_JAL   6'b000011
`define OP_LW    6'b100011
`define OP_SW    6'b101011
`define OP_LH    6'b100001
`define OP_LHU   6'b100101
`define OP_SH    6'b101001
`define OP_LB    6'b100000
`define OP_LBU   6'b100100
`define OP_SB    6'b101000
`define OP_LUI   6'b001111
`define OP_BNE   6'b000101

`define FUNC_ADD   6'b100000
`define FUNC_SUB   6'b100010
`define FUNC_AND   6'b100100
`define FUNC_OR    6'b100101
`define FUNC_SLT   6'b101010
`define FUNC_SLTU  6'b101011
`define FUNC_JR    6'b001000
`define FUNC_JALR  6'b001001
`define FUNC_MULT  6'b011000
`define FUNC_MULTU 6'b011001
`define FUNC_DIV   6'b011010
`define FUNC_DIVU  6'b011011
`define FUNC_MFHI  6'b010000
`define FUNC_MFLO  6'b010010
`define FUNC_MTHI  6'b010001
`define FUNC_MTLO  6'b010011


`define I_ADD   0
`define I_SUB   2
`define I_AND   4
`define I_OR    5
`define I_SLT   8
`define I_JR    13
`define I_JALR  14
`define I_ADDI  15
`define I_ANDI  17
`define I_ORI   18
`define I_SLTI  19
`define I_BEQ   20
`define I_J     21
`define I_JAL   22
`define I_LW    23
`define I_SW    24
`define I_LH    25
`define I_LHU   26
`define I_SH    27
`define I_LB    28
`define I_LBU   29
`define I_SB    30
`define I_LUI   31
`define I_BNE   32
`define I_SLTU  33
`define I_MULT  34
`define I_MULTU 35
`define I_DIV   36
`define I_DIVU  37
`define I_MFHI  38
`define I_MFLO  39
`define I_MTHI  40
`define I_MTLO  41

`define I_ERROR 63

//Mux Selectors
//ALU_B_sel
`define ALU_B_RT        0
`define ALU_B_Imm       1
//ALU_Shift_sel
`define ALU_Shift_RS    0
`define ALU_Shift_shamt 1
//Ext_Op
`define Ext_Zero        1
`define Ext_Sign        2
`define Ext_High        3
//Reg_WA_sel
`define Reg_WA_RD       1
`define Reg_WA_RT       2
`define Reg_WA_31       3
//Reg_WD_sel
`define Reg_WD_ALU      1
`define Reg_WD_DM       2
`define Reg_WD_PC_8     3
`define Reg_WD_HILO     4

//ALU Operations
`define ALU_ADDU    4'b0000
`define ALU_SUBU    4'b0001
`define ALU_AND     4'b0010
`define ALU_OR      4'b0011
`define ALU_SLL     4'b0100
`define ALU_SLT     4'b0101
`define ALU_SRL     4'b0110
`define ALU_SRA     4'b0111
`define ALU_SLTU    4'b1000
`define ALU_NEW     4'b1001


`define CMP_NE  4'b0000
`define CMP_LT  4'b0001
`define CMP_LE  4'b0010
`define CMP_GT  4'b0011
`define CMP_GE  4'b0100
`define CMP_EQ  4'b0101
`define CMP_NEW 4'b0110

//NPC Operations
`define NPC_default       0
`define NPC_branch        1
`define NPC_jump_instr    2
`define NPC_jump_reg      3
`define NPC_jump_new      4

//DM Operations
`define DM_align_word 1
`define DM_align_half 2
`define DM_align_byte 3
`define DM_unsigned   1'b0
`define DM_signed     1'b1

// MulDiv Operations
`define MD_Mult   1
`define MD_Multu  2
`define MD_Div    3
`define MD_Divu   4
`define MD_Mflo   5
`define MD_Mfhi   6
`define MD_Mtlo   7
`define MD_Mthi   8
`define MD_New    9

//Boolean
`define Enabled  1'b1
`define Disabled 1'b0
//Placeholders
`define Unused 0
