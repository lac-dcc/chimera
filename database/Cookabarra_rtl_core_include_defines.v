/*-------------------------------------------------------------------------
// Module:  define
// File:    define.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: the constant definition
--------------------------------------------------------------------------*/

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`define RstEnable               1'b0   //reset by negative edge
`define RstDisable              1'b1

`define ChipEnable              1'b1
`define ChipDisable             1'b0

`define WriteEnable             1'b1
`define WriteDisable            1'b0

`define ReadEnable              1'b1
`define ReadDisable             1'b0

`define AluOpBus                15:0
`define AluSelBus               3:0

`define InstValid               1'b1
`define InstInvalid             1'b0

`define Stop                    1'b1
`define NoStop                  1'b0

`define Branch                  1'b1
`define NotBranch               1'b0

`define InterruptAssert         1'b1
`define InterruptNotAssert      1'b0

`define TrapAssert              1'b1
`define TrapNotAssert           1'b0

`define True_v                  1'b1
`define False_v                 1'b0

`define ZeroWord                32'h00000000
`define NOP_INST                32'h00000013           //ADDI x0, x0, 0

`define InstAddrBus             31:0
`define InstBus                 31:0

/*----------------------------------- inst rom ---------------------------------*/
`define InstMemNum              1048576
`define InstMemNumLog2          20    //20 bits addr

/*----------------------------------- data ram ---------------------------------*/
`define DataAddrBus             31:0
`define DataBus                 31:0
`define DataMemNum              1048576   //1M
`define DataMemNumLog2          20        //20 bits addr
`define ByteWidth               7:0

/*----------------------------------- regfile ----------------------------------*/
`define RegAddrBus              4:0
`define RegBus                  31:0
`define RegWidth                32
`define DoubleRegWidth          64
`define DoubleRegBus            63:0
`define RegNum                  32
`define RegNumLog2              5
`define NOPRegAddr              5'b00000

/*-------------------------------------- div -----------------------------------*/
`define DivFree                 2'b00
`define DivByZero               2'b01
`define DivOn                   2'b10
`define DivEnd                  2'b11
`define DivResultReady          1'b1
`define DivResultNotReady       1'b0
`define DivStart                1'b1
`define DivStop                 1'b0


/*--------------------------------- instruction type ----------------------------*/
`define INST_OPCODE_LUI         7'b0110111   // {imm[31:12],                     rd,          opcode=0110111}
`define INST_OPCODE_AUIPC       7'b0010111   // {imm[31:12],                     rd,          opcode=0010111}
`define INST_OPCODE_JAL         7'b1101111   // {imm[20|10:1|11|19:12],          rd,          opcode=1101111}
`define INST_OPCODE_JALR        7'b1100111   // {imm[11:0],         rs1, 000,    rd,          opcode=1100111}

`define INST_OPCODE_BRANCH      7'b1100011   // {imm[12|10:5], rs2, rs1, funct3, imm[4:1|11], opcode=1100011}
`define INST_OPCODE_LOAD        7'b0000011   // {imm[11:0],         rs1, funct3, rd,          opcode=0000011}
`define INST_OPCODE_STORE       7'b0100011   // {imm[11:5],    rs2, rs1, funct3, imm[4:0],    opcode=0100011}
`define INST_OPCODE_IMM         7'b0010011   // {imm[11:0],         rs1, funct3, rd,          opcode=0010011}
`define INST_OPCODE_REG         7'b0110011   // {funct7,       rs2, rs1, funct3, rd,          opcode=0110011}
`define INST_OPCODE_FENCE       7'b0001111   // {fm, pred, succ,    rs1, 000,    rd,          opcode=0001111}
`define INST_OPCODE_CSR         7'b1110011   // {csr,               rs1, funct3, rd,          opcode=1110011}


/*---------------------------------------AluOp-----------------------------------*/

// B type inst  {imm[12|10:5], rs2, rs1, funct3, imm[4:1|11, opcode=1100011}
`define INST_BEQ                3'b000
`define INST_BNE                3'b001
`define INST_BLT                3'b100
`define INST_BGE                3'b101
`define INST_BLTU               3'b110
`define INST_BGEU               3'b111

