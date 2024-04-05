//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

stage2.v

Implements the writeback stage. Can assert the branch_mispredict signal. 
Depending on the opcode, this stage may wait for a valid signal on the memory 
or ALU.

This stage also takes care of decrementing jt and jf (see the README in this 
folder)

Even though the packet memory and ALU are all pipelined with an II of 1, I 
didn't feel the need to take advantage of it here; at any given moment, only 
one instruction can be waiting for the ALU or memory. This really simplifies 
the logic I have to write, and anyway, how often would a BPF program really 
benefit from pipelined ALU/memory? Let's remember that I only added pipelining 
for timing, not for performance.


Hmmmm, I forgot that stage1 and stage2 also fight over the scratch memory 
too... need to be careful for that. I think if stage2 outputs an extra bit to 
say when it is trying to use the regfile_sel bits, we should be ok. 

I'm not sure if it's correct to gate hot signals with prev_vld && rdy. 
Intuitively it makes sense, but I think I'll have to see the sim outputs to 
understand it for myself.

*/

`ifdef FROM_CONTROLLER
`include "../../bpf_defs.vh"
`elsif FROM_BPFCPU
`include "../bpf_defs.vh"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/bpf_defs.vh"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/bpf_defs.vh"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif


`define genif generate if
`define endgen end endgenerate

