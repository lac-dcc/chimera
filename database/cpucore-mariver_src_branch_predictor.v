// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    分支预测器（BTB/BPB/RAS/target确信位）
    Upd at 2023.3.29: 将预测策略由暴力2位BPB改为在每个BTB位置上维护9位局部历史，仅在Commit时进行两拍流水式修改
        preFetch段查询时直接查结果，结果在Commit时生成，这样是比较合理的。RAS的策略不受影响。
*/

module branch_predictor(
    input           clk,
    input           resetn,
    //预测器读端口
    input           predict_rden,           //读使能，用于ret修改RAS，当preFetch被阻塞时为0
    input[31:0]     PC0,
    input[31:0]     PC1,
    input           PC1_valid,              //指令1地址是否有效
    output          predict_jump,           //是否预测转移（显然只会有一条指令）
    output[31:0]    predict_jump_target,    //预测转移目标
    output          predict_isinst1,        //若预测转移，是否为地址1预测的
    output[31:0]    predict_target0,        //指令0的预测地址（不管是不是）
    output[31:0]    predict_target1,
    //RAS读写端口（predict读端口若为ret指令则自动修改RAS）
    output[63:0]    RAS_old,                //这个周期修改前，旧的RAS，直接同时赋给两条指令
    input           RAS_flush,              //清空RAS（当ret的目标错误时），优先级最高
    input           RAS_reset_en,           //来自Commit的重置RAS，优先级次之
    input[63:0]     RAS_reset_data,         //来自Commit的重置RAS
    input           RAS_push_en,            //来自Decode的call指令的push RAS，优先级最低
    input[63:0]     RAS_push_data,          //来自Decode的call指令的push RAS（整个64位字）
    //预测器写端口（来自Commit，一个周期显然至多一个branch指令，只有一个端口）
    input           wr_en,                  //写使能
    input[31:0]     wr_PC,                  //分支指令地址
    input[31:0]     wr_target,              //分支指令若真的成功跳转的目标（无论是不是真的跳转）
    input           wr_isret,               //是否为ret指令
    input           wr_isjump               //是否真的跳转
    );

    wire[31:0] real_PC0={PC0[31:24],PC0[23:0] ^ PC0[31:8]};
    wire[31:0] real_PC1={PC1[31:24],PC1[23:0] ^ PC1[31:8]};
    wire[31:0] real_wr_PC={wr_PC[31:24],wr_PC[23:0] ^ wr_PC[31:8]};
    
    reg[63:0] global_RAS;   //全局RAS栈
    reg global_BPB0[0:`History_SIZE - 1];
    reg global_BPB1[0:`History_SIZE - 1];       //对于局部历史轨迹维护的全局表
    reg global_BPB1_1[0:`History_SIZE - 1];       //对于局部历史轨迹维护的全局表
    
    reg[$clog2(`History_SIZE) - 1:0] BTB_history[0:`BTB_SIZE - 1];  //局部历史

    reg[14:0] BTB[0:`BTB_SIZE - 1]; //存储上一次的target
    reg[(16 - $clog2(`BTB_SIZE) - 2):0] BTB_PC[0:`BTB_SIZE - 1];  //存储指令PC
    reg target_bit[0:`BTB_SIZE - 1];    //target置信位，上一次更新target是否不变
    reg isret[0:`BTB_SIZE - 1];     //记录是否为ret
    reg[$clog2(`BTB_SIZE) - 1:0] rstcnt;    //用于复位
    initial rstcnt=0;

    genvar i;
    generate
        for(i=0; i < `BTB_SIZE; i=i + 1) begin
            initial begin
                BTB_history[i]=0;
                BTB[i]=0;
                BTB_PC[i]={(16 - $clog2(`BTB_SIZE) - 1){1'b1}};
                target_bit[i]=0;
                isret[i]=0;
            end
        end
        for(i=0; i < `History_SIZE; i=i + 1) begin
            initial begin
                global_BPB0[i]=0;
                global_BPB1[i]=0;
                global_BPB1_1[i]=0;
            end
        end
    endgenerate

    //preFetch预测转移逻辑
    wire[$clog2(`BTB_SIZE) - 1:0] index0=real_PC0[$clog2(`BTB_SIZE) + 2:3];
    wire[$clog2(`BTB_SIZE) - 1:0] index1=real_PC1[$clog2(`BTB_SIZE) + 2:3];

    wire bpsel0=({real_PC0[16:($clog2(`BTB_SIZE) + 3)],real_PC0[2]} == BTB_PC[index0]);
    wire bpsel1=({real_PC1[16:($clog2(`BTB_SIZE) + 3)],real_PC1[2]} == BTB_PC[index1]) & PC1_valid;

    wire real_bp0=global_BPB1[BTB_history[index0]];
    wire real_bp1=global_BPB1[BTB_history[index1]];
    
    wire[31:0] pdt0=((target_bit[index0] | (~(|global_RAS[15:0])) | ~isret[index0]) ? {PC0[31:17],BTB[index0],2'b0} : {PC0[31:18],global_RAS[15:0],2'b00});
    wire[31:0] pdt1=((target_bit[index1] | (~(|global_RAS[15:0])) | ~isret[index1]) ? {PC1[31:17],BTB[index1],2'b0} : {PC0[31:18],global_RAS[15:0],2'b00});

    wire pred0=bpsel0 & real_bp0;
    wire pred1=bpsel1 & real_bp1;
    assign predict_jump=pred0 | pred1;
    assign predict_isinst1=bpsel1 & ~bpsel0;
    assign predict_jump_target=bpsel0 ? pdt0 : pdt1;
    assign RAS_old=global_RAS;
    assign predict_target0=pdt0;
    assign predict_target1=pdt1;

    wire[$clog2(`BTB_SIZE) - 1:0] windex=real_wr_PC[$clog2(`BTB_SIZE) + 2:3];

    reg pop_RAS;
    always@(posedge clk) begin
        if(~resetn)
            pop_RAS<=0;
        else
            pop_RAS<=(predict_rden & ((bpsel0 & isret[index0]) | (bpsel1 & isret[index1])));
    end

    always@(posedge clk) begin
        //rstcnt<=rstcnt + 1;
        if(~resetn) begin
            global_RAS<=0;
            //BTB_PC[rstcnt]<=0;
            //isret[rstcnt]<=0;
        end
        else begin
            //维护RAS（ret自动弹栈，call入栈，清空，重置）
            if(pop_RAS | RAS_flush | RAS_reset_en | RAS_push_en) begin
                global_RAS<=(RAS_flush | RAS_reset_en) ? (RAS_flush ? 0 : RAS_reset_data) :
                    (RAS_push_en ? RAS_push_data : {16'b0,global_RAS[63:16]});     
            end 
            //维护BPB/BTB
            if(wr_en) begin
                BTB[windex]<=wr_target[16:2];
                BTB_PC[windex]<={real_wr_PC[16:($clog2(`BTB_SIZE) + 3)],real_wr_PC[2]};
                target_bit[windex]<=(wr_target[16:2] == BTB[windex]);
                isret[windex]<=wr_isret;
            end
        end
    end

    //三级流水更新
    //第一拍：查询该PC的局部历史
    //第二拍：更新该PC的局部历史，查询局部历史的BPB全局表
    //第三拍：更新局部历史的BPB全局表，更新BTB预测位
    reg update_en;
    reg update_jump;
    reg[$clog2(`BTB_SIZE) - 1:0] update_index;
    reg[$clog2(`History_SIZE) - 1:0] update_history;

    reg update_next_en;
    reg update_next_jump;
    reg[$clog2(`BTB_SIZE) - 1:0] update_next_index;
    reg update_next_bpb0,update_next_bpb1;
    reg[$clog2(`History_SIZE) - 1:0] update_next_history;

    always@(posedge clk) begin
        if(~resetn) begin
            update_en<=0;
            update_jump<=0;
            update_index<=0;
            update_history<=0;
            update_next_bpb0<=0;
            update_next_bpb1<=0;
            update_next_index<=0;
            update_next_jump<=0;
            update_next_en<=0;
            update_next_history<=0;
        end
        else begin
            if(update_next_en) begin
                //     0      1
                //11  10     11
                //10  01     11
                //01  00     10
                //00  00     01
                global_BPB0[update_next_history]<=update_next_jump ? (~(update_next_bpb0 & ~update_next_bpb1)) : (update_next_bpb1 & ~update_next_bpb0);
                global_BPB1[update_next_history]<=(update_next_jump & update_next_bpb0) | (update_next_jump & update_next_bpb1) | (update_next_bpb0 & update_next_bpb1);
                global_BPB1_1[update_next_history]<=(update_next_jump & update_next_bpb0) | (update_next_jump & update_next_bpb1) | (update_next_bpb0 & update_next_bpb1);
                //BTB_predict[update_next_index]<=(update_next_jump & update_next_bpb0) | (update_next_jump & update_next_bpb1) | (update_next_bpb0 & update_next_bpb1);
            end
            update_next_en<=update_en;
            update_next_jump<=update_jump;
            update_next_index<=update_index;
            update_next_history<=update_history;
            update_next_bpb0<=global_BPB0[update_history];
            update_next_bpb1<=global_BPB1_1[update_history];
            if(update_en) begin
                BTB_history[update_index]<={update_history[$clog2(`History_SIZE) - 2:0],update_jump};
            end
            update_en<=wr_en;
            update_jump<=wr_isjump;
            update_index<=windex;
            update_history<=BTB_history[windex];
            //BTB_history[windex]<={BTB_history[windex][$clog2(`History_SIZE) - 2:0],wr_isjump};
        end
    end
    




endmodule