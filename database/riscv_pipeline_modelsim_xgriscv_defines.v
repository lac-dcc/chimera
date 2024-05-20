// This program was cloned from: https://github.com/Crzax/riscv_pipeline
// License: MIT License

//=====================================================================
//
// Designer   : Yili Gong
//
// Description:
// As part of the project of Computer Organization Experiments, Wuhan University
// In spring 2021
// Macro definitions
//
// ====================================================================

`define DEBUG

// ISA related

`define ADDR_SIZE			32 // the width of an address,????32?
`define INSTR_SIZE  32 // the length of an instruction,????32
`define INSTR_WIDTH 5  // the bit width of an instruction

`define XLEN				    32 // the data width of a register
`define XLEN_WIDTH		5
`define RFREG_NUM			32 // the number of registers
`define RFIDX_WIDTH 5  // the width of a register index

`define IMEM_SIZE			1024
`define IMEM_SIZE_WIDTH		10
`define DMEM_SIZE			1024
`define DMEM_SIZE_WIDTH		10

//RV32I
`define OP_LUI		7'b0110111
`define OP_AUIPC	7'b0010111
`define OP_JAL		7'b1101111
`define OP_JALR		7'b1100111
`define OP_BRANCH	7'b1100011
`define OP_LOAD		7'b0000011
`define OP_STORE	7'b0100011
`define OP_ADDI		7'b0010011
`define OP_ADD		7'b0110011


`define FUNCT3_BEQ	3'b000
`define FUNCT3_BNE	3'b001
`define FUNCT3_BLT	3'b100
`define FUNCT3_BGE	3'b101
`define FUNCT3_BLTU	3'b110
`define FUNCT3_BGEU	3'b111

`define FUNCT3_LB	3'b000
`define FUNCT3_LH	3'b001
`define FUNCT3_LW	3'b010
`define FUNCT3_LBU	3'b100
`define FUNCT3_LHU	3'b101

`define FUNCT3_SB	3'b000
`define FUNCT3_SH	3'b001
`define FUNCT3_SW	3'b010

`define FUNCT3_ADDI	3'b000
`define FUNCT3_SLTI	3'b010
`define FUNCT3_SLTIU	3'b011
`define FUNCT3_XORI	3'b100
`define FUNCT3_ORI	3'b110
`define FUNCT3_ANDI	3'b111

`define FUNCT3_SL	3'b001
`define FUNCT3_SR	3'b101

`define FUNCT7_SLLI	7'b0000000
`define FUNCT7_SRLI	7'b0000000
`define FUNCT7_SRAI	7'b0100000

`define FUNCT3_ADD	3'b000
`define FUNCT3_SLL	3'b001
`define FUNCT3_SLT	3'b010
`define FUNCT3_SLTU	3'b011
`define FUNCT3_XOR	3'b100
`define FUNCT3_SR	3'b101
`define FUNCT3_OR	3'b110
`define FUNCT3_AND	3'b111

`define FUNCT7_ADD	7'b0000000
`define FUNCT7_SUB	7'b0100000

`define FUNCT7_SRL	7'b0000000
`define FUNCT7_SRA	7'b0100000

//RV64I
`define FUNCT3_LWU	3'b110
`define FUNCT3_LD	3'b011

`define FUNCT3_SD	3'b011

`define OP_ADDIW	7'b0011011
`define OP_ADDW		7'b0111011

//ID ALU bus
`define ID_ALU_WIDTH	16

//ALU CTRL
`define	ALU_CTRL_MOVEA	4'b0000

`define	ALU_CTRL_ADD	4'b0001
`define	ALU_CTRL_ADDU	4'b0010

`define	ALU_CTRL_OR		4'b0011
`define	ALU_CTRL_XOR	4'b0100
`define	ALU_CTRL_AND	4'b0101

`define	ALU_CTRL_SLL	4'b0110
`define	ALU_CTRL_SRL	4'b0111
`define	ALU_CTRL_SRA	4'b1000

`define	ALU_CTRL_SUB	4'b1001
`define	ALU_CTRL_SUBU	4'b1010
`define	ALU_CTRL_SLT	4'b1011
`define	ALU_CTRL_SLTU	4'b1100

`define	ALU_CTRL_LUI	4'b1101
`define	ALU_CTRL_AUIPC	4'b1110

`define	ALU_CTRL_ZERO	4'b1111

//IMM CTRL itype, stype, btype, utype, jtype
`define IMM_CTRL_ITYPE	5'b10000
`define IMM_CTRL_STYPE	5'b01000
`define IMM_CTRL_BTYPE	5'b00100
`define IMM_CTRL_UTYPE	5'b00010
`define IMM_CTRL_JTYPE	5'b00001