//I use logic where I intend combinational logic, but Verilog forces me to use reg
`define logic reg

module stage2 # (
    parameter CODE_ADDR_WIDTH = 10
) (
    input wire clk,
    input wire rst,

    //Inputs from last stage:
    input wire [63:0] instr_in,
    
    //Inputs from datapath:
    input wire mem_vld,
    input wire eq,
    input wire gt,
    input wire ge,
    input wire set,
    input wire ALU_vld,
    
    //Outputs for this stage:
    output wire [7:0] jt_out,
    output wire [7:0] jf_out,
    output wire [1:0] PC_sel, //branch_mispredict signifies when to use stage2's PC_sel over stage0's
    output wire [2:0] A_sel,
    output wire A_en,
    output wire [2:0] X_sel,
    output wire X_en,
    output wire [3:0] regfile_sel_stage2,
    output wire [31:0] imm_stage2,
    output wire ALU_ack,
    output wire branch_mispredict,
    
    output wire acc,
    output wire rej,
    
    //Signals for stall logic
    output wire stage2_reads_regfile, 
    output wire stage2_writes_A,
    output wire stage2_writes_X,
    
    
    //count number of cycles instruction has been around for
    input wire PC_en,
    input wire [5:0] icount,
    output wire [CODE_ADDR_WIDTH-1:0] jmp_correction,
    
    //Handshaking signals
    input wire prev_vld,
    output `logic rdy
);
    
    /************************************/
    /**Forward-declare internal signals**/
    /************************************/
    
    //Named subfields of instruction
    wire [7:0] opcode_i;
    wire [7:0] jt_i;
    wire [7:0] jf_i;
    wire [31:0] imm_i;
    
    //Inputs from datapath:
    wire mem_vld_i;
    wire eq_i;
    wire gt_i;
    wire ge_i;
    wire set_i;
    wire ALU_vld_i;
    
    //Outputs for this stage:
    wire [CODE_ADDR_WIDTH-1:0] jt_out_i;
    wire [CODE_ADDR_WIDTH-1:0] jf_out_i;
    `logic [1:0] PC_sel_i; //branch_mispredict signifies when to use stage2's PC_sel over stage0's
    `logic [2:0] A_sel_i;
    `logic A_en_i;
    `logic [2:0] X_sel_i;
    `logic X_en_i;
    wire regfile_sel_stage2_i;
    wire [31:0] imm_stage2_i;
    wire ALU_ack_i;
    `logic branch_mispredict_i;
    
    wire acc_i;
    wire rej_i;
    
    //Stall signals
    wire stage2_reads_regfile_i;
    wire stage2_writes_A_i;
    wire stage2_writes_X_i;
    
    //count number of cycles instruction has been around for
    wire PC_en_i;
    wire [CODE_ADDR_WIDTH-1:0] jmp_correction_i;
    
    
    /***************************************/
    /**Assign internal signals from inputs**/
    /***************************************/
    
    //count_i has special rules: see logic section
    
    //Named subfields of instruction
    assign opcode_i = instr_in[55:48];
    assign jt_i = instr_in[47:40];
    assign jf_i = instr_in[39:32];
    assign imm_i = instr_in[31:0];
    
    //Inputs from datapath:
    assign mem_vld_i  = mem_vld;
    assign eq_i       = eq;
    assign gt_i       = gt;
    assign ge_i       = ge;
    assign set_i      = set;
    assign ALU_vld_i  = ALU_vld;
    
    assign PC_en_i = PC_en;
    
    
    /************************************/
    /**Helpful names for neatening code**/
    /************************************/
    
    //Named subfields of opcode
    wire [2:0] opcode_class;
    assign opcode_class = opcode_i[2:0];
    wire [2:0] addr_type;
    assign addr_type = opcode_i[7:5];
    wire [2:0] jmp_type;
    assign jmp_type = opcode_i[6:4];
    wire [4:0] miscop;
    assign miscop = opcode_i[7:3];
    wire [1:0] retval;
    assign retval = opcode_i[4:3];
    
    //Helper booleans 
    wire miscop_is_zero;
    assign miscop_is_zero = (miscop == 0);
    wire is_TAX_instruction;
    assign is_TAX_instruction = (opcode_class == `BPF_MISC) && (miscop_is_zero);
    wire is_TXA_instruction;
    assign is_TXA_instruction = (opcode_class == `BPF_MISC) && (!miscop_is_zero);
    wire is_RETA_instruction;
    assign is_RETA_instruction = (opcode_class == `BPF_RET) && (retval == `RET_A);
    wire is_RETX_instruction;
    assign is_RETX_instruction = (opcode_class == `BPF_RET) && (retval == `RET_X);
    wire is_RETIMM_instruction;
    assign is_RETIMM_instruction = (opcode_class == `BPF_RET && retval == `RET_IMM);
    
    //If we are awaiting packet memory or ALU
    wire packmem_selected;
    assign packmem_selected = (addr_type == `BPF_ABS || addr_type == `BPF_IND || addr_type == `BPF_MSH);
    wire awaiting_packmem;
    assign awaiting_packmem = (opcode_class == `BPF_LD || opcode_class == `BPF_LDX) && packmem_selected && prev_vld;
    wire awaiting_ALU;
    assign awaiting_ALU = (opcode_class == `BPF_ALU) || (opcode_class == `BPF_JMP && jmp_type != `BPF_JA) && prev_vld;
    
    
    /****************/
    /**Do the logic**/
    /****************/
    
    //rdy
    //this stage is always ready unless it is an ALU or memory access instruction.
    always @(*) begin
        if ((awaiting_packmem && !mem_vld_i) || (awaiting_ALU && !ALU_vld_i)) begin
            rdy <= 0;
        end else begin
            rdy <= 1;
        end
    end
    
    //jt_out_i and jf_out_i
    assign jt_out_i = jt_i;
    assign jf_out_i = jf_i;
    
    //PC_sel_i and branch_mispredict_i
    always @(*) begin
        if (opcode_class == `BPF_JMP) begin
            if (jmp_type == `BPF_JA) begin
                PC_sel_i <= `PC_SEL_PLUS_IMM;
                branch_mispredict_i <= (imm_i != 0);
            end else if ( //If conditional jump was true
                (jmp_type == `BPF_JEQ && eq_i) ||
                (jmp_type == `BPF_JGT && gt_i) ||
                (jmp_type == `BPF_JGE && ge_i) ||
                (jmp_type == `BPF_JSET && set_i)
            ) begin
                PC_sel_i <= `PC_SEL_PLUS_JT;
                branch_mispredict_i <= (jt_i != 0);
            end else begin
                PC_sel_i <= `PC_SEL_PLUS_JF;
                branch_mispredict_i <= (jf_i != 0);
            end
        end else begin
            PC_sel_i <= `PC_SEL_PLUS_1; 
            branch_mispredict_i <= 0;
        end
    end
    
    //A_sel_i and A_en_i
    always @(*) begin
        if (opcode_class == `BPF_LD) begin
            A_en_i <= 1;
            case (addr_type)
                `BPF_ABS, `BPF_IND:
                    A_sel_i <= `A_SEL_PACKET_MEM;
                `BPF_IMM:
                    A_sel_i <= `A_SEL_IMM;
                `BPF_MEM:
                    A_sel_i <= `A_SEL_MEM;
                `BPF_LEN:
                    A_sel_i <= `A_SEL_LEN;
                default:
                    A_sel_i <= 0; //Error
            endcase
        end else if (opcode_class == `BPF_ALU) begin
            A_en_i <= 1;
            A_sel_i <= `A_SEL_ALU;
        end else if (is_TXA_instruction) begin
            A_en_i <= 1;
            A_sel_i <= `A_SEL_X;
        end else begin
            A_en_i <= 0;
            A_sel_i <= 0; //Don't synthesize a latch
        end
    end
    
    //X_sel_i and X_en_i
    always @(*) begin
        if (opcode_class == `BPF_LDX) begin
            X_en_i <= 1;
            case (addr_type)
                `BPF_ABS, `BPF_IND:
                    X_sel_i <= `X_SEL_PACKET_MEM;
                `BPF_IMM:
                    X_sel_i <= `X_SEL_IMM;
                `BPF_MEM:
                    X_sel_i <= `X_SEL_MEM;
                `BPF_LEN:
                    X_sel_i <= `X_SEL_LEN;
                `BPF_MSH:
                    X_sel_i <= `X_SEL_MSH;
                default:
                    X_sel_i <= 0; //Error
            endcase
        end else if (is_TAX_instruction) begin 
            X_en_i <= 1;
            X_sel_i <= `X_SEL_A;
        end else begin
            X_en_i <= 0;
            X_sel_i <= 0; //Don't synthesize a latch
        end
    end
    
    //regfile_sel_stage2
    assign regfile_sel_stage2_i = imm_i[3:0];
    
    //imm_stage2_i;
    assign imm_stage2_i = imm_i;
    
    //ALU_ack_i
    assign ALU_ack_i = (awaiting_ALU && ALU_vld_i);
    
    //jmp_correction_i
`genif (CODE_ADDR_WIDTH > 6) begin
    assign jmp_correction_i = $signed(icount);
end else begin
    assign jmp_correction_i = icount;
`endgen
    
    //acc_i and rej_i
    //TODO: add capability for RETA and RETX instructions
    assign acc_i = is_RETIMM_instruction && (imm_i != 0);
    assign rej_i = is_RETIMM_instruction && (imm_i == 0);
    
    //Stall signals
    assign stage2_reads_regfile_i = (opcode_class == `BPF_LD || opcode_class == `BPF_LDX) && (addr_type == `BPF_MEM);
    assign stage2_writes_A_i = A_en_i;
    assign stage2_writes_X_i = X_en_i;
    
    /****************************************/
    /**Assign outputs from internal signals**/
    /****************************************/
    
    //Note that "hot" control signals are gated with prev_vld and rdy
    wire enable_hot;
    assign enable_hot = prev_vld && rdy && !rst;
    
    //Outputs for this stage:
    assign jt_out             = jt_out_i;
    assign jf_out             = jf_out_i;
    assign PC_sel             = PC_sel_i;
    assign A_sel              = A_sel_i;
    assign A_en               = A_en_i && enable_hot;
    assign X_sel              = X_sel_i;
    assign X_en               = X_en_i && enable_hot;
    assign regfile_sel_stage2 = regfile_sel_stage2_i;
    assign imm_stage2         = imm_stage2_i;
    assign ALU_ack            = ALU_ack_i && enable_hot;
    assign branch_mispredict  = branch_mispredict_i && enable_hot;
    
    assign acc = acc_i && enable_hot;
    assign rej = rej_i && enable_hot;
    
    assign jmp_correction = jmp_correction_i;
    
    //Note that stall signals are gated with prev_vld. This is because they are
    //computed combinationally from the output of the last stage.
    //Stall signals
    assign stage2_reads_regfile = stage2_reads_regfile_i && prev_vld;
    assign stage2_writes_A = stage2_writes_A_i && prev_vld;
    assign stage2_writes_X = stage2_writes_X_i && prev_vld;
    
endmodule

`undef genif
`undef endgen
