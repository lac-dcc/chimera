/*-------------------------------------------------------------------------
// Module:  execution
// File:    ex.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: instruction fetch
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

module ex(

    input wire                    n_rst_i,

    /* ------- signals from the decoder unit --------*/
    input wire[`RegBus]           pc_i,
    input wire[`RegBus]           inst_i,

    input wire[`RegBus]           next_pc_i,
	input wire                    next_taken_i,
    input wire                    branch_slot_end_i,

    input wire[`AluSelBus]        alusel_i,
    input wire[`AluOpBus]         uopcode_i,

    input wire[`RegBus]           rs1_data_i,
    input wire[`RegBus]           rs2_data_i,
    input wire[`RegBus]           imm_i,

    input wire                    rd_we_i,
    input wire[`RegAddrBus]       rd_addr_i,

    input wire                    csr_we_i,       // write csr or not
    input wire[`RegBus]           csr_addr_i,     // the csr address, could be read or write

    input wire[31:0]              exception_i,    // the execeptions detected in the decode stage, ecall, mret, invalid instructions

    /* ------- signals with division unit --------*/
    output reg[`RegBus]           dividend_o,
    output reg[`RegBus]           divisor_o,
    output reg                    div_start_o,
    // output reg                 div_annul_o,   // not used at the moment
    output reg                    div_signed_o,

    input wire[`DoubleRegBus]     div_result_i,   // the result of the division,the low 32 bits are the quotient, the higher 32 bits are the remainder
    input wire                    div_ready_i,    //the divison result is ready

    /* ------- signals to the ctrl unit --------*/
    output reg                    stall_req_o,     // need to stall the pipeline on the division operation, it needs 32 cycles

    /* ------- signals with csr unit --------*/
    output reg[`RegBus]           csr_raddr_o,
    input wire[`RegBus]           csr_rdata_i,

    /* ------- bypass signals from lsu, for csr dependance detection --------*/
    input wire                    mem_csr_we_i,
    input wire[`RegBus]           mem_csr_waddr_i,
    input wire[`RegBus]           mem_csr_wdata_i,

    /* ------- bypass signals from write back, for csr dependance detection --------*/
    input wire                    wb_csr_we_i,
    input wire[`RegBus]           wb_csr_waddr_i,
    input wire[`RegBus]           wb_csr_wdata_i,


    /* ------- passed to next pipeline --------*/
    output reg[`RegBus]           pc_o,
    output reg[`RegBus]           inst_o,

    //branch related
    output reg                    branch_request_o,  // is this instruction a branch/jump ?
    output reg                    branch_is_taken_o,
    output reg                    branch_is_call_o,
    output reg                    branch_is_ret_o,
    output reg                    branch_is_jmp_o,
    output reg[`RegBus]           branch_target_o,

    output reg                    branch_redirect_o,  // if this is a branch instruction and branch miss predicted
    output reg[`RegBus]           branch_redirect_pc_o,

    output reg                    branch_tag_o,
    output reg                    branch_slot_end_o,

    output reg                    csr_we_o,
    output reg[`RegBus]           csr_waddr_o,
    output reg[`RegBus]           csr_wdata_o,

    output reg                    rd_we_o,
    output reg[`RegAddrBus]       rd_addr_o,
    output reg[`RegBus]           rd_wdata_o,

    output reg[`AluOpBus]         uopcode_o,    // used in the lsu, for determine it is a load or store
    output reg[`RegBus]           mem_addr_o,   // the memory address to access
    output reg[`RegBus]           mem_wdata_o,  // the data to write to the memory for the store instruction

	// the accumulated exception if there are some
    output reg[31:0]             exception_o
);
    reg    stallreq_for_div;

    assign pc_o = pc_i;
    assign inst_o = inst_i;
    assign branch_slot_end_o = branch_slot_end_i;

    // to identify call or ret
    wire[4:0]  rs1 = inst_i[19:15];

    assign csr_we_o =  csr_we_i;
    assign csr_waddr_o = csr_addr_i;

    assign rd_we_o = rd_we_i;
    assign rd_addr_o = rd_addr_i;

    assign uopcode_o = uopcode_i;

    assign exception_o = exception_i;

    wire[`RegBus] pc_plus_4;
    assign pc_plus_4 = pc_i + 4;    //for jar or jalr, the rd should be updated to pc + 4

    wire[`RegBus] pc_add_imm;
    assign pc_add_imm =  pc_i + imm_i;

    wire[`RegBus] rs1_add_imm;
    assign rs1_add_imm =  rs1_data_i + imm_i;

    wire[`RegBus] rs1_or_imm;
    assign  rs1_or_imm = rs1_data_i | imm_i;

    wire[`RegBus] rs1_and_imm;
    assign  rs1_and_imm = rs1_data_i & imm_i;

    wire[`RegBus] rs1_xor_imm;
    assign  rs1_xor_imm = rs1_data_i ^ imm_i;

    wire[`RegBus] rs1_add_rs2;
    assign rs1_add_rs2 =  rs1_data_i + rs2_data_i;

    wire[`RegBus] rs1_sub_rs2;
    assign rs1_sub_rs2 =  rs1_data_i - rs2_data_i;

    wire[`RegBus] rs1_and_rs2;
    assign  rs1_and_rs2 = rs1_data_i & rs2_data_i;

    wire[`RegBus] rs1_or_rs2;
    assign  rs1_or_rs2 = rs1_data_i |rs2_data_i;

    wire[`RegBus] rs1_xor_rs2;
    assign  rs1_xor_rs2 = rs1_data_i ^ rs2_data_i;

    /* ------ used in the be, bne, bge, blt ------*/
    wire rs1_ge_rs2_signed;
    wire rs1_ge_rs2_unsigned;
    wire rs1_eq_rs2;

    assign rs1_ge_rs2_signed = $signed(rs1_data_i) >= $signed(rs2_data_i);
    assign rs1_ge_rs2_unsigned = rs1_data_i >= rs2_data_i;
    assign rs1_eq_rs2 = (rs1_data_i == rs2_data_i);

    /* ------ used in slti, sltiu  ------*/
    wire rs1_ge_imm_signed;
    wire rs1_ge_imm_unsigned;
    wire rs1_eq_imm;

    assign rs1_ge_imm_signed = $signed(rs1_data_i) >= $signed(imm_i);
    assign rs1_ge_imm_unsigned = rs1_data_i >= imm_i;
    assign rs1_eq_imm = (rs1_data_i == imm_i);

    wire[31:0] sr_shift;
    wire[31:0] sr_shift_mask;
    assign sr_shift = rs1_data_i >> rs2_data_i[4:0];
    assign sr_shift_mask = 32'hffffffff >> rs2_data_i[4:0];

    wire[31:0] sri_shift;
    wire[31:0] sri_shift_mask;
    assign sri_shift = rs1_data_i >> imm_i;
    assign sri_shift_mask = 32'hffffffff >> imm_i;


    // handle the load and store instruction
    // (1) calcuate the memory address to acccess
    // (2) if it is a store instruction, the data to write was required as well
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            mem_addr_o = `ZeroWord;
            mem_wdata_o = `ZeroWord;
        end else begin
            case (uopcode_i)
                /* ---------------------L-type instruction --------------*/
                `UOP_CODE_LB, `UOP_CODE_LBU, `UOP_CODE_LH, `UOP_CODE_LHU, `UOP_CODE_LW:  begin
                    // lb rd,offset(rs1)  :  x[rd] = sext(M[x[rs1] + sext(offset)][7:0])
                    // lbu rd,offset(rs1)  :  x[rd] = M[x[rs1] + sext(offset)][7:0]
                    // lh rd,offset(rs1)  :  x[rd] = sext(M[x[rs1] + sext(offset)][15:0])
                    // lhu rs2,offset(rs1)  :  x[rd] = M[x[rs1] + sext(offset)][15:0]
                    // lw rd,offset(rs1)  :  x[rd] = sext(M[x[rs1] + sext(offset)][31:0])
                    mem_addr_o = rs1_add_imm;
                end

                /* ---------------------S-type instruction --------------*/
                `UOP_CODE_SB, `UOP_CODE_SH, `UOP_CODE_SW:  begin
                    // sb rs2,offset(rs1)  :   M[x[rs1] + sext(offset)] = x[rs2][7:0]
                    // sh rs2,offset(rs1)  :   M[x[rs1] + sext(offset)] = x[rs2][15:0]
                    // sw rs2,offset(rs1)  :   M[x[rs1] + sext(offset)] = x[rs2][31:0]
                    mem_addr_o = rs1_add_imm;
                    mem_wdata_o = rs2_data_i;
                end

                default: begin
                    // skip it
                end
            endcase
        end // else
    end //always

    // handle the load and store instruction
    reg[`RegBus] jump_result;
    reg[`RegBus] logic_result;
    reg[`RegBus] shift_result;
    reg[`RegBus] arithmetic_result;
    reg[`RegBus] mul_result;
    reg[`RegBus] div_result;
    reg[`RegBus] csr_result;

    // handle csr instruction
    wire read_csr_enable;
    assign read_csr_enable = (uopcode_i == `UOP_CODE_CSRRW) || (uopcode_i == `UOP_CODE_CSRRWI) || (uopcode_i == `UOP_CODE_CSRRS)
                            || (uopcode_i == `UOP_CODE_CSRRSI) || (uopcode_i == `UOP_CODE_CSRRC) || (uopcode_i == `UOP_CODE_CSRRCI);

    // get the lastest csr value to update the rd
    always @ (*) begin
        csr_result = `ZeroWord;
        csr_raddr_o = `ZeroWord;
        if (read_csr_enable) begin
            // If rd=x0, then the instruction shall not read the CSR and shall not cause any
            // of the side effects that might occur on a CSR read.
            // read the csr
            csr_raddr_o = csr_addr_i;
            csr_result = csr_rdata_i;
            // check the data dependance, if mem stage is updating the csr, use the lastest value
            if( mem_csr_we_i == `WriteEnable && mem_csr_waddr_i == csr_addr_i) begin
                csr_result = mem_csr_wdata_i;
            // check the data dependance, if wb stage is updating the csr, use the lastest value
            end else if( wb_csr_we_i == `WriteEnable && wb_csr_waddr_i == csr_addr_i) begin
                csr_result = wb_csr_wdata_i;
            end
        end
    end

    // calculate the data to write to the csr
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            csr_waddr_o = `ZeroWord;
            csr_wdata_o = `ZeroWord;
        end else begin
            csr_wdata_o = `ZeroWord;
            case (uopcode_i)
                `UOP_CODE_CSRRW: begin
                    // csrrw rd,offset,rs1  :   t = CSRs[csr]; CSRs[csr] = x[rs1]; x[rd] = t
                    csr_wdata_o = rs1_data_i;
                end

                `UOP_CODE_CSRRWI: begin
                    // csrrwi rd,offset,uimm  :  x[rd] = CSRs[csr]; CSRs[csr] = zimm
                    csr_wdata_o = imm_i;
                end

                `UOP_CODE_CSRRS: begin
                    // csrrs rd,offset,rs1  :   t = CSRs[csr]; CSRs[csr] = t | x[rs1]; x[rd] = t
                    csr_wdata_o = rs1_data_i | csr_result;
                end

                `UOP_CODE_CSRRSI: begin
                   // csrrsi rd,offset,uimm  :  t = CSRs[csr]; CSRs[csr] = t | zimm; x[rd] = t
                    csr_wdata_o = imm_i | csr_result;
                end

                `UOP_CODE_CSRRC: begin
                    // csrrc rd,offset,rs1  :   t = CSRs[csr]; CSRs[csr] = t &∼x[rs1]; x[rd] = t
                    csr_wdata_o = csr_result & (~rs1_data_i);
                end

                `UOP_CODE_CSRRCI: begin
                    // csrrci rd,offset,uimm  :  t = CSRs[csr]; CSRs[csr] = t &∼zimm; x[rd] = t
                    csr_wdata_o = csr_result & (~imm_i);
                end

                default: begin

                end
            endcase
        end  //else begin
    end  //always

    // jump and branch instructions
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            jump_result = `ZeroWord;

            branch_request_o = 1'b0;
            branch_is_taken_o = 1'b0;
            branch_is_call_o = 1'b0;
            branch_is_ret_o = 1'b0;
            branch_is_jmp_o = 1'b0;
            branch_target_o = `ZeroWord;

            branch_redirect_o = 1'b0;
            branch_redirect_pc_o = `ZeroWord;;
            branch_tag_o = 1'b0;

        end else begin
            jump_result = `ZeroWord;

            branch_request_o = 1'b0;
            branch_is_taken_o = 1'b0;
            branch_is_call_o = 1'b0;
            branch_is_ret_o = 1'b0;
            branch_is_jmp_o = 1'b0;
            branch_target_o = `ZeroWord;

            branch_redirect_o = 1'b0;
            branch_redirect_pc_o = `ZeroWord;;
            branch_tag_o = 1'b0;
            case (uopcode_i)
                `UOP_CODE_JAL: begin
                    // jal rd,offset  :  x[rd] = pc+4; pc += sext(offset)
                    jump_result = pc_plus_4;  //save to rd
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o = 1'b1;

                    /* A JAL instruction should push the return address onto a return-address stack (RAS) only when rd=x1/x5.*/
                    if( (rd_addr_i == 5'b00001) || (rd_addr_i == 5'b00101) ) begin
                        branch_is_call_o = 1'b1;
                    end else begin
                        branch_is_jmp_o = 1'b1;
                    end
                end

                `UOP_CODE_JALR: begin
                    // jalr rd,rs1,offset  :   t =pc+4; pc=(x[rs1]+sext(imm))&∼1; x[rd]=t
                    jump_result = pc_plus_4;
                    branch_target_o = rs1_data_i + imm_i;
                    branch_is_taken_o = 1'b1;

                    /* JALR instructions should push/pop a RAS as shown in the Table
                    ------------------------------------------------
                       rd    |   rs1    | rs1=rd  |   RAS action
                   (1) !link |   !link  | -       |   none
                   (2) !link |   link   | -       |   pop
                   (3) link  |   !link  | -       |   push
                   (4) link  |   link   | 0       |   push and pop
                   (5) link  |   link   | 1       |   push
                    ------------------------------------------------ */
                    if(rd_addr_i == 5'b00001 || rd_addr_i == 5'b00101) begin  //rd is linker reg
                        if(rs1 == 5'b00001 || rs1 == 5'b00101) begin  //rs1 is linker reg as well
                            if(rd_addr_i == rs1) begin     //(5)
                                branch_is_call_o = 1'b1;
                            end else begin
                                branch_is_call_o = 1'b1;   //(4)
                                branch_is_ret_o = 1'b1;
                            end
                        end else begin
                            branch_is_call_o = 1'b1; //(3)
                        end // if(rs1 == 5'b00001 || rs1 == 5'b00101) begin
                    end else begin  //rd is not linker reg
                        if(rs1 == 5'b00001 || rs1 == 5'b00101) begin  // rs1 is linker reg
                            branch_is_ret_o = 1'b1; //(2)
                        end else begin  //rs1 is not linker reg
                            branch_is_jmp_o = 1'b1; // (1)
                        end
                    end //if(rd_addr_i == 5'b00001 || rd_addr_i == 5'b00101) begin
               end

                /* ---------------------B-Type instruction --------------*/
                `UOP_CODE_BEQ: begin
                    // beq rs1,rs2,offset  :   if (rs1 == rs2) pc += sext(imm)
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o = rs1_eq_rs2;
                end

                `UOP_CODE_BNE: begin
                   // bne rs1,rs2,offset  :   if (rs1 != rs2) pc += sext(offset)
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o = (~rs1_eq_rs2);
                end

                `UOP_CODE_BGE: begin
                    // bge rs1,rs2,offset  :   if (rs1 >=s rs2) pc += sext(offset)
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o = (rs1_ge_rs2_signed);
                end

                `UOP_CODE_BGEU: begin
                    // bgeu rs1,rs2,offset  :   if (rs1 >=u rs2) pc += sext(offset)
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o = (rs1_ge_rs2_unsigned);
                end

                `UOP_CODE_BLT: begin
                   // blt rs1,rs2,offset  :   if (rs1 <s rs2) pc += sext(offset)
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o = (~rs1_ge_rs2_signed);
                end

                `UOP_CODE_BLTU: begin
                    // bltu rs1,rs2,offset  :   if (rs1 >u rs2) pc += sext(offset)
                    branch_target_o = pc_add_imm;
                    branch_is_taken_o =  (~rs1_ge_rs2_unsigned);
                end

                default: begin
                end
            endcase // case (uopcode_i)

            if( (uopcode_i == `UOP_CODE_JAL) || (uopcode_i == `UOP_CODE_JALR) || (uopcode_i == `UOP_CODE_BEQ) || (uopcode_i == `UOP_CODE_BNE) ||
                (uopcode_i == `UOP_CODE_BGE) || (uopcode_i == `UOP_CODE_BGEU) || (uopcode_i == `UOP_CODE_BLT) || (uopcode_i == `UOP_CODE_BLTU) ) begin

                branch_request_o = 1'b1;

                if(branch_is_taken_o == 1'b1) begin   //taken
                    if( (next_taken_i == 1'b0) || (next_pc_i != branch_target_o) ) begin     //miss predicted taken or target
                        branch_redirect_o = `Branch;
                        branch_redirect_pc_o = branch_target_o;
                        branch_tag_o = branch_redirect_o;  // indicate a branch started
                        $display("miss predicted, pc=%h, next_take=%d, branch_taken=%d, next_pc=%h, branch_target=%h is_call=%d, is_ret=%d, is_jmp=%d",
                        pc_i, next_taken_i, branch_is_taken_o, next_pc_i, branch_target_o, branch_is_call_o, branch_is_ret_o, branch_is_jmp_o);
                    end
                end else begin  //if(branch_is_taken_o == 1'b1) begin
                    if( next_taken_i == 1'b1 ) begin //miss predicted taken
                        branch_redirect_o = `Branch;
                        branch_redirect_pc_o = pc_i+4;
                        branch_tag_o = branch_redirect_o;  // indicate a branch started
                        $display("miss predicted, pc=%h, branch_taken=%d, next_take=%d, next_pc=%h", pc_i, branch_is_taken_o, next_taken_i, next_pc_i);
                    end
                end  // if(branch_is_taken_o == 1'b1) begin
            end  //  if( (uopcode_i == `UOP_CODE_JAL) || (uopcode_i == `UOP_CODE_JALR) ||
        end  // if(n_rst_i == `RstEnable) begin
    end //always



    // logic
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            logic_result = `ZeroWord;
        end else begin
            logic_result = `ZeroWord;
            case (uopcode_i)
               `UOP_CODE_LUI:  begin
                    // lui rd,imm  :  x[rd] = sext(immediate[31:12] << 12)
                    logic_result = imm_i;
                end

               `UOP_CODE_AUIPC:  begin
                    // auipc rd,imm  : 	x[rd] = pc + sext(immediate[31:12] << 12)
                    logic_result = pc_add_imm;
                end

                `UOP_CODE_SLTI: begin
                    // slti rd,rs1,imm  :  x[rd] = x[rs1] <s sext(immediate)
                    logic_result = {32{(~rs1_ge_imm_signed)}} & 32'h1;
                end

                `UOP_CODE_SLTIU: begin
                    // sltiu rd,rs1,imm  :  x[rd] = x[rs1] <u sext(immediate)
                    logic_result = {32{(~rs1_ge_imm_unsigned)}} & 32'h1;
                end

                `UOP_CODE_ANDI: begin
                    // andi rd,rs1,imm  :   x[rd] = x[rs1] & sext(immediate)
                    logic_result = rs1_and_imm;
                end

                `UOP_CODE_ORI: begin
                    // ori rd,rs1,imm  :  x[rd] = x[rs1] | sext(immediate)
                    logic_result = rs1_or_imm;
                end

                `UOP_CODE_XORI: begin
                    // xori rd,rs1,imm  :  x[rd] = x[rs1] ^ sext(immediate)
                    logic_result = rs1_xor_imm;
                end

               `UOP_CODE_AND: begin
                    // and rd,rs1,rs2  :  x[rd] = x[rs1] & x[rs2]
                    logic_result =  rs1_and_rs2;
                end

                `UOP_CODE_OR: begin
                    // or rd,rs1,rs2  :  x[rd] = x[rs1] | x[rs2]
                    logic_result =  rs1_or_rs2;
                end

                `UOP_CODE_XOR: begin
                    // xor rd,rs1,rs2  :  x[rd] = x[rs1] ^ x[rs2]
                    logic_result =  rs1_xor_rs2;
                end

                `UOP_CODE_SLT: begin
                    // slt rd,rs1,rs2  :   x[rd] = x[rs1] <s x[rs2]
                    logic_result = {32{(~rs1_ge_rs2_signed)}} & 32'h1;
                end

                `UOP_CODE_SLTU: begin
                    // sltu rd,rs1,rs2  :   x[rd] = x[rs1] <u x[rs2]
                    logic_result = {32{(~rs1_ge_rs2_unsigned)}} & 32'h1;
                end

                default: begin

                end
            endcase // case (uopcode_i)
        end  // end else begin
    end //always


    //shift
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            shift_result = `ZeroWord;
        end else begin
            shift_result = `ZeroWord;
            case (uopcode_i)
                `UOP_CODE_SLLI: begin
                    // slli rd,rs1,shamt  :   x[rd] = x[rs1] << shamt
                    shift_result = rs1_data_i << imm_i;
                end

                `UOP_CODE_SRLI: begin
                    // srli rd,rs1,shamt  :   x[rd] = x[rs1] >>u shamt
                    shift_result = rs1_data_i >> imm_i;
                end

                `UOP_CODE_SRAI: begin
                    // srai rd,rs1,shamt  :   x[rd] = x[rs1] >>s shamt
                    shift_result = (sri_shift & sri_shift_mask) | ({32{rs1_data_i[31]}} & (~sri_shift_mask));
                end

               `UOP_CODE_SLL: begin
                    // sll rd,rs1,rs2  :   x[rd] = x[rs1] << x[rs2]
                    shift_result =  rs1_data_i << rs2_data_i[4:0];
                end

                `UOP_CODE_SRL: begin
                    // srl rd,rs1,rs2  :   x[rd] = x[rs1] >>u x[rs2]
                    shift_result =  rs1_data_i >> rs2_data_i[4:0];
                end

                `UOP_CODE_SRA: begin
                    // sra rd,rs1,rs2  :   x[rd] = x[rs1] >>s x[rs2]
                    shift_result =  (sr_shift & sr_shift_mask) | ({32{rs1_data_i[31]}} & (~sr_shift_mask));
                end

                default: begin

                end
            endcase // case (uopcode_i)
        end  // end else begin
    end //always



    //arithmetic
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            arithmetic_result = `ZeroWord;
        end else begin
            arithmetic_result = `ZeroWord;
            case (uopcode_i)
                `UOP_CODE_ADDI: begin
                    // addi rd,rs1,imm :  x[rd] = x[rs1] + sext(immediate)
                    arithmetic_result = rs1_add_imm;
                end

                `UOP_CODE_ADD: begin
                    // add rd,rs1,rs2  :  x[rd] = x[rs1] + x[rs2]
                    arithmetic_result = rs1_add_rs2;
                end

                `UOP_CODE_SUB: begin
                    // sub rd,rs1,rs2  :  x[rd] = x[rs1] - x[rs2]
                    arithmetic_result = rs1_sub_rs2;
                end

                default: begin

                end
            endcase // case (uopcode_i)
        end  // end else begin
    end //always



    // multiply instructions
    reg[`RegBus] mul_op1;
    reg[`RegBus] mul_op2;

    wire[`DoubleRegBus] mul_temp;
    wire[`DoubleRegBus] mul_temp_invert;

    assign mul_temp = mul_op1 * mul_op2;
    assign mul_temp_invert = ~mul_temp + 1;

    reg[`RegBus] rs1_data_invert;
    reg[`RegBus] rs2_data_invert;

    assign rs1_data_invert = ~rs1_data_i + 1;
    assign rs2_data_invert = ~rs2_data_i + 1;

    always @ (*) begin
        case (uopcode_i)
            `UOP_CODE_MULT, `UOP_CODE_MULHU: begin
                mul_op1 = rs1_data_i;
                mul_op2 = rs2_data_i;
            end

            `UOP_CODE_MULHSU: begin
                mul_op1 = (rs1_data_i[31] == 1'b1)? (rs1_data_invert): rs1_data_i;
                mul_op2 = rs2_data_i;
            end

            `UOP_CODE_MULH: begin
                mul_op1 = (rs1_data_i[31] == 1'b1)? (rs1_data_invert): rs1_data_i;
                mul_op2 = (rs2_data_i[31] == 1'b1)? (rs2_data_invert): rs2_data_i;
            end

            default: begin
                mul_op1 = rs1_data_i;
                mul_op2 = rs2_data_i;
            end
        endcase
    end


    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            mul_result = `ZeroWord;
        end else begin
            mul_result = `ZeroWord;
            case (uopcode_i)
                `UOP_CODE_MULT: begin
                    // mul rd,rs1,rs2  :    x[rd] = x[rs1] × x[rs2]
                    mul_result = mul_temp[31:0];
                end

                `UOP_CODE_MULHU: begin
                    // mulhu rd,rs1,rs2  :   x[rd] = (x[rs1] u × x[rs2]) >>u XLEN
                    mul_result = mul_temp[63:32];
                end

                `UOP_CODE_MULH: begin
                    // mulh rd,rs1,rs2  :   x[rd] = (x[rs1] s×s x[rs2]) >>s XLEN
                    case ({rs1_data_i[31], rs2_data_i[31]})
                        2'b00: begin
                            mul_result = mul_temp[63:32];
                        end
                        2'b11: begin
                            mul_result = mul_temp[63:32];
                        end
                        2'b10: begin
                            mul_result = mul_temp_invert[63:32];
                        end
                        default: begin
                            mul_result = mul_temp_invert[63:32];
                        end
                    endcase
                end

                `UOP_CODE_MULHSU: begin
                    // mulhsu rd,rs1,rs2  :   x[rd] = (x[rs1] s × x[rs2]) >>s XLEN
                    if (rs1_data_i[31] == 1'b1) begin
                        mul_result = mul_temp_invert[63:32];
                    end else begin
                        mul_result = mul_temp[63:32];
                    end
                end

                default: begin

                end
            endcase
        end // else begin
    end  //always


    // stall the pipeline if needed
    always @ (*) begin
        stall_req_o = stallreq_for_div;  //只有div指令才需要停止流水线
    end

    // division and rem instructions
    always @ (*) begin
        if(n_rst_i == `RstEnable) begin
            stallreq_for_div = `NoStop;
            dividend_o = `ZeroWord;
            divisor_o = `ZeroWord;
            div_start_o = `DivStop;
            div_signed_o = 1'b0;
        end else begin
            stallreq_for_div = `NoStop;
            dividend_o = `ZeroWord;
            divisor_o = `ZeroWord;
            div_start_o = `DivStop;
            div_signed_o = 1'b0;
            case (uopcode_i)
                `UOP_CODE_DIV:        begin
                    // div rd,rs1,rs2  :   x[rd] = x[rs1] /s x[rs2]
                    if(div_ready_i == `DivResultNotReady) begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStart;
                        div_signed_o = 1'b1;       // signed division
                        stallreq_for_div = `Stop;  // stop the pipeline
                    end else begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStop;
                        div_signed_o = 1'b1;
                        stallreq_for_div = `NoStop;  // resume the pipeline
                        div_result = div_result_i[31:0]; // get the quotient
                    end
                end

               `UOP_CODE_DIVU:       begin
                    // divu rd,rs1,rs2  :   x[rd] = x[rs1] /u x[rs2]
                    if(div_ready_i == `DivResultNotReady) begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStart;
                        div_signed_o = 1'b0;        // unsigned division
                        stallreq_for_div = `Stop;
                    end else begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStop;
                        div_signed_o = 1'b0;
                        stallreq_for_div = `NoStop;
                        div_result = div_result_i[31:0];
                    end
                end

                `UOP_CODE_REM: begin
                    // rem rd,rs1,rs2  :    x[rd] = x[rs1] %s x[rs2]
                    if(div_ready_i == `DivResultNotReady) begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStart;
                        div_signed_o = 1'b1;
                        stallreq_for_div = `Stop;
                    end else begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStop;
                        div_signed_o = 1'b1;
                        stallreq_for_div = `NoStop;
                        div_result = div_result_i[63:32]; // get the remainder
                    end
                end

                `UOP_CODE_REMU: begin
                    // remu rd,rs1,rs2  :   x[rd] = x[rs1] %u x[rs2]
                   if(div_ready_i == `DivResultNotReady) begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStart;
                        div_signed_o = 1'b0;
                        stallreq_for_div = `Stop;
                    end else begin
                        dividend_o = rs1_data_i;
                        divisor_o = rs2_data_i;
                        div_start_o = `DivStop;
                        div_signed_o = 1'b0;
                        stallreq_for_div = `NoStop;
                        div_result = div_result_i[63:32];
                    end
                end

                default: begin
                end
            endcase
        end // else begin
    end  //always


    /* selector the alu result to write to the rd*/
    always @ (*) begin
        rd_addr_o = rd_addr_i;
        case ( alusel_i )
            `EXE_TYPE_BRANCH:  begin
                rd_wdata_o = jump_result;
            end

            `EXE_TYPE_LOGIC: begin
                rd_wdata_o = logic_result;
            end

            `EXE_TYPE_SHIFT: begin
                rd_wdata_o = shift_result;
            end

            `EXE_TYPE_ARITHMETIC: begin
                rd_wdata_o = arithmetic_result;
            end

            `EXE_TYPE_MUL:  begin
                rd_wdata_o = mul_result;
            end

            `EXE_TYPE_DIV: begin
                rd_wdata_o = div_result;
            end

            `EXE_TYPE_CSR: begin
                rd_wdata_o = csr_result;
            end

            default: begin
                rd_wdata_o = `ZeroWord;
            end
        endcase
    end

endmodule
