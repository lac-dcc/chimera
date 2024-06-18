// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

//Control Signals
/*
Currently supported operations:
    OP=6'b000000 Operations:
    FUNC    =
        ADD :100000 #Currently implemented as ADDU (no overflow detection)
        ADDU:100001
        SUB :100010 #Currently implemented as SUBU (no overflow detection)
        SUBU:100011
        AND :100100
        OR  :100101
        SLL :000000
        SLLV:000100
        SLT :101010
        SRL :000010
        SRLV:000110
        SRA :000011
        SRAV:000111
        JR  :001000
        JALR:001001
        
    OP!=6'b000000 Operations:
    OP       =
        ADDI :001000 #Currently implemented as ADDIU (no overflow detection)
        ADDIU:001001       
        ANDI :001100
        ORI  :001101
        SLTI :001010
        BEQ  :000100
        J    :000010
        JAL  :000011
        LW   :100011
        SW   :101011
        LH   :100001
        LHU  :100101
        SH   :101001
        LB   :100000
        LBU  :100100
        SB   :101000
        LUI  :001111

*/
`define OP_ZERO  6'b000000
`define OP_ADDI  6'b001000
`define OP_ADDIU 6'b001001
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

`define FUNC_ADD  6'b100000
`define FUNC_ADDU 6'b100001
`define FUNC_SUB  6'b100010
`define FUNC_SUBU 6'b100011
`define FUNC_AND  6'b100100
`define FUNC_OR   6'b100101
`define FUNC_SLL  6'b000000
`define FUNC_SLLV 6'b000100
`define FUNC_SLT  6'b101010
`define FUNC_SRL  6'b000010
`define FUNC_SRLV 6'b000110
`define FUNC_SRA  6'b000011
`define FUNC_SRAV 6'b000111
`define FUNC_JR   6'b001000
`define FUNC_JALR 6'b001001


`define I_ADD   0
`define I_ADDU  1
`define I_SUB   2
`define I_SUBU  3
`define I_AND   4
`define I_OR    5
`define I_SLL   6
`define I_SLLV  7
`define I_SLT   8
`define I_SRL   9
`define I_SRLV  10
`define I_SRA   11
`define I_SRAV  12
`define I_JR    13
`define I_JALR  14
`define I_ADDI  15
`define I_ADDIU 16
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


`define CMP_NE  4'b0000
`define CMP_LT  4'b0001
`define CMP_LE  4'b0010
`define CMP_GT  4'b0011
`define CMP_GE  4'b0100
`define CMP_EQ  4'b0101

//NPC Operations
`define NPC_default       2'b00
`define NPC_branch        2'b01
`define NPC_jump_instr    2'b10
`define NPC_jump_reg      2'b11

//DM Operations
`define DM_align_word 2'b01
`define DM_align_half 2'b10
`define DM_align_byte 2'b11
`define DM_unsigned   1'b0
`define DM_signed     1'b1


//Boolean
`define Enabled  1'b1
`define Disabled 1'b0
//Placeholders
`define Unused 0
