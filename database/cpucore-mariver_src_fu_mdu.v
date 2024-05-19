// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    作为FU的MDU模块，包括Issue/Execute和Execute/WriteBack流水线寄存器和旁路处理
    Upd at 6.24: 令其处理cfc1、mtc1、movf/t指令
*/

module fu_mdu(
    input           clk,
    input           resetn,
    //来自Commit
    input           flush,
    input[31:0]     flush_Hi,       //flush时被重置的Hi
    input[31:0]     flush_Lo,       //flush时被重置的Lo
    //反馈信号
    output          mdu_busy,
    //来自保留站的组合逻辑输入（不需要旁路）
    input                               sel_valid,
    input[`CNT_MDUOP - 1:0]             sel_mduop,
    input[31:0]                         sel_rsval,               //无需WB旁路处理
    input[31:0]                         sel_rtval,
    input[5:0]                          sel_cp0addr,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_destnum,
    //来自FPU的数据
    input[31:0]     fromfpu_data,
    input           fromfpu_bool,
    //CP0读端口
    output[5:0]                         cp0_raddr,
    input[31:0]                         cp0_rdata,
    //CP1读端口
    output[4:0]     cp1_raddr,
    input[31:0]     cp1_rdata,
    //对于mfhi/mflo输出到ALU的旁路
    output                              mdu_wakeup_en,
    output[$clog2(`ROB_SIZE) - 1:0]     mdu_wakeup_num,
    output[31:0]                        mdu_wakeup_data,
    //Execute/WriteBack流水线寄存器输出
    output reg                          mdu_wb_valid,
    output reg                          mdu_wb_wen,
    output reg[$clog2(`ROB_SIZE) - 1:0] mdu_wb_num,
    output reg[31:0]                    mdu_wb_result,
    output reg[31:0]                    mdu_wb_result_other
    );

    //临时的Hi/Lo
    reg[31:0] Hi,Lo;

    //Issue/Ex流水线寄存器
    reg isex_valid;
    reg[`CNT_MDUOP - 1:0] isex_mduop;
    reg[31:0] isex_rsval;
    reg[31:0] isex_rtval;
    reg[5:0] isex_cp0addr;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_destnum;

    reg[31:0] isex_fromfpu_data;
    reg isex_fromfpu_bool;

    assign mdu_wakeup_en=isex_valid & (isex_mduop[`MDUOP_mfhi] | isex_mduop[`MDUOP_mflo]);
    assign mdu_wakeup_num=isex_destnum;
    assign mdu_wakeup_data=isex_mduop[`MDUOP_mfhi] ? Hi : Lo;

    assign cp0_raddr=isex_cp0addr;
    assign cp1_raddr=isex_cp0addr[4:0];

    always@(posedge clk) begin
        if(~resetn) begin
            isex_valid<=0;
            isex_mduop<=0;
            isex_rsval<=0;
            isex_rtval<=0;
            isex_cp0addr<=0;
            isex_destnum<=0;
            isex_fromfpu_bool<=0;
            isex_fromfpu_data<=0;
        end
        else begin
            if(flush | mdu_busy)
                isex_valid<=0;
            else
                isex_valid<=sel_valid;
            isex_cp0addr<=sel_cp0addr;
            isex_destnum<=sel_destnum;
            isex_rsval<=sel_rsval;
            isex_rtval<=sel_rtval;
            isex_mduop<=sel_mduop;
            isex_fromfpu_bool<=fromfpu_bool;
            isex_fromfpu_data<=fromfpu_data;
        end
    end

    //乘法和clo/clz共用的3段流水线中间寄存器
    reg stage0_valid;
    reg[`CNT_MDUOP - 1:0] stage0_mduop;
    reg[31:0] stage0_rsval;
    reg[5:0] stage0_clo_tot;    //clo已经数的bit个数
    reg stage0_clo_cont;        //clo过程是否可以继续
    reg[$clog2(`ROB_SIZE) - 1:0] stage0_destnum;

    reg stage1_valid;
    reg[`CNT_MDUOP - 1:0] stage1_mduop;
    reg[31:0] stage1_rsval;
    reg[5:0] stage1_clo_tot;    //clo已经数的bit个数
    reg stage1_clo_cont;        //clo过程是否可以继续
    reg[$clog2(`ROB_SIZE) - 1:0] stage1_destnum;

    reg[$clog2(`ROB_SIZE) - 1:0] div_destnum;   //保存除法的destnum

    //对于madd/msub，多执行一拍
    reg stage2_valid;
    reg[`CNT_MDUOP - 1:0] stage2_mduop;
    reg[63:0] stage2_result;
    reg[$clog2(`ROB_SIZE) - 1:0] stage2_destnum;
    
    wire div_busy,div_done;
    wire[31:0] div_q,div_rem;
    wire[63:0] mul_result;

    assign mdu_busy=div_busy | stage0_valid | (stage1_valid & (stage1_mduop[`MDUOP_addHiLo] | stage1_mduop[`MDUOP_subHiLo])) | (isex_valid & (isex_mduop[`MDUOP_clo] | isex_mduop[`MDUOP_clz] | isex_mduop[`MDUOP_div] | isex_mduop[`MDUOP_mul]));

    div mydiv(.clk(clk),.resetn(resetn),.flush(flush),.A(isex_rsval),.B(isex_rtval),
        .signed_en(isex_mduop[`MDUOP_signed]),.start(isex_valid & isex_mduop[`MDUOP_div]),
            .busy(div_busy),.done(div_done),.q(div_q),.rem(div_rem));
    mul mymul(.clk(clk),.resetn(resetn),.A(isex_rsval),.B(isex_rtval),
        .signed_en(isex_mduop[`MDUOP_signed]),.result(mul_result));
    
    wire[31:0] stage0_in=isex_mduop[`MDUOP_clz] ? (~isex_rsval) : isex_rsval;
    wire[5:0] stage0_cnt=(&stage0_in[31:24]) ? 8 : 
        ((&stage0_in[31:28]) ? ((&stage0_in[27:26]) ? (stage0_in[25] ? 7 : 6) : (stage0_in[27] ? 5 : 4)) :
            ((&stage0_in[31:30]) ? (stage0_in[29] ? 3 : 2) : (stage0_in[31] ? 1 : 0)));
    
    always@(posedge clk) begin
        if(~resetn) begin
            stage0_valid<=0;
            stage0_mduop<=0;
            stage0_rsval<=0;
            stage0_clo_tot<=0;
            stage0_clo_cont<=0;
            stage0_destnum<=0;
        end
        else begin
            if(flush)
                stage0_valid<=0;
            else
                stage0_valid<=isex_valid & (isex_mduop[`MDUOP_clo] | isex_mduop[`MDUOP_clz] | isex_mduop[`MDUOP_mul]);
            stage0_destnum<=isex_destnum;
            stage0_mduop<=isex_mduop;
            stage0_rsval<=stage0_in;
            stage0_clo_tot<=stage0_cnt;
            stage0_clo_cont<=&stage0_in[31:24];
        end
    end

    wire[5:0] stage1_cnt=(&stage0_rsval[23:8]) ? 16 : ((&stage0_rsval[23:16]) ?
        ((&stage0_rsval[15:12]) ? ((&stage0_rsval[11:10]) ? (stage0_rsval[9] ? 15 : 14) : (stage0_rsval[11] ? 13 : 12)) : ((&stage0_rsval[15:14]) ? (stage0_rsval[13] ? 11 : 10) : (stage0_rsval[15] ? 9 : 8))) :
        ((&stage0_rsval[23:20]) ? ((&stage0_rsval[19:18]) ? (stage0_rsval[17] ? 7 : 6) : (stage0_rsval[19] ? 5 : 4)) : ((&stage0_rsval[23:22]) ? (stage0_rsval[21] ? 3 : 2) : (stage0_rsval[23] ? 1 : 0))));
    always@(posedge clk) begin
        if(~resetn) begin
            stage1_valid<=0;
            stage1_mduop<=0;
            stage1_rsval<=0;
            stage1_clo_tot<=0;
            stage1_clo_cont<=0;
            stage1_destnum<=0;
        end
        else begin
            if(flush)
                stage1_valid<=0;
            else
                stage1_valid<=stage0_valid;
            stage1_mduop<=stage0_mduop;
            stage1_rsval<=stage0_rsval;
            stage1_destnum<=stage0_destnum;
            stage1_clo_tot<=stage0_clo_cont ? (stage0_clo_tot + stage1_cnt) : stage0_clo_tot;
            stage1_clo_cont<=stage0_clo_cont & &stage0_rsval[23:8];
        end
    end

    wire[5:0] stage2_cnt=(&stage1_rsval[7:0]) ? 8 : ((&stage1_rsval[7:4]) ?
        ((&stage1_rsval[3:2]) ? (stage1_rsval[1] ? 7 : 6) : (stage1_rsval[3] ? 5 : 4)) :
        ((&stage1_rsval[7:6]) ? (stage1_rsval[5] ? 3 : 2) : (stage1_rsval[7] ? 1 : 0)));
    wire[31:0] clo_result={26'b0,stage1_clo_cont ? (stage2_cnt + stage1_clo_tot) : stage1_clo_tot};
    
    always@(posedge clk) begin
        if(~resetn) begin
            stage2_mduop<=0;
            stage2_valid<=0;
            stage2_result<=0;
            stage2_destnum<=0;
        end
        else begin
            if(flush)
                stage2_valid<=0;
            else
                stage2_valid<=stage1_valid & (stage1_mduop[`MDUOP_addHiLo] | stage1_mduop[`MDUOP_subHiLo]);
            stage2_result<=mul_result;
            stage2_mduop<=stage1_mduop;
            stage2_destnum<=stage1_destnum;
        end
    end

    wire[63:0] stage2_HiLo=stage2_mduop[`MDUOP_addHiLo] ? ({Hi,Lo} + stage2_result) : ({Hi,Lo} - stage2_result);

    always@(posedge clk) begin
        if(~resetn) begin
            mdu_wb_valid<=0;
            mdu_wb_wen<=0;
            mdu_wb_num<=0;
            mdu_wb_result<=0;
            mdu_wb_result_other<=0;
            div_destnum<=0;
        end
        else begin
            if(flush)
                mdu_wb_valid<=0;
            else
                mdu_wb_valid<=(stage1_valid & ~(stage1_mduop[`MDUOP_addHiLo] | stage1_mduop[`MDUOP_subHiLo])) | stage2_valid | div_done | (isex_valid & (~(isex_mduop[`MDUOP_mul] | isex_mduop[`MDUOP_div] | isex_mduop[`MDUOP_clo] | isex_mduop[`MDUOP_clz])/*isex_mduop[`MDUOP_mfc0] | isex_mduop[`MDUOP_mfhi] | isex_mduop[`MDUOP_mflo] | isex_mduop[`MDUOP_mthi] | isex_mduop[`MDUOP_mtlo] | isex_mduop[`MDUOP_mfc1] | isex_mduop[`MDUOP_cfc1] | isex_mduop[`MDUOP_movt]*/));
            if(isex_valid & isex_mduop[`MDUOP_div])
                div_destnum<=isex_destnum;

            mdu_wb_wen<=(stage1_valid & stage1_mduop[`MDUOP_wb]) | (isex_valid & isex_mduop[`MDUOP_wb] & ~(isex_mduop[`MDUOP_clo] | isex_mduop[`MDUOP_clz] | isex_mduop[`MDUOP_mul]));

            mdu_wb_num<=(div_done | stage2_valid) ? (div_done ? div_destnum : stage2_destnum) : (stage1_valid ? stage1_destnum : isex_destnum);
            mdu_wb_result_other<=(div_done | (isex_valid & isex_mduop[`MDUOP_mthi])) ? (div_done ? div_rem : isex_rsval) : (stage2_valid ? stage2_HiLo[63:32] : mul_result[63:32]);
            //结果低32位的几个来源：cp0读端口、Hi/Lo、rsval、clo结果、mul结果、div结果、cp1读端口、rs/rt、fpudata
            mdu_wb_result<=isex_valid ? ((isex_mduop[`MDUOP_mfhi] | isex_mduop[`MDUOP_mflo]) ? (isex_mduop[`MDUOP_mfhi] ? Hi : Lo) : ((isex_mduop[`MDUOP_mfc0] | isex_mduop[`MDUOP_cfc1]) ? (isex_mduop[`MDUOP_mfc0] ? cp0_rdata : cp1_rdata) : ((isex_mduop[`MDUOP_mfc1] | (isex_mduop[`MDUOP_movt] & ~isex_fromfpu_bool)) ? (isex_mduop[`MDUOP_mfc1] ? isex_fromfpu_data : isex_rtval) :isex_rsval))) :
                ((div_done | (stage1_valid & ~stage1_mduop[`MDUOP_mul])) ? (div_done ? div_q : clo_result) : (stage2_valid ? stage2_HiLo[31:0] : mul_result[31:0]));
        end
    end

    always@(posedge clk) begin
        if(~resetn) begin
            Hi<=0;
            Lo<=0;
        end
        else begin
            if(flush | div_done | (stage1_valid & stage1_mduop[`MDUOP_mul] & ~(stage1_mduop[`MDUOP_addHiLo] | stage1_mduop[`MDUOP_subHiLo])) | (isex_valid & isex_mduop[`MDUOP_mthi]) | stage2_valid)
                Hi<=flush ? flush_Hi : (div_done ? div_rem : ((stage1_valid | stage2_valid) ? (stage1_valid ? mul_result[63:32] : stage2_HiLo[63:32]) : isex_rsval));
            if(flush | div_done | (stage1_valid & stage1_mduop[`MDUOP_mul] & ~(stage1_mduop[`MDUOP_addHiLo] | stage1_mduop[`MDUOP_subHiLo])) | (isex_valid & isex_mduop[`MDUOP_mtlo]) | stage2_valid)
                Lo<=flush ? flush_Lo : (div_done ? div_q : ((stage1_valid | stage2_valid) ? (stage1_valid ? mul_result[31:0] : stage2_HiLo[31:0]) : isex_rsval));
        end
    end


endmodule