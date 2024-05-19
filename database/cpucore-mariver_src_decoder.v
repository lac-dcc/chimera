// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    单指令译码器，基于组合逻辑
    Upd at 6.24: 输出参数弃用“rt”，改为“real_rt”
*/

module decoder(
    input[31:0]         inst,
    input[$clog2(`CNT_EXCEPTION) - 1:0] pre_excode, //取指阶段的异常码
    input               pred,
    input               llbit,
    input               cp0_en,
    output[`CNT_FU - 1:0]   futype, //若decode检测出异常则视作ALU指令
    output[$clog2(`CNT_ALUOP) - 1:0]    aluop,  //若ALU指令则操作码
    output[`CNT_MDUOP - 1:0]    mduop,
    output[$clog2(`CNT_MUOP) - 1:0]     muop,
    output[`CNT_CTRL - 1:0]     ctrl,
    output[$clog2(`CNT_CMP) - 1:0]  cmpop,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    excode,
    output[4:0]         rs,
    //output[4:0]         rt,
    output[4:0]         real_rt,
    output[4:0]         real_rd,    //真正的写回GPR
    output[5:0]         cp0addr,
    output              iscall      //给Decode用的，用于RAS压栈
    );

    wire[4:0] rt;
    wire[31:0] IR=inst;
    assign rs=inst[25:21];
    assign rt=inst[20:16];

    /*
        我们作出这样的尝试：
        实现sel=2,rd=4的UserLocal，将其映射到sel=1,rd=10
        并且实现rdhwr 29, 
    */

    //When sel != 0/1, redirect cp0addr to {sel=0,7}, inst don't make effect and read 0
    //Note: 这个cp0addr其实也包括cp1的控制寄存器，高位一定是0
    assign cp0addr=(inst[1] | inst[2]) ? 6'd7 : {inst[0],inst[15:11]};

    wire[4:0] sa=inst[10:6];
    wire[15:0] imm=inst[15:0];
    wire[5:0] opcode=inst[31:26];
    wire[5:0] func=inst[5:0];
    wire[4:0] tmp_rd=inst[15:11];
    wire[25:0] instr_index=inst[25:0];
    wire rs0=~(|rs);
    wire rt0=~(|rt);
    wire sa0=~(|sa);
    wire rd0=~(|tmp_rd);
    wire opcode0=~(|opcode);
    wire func0=~(|func);

    wire[`CNT_INST:1] icode;
    assign icode[`I_add]=opcode0 & sa0 & (func == 6'b100000);
    assign icode[`I_addi]=(opcode == 6'b001000);
    assign icode[`I_addu]=opcode0 & sa0 & (func == 6'b100001);
    assign icode[`I_addiu]=(opcode == 6'b001001);
    assign icode[`I_sub]=opcode0 & sa0 & (func == 6'b100010);
    assign icode[`I_subu]=opcode0 & sa0 & (func == 6'b100011);
    assign icode[`I_slt]=opcode0 & sa0 & (func == 6'b101010);
    assign icode[`I_slti]=(opcode == 6'b001010);
    assign icode[`I_sltu]=opcode0 & sa0 & (func == 6'b101011);
    assign icode[`I_sltiu]=(opcode == 6'b001011);
    assign icode[`I_div]=opcode0 & (imm == 16'b011010);
    assign icode[`I_divu]=opcode0 & (imm == 16'b011011);
    assign icode[`I_mult]=opcode0 & (imm == 16'b011000);
    assign icode[`I_multu]=opcode0 & (imm == 16'b011001);
    assign icode[`I_and]=opcode0 & sa0 & (func == 6'b100100);
    assign icode[`I_andi]=(opcode == 6'b001100);
    assign icode[`I_lui]=(opcode == 6'b001111) & rs0;
    assign icode[`I_nor]=opcode0 & sa0 & (func == 6'b100111);
    assign icode[`I_or]=opcode0 & sa0 & (func == 6'b100101);
    assign icode[`I_ori]=(opcode == 6'b001101);
    assign icode[`I_xor]=opcode0 & sa0 & (func == 6'b100110);
    assign icode[`I_xori]=(opcode == 6'b001110);
    assign icode[`I_sllv]=opcode0 & sa0 & (func == 6'b000100);
    assign icode[`I_sll]=opcode0 & rs0 & func0;
    assign icode[`I_srav]=opcode0 & sa0 & (func == 6'b000111);
    assign icode[`I_sra]=opcode0 & rs0 & (func == 6'b000011);
    assign icode[`I_srlv]=opcode0 & sa0 & (func == 6'b000110);
    assign icode[`I_srl]=opcode0 & rs0 & (func == 6'b000010);
    assign icode[`I_beq]=(opcode == 6'b000100);
    assign icode[`I_bne]=(opcode == 6'b000101);
    assign icode[`I_bgez]=(opcode == 6'b000001) & (rt == 5'b00001);
    assign icode[`I_bgtz]=(opcode == 6'b000111) & rt0;
    assign icode[`I_blez]=(opcode == 6'b000110) & rt0;
    assign icode[`I_bltz]=(opcode == 6'b000001) & rt0;
    assign icode[`I_bgezal]=(opcode == 6'b000001) & (rt == 5'b10001);
    assign icode[`I_bltzal]=(opcode == 6'b000001) & (rt == 5'b10000);
    assign icode[`I_j]=(opcode == 6'b000010);
    assign icode[`I_jal]=(opcode == 6'b000011);
    assign icode[`I_jr]=opcode0 & (IR[20:0]==21'b1000);
    assign icode[`I_jalr]=opcode0 & sa0 & rt0 & (func == 6'b001001);
    assign icode[`I_mfhi]=opcode0 & rs0 & rt0 & sa0 & (func == 6'b010000);
    assign icode[`I_mflo]=opcode0 & rs0 & rt0 & sa0 & (func == 6'b010010);
    assign icode[`I_mthi]=opcode0 & rt0 & rd0 & sa0 & (func == 6'b010001);
    assign icode[`I_mtlo]=opcode0 & rt0 & rd0 & sa0 & (func == 6'b010011);
    assign icode[`I_break]=opcode0 & (func == 6'b001101);
    assign icode[`I_syscall]=opcode0 & (func == 6'b001100);
    assign icode[`I_lb]=(opcode == 6'b100000);
    assign icode[`I_lbu]=(opcode == 6'b100100);
    assign icode[`I_lh]=(opcode == 6'b100001);
    assign icode[`I_lhu]=(opcode == 6'b100101);
    assign icode[`I_lw]=(opcode == 6'b100011);
    assign icode[`I_sb]=(opcode == 6'b101000);
    assign icode[`I_sh]=(opcode == 6'b101001);
    assign icode[`I_sw]=(opcode == 6'b101011);
    assign icode[`I_eret]=(IR == {6'b010000,1'b1,25'b011000});
    assign icode[`I_mfc0]=rs0 & (opcode == 6'b010000) & ~(|inst[10:3]);
    assign icode[`I_mtc0]=(opcode == 6'b010000) & (rs == 5'b00100) & ~(|inst[10:3]);
    assign icode[`I_cache]=(opcode == 6'b101111);
    assign icode[`I_tlbwi]=(IR == {6'b010000,1'b1,25'b000010});
    assign icode[`I_tlbr]=(IR == {6'b010000,1'b1,25'b000001});
    assign icode[`I_tlbp]=(IR == {6'b010000,1'b1,25'b001000});
    assign icode[`I_clo]=(opcode == 6'b011100) & sa0 & (func == 6'b100001);
    assign icode[`I_clz]=(opcode == 6'b011100) & sa0 & (func == 6'b100000);
    assign icode[`I_madd]=(opcode == 6'b011100) & rd0 & sa0 & func0;
    assign icode[`I_maddu]=(opcode == 6'b011100) & rd0 & sa0 & (func == 6'b000001);
    assign icode[`I_msub]=(opcode == 6'b011100) & rd0 & sa0 & (func == 6'b000100);
    assign icode[`I_msubu]=(opcode == 6'b011100) & rd0 & sa0 & (func == 6'b000101);
    assign icode[`I_mul]=(opcode == 6'b011100) & sa0 & (func == 6'b000010);
    assign icode[`I_ll]=(opcode == 6'b110000);
    assign icode[`I_lwl]=(opcode == 6'b100010);
    assign icode[`I_lwr]=(opcode == 6'b100110);
    assign icode[`I_pref]=(opcode == 6'b110011);
    assign icode[`I_sc]=(opcode == 6'b111000);
    assign icode[`I_swl]=(opcode == 6'b101010);
    assign icode[`I_swr]=(opcode == 6'b101110);
    assign icode[`I_sync]=(func == 6'b001111) & ~(|inst[31:11]);
    assign icode[`I_movn]=opcode0 & sa0 & (func == 6'b001011);
    assign icode[`I_movz]=opcode0 & sa0 & (func == 6'b001010);
    assign icode[`I_teq]=opcode0 & (func == 6'b110100);
    assign icode[`I_teqi]=(opcode == 6'b000001) & (rt == 5'b01100);
    assign icode[`I_tge]=opcode0 & (func == 6'b110000);
    assign icode[`I_tgei]=(opcode == 6'b000001) & (rt == 5'b01000);
    assign icode[`I_tgeiu]=(opcode == 6'b000001) & (rt == 5'b01001);
    assign icode[`I_tgeu]=opcode0 & (func == 6'b110001);
    assign icode[`I_tlt]=opcode0 & (func == 6'b110010);
    assign icode[`I_tlti]=(opcode == 6'b000001) & (rt == 5'b01010);
    assign icode[`I_tltiu]=(opcode == 6'b000001) & (rt == 5'b01011);
    assign icode[`I_tltu]=opcode0 & (func == 6'b110011);
    assign icode[`I_tne]=opcode0 & (func == 6'b110110);
    assign icode[`I_tnei]=(opcode == 6'b000001) & (rt == 5'b01110);
    assign icode[`I_beql]=(opcode == 6'b010100);
    assign icode[`I_bgezall]=(opcode == 6'b000001) & (rt == 5'b10011);
    assign icode[`I_bgezl]=(opcode == 6'b000001) & (rt == 5'b00011);
    assign icode[`I_bgtzl]=(opcode == 6'b010111) & rt0;
    assign icode[`I_blezl]=(opcode == 6'b010110) & rt0;
    assign icode[`I_bltzall]=(opcode == 6'b000001) & (rt == 5'b10010);
    assign icode[`I_bltzl]=(opcode == 6'b000001) & (rt == 5'b00010);
    assign icode[`I_bnel]=(opcode == 6'b010101);
    assign icode[`I_tlbwr]=(IR == {6'b010000,1'b1,25'b000110});
    assign icode[`I_wait]=(opcode == 6'b010000) & inst[25] & (func == 6'b100000);

    wire[`CNT_INST_EX - 1:0] icode_ex;   //支持FPU的指令，CPU需要识别出
`ifdef FPU_ENABLED
    assign icode_ex[`I_ex_cfc1]=(opcode == 6'b010001) & (rs == 5'b00010) & ~(|IR[10:0]);
    assign icode_ex[`I_ex_ctc1]=(opcode == 6'b010001) & (rs == 5'b00110) & ~(|IR[10:0]);
    assign icode_ex[`I_ex_ldc1]=(opcode == 6'b110101);
    assign icode_ex[`I_ex_lwc1]=(opcode == 6'b110001);
    assign icode_ex[`I_ex_mfc1]=(opcode == 6'b010001) & rs0 & ~(|IR[10:0]);
    assign icode_ex[`I_ex_mtc1]=(opcode == 6'b010001) & (rs == 5'b00100) & ~(|IR[10:0]);
    assign icode_ex[`I_ex_movf]=(opcode == 0) & (IR[17:16] == 0) & (IR[10:0] == 1);
    assign icode_ex[`I_ex_movt]=(opcode == 0) & (IR[17:16] == 1) & (IR[10:0] == 1);
    assign icode_ex[`I_ex_movn]=(opcode == 6'b010001) & (func == 6'b010011);
    assign icode_ex[`I_ex_movz]=(opcode == 6'b010001) & (func == 6'b010010);
    assign icode_ex[`I_ex_sdc1]=(opcode == 6'b111101);
    assign icode_ex[`I_ex_swc1]=(opcode == 6'b111001);
`else
    assign icode_ex=0;
`endif


    wire sc_success=icode[`I_sc] & llbit;
    wire sc_fail=icode[`I_sc] & ~llbit;

    wire cp0inst=icode[`I_cache] | icode[`I_eret] | icode[`I_mfc0] | icode[`I_mtc0] |
        icode[`I_tlbp] | icode[`I_tlbwi] | icode[`I_tlbwr] | icode[`I_tlbr] | icode[`I_wait];

    wire write_rt=icode[`I_addi] | icode[`I_addiu] | icode[`I_slti] | icode[`I_sltiu] |
        icode[`I_andi] | icode[`I_ori] | icode[`I_xori] | icode[`I_lb] | icode[`I_lbu] |
            icode[`I_lh] | icode[`I_lui] | icode[`I_lhu] | icode[`I_lw] | icode[`I_mfc0] |
            icode[`I_ll] | icode[`I_lwl] | icode[`I_lwr] | icode[`I_sc] |
            icode_ex[`I_ex_mfc1] | icode_ex[`I_ex_cfc1];
    
    wire write_rd=icode[`I_add] | icode[`I_addu] | icode[`I_sub] | icode[`I_subu] | icode[`I_slt] |
        icode[`I_sltu] | icode[`I_and] | icode[`I_nor] | icode[`I_or] | icode[`I_xor] |
            icode[`I_sllv] | icode[`I_sll] | icode[`I_srav] | icode[`I_sra] | icode[`I_srlv] |
                icode[`I_srl] | icode[`I_jalr] | icode[`I_mfhi] | icode[`I_mflo] | icode[`I_clo] |
                    icode[`I_clz] | icode[`I_mul] | icode[`I_movn] | icode[`I_movz] |
                    icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt];
    
    wire link_r31=icode[`I_bgezal] | icode[`I_bltzal] | icode[`I_jal] | 
        icode[`I_bgezall] | icode[`I_bltzall];
    assign real_rd=write_rt ? rt : (link_r31 ? 5'd31 : tmp_rd);

    assign iscall=icode[`I_bgezal] | icode[`I_bltzal] | icode[`I_jal] |
        icode[`I_jalr] | icode[`I_bgezall] | icode[`I_bltzall];

    //检测异常
    wire reserved_en=0;//(~(|icode)) & ~(|f);
    wire syscall_en=icode[`I_syscall];
    wire break_en=icode[`I_break];

    assign excode=(|pre_excode) ? pre_excode : ((syscall_en | break_en) ? (syscall_en ? `E_syscall : `E_break) : ((cp0inst & ~cp0_en) ? `E_copunusable0 : `E_noexception));

    //处理futype
    assign futype[`FU_MDU]=(~(|excode)) & (icode[`I_mfc0] | icode[`I_clo] | icode[`I_clz] |
        icode[`I_mfhi] | icode[`I_mflo] | icode[`I_mthi] | icode[`I_mtlo] | icode[`I_mul] |
        icode[`I_mult] | icode[`I_multu] | icode[`I_div] | icode[`I_divu] | icode[`I_madd] |
        icode[`I_maddu] | icode[`I_msub] | icode[`I_msubu] | 
        icode_ex[`I_ex_cfc1] | icode_ex[`I_ex_mfc1] | icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt] | icode_ex[`I_ex_movn] | icode_ex[`I_ex_movz] | icode_ex[`I_ex_mtc1]);
    assign futype[`FU_MU]=(~(|excode)) & (icode[`I_cache] | icode[`I_lb] | icode[`I_lbu] | 
        icode[`I_lh] | icode[`I_lhu] | icode[`I_ll] | icode[`I_lw] | icode[`I_lwl] | icode[`I_lwr] |
        icode[`I_sb] | /*icode[`I_sc]*/sc_success | icode[`I_sh] | icode[`I_sw] | icode[`I_swl] | icode[`I_swr] |
        icode_ex[`I_ex_ldc1] | icode_ex[`I_ex_lwc1] | icode_ex[`I_ex_sdc1] | icode_ex[`I_ex_swc1]);
    assign futype[`FU_ALU]=~(futype[`FU_MDU] | futype[`FU_MU]);

    //处理ctrl信号
    /*assign ctrl[`CTRL_wen]=icode[`I_add] | icode[`I_addi] | icode[`I_addu] | icode[`I_addiu] |
        icode[`I_sub] | icode[`I_subu] | icode[`I_slt] | icode[`I_slti] | icode[`I_sltu] |
            icode[`I_sltiu] | icode[`I_and] | icode[`I_andi] | icode[`I_lui] | icode[`I_nor] |
                icode[`I_or] | icode[`I_ori] | icode[`I_xor] | icode[`I_xori] | icode[`I_sllv] |
                    icode[`I_sll] | icode[`I_srav] | icode[`I_sra] | icode[`I_srlv] | 
                        icode[`I_srl] | icode[`I_bgezal] | icode[`I_bltzal] | icode[`I_jal] |
                            icode[`I_jalr] | icode[`I_mfhi] | icode[`I_mflo] | icode[`I_lb] | icode[`I_lbu] |
                                icode[`I_lh] | icode[`I_lhu] | icode[`I_lw] | icode[`I_mfc0] | icode[`I_clo] | icode[`I_clz] | icode[`I_mul] |
                                        icode[`I_ll] | icode[`I_lwl] | icode[`I_lwr] | icode[`I_bgezall] | icode[`I_bltzall] | icode[`I_movn] | icode[`I_movz];*/

    assign ctrl[`CTRL_wen]=link_r31 | (write_rd & |tmp_rd) | (write_rt & |rt);

    assign ctrl[`CTRL_use_rs]=(icode[`I_add] | icode[`I_addi] | icode[`I_addu] | icode[`I_addiu] |
        icode[`I_sub] | icode[`I_subu] | icode[`I_slt] | icode[`I_slti] | icode[`I_sltu] |
            icode[`I_sltiu] | icode[`I_div] | icode[`I_divu] | icode[`I_mult] | icode[`I_multu] |
                icode[`I_and] | icode[`I_andi] | icode[`I_nor] | icode[`I_or] | icode[`I_ori] | 
                    icode[`I_xor] | icode[`I_xori] | icode[`I_sllv] | icode[`I_srav] | icode[`I_srlv] |
                        icode[`I_beq] | icode[`I_bne] | icode[`I_bgez] | icode[`I_bgtz] | icode[`I_blez] |
                        icode[`I_bltz] | icode[`I_bgezal] | icode[`I_bltzal] | icode[`I_jr] | icode[`I_jalr] |
                        icode[`I_mthi] | icode[`I_mtlo] | icode[`I_lb] | icode[`I_lbu] | icode[`I_lh] | 
                            icode[`I_lhu] | icode[`I_lw] | icode[`I_sb] | icode[`I_sh] | icode[`I_sw] |
                                icode[`I_cache] | icode[`I_clo] | icode[`I_clz] | icode[`I_madd] |
                                    icode[`I_maddu] | icode[`I_msub] | icode[`I_msubu] | icode[`I_mul] |
                                        icode[`I_ll] | icode[`I_lwl] | icode[`I_lwr] | icode[`I_sc] | icode[`I_swl] |
                                            icode[`I_swr] | icode[`I_movn] | icode[`I_movz] | icode[`I_teq] | icode[`I_teqi] |
                                                icode[`I_tge] | icode[`I_tgei] | icode[`I_tgeiu] | icode[`I_tgeu] |
                                                    icode[`I_tlt] | icode[`I_tlti] | icode[`I_tltiu] | icode[`I_tltu] |
                                                        icode[`I_tne] | icode[`I_tnei] | icode[`I_beql] | icode[`I_bgezall] |
                                                        icode[`I_bgezl] | icode[`I_bgtzl] | icode[`I_blezl] | icode[`I_bltzall] |
                                                        icode[`I_bltzl] | icode[`I_bnel] |
        icode_ex[`I_ex_ldc1] | icode_ex[`I_ex_lwc1] | icode_ex[`I_ex_sdc1] | icode_ex[`I_ex_swc1] | icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt]) & ~rs0;
    assign ctrl[`CTRL_use_rt]=(icode[`I_add] | icode[`I_addu] |
        icode[`I_sub] | icode[`I_subu] | icode[`I_slt] | icode[`I_sltu] |
            icode[`I_div] | icode[`I_divu] | icode[`I_mult] | icode[`I_multu] |
                icode[`I_and] | icode[`I_nor] | icode[`I_or] |
                    icode[`I_xor] | icode[`I_sllv] | icode[`I_sll] |
                        icode[`I_srav] | icode[`I_sra] | icode[`I_srlv] | icode[`I_srl] | icode[`I_beq] |
                        icode[`I_bne] | icode[`I_sb] |
                            icode[`I_sh] | icode[`I_sw] | icode[`I_mtc0] | icode[`I_madd] | icode[`I_maddu] |
                                icode[`I_msub] | icode[`I_msubu] | icode[`I_mul] | icode[`I_lwl] | icode[`I_lwr] |
                                    icode[`I_sc] | icode[`I_swl] | icode[`I_swr] | icode[`I_movn] | icode[`I_movz] |
                                        icode[`I_teq] | icode[`I_tge] | icode[`I_tgeu] | icode[`I_tlt] | icode[`I_tltu] |
                                            icode[`I_tne] | icode[`I_beql] | icode[`I_bnel] |
        icode_ex[`I_ex_ctc1] | icode_ex[`I_ex_mtc1] | icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt] | icode_ex[`I_ex_movn] | icode_ex[`I_ex_movz]) & ~rt0;
    assign ctrl[`CTRL_is_b_imm]=icode[`I_addi] | icode[`I_addiu] | icode[`I_slti] |
        icode[`I_sltiu] | icode[`I_andi] | icode[`I_lui] | icode[`I_ori] | icode[`I_xori] |
            icode[`I_teqi] | icode[`I_tgei] | icode[`I_tgeiu] | icode[`I_tlti] | icode[`I_tltiu] | icode[`I_tnei];
    assign ctrl[`CTRL_is_branch]=icode[`I_beq] | icode[`I_bne] | icode[`I_bgez] | icode[`I_bgtz] | icode[`I_blez] | icode[`I_bltz] |
            icode[`I_bgezal] | icode[`I_bltzal] | icode[`I_j] | icode[`I_jal] | icode[`I_jr] | icode[`I_jalr];
    assign ctrl[`CTRL_is_jr]=icode[`I_jr] | icode[`I_jalr];
    assign ctrl[`CTRL_is_j]=icode[`I_j] | icode[`I_jal];
    assign ctrl[`CTRL_checkov]=icode[`I_add] | icode[`I_addi] | icode[`I_sub];
    assign ctrl[`CTRL_use_sa]=icode[`I_sll] | icode[`I_sra] | icode[`I_srl];
    assign ctrl[`CTRL_trap]=icode[`I_teq] | icode[`I_teqi] | icode[`I_tge] | icode[`I_tgei] |
        icode[`I_tgeiu] | icode[`I_tgeu] | icode[`I_tlt] | icode[`I_tlti] | icode[`I_tltiu] |
            icode[`I_tltu] | icode[`I_tne] | icode[`I_tnei];
    assign ctrl[`CTRL_movn]=icode[`I_movn];
    assign ctrl[`CTRL_movz]=icode[`I_movz];
    

    wire icache=icode[`I_cache] & ((inst[20:16] == 5'b00000) | (inst[20:16] == 5'b01000) | (inst[20:16] == 5'b10000));
    wire dcache=icode[`I_cache] & ((inst[20:16] == 5'b00001) | (inst[20:16] == 5'b01001) | (inst[20:16] == 5'b10001) | (inst[20:16] == 5'b10101));

    assign ctrl[`CTRL_likely]=icode[`I_beql] | icode[`I_bgezall] | icode[`I_bgezl] |
        icode[`I_bgtzl] | icode[`I_blezl] | icode[`I_bltzall] | icode[`I_bltzl] |
        icode[`I_bnel];
    assign ctrl[`CTRL_mustflush]=icache | icode[`I_eret] | icode[`I_mtc0] | icode[`I_tlbp] |
        icode[`I_tlbr] | icode[`I_tlbwi] | icode[`I_tlbwr] | icode[`I_wait] | icode[`I_movn] | icode[`I_movz] | ctrl[`CTRL_prederr] | icode[`I_ll] | sc_success |
        icode_ex[`I_ex_ctc1];// | ctrl[`CTRL_likely];
    assign ctrl[`CTRL_wrHi]=icode[`I_mthi] | icode[`I_mult] | icode[`I_multu] | icode[`I_div] |
        icode[`I_divu] | icode[`I_madd] | icode[`I_maddu] | icode[`I_msub] | icode[`I_msubu] | icode[`I_mul];
    assign ctrl[`CTRL_wrLo]=icode[`I_mtlo] | icode[`I_mult] | icode[`I_multu] | icode[`I_div] |
        icode[`I_divu] | icode[`I_madd] | icode[`I_maddu] | icode[`I_msub] | icode[`I_msubu] | icode[`I_mul];
    assign ctrl[`CTRL_load]=icode[`I_lb] | icode[`I_lbu] | icode[`I_lh] | icode[`I_lhu] |
        icode[`I_lw] | icode[`I_ll] | icode[`I_lwl] | icode[`I_lwr] |
        icode_ex[`I_ex_lwc1] | icode_ex[`I_ex_ldc1];
    assign ctrl[`CTRL_store]=icode[`I_sb] | icode[`I_sh] | icode[`I_sw] | 
        icode[`I_sc] | icode[`I_swl] | icode[`I_swr] |
        icode_ex[`I_ex_swc1] | icode_ex[`I_ex_sdc1];
    assign ctrl[`CTRL_is_ret]=icode[`I_jr] & (rs == 31);
    assign ctrl[`CTRL_mtc0]=icode[`I_mtc0];
    assign ctrl[`CTRL_tlbp]=icode[`I_tlbp];
    assign ctrl[`CTRL_icache_hit]=(opcode == 6'b101111) & (rt == 5'b10000);
    assign ctrl[`CTRL_icache_index]=(opcode == 6'b101111) & (rt0 | (rt == 5'b01000));
    assign ctrl[`CTRL_tlbr]=icode[`I_tlbr];
    assign ctrl[`CTRL_tlbwr]=icode[`I_tlbwr];
    assign ctrl[`CTRL_eret]=icode[`I_eret];
    assign ctrl[`CTRL_tlbwi]=icode[`I_tlbwi];
    assign ctrl[`CTRL_cachewb]=(opcode == 6'b101111) & ((rt == 5'b00001) | (rt == 5'b10101));
    
    //Note: 对于FPU转移指令，不要误杀
    wire bc1=(opcode == 6'b010001) & (rs == 5'b01000) & ~IR[17];
    assign ctrl[`CTRL_prederr]=pred & ~(ctrl[`CTRL_is_branch] | ctrl[`CTRL_likely] | bc1);
    
    assign ctrl[`CTRL_ll]=icode[`I_ll];
    assign ctrl[`CTRL_wait]=icode[`I_wait];

    assign ctrl[`CTRL_fpu]=(pre_excode == 0) & (~(icode_ex[`I_ex_cfc1] | icode_ex[`I_ex_ctc1])) & ~(|icode);
    assign ctrl[`CTRL_nocpu]=(pre_excode == 0) & (~(|icode)) & (~(|icode_ex));
    assign ctrl[`CTRL_issue2]=icode_ex[`I_ex_ldc1] | icode_ex[`I_ex_sdc1];
    assign ctrl[`CTRL_waitfpu]=icode_ex[`I_ex_sdc1] | icode_ex[`I_ex_swc1] | icode_ex[`I_ex_mfc1];
    assign ctrl[`CTRL_waitfpubool]=icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt];
    assign ctrl[`CTRL_tofpu]=icode_ex[`I_ex_mtc1] | icode_ex[`I_ex_ldc1] | icode_ex[`I_ex_lwc1] | icode_ex[`I_ex_movn] | icode_ex[`I_ex_movz];
    assign ctrl[`CTRL_ctc1]=icode_ex[`I_ex_ctc1];

    //处理MDUOP
    assign mduop[`MDUOP_mfhi]=icode[`I_mfhi];
    assign mduop[`MDUOP_mflo]=icode[`I_mflo];
    assign mduop[`MDUOP_mthi]=icode[`I_mthi];
    assign mduop[`MDUOP_mtlo]=icode[`I_mtlo];
    assign mduop[`MDUOP_mul]=icode[`I_mul] | icode[`I_mult] | icode[`I_multu] |
        icode[`I_madd] | icode[`I_maddu] | icode[`I_msub] | icode[`I_msubu];
    assign mduop[`MDUOP_div]=icode[`I_div] | icode[`I_divu];
    assign mduop[`MDUOP_addHiLo]=icode[`I_madd] | icode[`I_maddu];
    assign mduop[`MDUOP_subHiLo]=icode[`I_msub] | icode[`I_msubu];
    assign mduop[`MDUOP_signed]=icode[`I_mul] | icode[`I_mult] | icode[`I_madd] | icode[`I_msub] | icode[`I_div];
    assign mduop[`MDUOP_mfc0]=icode[`I_mfc0];
    assign mduop[`MDUOP_clo]=icode[`I_clo];
    assign mduop[`MDUOP_clz]=icode[`I_clz];
    assign mduop[`MDUOP_wb]=icode[`I_clo] | icode[`I_clz] | icode[`I_mfc0] | icode[`I_mul] | icode[`I_mfhi] | icode[`I_mflo] | icode_ex[`I_ex_mfc1] | icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt] | icode_ex[`I_ex_cfc1];
    assign mduop[`MDUOP_cfc1]=icode_ex[`I_ex_cfc1];
    assign mduop[`MDUOP_mfc1]=icode_ex[`I_ex_mfc1];
    assign mduop[`MDUOP_movt]=icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt];

    //处理ALUOP

    wire useb_en=icode[`I_mtc0] | icode_ex[`I_ex_ctc1];
    wire add_en=icode[`I_add] | icode[`I_addi] | icode[`I_addiu] | icode[`I_addu];
    wire sub_en=icode[`I_sub] | icode[`I_subu];
    wire slt_en=icode[`I_slt] | icode[`I_slti];
    wire sltu_en=icode[`I_sltu] | icode[`I_sltiu];
    wire and_en=icode[`I_and] | icode[`I_andi];
    wire lui_en=icode[`I_lui];
    wire nor_en=icode[`I_nor];
    wire or_en=icode[`I_or] | icode[`I_ori];
    wire xor_en=icode[`I_xor] | icode[`I_xori];
    wire shl_en=icode[`I_sll] | icode[`I_sllv];
    wire shr_en=icode[`I_srl] | icode[`I_srlv];
    wire sar_en=icode[`I_sra] | icode[`I_srav];
    wire usea_en=icode[`I_movn] | icode[`I_movz];
    wire link_en=iscall;

    assign aluop=(useb_en | add_en | sub_en | slt_en | sltu_en | and_en | lui_en) ?
        ((slt_en | sltu_en | and_en | lui_en) ? ((slt_en | sltu_en) ? (slt_en ? `ALUOP_slt : `ALUOP_sltu) : (and_en ? `ALUOP_and : `ALUOP_lui)) :
            (useb_en ? `ALUOP_useB : (sub_en ? `ALUOP_sub : `ALUOP_add))) :
        ((nor_en | or_en | xor_en | shl_en) ? ((nor_en | or_en) ? (nor_en ? `ALUOP_nor : `ALUOP_or) : (xor_en ? `ALUOP_xor : `ALUOP_shl)) :
            (shr_en ? `ALUOP_shr : (sar_en ? `ALUOP_sar : (usea_en ? `ALUOP_useA : (link_en ? `ALUOP_link : `ALUOP_zero)))));

    //处理CMPOP（仅分支指令/trap）
    wire true_en=icode[`I_j] | icode[`I_jr] | icode[`I_jal] | icode[`I_jalr];
    wire ne_en=icode[`I_bne] | icode[`I_tne] | icode[`I_tnei] | icode[`I_bnel];
    wire gez_en=icode[`I_bgez] | icode[`I_bgezal] | icode[`I_bgezl] | icode[`I_bgezall];  //
    wire gtz_en=icode[`I_bgtz] | icode[`I_bgtzl]; //
    wire lez_en=icode[`I_blez] | icode[`I_blezl]; //
    wire ltz_en=icode[`I_bltz] | icode[`I_bltzal] | icode[`I_bltzl] | icode[`I_bltzall];  //
    wire geu_en=icode[`I_tgeu] | icode[`I_tgeiu];
    wire ltu_en=icode[`I_tltu] | icode[`I_tltiu];
    wire ge_en=icode[`I_tge] | icode[`I_tgei];
    wire lt_en=icode[`I_tlt] | icode[`I_tlti];
    wire eq_en=icode[`I_beq] | icode[`I_teq] | icode[`I_teqi] | icode[`I_beql];  //
    
    assign cmpop=(gez_en | gtz_en | lez_en | ltz_en | eq_en) ? 
        ((gez_en | gtz_en) ? (gez_en ? `CMP_gez : `CMP_gtz) : (lez_en ? `CMP_lez : (ltz_en ? `CMP_ltz : `CMP_eq))) :
        ((ge_en | lt_en | ne_en) ? (ge_en ? `CMP_ge : (lt_en ? `CMP_lt : `CMP_ne)) :
            (geu_en ? `CMP_geu : (ltu_en ? `CMP_ltu : `CMP_true)));
    
    //处理MUOP
    wire cacheindex_en=(opcode == 6'b101111) & ((rt == 5'b00001) | (rt == 5'b01001));
    wire cachehit_en=(opcode == 6'b101111) & ((rt == 5'b10001) | (rt == 5'b10101));
    wire calcaddr_en=(opcode == 6'b101111) & (rt0 | (rt == 5'b01000) | (rt == 5'b10000));

    assign muop=(icode[`I_sb] | icode[`I_sh] | icode[`I_sw] | icode_ex[`I_ex_swc1] | icode_ex[`I_ex_sdc1] | icode[`I_sc] | icode[`I_swl] | icode[`I_swr] | icode[`I_lb] | icode[`I_lbu]) ?
        ((icode[`I_sb] | icode[`I_sh] | icode[`I_sw] | icode_ex[`I_ex_swc1] | icode_ex[`I_ex_sdc1] | icode[`I_sc] | icode[`I_swl]) ? ((icode[`I_sb] | icode[`I_sh]) ? (icode[`I_sb] ? `MUOP_sb : `MUOP_sh) : (icode[`I_swl] ? `MUOP_swl : `MUOP_sw)) :
            (icode[`I_swr] ? `MUOP_swr : (icode[`I_lb] ? `MUOP_lb : `MUOP_lbu))) :
        ((icode[`I_lh] | icode[`I_lhu] | icode[`I_lw] | icode_ex[`I_ex_lwc1] | icode_ex[`I_ex_ldc1] | icode[`I_ll] | icode[`I_lwl]) ? ((icode[`I_lh] | icode[`I_lhu]) ? (icode[`I_lh] ? `MUOP_lh : `MUOP_lhu) : (icode[`I_lwl] ? `MUOP_lwl : `MUOP_lw)) :
            ((icode[`I_lwr] | cacheindex_en) ? (icode[`I_lwr] ? `MUOP_lwr : `MUOP_cacheindex) : (cachehit_en ? `MUOP_cachehit : `MUOP_calcaddr)));
    
    assign real_rt=(icode_ex[`I_ex_movf] | icode_ex[`I_ex_movt]) ? tmp_rd : rt;
    


endmodule