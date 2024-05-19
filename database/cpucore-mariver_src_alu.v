// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    ALU模块（组合逻辑），注意，并不进行旁路处理
*/

module alu(
    input[31:0]         PC,         //指令地址
    input[31:0]         val_rs,     //rs真正的值（如果用到的话）
    input[31:0]         val_rt,     //rt真正的值
    input[31:0]         inst,       //指令字
    input[$clog2(`CNT_ALUOP) - 1:0] aluop,  //操作码
    input[`CNT_CTRL - 1:0]  ctrl,   //杂项控制信号
    input[$clog2(`CNT_CMP) - 1:0] cmpop,    //cmp操作码
    input               predict,    //指令是否预测转移
    input[31:0]         predict_target, //若指令预测转移则目标
    input[$clog2(`CNT_EXCEPTION) - 1:0] pre_excode,     //可能在decode前检出的异常，此时直接将指令流出，啥都不干
    output[31:0]        alu_result, //真正的结果
    output              alu_wen,    //是否真的要将结果写回
    output[`WIDTH_other - 1:0]      alu_result_other,   //其它结果
    output[$clog2(`CNT_EXCEPTION) - 1:0]    excode      //【由ALU得出的】异常码
    );

    //Note: 对于一切分支指令，other[31:0]=target，other[32]指示是否转移，other[33]指示是否失败，other[34]指示是否因target失败
    //对于movn/movz，other[32]指示是否写回

    wire[31:0] real_A=val_rs;
    //注意，这里的B适用于大部分情况下使用符号扩展的imm时
    wire[31:0] real_B=ctrl[`CTRL_is_b_imm] ? {{16{inst[15]}},inst[15:0]} : val_rt;
    //这个B仅适用于0扩展imm的位运算
    wire[31:0] real_B_zx=ctrl[`CTRL_is_b_imm] ? {16'b0,inst[15:0]} : val_rt;
    wire signed[31:0] sA=real_A;
    wire signed[31:0] sB=real_B;    //带符号运算
    wire signed[31:0] srt=val_rt;
    wire[4:0] real_sa=ctrl[`CTRL_use_sa] ? inst[10:6] : val_rs[4:0];

    reg cmp_result;
    always@(*) begin                //fXXk the rules!
        case(cmpop)
        `CMP_true:  cmp_result=1;
        `CMP_eq:    cmp_result=(real_A == real_B);
        `CMP_ge:    cmp_result=(sA >= sB);
        `CMP_geu:   cmp_result=(real_A >= real_B);
        `CMP_gez:   cmp_result=~real_A[31];
        `CMP_gtz:   cmp_result=(|real_A) & ~real_A[31];
        `CMP_lez:   cmp_result=real_A[31] | ~(|real_A);
        `CMP_lt:    cmp_result=(sA < sB);
        `CMP_ltu:   cmp_result=(real_A < real_B);
        `CMP_ltz:   cmp_result=real_A[31];
        `CMP_ne:    cmp_result=(real_A != real_B);
        default:    cmp_result=1;
        endcase
    end

    

    wire[32:0] add33={real_A[31],real_A} + {real_B[31],real_B};
    wire[32:0] sub33={real_A[31],real_A} - {real_B[31],real_B};
    reg[31:0] result;
    assign alu_result=result;
    always@(*) begin
        case(aluop)
        `ALUOP_add:     result=add33[31:0];
        `ALUOP_and:     result=real_A & real_B_zx;
        `ALUOP_link:    result=PC + 8;
        `ALUOP_lui:     result={inst[15:0],16'b0};
        `ALUOP_nor:     result=~(real_A | real_B_zx);
        `ALUOP_or:      result=real_A | real_B_zx;
        `ALUOP_sar:     result=srt >>> real_sa;
        `ALUOP_shl:     result=val_rt << real_sa;
        `ALUOP_shr:     result=val_rt >> real_sa;
        `ALUOP_slt:     result=(sA < sB) ? 32'b1 : 32'b0;
        `ALUOP_sltu:    result=(real_A < real_B) ? 32'b1 : 32'b0;
        `ALUOP_sub:     result=sub33[31:0];
        `ALUOP_useA:    result=real_A;
        `ALUOP_useB:    result=real_B;
        `ALUOP_xor:     result=real_A ^ real_B_zx;
        default:        result=0;
        endcase
    end

    //处理分支指令
    wire[31:0] NPC=PC + 4;
    wire[31:0] target=ctrl[`CTRL_is_jr] ? val_rs : (ctrl[`CTRL_is_j] ? {NPC[31:28],inst[25:0],2'b00} : (NPC + {{14{inst[15]}},inst[15:0],2'b00}));
    assign alu_result_other[31:0]=target;
    assign alu_result_other[32]=(ctrl[`CTRL_movn] | ctrl[`CTRL_movz]) ? (ctrl[`CTRL_movn] ? (|real_B) : (~(|real_B))) : cmp_result;
    assign alu_result_other[33]=(cmp_result ^ predict) | ((target != predict_target) & predict);
    assign alu_result_other[34]=predict & (target != predict_target);
    assign alu_result_other[`WIDTH_other - 1:35]=0;

    //处理异常（trap/overflow）
    wire trap_en=ctrl[`CTRL_trap] & cmp_result;
    wire overflow_en=
        (ctrl[`CTRL_checkov] & (aluop == `ALUOP_add) & (add33[32] ^ add33[31])) |
        (ctrl[`CTRL_checkov] & (aluop == `ALUOP_sub) & (sub33[32] ^ sub33[31]));
    assign excode=overflow_en ? `E_overflow : (trap_en ? `E_trap : pre_excode);

    assign alu_wen=ctrl[`CTRL_wen];

endmodule