// L type inst, {imm[11:0], rs1[4:0], funct3[2:0], rd[4:0],opcode=0000011}
`define INST_LB                 3'b000
`define INST_LH                 3'b001
`define INST_LW                 3'b010
`define INST_LBU                3'b100
`define INST_LHU                3'b101

// S type inst, {imm[11:5], rs2, rs1, funct3, imm[4:0], opcode=0100011}
`define INST_SB                 3'b000
`define INST_SH                 3'b001
`define INST_SW                 3'b010


// I type inst,  {imm[11:0], rs1[4:0], funct3[2:0], rd[4:0],opcode=0010011}
`define INST_ADDI               3'b000
`define INST_SLTI               3'b010
`define INST_SLTIU              3'b011
`define INST_XORI               3'b100
`define INST_ORI                3'b110
`define INST_ANDI               3'b111

`define INST_SLLI               3'b001  // {7'b0000000, shamt[4:0], rs1[4:0], funct3[2:0], rd[4:0],opcode=0010011}
`define INST_SRLI_SRAI          3'b101  // {7'b0000000, shamt[4:0], rs1[4:0], funct3[2:0], rd[4:0],opcode=0010011} INST_SRLI
                                        // {7'b0100000, shamt[4:0], rs1[4:0], funct3[2:0], rd[4:0],opcode=0010011} INST_SRAI


// R type inst, {funct7, rs2, rs1, funct3, rd, opcode=0110011}, funct7=0000000 or 0100000
// R-1: LOGIC inst
`define INST_ADD_SUB            3'b000  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011} ADD
                                        // {funct7=0100000, rs2, rs1, funct3, rd, opcode=0110011} SUB
`define INST_SLL                3'b001  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011}
`define INST_SLT                3'b010  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011}
`define INST_SLTU               3'b011  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011}
`define INST_XOR                3'b100  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011}
`define INST_SRL_SRA            3'b101  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011} SRL
                                        // {funct7=0100000, rs2, rs1, funct3, rd, opcode=0110011} SRA
`define INST_OR                 3'b110  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011}
`define INST_AND                3'b111  // {funct7=0000000, rs2, rs1, funct3, rd, opcode=0110011}

//R-2: Multiply inst, {funct7, rs2, rs1, funct3, rd, opcode=0110011}, funct7=000001
`define INST_MUL                3'b000  // {funct7=0000001, rs2, rs1, funct3, rd, opcode=0110011}
`define INST_MULH               3'b001
`define INST_MULHSU             3'b010
`define INST_MULHU              3'b011
`define INST_DIV                3'b100
`define INST_DIVU               3'b101
`define INST_REM                3'b110
`define INST_REMU               3'b111

// CSR inst, {csr, rs1, funct3, rd, opcode=1110011}
`define INST_CSRRW              3'b001
`define INST_CSRRS              3'b010
`define INST_CSRRC              3'b011
`define INST_CSRRWI             3'b101
`define INST_CSRRSI             3'b110
`define INST_CSRRCI             3'b111
`define INST_CSR_SPECIAL        3'b000

// Fence type inst
`define INST_FENCE              3'b000
`define INST_FENCE_I            3'b001



/*-------------------------- AluSel -----------------------------------*/
`define EXE_TYPE_NOP            4'b0000
`define EXE_TYPE_BRANCH         4'b0001
`define EXE_TYPE_LOGIC          4'b0010
`define EXE_TYPE_SHIFT          4'b0011
`define EXE_TYPE_ARITHMETIC     4'b0100
`define EXE_TYPE_MUL            4'b0101
`define EXE_TYPE_DIV            4'b0110
`define EXE_TYPE_LOAD_STORE     4'b0111
`define EXE_TYPE_CSR            4'b1000


/*---------------------------------uop_code-------------------------------*/
`define UOP_CODE_NOP            16'D0
`define UOP_CODE_LUI            16'D1
`define UOP_CODE_AUIPC          16'D2
`define UOP_CODE_JAL            16'D3
`define UOP_CODE_JALR           16'D4

`define UOP_CODE_BEQ            16'D5
`define UOP_CODE_BNE            16'D6
`define UOP_CODE_BGE            16'D7
`define UOP_CODE_BGEU           16'D8
`define UOP_CODE_BLT            16'D9
`define UOP_CODE_BLTU           16'D10

`define UOP_CODE_LB             16'D11
`define UOP_CODE_LBU            16'D12
`define UOP_CODE_LH             16'D13
`define UOP_CODE_LHU            16'D14
`define UOP_CODE_LW             16'D15

