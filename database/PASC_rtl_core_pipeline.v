// 
// Copyright 2013 Jeff Bush
// 
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
// 



//
// The execution pipeline has four stages:
//  Instruction Fetch -> Instruction Decode -> Execute -> Writeback
//

//`define ENABLE_TRACING 1

module pipeline(
    input           clk,
    input           reset,
    
    input           stall,

    // Instruction Memory Interface
    output[15:0]    iaddr,
    input[15:0]     idata,

    // Data Memory Interface
    output[15:0]    daddr,
    output[15:0]    ddata_out,
    input[15:0]     ddata_in,
    output          dwrite_en,
    output          dread_en);

    localparam LINK_REGISTER = 3'd7;

    // Instruction Type Field Values (bits 15-13)
    localparam IT_ARITH = 3'b000;
    localparam IT_LOAD = 3'b001;
    localparam IT_STORE = 3'b010;
    localparam IT_ADDI = 3'b011;
    localparam IT_LUI = 3'b100;
    localparam IT_CONDBR = 3'b101;
    localparam IT_UNCONDBR = 3'b110;
    localparam IT_BRANCHREG = 3'b111;

    // ALU operation (low bits of arithmetic instruction operation field)
    localparam OP_AND = 3'b000;
    localparam OP_OR = 3'b001;
    localparam OP_SHL = 3'b010;
    localparam OP_SHR = 3'b011;
    localparam OP_ADD = 3'b100;
    localparam OP_SUB = 3'b101;
    localparam OP_XOR = 3'b110;
    localparam OP_NOT = 3'b111;
    
    // Condition flags
    localparam CC_Z = 2'd0;
    localparam CC_N = 2'd1;
    localparam CC_C = 2'd2;
    localparam CC_O = 2'd3;

    // Architectural State
    reg[15:0] pc;
    reg[15:0] registers[0:7];
    reg[3:0] condition_codes;
    
    integer i;
    initial
    begin
        for (i = 0; i < 8; i = i + 1)
            registers[i] = 0;
    end

    // Signals that are internal to a stage are prefixed with a two character stage 
    // identifier.  Signals that connect stages have two prefixes: the source and 
    // destination stages.
    reg[15:0] if_id_pc;
    wire[15:0] if_id_instruction;
    reg[15:0] id_ex_instruction;    
    reg[15:0] id_ex_rega;
    reg[15:0] id_ex_regb;
    reg id_ex_has_writeback;
    reg[15:0] id_ex_immediate;
    reg[15:0] id_ex_pc;
    reg[15:0] ex_wb_instruction;
    reg ex_wb_has_writeback;
    reg[15:0] ex_alu_result;
    reg[15:0] ex_wb_result;
    wire[16:0] ex_add_sub_result;   // Note extra bit
    wire ex_ignore;
    wire[3:0] ex_instruction_type;
    wire[3:0] ex_arith_op;
    reg[15:0] ex_wb_pc;
    reg[15:0] ex_regb_bypassed;
    reg[15:0] ex_operand1;
    reg[15:0] ex_operand2;
    wire ex_carry_in;
    reg ex_carry_out;
    wire use_cc;
    wire ex_do_subtract;
    wire ex_is_branch;
    wire ex_overflow;
    reg ex_branch_flag;
    reg ex_if_branch_en;
    wire[15:0] ex_if_branch_target;
    wire[2:0] wb_writeback_reg;
    reg[15:0] wb_writeback_value;
    wire wb_is_call;
    wire[2:0] wb_instruction_type;
    wire wb_link;
    reg[15:0] id_immediate;
    reg[2:0] wb_ex_bypass_reg;
    reg[15:0] wb_ex_bypass_value;
    reg wb_ex_has_bypass;
    wire wb_save_link;
    reg[15:0] pc_nxt;

    //////////////////////////////////////////////////////////////
    //
    // Instruction Fetch Stage
    //
    //////////////////////////////////////////////////////////////

    always @*
    begin
        if (ex_if_branch_en)
            pc_nxt = ex_if_branch_target;
        else if (stall)
            pc_nxt = pc;
        else 
            pc_nxt = pc + 16'd1;
    end

    assign iaddr = pc_nxt;
    assign if_id_instruction = idata;   // Note: has latency of one cycle

    always @(posedge clk, posedge reset)
    begin
        if (reset)
        begin
            if_id_pc <= 0;
            pc <= 16'hffff;
        end
        else if (!stall)
        begin
            pc <= pc_nxt;
            if_id_pc <= iaddr + 16'd1;
        end
    end

    //////////////////////////////////////////////////////////////
    //
    // Instruction Decode Stage
    //
    //////////////////////////////////////////////////////////////

    always @*
    begin
        case (if_id_instruction[15:13])
            IT_LOAD,
            IT_ADDI: id_immediate = { {9{if_id_instruction[12]}}, 
                if_id_instruction[12:6] };
            IT_STORE: id_immediate = { {9{if_id_instruction[12]}}, 
                if_id_instruction[12:9], if_id_instruction[2:0] };
            IT_LUI: id_immediate = { if_id_instruction[12:3], 6'd0 };
            IT_CONDBR: id_immediate = { {6{if_id_instruction[9]}}, 
                if_id_instruction[9:0] };
            IT_UNCONDBR: id_immediate = { {4{if_id_instruction[11]}}, 
                if_id_instruction[11:0] };
            default: id_immediate = 0;
        endcase 
    end

    always @(posedge clk, posedge reset)
    begin
        if (reset)
        begin
            id_ex_instruction <= 0;
            id_ex_rega <= 0;
            id_ex_regb <= 0;
            id_ex_has_writeback <= 0;
            id_ex_immediate <= 0;
            id_ex_pc <= 0;
        end
        else if (!stall)
        begin
            id_ex_instruction <= if_id_instruction;
            id_ex_rega <= registers[if_id_instruction[5:3]];
            id_ex_regb <= registers[if_id_instruction[8:6]];
            id_ex_pc <= if_id_pc;
            id_ex_immediate <= id_immediate;
            case (if_id_instruction[15:13])
                IT_ARITH,
                IT_LOAD,
                IT_ADDI,
                IT_LUI: id_ex_has_writeback <= 1;
                default: id_ex_has_writeback <= 0;
            endcase
        end
    end 

    //////////////////////////////////////////////////////////////
    //
    // Execute Stage
    //
    //////////////////////////////////////////////////////////////

    assign ex_instruction_type = id_ex_instruction[15:13];
    assign ex_arith_op = id_ex_instruction[11:9];
    assign ex_is_branch = ex_instruction_type == IT_CONDBR
        || ex_instruction_type == IT_UNCONDBR
        || ex_instruction_type == IT_BRANCHREG;

    // ALU Operand1. Bypasses results from end of execute/writeback stages.
    // This will also select PC as the first operand for branches (reusing
    // the ALU to compute the branch target).
    always @*
    begin
        if (ex_is_branch)
            ex_operand1 = id_ex_pc;
        else if (ex_wb_has_writeback && ex_wb_instruction[2:0] == id_ex_instruction[5:3])
            ex_operand1 = ex_wb_result; 
        else if (wb_ex_has_bypass && wb_ex_bypass_reg == id_ex_instruction[5:3])
            ex_operand1 = wb_ex_bypass_value;
        else
            ex_operand1 = id_ex_rega;
    end

    // Bypass regb from execute/writeback stages.
    // for stores, we will use this for the value to be stored, and operand 2 will 
    // contain the offset.
    always @*
    begin
        if (ex_wb_has_writeback && ex_wb_instruction[2:0] == id_ex_instruction[8:6])
            ex_regb_bypassed = ex_wb_result; 
        else if (wb_ex_has_bypass && wb_ex_bypass_reg == id_ex_instruction[8:6])
            ex_regb_bypassed = wb_ex_bypass_value;
        else
            ex_regb_bypassed = id_ex_regb;
    end
    
    // ALU Operand 2.  Select either register value or immediate value.  
    // The ALU is also overloaded to compute memory access addresses.
    always @*
    begin
        if (ex_instruction_type == IT_ARITH)
            ex_operand2 = ex_regb_bypassed;
        else 
            ex_operand2 = id_ex_immediate;
    end

    // ALU
    assign use_cc = ex_arith_op[3];
    assign ex_do_subtract = ex_instruction_type == IT_ARITH && ex_arith_op == OP_SUB;
    assign ex_carry_in = (ex_do_subtract ^ (condition_codes[CC_C] && use_cc));
    assign { ex_add_sub_result, ex_ignore } = { 1'b0, ex_operand1, ex_carry_in } 
        + { ex_do_subtract, {16{ex_do_subtract}} ^ ex_operand2, ex_carry_in };
    assign ex_overflow = ex_operand2[15] == ex_add_sub_result[15] 
        && ex_operand1[15] != ex_operand2[15];

    always @*
    begin
        ex_carry_out = 0;

        if (ex_instruction_type == IT_LUI)
            ex_alu_result = id_ex_immediate;
        else if (ex_instruction_type == IT_ARITH)
        begin
            case (ex_arith_op[2:0])
                OP_AND: ex_alu_result = ex_operand1 & ex_operand2;
                OP_OR: ex_alu_result = ex_operand1 | ex_operand2; 
                OP_XOR: ex_alu_result = ex_operand1 ^ ex_operand2;
                OP_ADD,
                OP_SUB: { ex_carry_out, ex_alu_result } = ex_add_sub_result;
                OP_SHL: { ex_carry_out, ex_alu_result } = { ex_operand1, condition_codes[CC_C] && use_cc };
                OP_SHR: { ex_alu_result, ex_carry_out } = { use_cc && condition_codes[CC_C], ex_operand1 };
                OP_NOT: ex_alu_result = ~ex_operand1;
            endcase
        end
        else
            ex_alu_result = ex_add_sub_result[15:0];
    end

    // Branch control
    always @*
    begin
        case (id_ex_instruction[11:10])
            CC_Z: ex_branch_flag = condition_codes[CC_Z];
            CC_N: ex_branch_flag = condition_codes[CC_N];
            CC_C: ex_branch_flag = condition_codes[CC_C];
            CC_O: ex_branch_flag = condition_codes[CC_O];
        endcase
    end

    assign ex_if_branch_target = ex_instruction_type == IT_BRANCHREG
        ? ex_regb_bypassed
        : ex_alu_result; 

    always @*
    begin
        if (ex_instruction_type == IT_UNCONDBR || ex_instruction_type == IT_BRANCHREG)
            ex_if_branch_en = 1;
        else if (ex_instruction_type == IT_CONDBR)
            ex_if_branch_en = ex_branch_flag ^ id_ex_instruction[12];
        else
            ex_if_branch_en = 0;
    end
    
    // Data access
    assign daddr = ex_alu_result;
    assign dwrite_en = ex_instruction_type == IT_STORE;
    assign dread_en = ex_instruction_type == IT_LOAD;
    assign ddata_out = ex_regb_bypassed;
    
    always @(posedge clk, posedge reset)
    begin
        if (reset)
        begin
            ex_wb_instruction <= 0;
            ex_wb_has_writeback <= 0;
            ex_wb_result <= 0;
            ex_wb_pc <= 0;
            condition_codes <= 0;
        end
        else if (!stall)
        begin
            ex_wb_instruction <= id_ex_instruction;
            ex_wb_has_writeback <= id_ex_has_writeback;
            ex_wb_result <= ex_alu_result;
            ex_wb_pc <= id_ex_pc;
            if (ex_instruction_type == IT_ARITH || ex_instruction_type == IT_ADDI)
            begin
                condition_codes <= { ex_overflow, ex_carry_out, ex_alu_result[15], 
                    ex_alu_result == 0 }; // OCNZ
            end
            
`ifdef ENABLE_TRACING
            if (dwrite_en)
            begin
                $display("%m %x: mem[%x] <= %x", id_ex_pc - 1, ex_alu_result,
                    ex_regb_bypassed);
            end
`endif
        end
    end     

    //////////////////////////////////////////////////////////////
    //
    // Writeback Stage
    //
    //////////////////////////////////////////////////////////////

    assign wb_save_link = (wb_instruction_type == IT_UNCONDBR 
        || wb_instruction_type == IT_BRANCHREG) && ex_wb_instruction[12];
    assign wb_writeback_reg = wb_save_link ? LINK_REGISTER : ex_wb_instruction[2:0];
    assign wb_instruction_type = ex_wb_instruction[15:13];

    always @*
    begin
        if (wb_save_link)
            wb_writeback_value = ex_wb_pc;
        else if (wb_instruction_type == IT_LOAD)
            wb_writeback_value = ddata_in;
        else
            wb_writeback_value = ex_wb_result;
    end

    always @(posedge clk, posedge reset)
    begin
        if (reset)
        begin
            wb_ex_bypass_reg <= 0;
            wb_ex_bypass_value <= 0;
            wb_ex_has_bypass <= 0;
        end
        else if (!stall)
        begin
            wb_ex_has_bypass <= ex_wb_has_writeback;
            if (ex_wb_has_writeback)
            begin
                registers[wb_writeback_reg] <= wb_writeback_value;
                wb_ex_bypass_reg <= wb_writeback_reg;
                wb_ex_bypass_value <= wb_writeback_value;

`ifdef ENABLE_TRACING
                if (ex_wb_instruction != 0)
                begin
                    $display("%m %04x: r%d <= %04x", ex_wb_pc - 1, wb_writeback_reg, 
                        wb_writeback_value);
                end
`endif
            end
        end
    end
endmodule

