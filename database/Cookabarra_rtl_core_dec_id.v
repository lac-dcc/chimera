
/*-------------------------------------------------------------------------
// Module:  id
// File:    id.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: the instruction decode stage
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

`include "defines.v"

module id(

    input wire                    n_rst_i,

    /* ------- signals from the if_id unit --------*/
    input wire[`InstAddrBus]      pc_i,
    input wire[`InstBus]          inst_i,
    input wire                    branch_slot_end_i,

    input wire[`RegBus]           next_pc_i,
    input wire                    next_taken_i,

    //pass the gpr read signals to the gpr module, read the gpr
    output reg                    rs1_re_o,      // read rs1 or not
    output reg                    rs2_re_o,      // read rs2 or not
    output reg[`RegAddrBus]       rs1_raddr_o,   // address of rs1
    output reg[`RegAddrBus]       rs2_raddr_o,   // address of rs2
    // GPR reponse to the above read request with the rs1 and rs2 values
    input wire[`RegBus]           rs1_rdata_i,
    input wire[`RegBus]           rs2_rdata_i,

    /* ---------signals from exu -----------------*/
    input wire                    branch_redirect_i,

    // some neccessary signals forwarded from exe unit, to detect data dependance.
    // if the exe unis is executing load instruction, and the rd is one of the rs,
    // notify the ctrl unit to stall pipeline
    input wire[`AluOpBus]         ex_uopcode_i,

    // the rd info fowarded from ex to determine the data dependance
    input wire                    ex_rd_we_i,      // update the rd or not at exe stage
    input wire[`RegAddrBus]       ex_rd_waddr_i,   // the rd address
    input wire[`RegBus]           ex_rd_wdata_i,   // the data to write to rd


    /* ------- signals forwarded from the lsu unit --------*/
    input wire                    mem_rd_we_i,
    input wire[`RegAddrBus]       mem_rd_waddr_i,
    input wire[`RegBus]           mem_rd_wdata_i,


    /* ------- signals to the ctrl  ---------------*/
    output wire                   stall_req_o,

    /* ------- signals to the execution unit --------*/
    output reg[`RegBus]           pc_o,
    output reg[`RegBus]           inst_o,
    output reg[`RegBus]           next_pc_o,
    output reg                    next_taken_o,
    output reg                    branch_slot_end_o,

    output reg[`RegBus]           imm_o,

    output reg                    csr_we_o,
    output reg[`RegBus]           csr_addr_o,

    output reg[`RegBus]           rs1_data_o,
    output reg[`RegBus]           rs2_data_o,
    output reg                    rd_we_o,
    output reg[`RegAddrBus]       rd_waddr_o,

    output reg[`AluSelBus]        alusel_o,
    output reg[`AluOpBus]         uopcode_o,

    output wire[31:0]             exception_o
);

    //decode the funct7, funct3, opcode, rs2, rs1, rd
    wire[6:0]     opcode = inst_i[6:0];
    wire[4:0]     rd = inst_i[11:7];
    wire[2:0]     funct3 = inst_i[14:12];
    wire[4:0]     rs1 = inst_i[19:15];
    wire[4:0]     rs2 = inst_i[24:20];
    wire[6:0]     funct7 = inst_i[31:25];

    reg[`RegBus]  imm;
    reg           csr_we;
    reg[`RegBus]  csr_addr;

    reg           instvalid;

    reg           rs1_load_depend;   //rs1 is the rd of the previous load
    reg           rs2_load_depend;   //rs2 is the rd of the previous load
    wire          pre_inst_is_load;  //the previous instruction is a lb, lh, lw, etc

    reg           excepttype_mret;
    reg           excepttype_ecall;
    reg           excepttype_ebreak;
    reg           excepttype_illegal_inst;

    // check there is a load dependance
    assign stall_req_o = rs1_load_depend | rs2_load_depend;

    // check the instruction in the exu is a load type instruciotn or not
    assign pre_inst_is_load = ( (ex_uopcode_i == `UOP_CODE_LB) || (ex_uopcode_i == `UOP_CODE_LBU)
                              ||(ex_uopcode_i == `UOP_CODE_LH) || (ex_uopcode_i == `UOP_CODE_LHU)
                              ||(ex_uopcode_i == `UOP_CODE_LW) ) ? 1'b1 : 1'b0;

    assign pc_o = pc_i;
    assign imm_o = imm;

    // pass down the branch prediction info
    assign next_pc_o = next_pc_i;
    assign next_taken_o = next_taken_i;
    assign branch_slot_end_o = branch_slot_end_i;

    assign csr_we_o = csr_we;
    assign csr_addr_o = csr_addr;

    assign rs1_raddr_o = rs1;
    assign rs2_raddr_o = rs2;

    //exception ={ misaligned_load, misaligned_store, illegal_inst, misaligned_inst,  ebreak, ecall,  mret}
    assign exception_o = {28'b0, excepttype_illegal_inst, excepttype_ebreak, excepttype_ecall, excepttype_mret};

    always @ (*) begin
        if (n_rst_i == `RstEnable) begin
            //reset to default
            inst_o = `NOP_INST;
            rs1_re_o = 1'b0;
            rs2_re_o = 1'b0;
            rs1_raddr_o = `NOPRegAddr;
            rs2_raddr_o = `NOPRegAddr;

            imm = `ZeroWord;

            csr_we = `WriteDisable;
            csr_addr = `ZeroWord;

            rs1_data_o = `ZeroWord;
            rs2_data_o = `ZeroWord;

            rd_we_o = `WriteDisable;
            rd_waddr_o = `NOPRegAddr;

            alusel_o = `EXE_TYPE_NOP;
            uopcode_o = `UOP_CODE_NOP;

            excepttype_ecall = `False_v;
            excepttype_mret = `False_v;
            excepttype_ebreak = `False_v;
            excepttype_illegal_inst = `False_v;

            instvalid = `InstValid;
        end else if (branch_redirect_i) begin  // branch detected in the exe unit, replaced with a NOP
            // set the default
            inst_o = `NOP_INST;
            rs1_re_o = 1'b0;
            rs2_re_o = 1'b0;

            imm = `ZeroWord;

            csr_we = `WriteDisable;
            csr_addr = `ZeroWord;

            rs1_data_o = `ZeroWord;
            rs2_data_o = `ZeroWord;

            rd_we_o = `WriteDisable;
            rd_waddr_o = `NOPRegAddr;

            alusel_o = `EXE_TYPE_NOP;
            uopcode_o = `UOP_CODE_NOP;

            excepttype_ecall = `False_v;
            excepttype_mret = `False_v;
            excepttype_ebreak = `False_v;
            excepttype_illegal_inst = `False_v;

            instvalid = `InstValid;
        end else begin
            inst_o = inst_i;
            // set the default
            rs1_re_o = 1'b0;
            rs2_re_o = 1'b0;

            imm = `ZeroWord;

            csr_we = `WriteDisable;
            csr_addr = `ZeroWord;

            rs1_data_o = `ZeroWord;
            rs2_data_o = `ZeroWord;

            rd_we_o = `WriteDisable;
            rd_waddr_o = `NOPRegAddr;

            alusel_o = `EXE_TYPE_NOP;
            uopcode_o = `UOP_CODE_NOP;

            excepttype_ecall = `False_v;
            excepttype_mret = `False_v;
            excepttype_ebreak = `False_v;
            excepttype_illegal_inst = `False_v;

            instvalid = `InstInvalid;

            case (opcode)
/*-----------------------------------decode special instructions, started -------------------------------------------------------*/
                `INST_OPCODE_LUI: begin  //7'b0110111
                    // imm:[31:12], rd:[11:7], opcode[6:0] = 0110111
                    // LUI places the U-immediate value in the top 20 bits of the destination register rd,
                    // and fill in the lowest 12 bits with zeros.
                    // format: lui rd,imm  :  x[rd] = sext(immediate[31:12] << 12)
                    // decode the imm and extend to 32 bit logically
                    imm = {inst_i[31:12], 12'b0};
                    // no rs required
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    alusel_o = `EXE_TYPE_LOGIC;
                    uopcode_o = `UOP_CODE_LUI;
                    instvalid = `InstValid;
                end

                `INST_OPCODE_AUIPC: begin  //7'b0010111
                    // imm:[31:12], rd:[11:7], opcode[6:0] = 0010111
                    // AUIPC adds upper immediate to PC. This instruction adds a 20-bit immediate value to the
                    // upper 20 bits of the program counter.
                    // auipc rd,imm  :  x[rd] = pc + sext(immediate[31:12] << 12)
                    imm = {inst_i[31:12], 12'b0};    // decode the imm and extend to 32 bit logically
                    // no rs required
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    alusel_o = `EXE_TYPE_LOGIC;
                    uopcode_o = `UOP_CODE_AUIPC;
                    instvalid = `InstValid;
                end

                `INST_OPCODE_JAL: begin
                    // imm(20, 10:1, 11, 19:12):[31:12], rd:[11:7], opcode[6:0] = 1101111
                    // JAL(jump and link). Transfer control to the PC-relative address provided in the 20-bit signed immediate value
                    // and store the address of the next instruction (the return address) in the destination register.
                    // jal rd,offset  :  // jal rd,offset  :  x[rd] = pc+4; pc += sext(offset)
                    imm = {{12{inst_i[31]}}, inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};
                    // no rs required
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    alusel_o = `EXE_TYPE_BRANCH;
                    uopcode_o = `UOP_CODE_JAL;
                    instvalid = `InstValid;
                end

                `INST_OPCODE_JALR: begin // 7'b1100111
                    // imm:[31:20], rs1:[19:15], funct3 =000, rd:[11:7], opcode[6:0]=1100111
                    // JALR(jump and link, register). Compute the target address as the sum of the source register and a signed 12- bit immediate value,
                    // then jump to that address and store the address of the next instruction in the destination register.
                    // jalr rd,rs1,offset  :   t =pc+4; pc=(x[rs1]+sext(offset))&∼1; x[rd]=t
                    imm = {{20{inst_i[31]}}, inst_i[31:20]};
                    //rs1 required
                    rs1_re_o = 1'b1;
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    alusel_o = `EXE_TYPE_BRANCH;
                    uopcode_o = `UOP_CODE_JALR;
                    instvalid = `InstValid;
                end
/*-----------------------------------decode special instructions, ended -------------------------------------------------------*/



/*-----------------------------------decode Type B instruction, started -------------------------------------------------------*/
                `INST_OPCODE_BRANCH: begin  //1100011
                    // imm(12,10:5):[31:25], rs2:[24:20], rs1:[19:15], funct3:[14:12], imm(4:1,11):[11:7], opcode[6:0]
                    // Branch if equal (beq), not equal (bne), less than (blt), less than unsigned (bltu), greater or equal (bge),
                    // greater or equal unsigned (bgeu).
                    // These instructions perform the designated comparison between two registers and,
                    // if the condition is satisfied, transfer control to the address offset provided in the 12-bit signed immediate value.
                    imm = {{20{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
                    rs1_re_o = 1'b1;
                    rs2_re_o = 1'b1;
                    // no rd
                    alusel_o = `EXE_TYPE_BRANCH;
                    instvalid = `InstValid;

                    case (funct3)
                        /*---------- beq, rs1, rs2;  started --------------*/
                        // beq rs1,rs2,offset  :   if (rs1 == rs2) pc += sext(offset)
                        `INST_BEQ: begin
                            uopcode_o = `UOP_CODE_BEQ;
                        end

                        /*---------- bneq, rs1, rs2;  started --------------*/
                        // bne rs1,rs2,offset  :   if (rs1 != rs2) pc += sext(offset)
                        `INST_BNE: begin
                            uopcode_o = `UOP_CODE_BNE;
                        end

                        /*---------- bge, rs1, rs2;  started --------------*/
                        // bge rs1,rs2,offset  :   if (rs1 >=s rs2) pc += sext(offset)
                        `INST_BGE: begin
                            uopcode_o = `UOP_CODE_BGE;
                        end

                        /*---------- bgeu, rs1, rs2;  started --------------*/
                        // bgeu rs1,rs2,offset  :   if (rs1 >=u rs2) pc += sext(offset)
                        `INST_BGEU: begin
                            uopcode_o = `UOP_CODE_BGEU;
                         end

                        /*---------- blt, rs1, rs2;  started --------------*/
                        // blt rs1,rs2,offset  :   if (rs1 <s rs2) pc += sext(offset)
                        `INST_BLT: begin
                            uopcode_o = `UOP_CODE_BLT;
                        end

                        /*---------- bltu, rs1, rs2;  started --------------*/
                        // bltu rs1,rs2,offset  :   if (rs1 >u rs2) pc += sext(offset)
                        `INST_BLTU: begin
                            uopcode_o = `UOP_CODE_BLTU;
                        end

                        default: begin
                            $display("invalid funct3 in branch type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                            instvalid = `InstInvalid;
                        end
                    endcase
                end
/*-----------------------------------decode Type B instruction, ended -------------------------------------------------------*/



/*-----------------------------------decode Type L instruction, started -------------------------------------------------------*/
                `INST_OPCODE_LOAD: begin  //0000011
                    // imm:[31:20], rs1:[19:15], funct3:[14:12], rd:[11:7], opcode[6:0]
                    // lb, lbu, lh, lhu, lw: Load an 8-bit byte (lb), a 16-bit halfword (lh) or 32-bit word (lw) into the destination register.
                    // For byte and halfword loads, the instruction will either sign-extend (lb and lh) or zero-extend (lbu and lhu)
                    // to fill the 32-bit destination register.
                    imm = {{20{inst_i[31]}}, inst_i[31:20]};
                    rs1_re_o = 1'b1;
                    //no rs2
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    alusel_o = `EXE_TYPE_LOAD_STORE;
                    instvalid = `InstValid;

                    case (funct3)
                        `INST_LB: begin
                            // lb rd,offset(rs1)  :  x[rd] = sext(M[x[rs1] + sext(offset)][7:0])
                            uopcode_o = `UOP_CODE_LB;
                        end

                        `INST_LBU: begin
                            // lbu rd,offset(rs1)  :  x[rd] = M[x[rs1] + sext(offset)][7:0]
                            uopcode_o = `UOP_CODE_LBU;
                        end

                        `INST_LH: begin
                            // lh rd,offset(rs1)  :   x[rd] = sext(M[x[rs1] + sext(offset)][15:0])
                            uopcode_o = `UOP_CODE_LH;
                        end

                        `INST_LHU: begin
                            // lhu rs2,offset(rs1)  :   x[rd] = M[x[rs1] + sext(offset)][15:0]
                            uopcode_o = `UOP_CODE_LHU;
                        end

                        `INST_LW: begin
                            // lw rd,offset(rs1)  :   x[rd] = sext(M[x[rs1] + sext(offset)][31:0])
                            uopcode_o = `UOP_CODE_LW;
                        end

                        default: begin
                            $display("invalid funct3 in load type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                            instvalid = `InstInvalid;
                        end
                    endcase
                end
/*-----------------------------------decode Type L instruction, ended -------------------------------------------------------*/



/*-----------------------------------decode Type S instruction, started -------------------------------------------------------*/
                `INST_OPCODE_STORE: begin   //0100011
                    //  imm(11:5):[31:25], rs2:[24:20], rs1:[19:15], funct3:[14:12], imm(4:0):[11:7], opcode[6:0]
                    //  sb, sh, sw: Store a byte (sb), halfword (sh) or word (sw) to a memory location matching the size of the data value.
                    imm = {{20{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};   //need pass the imm to exu
                    rs1_re_o = 1'b1;
                    rs2_re_o = 1'b1;
                    // no rd
                    alusel_o = `EXE_TYPE_LOAD_STORE;
                    instvalid = `InstValid;

                    case (funct3)
                        `INST_SB:  begin
                            // sb rs2,offset(rs1)  :   M[x[rs1] + sext(offset)] = x[rs2][7:0]
                            uopcode_o = `UOP_CODE_SB;
                        end

                        `INST_SH:  begin
                            // sh rs2,offset(rs1)  :   M[x[rs1] + sext(offset)] = x[rs2][15:0]
                            uopcode_o = `UOP_CODE_SH;
                        end

                        `INST_SW:  begin
                            // sw rs2,offset(rs1)  :   M[x[rs1] + sext(offset)] = x[rs2][31:0]
                            uopcode_o = `UOP_CODE_SW;
                        end

                        default: begin
                            $display("invalid funct3 in STORE type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                            instvalid = `InstInvalid;
                        end
                    endcase
                end
/*-----------------------------------decode Type S instruction, ended -------------------------------------------------------*/



/*-----------------------------------decode Type I instruction, started -------------------------------------------------------*/
                `INST_OPCODE_IMM: begin
                    // imm:[31:20], rs1:[19:15], funct3:[14:12], rd:[11:7], opcode[6:0]
                    rs1_re_o = 1'b1;
                    // no rs2
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    instvalid = `InstValid;

                    case (funct3)
                        // addi: Perform addition, The immediate value in the addi instruction is a 12-bit signed value.
                        // There is no subi instruction because addi can add a negative immediate value.
                        // addi rd,rs1,imm :  x[rd] = x[rs1] + sext(immediate)
                        `INST_ADDI: begin
                            imm = {{20{inst_i[31]}}, inst_i[31:20]};  //extend to 32 bits
                            alusel_o = `EXE_TYPE_ARITHMETIC;
                            uopcode_o = `UOP_CODE_ADDI;
                        end

                        // slti: set less than immediate, set the destination register to 1 if the first source operand is less than
                        // the immediate(12 bits).
                        // slti rd,rs1,imm  :  x[rd] = x[rs1] <s sext(immediate)
                        `INST_SLTI: begin
                            imm = {{20{inst_i[31]}}, inst_i[31:20]};  //extend to 32 bits
                            alusel_o = `EXE_TYPE_LOGIC;
                            uopcode_o = `UOP_CODE_SLTI;
                        end

                        // sltiu: Place the value 1 in register rd if register rs1 is less than the immediate when
                        // both are treated as unsigned numbers, else 0 is written to rd.
                        // sltiu rd,rs1,imm  :  x[rd] = x[rs1] <u sext(immediate)
                        `INST_SLTIU: begin
                            imm = {{20{inst_i[31]}}, inst_i[31:20]};  //extend to 32 bits
                            alusel_o = `EXE_TYPE_LOGIC;
                            uopcode_o = `UOP_CODE_SLTIU;
                        end

                        // Performs bitwise AND on register rs1 and the sign-extended 12-bit
                        // immediate and place the result in rd
                        // andi rd,rs1,imm  :   x[rd] = x[rs1] & sext(immediate)
                        `INST_ANDI: begin
                            imm = {{20{inst_i[31]}}, inst_i[31:20]};  //extend to 32 bits
                            alusel_o = `EXE_TYPE_LOGIC;
                            uopcode_o = `UOP_CODE_ANDI;
                        end

                        // Performs bitwise OR on register rs1 and the sign-extended 12-bit immediate
                        // and place the result in rd
                        // ori rd,rs1,imm  :  x[rd] = x[rs1] | sext(immediate)
                        `INST_ORI: begin
                            imm = {{20{inst_i[31]}}, inst_i[31:20]};  //extend to 32 bits
                            alusel_o = `EXE_TYPE_LOGIC;
                            uopcode_o = `UOP_CODE_ORI;
                        end

                        // Performs bitwise XOR on register rs1 and the sign-extended 12-bit
                        // immediate and place the result in rd
                        // xori rd,rs1,imm  :  x[rd] = x[rs1] ^ sext(immediate)
                        `INST_XORI: begin
                            imm = {{20{inst_i[31]}}, inst_i[31:20]};  //extend to 32 bits
                            alusel_o = `EXE_TYPE_LOGIC;
                            uopcode_o = `UOP_CODE_XORI;
                        end

                        // slli, srli, srai: Perform  shifts of logical left (sll) and right (srl), and arithmetic right shifts (sra).
                        // The number of bit positions to shift is taken from the 5-bit immediate value.
                        `INST_SLLI: begin
                            // slli rd,rs1,shamt  :   x[rd] = x[rs1] << shamt
                            imm = {27'b0, inst_i[24:20]};
                            alusel_o = `EXE_TYPE_SHIFT;
                            uopcode_o = `UOP_CODE_SLLI;
                        end


                        `INST_SRLI_SRAI: begin
                            imm = {27'b0, inst_i[24:20]};

                            if(funct7[6:1] == 6'b000000) begin
                                // srli rd,rs1,shamt  :   x[rd] = x[rs1] >>u shamt
                                alusel_o = `EXE_TYPE_SHIFT;
                                uopcode_o = `UOP_CODE_SRLI;
                            end else if (funct7[6:1] == 6'b010000) begin
                                // srai rd,rs1,shamt  :   x[rd] = x[rs1] >>s shamt
                                alusel_o = `EXE_TYPE_SHIFT;
                                uopcode_o = `UOP_CODE_SRAI;
                            end else begin
                                $display("invalid funct7 (%b) for SRI, pc=%h, inst=%h, funct3=%d", funct7[6:1], pc_i, inst_i, funct3);
                                instvalid = `InstInvalid;
                            end
                        end

                        default: begin   //invalid instruction
                            $display("invalid funct3 in I type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                            instvalid = `InstInvalid;
                        end
                    endcase //case (funct3)
                end // `INST_OPCODE_IMM: begin
/*-----------------------------------decode Type I instruction, ended -------------------------------------------------------*/



/*-----------------------------------decode Type R instruction, started -------------------------------------------------------*/
                `INST_OPCODE_REG: begin
                    // funct7:[31:25], rs2:[24:20], rs1:[19:15], funct3[14:12], opcode[6:0]
                    rs1_re_o = 1'b1;
                    rs2_re_o = 1'b1;
                    rd_we_o = `WriteEnable;
                    rd_waddr_o = rd;
                    instvalid = `InstValid;

                    if ((funct7 == 7'b0000000) || (funct7 == 7'b0100000)) begin
                        case (funct3)
                            // add, sub: Perform addition and subtraction. The sub instruction subtracts the second source operand from the first.
                            `INST_ADD_SUB: begin
                                if(funct7 == 7'b0000000) begin
                                    // add rd,rs1,rs2  :  x[rd] = x[rs1] + x[rs2]
                                    alusel_o = `EXE_TYPE_ARITHMETIC;
                                    uopcode_o = `UOP_CODE_ADD;
                                end else begin
                                    // sub rd,rs1,rs2  :  x[rd] = x[rs1] - x[rs2]
                                    alusel_o = `EXE_TYPE_ARITHMETIC;
                                    uopcode_o = `UOP_CODE_SUB;
                                end
                            end

                            // and, or, xor: Perform the indicated bitwise operation on the two source operands.
                            `INST_AND: begin
                                // and rd,rs1,rs2  :  x[rd] = x[rs1] & x[rs2]
                                alusel_o = `EXE_TYPE_LOGIC;
                                uopcode_o = `UOP_CODE_AND;
                            end

                            `INST_OR: begin
                                // or rd,rs1,rs2  :  x[rd] = x[rs1] | x[rs2]
                                alusel_o = `EXE_TYPE_LOGIC;
                                uopcode_o = `UOP_CODE_OR;
                            end

                            `INST_XOR: begin
                                // xor rd,rs1,rs2  :  x[rd] = x[rs1] ^ x[rs2]
                                alusel_o = `EXE_TYPE_LOGIC;
                                uopcode_o = `UOP_CODE_XOR;
                            end

                            // sll, srl, sra: Perform logical left and right shifts (sll and srl), and arithmetic right shifts (sra).
                            // Logical shifts insert zero bits into vacated locations. Arithmetic right shifts replicate the sign bit into vacated locations.
                            // The number of bit positions to shift is taken from the lowest 5 bits of the second source register.

                            `INST_SLL: begin
                                // sll rd,rs1,rs2  :   x[rd] = x[rs1] << x[rs2]
                                alusel_o = `EXE_TYPE_SHIFT;
                                uopcode_o = `UOP_CODE_SLL;
                            end

                            `INST_SRL_SRA: begin
                                if(funct7 == 7'b0000000) begin  //srl
                                    // srl rd,rs1,rs2  :   x[rd] = x[rs1] >>u x[rs2]
                                    alusel_o = `EXE_TYPE_SHIFT;
                                    uopcode_o = `UOP_CODE_SRL;
                                end else begin  //sra
                                    // sra rd,rs1,rs2  :   x[rd] = x[rs1] >>s x[rs2]
                                    alusel_o = `EXE_TYPE_SHIFT;
                                    uopcode_o = `UOP_CODE_SRA;
                                end
                            end

                            // slt, sltu: The set if less than instructions set the destination register to 1
                            // if the first source operand is less than the second source operand:
                            // This comparison is in terms of two’s complement (slt) or unsigned (sltu) operands.
                            `INST_SLT: begin
                                // slt rd,rs1,rs2  :   x[rd] = x[rs1] <s x[rs2]
                                alusel_o = `EXE_TYPE_LOGIC;
                                uopcode_o = `UOP_CODE_SLT;
                            end

                            `INST_SLTU: begin
                                // sltu rd,rs1,rs2  :   x[rd] = x[rs1] <u x[rs2]
                                alusel_o = `EXE_TYPE_LOGIC;
                                uopcode_o = `UOP_CODE_SLTU;
                            end

                            default: begin
                                $display("invalid funct3 in R type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                                instvalid = `InstInvalid;
                            end
                        endcase // case (funct3)
                    end else if (funct7 == 7'b0000001) begin  // if ((funct7 == 7'b0000000) || (funct7 == 7'b0100000)) begin
                        case (funct3)
                            // mul: Multiply two 32-bit registers and store the lower 32 bits of the result in the destination register.
                            // mulh. mulhu, mulhsu: Multiply two 32-bit registers and store the upper 32 bits of the result in the destination register.
                            // Treat the multiplicands as both signed (mulh), both unsigned (mulhu),
                            // or signed rs1 times unsigned rs2 (mulhsu). rs1 is the first source register in the instruction and rs2 is the second.

                            `INST_MUL: begin
                                // mul rd,rs1,rs2  :    x[rd] = x[rs1] × x[rs2]
                                alusel_o = `EXE_TYPE_MUL;
                                uopcode_o = `UOP_CODE_MULT;
                            end

                            `INST_MULH: begin
                                // mulh rd,rs1,rs2  :   x[rd] = (x[rs1] s×s x[rs2]) >>s XLEN
                                alusel_o = `EXE_TYPE_MUL;
                                uopcode_o = `UOP_CODE_MULH;
                            end

                            `INST_MULHU: begin
                                // mulhu rd,rs1,rs2  :   x[rd] = (x[rs1] u × x[rs2]) >>u XLEN
                                alusel_o = `EXE_TYPE_MUL;
                                uopcode_o = `UOP_CODE_MULHU;
                            end

                            `INST_MULHSU: begin
                                // mulhsu rd,rs1,rs2  :   x[rd] = (x[rs1] s × x[rs2]) >>s XLEN
                                alusel_o = `EXE_TYPE_MUL;
                                uopcode_o = `UOP_CODE_MULHSU;
                            end

                            // div, divu : Perform division of two 32-bit registers, rounding the result toward zero,
                            // on signed (div) or unsigned (divu) operands.
                            // rem, remu: Return the remainder corresponding to the result of a div or divu instruction on the operands.
                            // Division by zero does not raise an exception. To detect division by zero, code should test the divisor
                            // and branch to an appropriate handler if it is zero.

                            `INST_DIV: begin
                                // div rd,rs1,rs2  :   x[rd] = x[rs1] /s x[rs2]
                                alusel_o = `EXE_TYPE_DIV;
                                uopcode_o = `UOP_CODE_DIV;
                            end

                            `INST_DIVU: begin
                                // divu rd,rs1,rs2  :   x[rd] = x[rs1] /u x[rs2]
                                alusel_o = `EXE_TYPE_DIV;
                                uopcode_o = `UOP_CODE_DIVU;
                            end

                            `INST_REM: begin
                                // rem rd,rs1,rs2  :    x[rd] = x[rs1] %s x[rs2]
                                alusel_o = `EXE_TYPE_DIV;
                                uopcode_o = `UOP_CODE_REM;
                            end

                            `INST_REMU: begin
                                // remu rd,rs1,rs2  :   x[rd] = x[rs1] %u x[rs2]
                                alusel_o = `EXE_TYPE_DIV;
                                uopcode_o = `UOP_CODE_REMU;
                            end

                            default: begin
                                instvalid = `InstValid;
                                $display("invalid funct3 in R type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                            end
                        endcase
                    end else begin //else if (funct7 == 7'b0000001) begin
                        instvalid = `InstInvalid;
                        $display("invalid funct7 in R type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                    end
                end  // `INST_OPCODE_REG: begin
/*-----------------------------------decode Type R instruction, ended -------------------------------------------------------*/



/*-----------------------------------decode Type CSR instruction, started -------------------------------------------------------*/
                `INST_OPCODE_CSR: begin
                    // csr[31:20], rs1:[19:15], funct3[14:12], opcode[6:0] = 7'b1110011
                    // csr[31:20], uimm[19:15], funct3[14:12], opcode[6:0] = 7'b1110011
                    csr_addr = {20'h0, inst_i[31:20]};
                    imm = {27'b0, inst_i[19:15]};
                    rd_waddr_o = rd;
                    instvalid = `InstValid;

                    case (funct3)
                        `INST_CSRRW: begin
                            // csrrw(csr read and write): Read the specified CSR into a destination register
                            // and write a source operand value to the register
                            // if rd=x0, then the instruction shall not read the CSR
                            // csrrw rd,offset,rs1  :   t = CSRs[csr]; CSRs[csr] = x[rs1]; x[rd] = t
                            rs1_re_o = 1'b1;
                            // rs2 is not required
                            rd_we_o = `WriteEnable;
                            csr_we = `WriteEnable;

                            alusel_o = `EXE_TYPE_CSR;
                            uopcode_o = `UOP_CODE_CSRRW;
                        end

                        `INST_CSRRWI: begin
                            // csrrw(csr read and write): Read the specified CSR into a destination register
                            // and write a source operand value to the register
                            // csrrwi rd,offset,uimm  :  x[rd] = CSRs[csr]; CSRs[csr] = zimm
                            //zero-extending a 5-bit unsigned immediate (uimm[4:0]) to  an XLEN-bit value
                            // no rs required
                            rd_we_o = `WriteEnable;
                            csr_we = `WriteEnable;

                            alusel_o = `EXE_TYPE_CSR;
                            uopcode_o = `UOP_CODE_CSRRWI;
                        end

                        `INST_CSRRS: begin
                            // CSRRC(CSR read and set): Read the specified CSR into a destination register and
                            // set any 1 bit in the source operand in the register
                            // csrrs rd,offset,rs1  :   t = CSRs[csr]; CSRs[csr] = t | x[rs1]; x[rd] = t
                            rs1_re_o = 1'b1;
                            // rs2 is not required
                            rd_we_o = `WriteEnable;
                            csr_we = `WriteEnable;

                            alusel_o = `EXE_TYPE_CSR;
                            uopcode_o = `UOP_CODE_CSRRS;
                        end

                        `INST_CSRRSI: begin
                            // CSRRC(CSR read and set): Read the specified CSR into a destination register and
                            // set any 1 bit in the source operand in the register
                            // csrrsi rd,offset,uimm  :  t = CSRs[csr]; CSRs[csr] = t | zimm; x[rd] = t

                            //zero-extending a 5-bit unsigned immediate (uimm[4:0]) to  an XLEN-bit value
                            // no rs required
                            rd_we_o = `WriteEnable;
                            csr_we = `WriteEnable;

                            alusel_o = `EXE_TYPE_CSR;
                            uopcode_o = `UOP_CODE_CSRRSI;
                        end

                        `INST_CSRRC: begin
                            // CSRRC(CSR read and clear): Read the specified CSR into a destination register and
                            // clear any 1 bit in the source operand in the register
                            // csrrc rd,offset,rs1  :   t = CSRs[csr]; CSRs[csr] = t &∼x[rs1]; x[rd] = t
                            rs1_re_o = 1'b1;
                            // rs2 is not required
                            rd_we_o = `WriteEnable;
                            csr_we = `WriteEnable;

                            alusel_o = `EXE_TYPE_CSR;
                            uopcode_o = `UOP_CODE_CSRRC;
                        end

                        `INST_CSRRCI: begin
                            // CSRRC(CSR read and clear): Read the specified CSR into a destination register and
                            // clear any 1 bit in the source operand in the register
                            // csrrci rd,offset,uimm  :  t = CSRs[csr]; CSRs[csr] = t &∼zimm; x[rd] = t
                            //zero-extending a 5-bit unsigned immediate (uimm[4:0]) to  an XLEN-bit value
                            // no rs required
                            rd_we_o = `WriteEnable;
                            csr_we = `WriteEnable;

                            uopcode_o = `UOP_CODE_CSRRCI;
                            alusel_o = `EXE_TYPE_CSR;
                        end

                        /*----------csr special instruction, ecall, ebreak, eret, mret, sret, wfi, sfence.wma -------------*/
                        `INST_CSR_SPECIAL: begin
                            if((funct7==7'b0000000) &&  (rs2 == 5'b00000))  begin // INST_ECALL:

                                // {00000, 00, rs2(00000), rs1(00000), funct3(000), rd(00000), opcode = 7b'1110011 }
                                // Make a request to the supporting execution environment.
                                // When executed in U-mode, S-mode, or M-mode, it generates an
                                // environment-call-from-U-mode exception, environment-call-from-S-mode
                                // exception, or environment-call-from-M-mode exception, respectively, and
                                // performs no other operation.
                                // ecall  :   RaiseException(EnvironmentCall)
                                alusel_o = `EXE_TYPE_NOP;
                                uopcode_o = `UOP_CODE_ECALL;
                                excepttype_ecall= `True_v;
                            end

                            if( (funct7==7'b0011000) && (rs2 == 5'b00010)) begin   //INST_MRET
                                // {00110, 00, rs2(00010), rs1(00000), funct3(000), rd(00000), opcode = 7b'1110011 }
                                // Return from traps in M-mode, and MRET copies MPIE into MIE, then sets MPIE.
                                // mret  :   ExceptionReturn(Machine)
                                alusel_o = `EXE_TYPE_NOP;
                                uopcode_o = `UOP_CODE_MRET;
                                excepttype_mret = `True_v;
                            end

/*
                            if( (funct7==7'b0000000) && (rs2 == 5'b00010) ) begin   //INST_ERET
                                // {00000, 00, rs2(00010), rs1(00000), funct3(000), rd(00000), opcode = 7b'1110011 }
                                // Return from traps in U-mode, and URET copies UPIE into UIE, then sets UPIE.
                                // uret  :   ExceptionReturn(User)
                                alusel_o = `EXE_TYPE_NOP;
                                uopcode_o = `UOP_CODE_ERET;
                                excepttype_is_eret = `True_v;
                            end

                            if((funct7==7'b0000000) && (rs2 == 5'b00001)) begin   //INST_EBREAK:
                                // {00000, 00, rs2(00001), rs1(00000), funct3(000), rd(00000), opcode = 7b'1110011 }
                                // Used by debuggers to cause control to be transferred back to a debugging environment.
                                // It generates a breakpoint exception and performs no other operation.
                                // ebreak  :   RaiseException(Breakpoint)
                                alusel_o = `EXE_TYPE_NOP;
                                uopcode_o = `UOP_CODE_EBREAK;
                            end

                            if( (funct7==7'b0000100) && (rs2 == 5'b00010) ) begin   // INST_SRET
                                // {00010, 00, rs2(00010), rs1(00000), funct3(000), rd(00000), opcode = 7b'1110011 }
                                // Return from traps in S-mode, and SRET copies SPIE into SIE, then sets SPIE.
                                // sret  :   ExceptionReturn(User)
                            end



                            if( (funct7==7'b0010000) && (rs2 == 5'b00101) ) begin  //INST_WFI
                                // {00100, 00, rs2(00101), rs1(00000), funct3(000), rd(00000), opcode = 7b'1110011 }
                                // Provides a hint to the implementation that the current hart can be stalled
                                // until an interrupt might need servicing.
                                // Execution of the WFI instruction can also be used to inform the hardware
                                // platform that suitable interrupts should preferentially be routed to this hart.
                                // WFI is available in all privileged modes, and optionally available to U-mode.
                                // This instruction may raise an illegal instruction exception when TW=1 in mstatus.
                                // wfi   :   while (noInterruptsPending) idle
                            end

                            if( funct7==7'b0001001) begin  //INST_SFENCE_WMA
                                // {00010, 01, rs2, rs1, funct3(000), rd, opcode = 7b'1110011 }
                                // Guarantees that any previous stores already visible to the current RISC-V
                                // hart are ordered before all subsequent implicit references from that hart to
                                // the memory-management data structures.
                                // The SFENCE.VMA is used to flush any local hardware caches related to address translation.
                                // It is specified as a fence rather than a TLB flush to provide cleaner semantics
                                // with respect to which instructions are affected by the flush operation and to
                                // support a wider variety of dynamic caching structures and memory-management schemes.
                                // SFENCE.VMA is also used by higher privilege levels to synchronize page
                                // table writes and the address translation hardware.
                                // sfence.vma rs1,rs2  :   Fence(Store, AddressTranslation)
                            end
*/
                        end //`INST_CSR_SPECIAL: begin

                        /*----------csr special instruction, ecall, ebreak, eret, mret, sret, wfi, sfence.wma -------------*/

                        default: begin
                            instvalid = `InstValid;
                            $display("invalid funct7 in csr type, pc=%h, inst=%h, funct3=%d", pc_i, inst_i, funct3);
                        end
                    endcase  // case (funct3)
                end //`INST_OPCODE_CSR: begin
/*-----------------------------------decode Type CSR instruction, ended -------------------------------------------------------*/



/*-----------------------------------decode Type Fence instruction, started -------------------------------------------------------*/
                `INST_OPCODE_FENCE: begin
                    case (funct3)
                        `INST_FENCE: begin   //funct3 = 000
                            // Used to order device I/O and memory accesses as viewed by other RISC-V
                            // harts and external devices or coprocessors.
                            // Any combination of device input (I), device output (O), memory reads (R), and
                            // memory writes (W) may be ordered with respect to any combination of the same.
                            // Informally, no other RISC-V hart or external device can observe any
                            // operation in the successor set following a FENCE before any operation in
                            // the predecessor set preceding the FENCE.
                            // fm:[32:28]=0000, pred:[27:24], succ[23:20], rs1=00000, funct3=000, rd=00000, opcode=0001111
                            // fence pred, succ :  Fence(pred, succ)

                        end

                        `INST_FENCE_I: begin   //funct3 = 001
                            // Provides explicit synchronization between writes to instruction memory and
                            // instruction fetches on the same hart.
                            // fm:[32:27]=00000, pred:[26:25]=00, succ[24:20]=00000, rs1=00000, funct3=001, rd=00000, opcode=0001111
                        end

                        default: begin

                        end
                    endcase
                end
/*-----------------------------------decode Type Fence instruction, ended -------------------------------------------------------*/

                default: begin
                    $display("invalid instruction opcode (%h), pc=%d,  the instruction is (%h)", opcode, pc_i, inst_i);
                end
            endcase
        end  //if_else
    end  //always

/*==========================================================decoded end here ==========================================================*/

    /* determine the rs1*/
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            rs1_data_o = `ZeroWord;
            rs1_load_depend = `NoStop;
        end else begin
            rs1_data_o = `ZeroWord;
            rs1_load_depend = `NoStop;
             // in case there is a instruction which write data to x0, for example: csrrwi x0, csr, 0x5
            if(rs1_raddr_o == 5'b0) begin
                rs1_data_o = 32'b0;
            end else begin
                if(pre_inst_is_load == 1'b1 && ex_rd_waddr_i == rs1_raddr_o && rs1_re_o == 1'b1 ) begin
                rs1_load_depend = `Stop;
                end else begin
                    if((rs1_re_o == 1'b1) && (ex_rd_we_i == 1'b1) && (ex_rd_waddr_i == rs1_raddr_o)) begin
                        rs1_data_o = ex_rd_wdata_i;
                    end else if((rs1_re_o == 1'b1) && (mem_rd_we_i == 1'b1) && (mem_rd_waddr_i == rs1_raddr_o)) begin
                        rs1_data_o = mem_rd_wdata_i;
                    end else if(rs1_re_o == 1'b1) begin
                        rs1_data_o = rs1_rdata_i;
                    end
                end
            end
        end
    end

     /* determine the rs2*/
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            rs2_load_depend = `NoStop;
            rs2_data_o = `ZeroWord;
        end else begin
            rs2_load_depend = `NoStop;
            rs2_data_o = `ZeroWord;
            if(rs2_raddr_o == 5'b0) begin
                rs2_data_o = 32'b0;
            end else begin
                if(pre_inst_is_load == 1'b1 && ex_rd_waddr_i == rs2_raddr_o && rs2_re_o == 1'b1 ) begin
                    rs2_load_depend = `Stop;
                end else begin
                    if((rs2_re_o == 1'b1) && (ex_rd_we_i == 1'b1) && (ex_rd_waddr_i == rs2_raddr_o)) begin
                        rs2_data_o = ex_rd_wdata_i;
                    end else if((rs2_re_o == 1'b1) && (mem_rd_we_i == 1'b1) && (mem_rd_waddr_i == rs2_raddr_o)) begin
                        rs2_data_o = mem_rd_wdata_i;
                    end else if(rs2_re_o == 1'b1) begin
                        rs2_data_o = rs2_rdata_i;
                    end
                end
            end
        end
    end
endmodule