`define UOP_CODE_SB             16'D16
`define UOP_CODE_SH             16'D17
`define UOP_CODE_SW             16'D18

`define UOP_CODE_ADDI           16'D19
`define UOP_CODE_SLTI           16'D20
`define UOP_CODE_SLTIU          16'D21
`define UOP_CODE_ANDI           16'D22
`define UOP_CODE_ORI            16'D23
`define UOP_CODE_XORI           16'D24
`define UOP_CODE_SLLI           16'D25
`define UOP_CODE_SRLI           16'D26
`define UOP_CODE_SRAI           16'D27

`define UOP_CODE_ADD            16'D28
`define UOP_CODE_SUB            16'D29
`define UOP_CODE_AND            16'D30
`define UOP_CODE_OR             16'D31
`define UOP_CODE_XOR            16'D32
`define UOP_CODE_SLL            16'D33
`define UOP_CODE_SRL            16'D34
`define UOP_CODE_SRA            16'D35
`define UOP_CODE_SLT            16'D36
`define UOP_CODE_SLTU           16'D37
`define UOP_CODE_MULT           16'D38
`define UOP_CODE_MULH           16'D39
`define UOP_CODE_MULHU          16'D40
`define UOP_CODE_MULHSU         16'D41
`define UOP_CODE_DIV            16'D42
`define UOP_CODE_DIVU           16'D43
`define UOP_CODE_REM            16'D44
`define UOP_CODE_REMU           16'D45

`define UOP_CODE_CSRRW          16'D46
`define UOP_CODE_CSRRWI         16'D47
`define UOP_CODE_CSRRS          16'D48
`define UOP_CODE_CSRRSI         16'D49
`define UOP_CODE_CSRRC          16'D50
`define UOP_CODE_CSRRCI         16'D51

`define UOP_CODE_ECALL          16'D52
`define UOP_CODE_MRET           16'D53


/*-------------------------- CSR reg addr -------------------------*/
`define  CSR_MVENDORID_ADDR       12'hF11
`define  CSR_MARCHID_ADDR         12'hF12
`define  CSR_MIMPID_ADDR          12'hF13
`define  CSR_MHARTID_ADDR         12'hF14

/* ------ Machine trap setup ---------*/
`define  CSR_MSTATUS_ADDR         12'h300
`define  CSR_MISA_ADDR            12'h301
`define  CSR_MIE_ADDR             12'h304
`define  CSR_MTVEC_ADDR           12'h305
`define  CSR_MCOUNTEREN_ADDR      12'h306
`define  CSR_MCOUNTINHIBIT_ADDR   12'h320

/* ------ Machine trap handling ------*/
`define  CSR_MSCRATCH_ADDR        12'h340
`define  CSR_MEPC_ADDR            12'h341
`define  CSR_MCAUSE_ADDR          12'h342
`define  CSR_MTVAL_ADDR           12'h343
`define  CSR_MIP_ADDR             12'h344

`define  CSR_CYCLE_ADDR           12'hc00
`define  CSR_CYCLEH_ADDR          12'hc80
`define  CSR_MCYCLE_ADDR          12'hB00
`define  CSR_MCYCLEH_ADDR         12'hB80
`define  CSR_MINSTRET_ADDR        12'hB02
`define  CSR_MINSTRETH_ADDR       12'hB82

/* -------- Debug trigger -----------*/
`define  CSR_TSELECT_ADDR         12'h7A0
`define  CSR_TDATA1_ADDR          12'h7A1
`define  CSR_TDATA2_ADDR          12'h7A2
`define  CSR_TDATA3_ADDR          12'h7A3
`define  CSR_MCONTEXT_ADDR        12'h7A8
`define  CSR_SCONTEXT_ADDR        12'h7AA

/* -------- Debug/trace -------------*/
`define  CSR_DCSR_ADDR            12'h7b0
`define  CSR_DPC_ADDR             12'h7b1

/* ------------ Debug ----------------*/
`define  CSR_DSCRATCH0_ADDR       12'h7b2
`define  CSR_DSCRATCH1_ADDR       12'h7b3


/* --------------config parameters -----------*/
`define  REBOOT_ADDR              32'h80         //  32'h80 for c-test program, 32'h00000000: for isa test
`define  MTVEC_RESET              32'h00000001