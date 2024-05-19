// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    作为FU的ALU模块，包括Issue/Execute和Execute/WriteBack流水线寄存器和旁路处理
*/

module fu_alu(
    input           clk,
    input           resetn,
    //来自Commit
    input           flush,
    //来自保留站的组合逻辑输入（数据经过了旁路处理）
    input                               sel_valid,              //保留站是否非空
    input[31:0]                         sel_PC,                 //仅ALU需要
    input[31:0]                         sel_inst,
    input[$clog2(`CNT_ALUOP) - 1:0]     sel_aluop,
    input[`CNT_CTRL - 1:0]              sel_ctrl,
    input[$clog2(`CNT_CMP) - 1:0]       sel_cmpop,
    input[$clog2(`CNT_EXCEPTION) - 1:0] sel_excode,
    input                               sel_predict,
    input[31:0]                         sel_predict_target,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_rsnum,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_rtnum,
    input[31:0]                         sel_rsval,              //自动与ALU的WB旁路处理
    input[31:0]                         sel_rtval,
    input                               sel_rsval_ready,        //经过第一次旁路后是否ready
    input                               sel_rtval_ready,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_destnum,
    //来自另一个ALU的旁路输入（两条旁路，一条是自己的WB）
    input           bypass_en,
    input[$clog2(`ROB_SIZE) - 1:0]  bypass_num,
    input[31:0]     bypass_data,
    //来自MU的旁路输入
    input           mu_bypass_en,
    input[$clog2(`ROB_SIZE) - 1:0]  mu_bypass_num,
    input[31:0]     mu_bypass_data,
    //Execute/WriteBack流水线寄存器输出（如果可以的话可以冗余）
    output reg      alu_wb_valid,       //相当于ROB的写使能
    (* dont_touch = "true" *) output reg      alu_wb_wen,         //相当于GPR的写使能，用于旁路及唤醒
    (* dont_touch = "true" *) output reg      alu_wb_wen1,         //相当于GPR的写使能，用于旁路及唤醒
    (* dont_touch = "true" *) output reg[$clog2(`ROB_SIZE) - 1:0] alu_wb_num,
    (* dont_touch = "true" *) output reg[$clog2(`ROB_SIZE) - 1:0] alu_wb_num1,
    output reg[31:0]    alu_wb_result,
    output reg[`WIDTH_other - 1:0]  alu_wb_result_other,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    alu_wb_excode,
    //由Issue/Ex提供给station的提前唤醒信号
    output                               alu_execute_wakeup_en,
    output[$clog2(`ROB_SIZE) - 1:0]      alu_execute_wakeup_num
    );

    reg[31:0] isex_PC;
    reg[31:0] isex_rsval;
    reg[31:0] isex_rtval;
    reg[31:0] isex_inst;
    reg[$clog2(`CNT_ALUOP) - 1:0] isex_aluop;
    reg[`CNT_CTRL - 1:0] isex_ctrl;
    reg[$clog2(`CNT_CMP) - 1:0] isex_cmpop;
    reg isex_predict;
    reg[31:0] isex_predict_target;
    reg[$clog2(`CNT_EXCEPTION) - 1:0] isex_excode;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_rsnum;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_rtnum;
    reg isex_rsready;
    reg isex_rtready;
    reg isex_valid;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_destnum;
    
    assign alu_execute_wakeup_en=isex_valid & isex_ctrl[`CTRL_wen];
    assign alu_execute_wakeup_num=isex_destnum;

    always@(posedge clk) begin
        if(~resetn) begin
            isex_PC<=0;
            isex_rsval<=0;
            isex_rtval<=0;
            isex_inst<=0;
            isex_aluop<=0;
            isex_ctrl<=0;
            isex_cmpop<=0;
            isex_predict<=0;
            isex_predict_target<=0;
            isex_excode<=0;
            isex_rsnum<=0;
            isex_rtnum<=0;
            isex_rsready<=0;
            isex_rtready<=0;
            isex_valid<=0;
            isex_destnum<=0;
        end
        else begin
            //任何时刻永远接受输入
            isex_valid<=sel_valid & ~flush;
            isex_PC<=sel_PC;
            isex_rsval<=sel_rsval;
            isex_rtval<=sel_rtval;
            isex_inst<=sel_inst;
            isex_aluop<=sel_aluop;
            isex_ctrl<=sel_ctrl;
            isex_cmpop<=sel_cmpop;
            isex_predict<=sel_predict;
            isex_predict_target<=sel_predict_target;
            isex_excode<=sel_excode;
            isex_rsnum<=sel_rsnum;
            isex_rtnum<=sel_rtnum;
            isex_rsready<=sel_rsval_ready;
            isex_rtready<=sel_rtval_ready;
            isex_destnum<=sel_destnum;
        end
    end

    //处理二级旁路
    wire[31:0] val_rs=isex_rsready ? isex_rsval : ((alu_wb_wen & (alu_wb_num == isex_rsnum)) ? alu_wb_result : ((mu_bypass_en & (mu_bypass_num == isex_rsnum)) ? mu_bypass_data : bypass_data));
    wire[31:0] val_rt=isex_rtready ? isex_rtval : ((alu_wb_wen & (alu_wb_num == isex_rtnum)) ? alu_wb_result : ((mu_bypass_en & (mu_bypass_num == isex_rtnum)) ? mu_bypass_data : bypass_data));

    wire[31:0] alu_result;
    wire alu_wen;
    wire[`WIDTH_other - 1:0] alu_result_other;
    wire[$clog2(`CNT_EXCEPTION) - 1:0] excode;

    alu myalu(.PC(isex_PC),.val_rs(val_rs),.val_rt(val_rt),.inst(isex_inst),
        .aluop(isex_aluop),.ctrl(isex_ctrl),.cmpop(isex_cmpop),.predict(isex_predict),
        .predict_target(isex_predict_target),.pre_excode(isex_excode),
        .alu_result(alu_result),.alu_wen(alu_wen),.alu_result_other(alu_result_other),
        .excode(excode));
    
    always@(posedge clk) begin
        if(~resetn) begin
            alu_wb_valid<=0;
            alu_wb_excode<=0;
            alu_wb_num<=0;
            alu_wb_num1<=0;
            alu_wb_result<=0;
            alu_wb_result_other<=0;
            alu_wb_wen<=0;
            alu_wb_wen1<=0;
        end
        else begin
            alu_wb_valid<=isex_valid & ~flush;
            alu_wb_excode<=excode;
            alu_wb_num<=isex_destnum;
            alu_wb_num1<=isex_destnum;
            alu_wb_result<=alu_result;
            alu_wb_result_other<=alu_result_other;
            alu_wb_wen<=isex_valid & alu_wen & ~flush;  //wen必须和valid保持一致
            alu_wb_wen1<=isex_valid & alu_wen & ~flush;  //wen必须和valid保持一致
        end
    end

endmodule