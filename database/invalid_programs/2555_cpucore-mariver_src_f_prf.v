// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    FPU物理寄存器堆
*/

module get_free_prf(        //找到32位数中任意一个1，保证非0
    input[31:0]     state,
    output[4:0]     index
    );

    wire[4:0] indexs[0:7];
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin
            assign indexs[i][4:2]=i;
            assign indexs[i][1:0]=(|state[i * 4 + 1:i * 4]) ? (state[i * 4] ? 0 : 1) : (state[i * 4 + 2] ? 2 : 3);
        end
    endgenerate

    assign index=
        (|state[15:0]) ? 
            ((|state[7:0]) ? 
                ((|state[3:0]) ? indexs[0] /*3:0*/ : indexs[1] /*7:4*/) : 
                ((|state[11:8]) ? indexs[2] /*11:8*/ : indexs[3] /*15:12*/)) : 
            ((|state[23:16]) ?
                ((|state[19:16]) ? indexs[4] /*19:16*/ : indexs[5] /*23:20*/) : 
                ((|state[27:24]) ? indexs[6] /*27:24*/ : indexs[7] /*31:28*/));

endmodule



//Note: 为方便起见，我们干脆对于每个64位数据，从奇寄存器取的【一定】在高32位
//因此，FPR地址统一使用4位，外加两个奇偶使能
module f_prf(
    input           clk,
    input           resetn,
    input           flush,
    //来自Commit
    input           fpr_wen0,
    input           fpr_wen1,           //这个0和1表示奇偶
    input[3:0]      fpr_waddr,
    input[4:0]      fpr_wprf0,
    input[4:0]      fpr_wprf1,
    //来自FRename.fd
    input           frename_wen0,
    input           frename_wen1,       //只能持续1周期，不可持久
    input[3:0]      frename_waddr,
    output          frename_busy,
    output[4:0]     frename_prf0,
    output[4:0]     frename_prf1,
    //来自FRename.fs/ft
    input[3:0]      frename_fs_addr,
    input[3:0]      frename_ft_addr,    //不考虑最后一位，输出的0是偶，1是奇
    output[4:0]     frename_fs_prf0,
    output[4:0]     frename_fs_prf1,
    output[4:0]     frename_ft_prf0,
    output[4:0]     frename_ft_prf1,
    //来自FDispatch.fs/ft，获取ready
    input[4:0]      fdispatch_fs_prf0,
    input[4:0]      fdispatch_fs_prf1,
    input[4:0]      fdispatch_ft_prf0,
    input[4:0]      fdispatch_ft_prf1,
    output          fdispatch_fs_ready0,
    output          fdispatch_fs_ready1,
    output          fdispatch_ft_ready0,
    output          fdispatch_ft_ready1,
    //来自FPU输出端
    input           prf_wen0,
    input           prf_wen1,           //这个0/1表示奇偶
    input[4:0]      prf_waddr0,
    input[4:0]      prf_waddr1,
    input[63:0]     prf_wdata,          //这个data并不总是低32位有效，需要经过转换，高位奇低位偶
    //来自Issue的两个保留站
    input[4:0]      rd_a_fs_addr0,
    input[4:0]      rd_a_fs_addr1,
    input[4:0]      rd_a_ft_addr0,
    input[4:0]      rd_a_ft_addr1,
    input[4:0]      rd_b_fs_addr0,
    input[4:0]      rd_b_fs_addr1,
    input[4:0]      rd_b_ft_addr0,
    input[4:0]      rd_b_ft_addr1,
    output[31:0]    rd_a_fs_data0,
    output[31:0]    rd_a_fs_data1,
    output[31:0]    rd_a_ft_data0,
    output[31:0]    rd_a_ft_data1,
    output[31:0]    rd_b_fs_data0,
    output[31:0]    rd_b_fs_data1,
    output[31:0]    rd_b_ft_data0,
    output[31:0]    rd_b_ft_data1
    );

    //PRF & FPR
    reg[31:0]       PRF0[0:31];
    reg[31:0]       PRF1[0:31];
    reg[31:0]       PRF0_free;      //该PRF若空闲则为1
    reg[31:0]       PRF1_free;
    reg[31:0]       PRF0_committed; //是否是上次被提交的（flush后非committed的都要空闲）
    reg[31:0]       PRF1_committed;
    reg[4:0]        FPR0_head[0:15];
    reg[4:0]        FPR1_head[0:15];    //每个FPR的PRF队列头，上一次commit的PRF
    reg[4:0]        FPR0_tail[0:15];
    reg[4:0]        FPR1_tail[0:15];    //每个FPR的PRF队列尾，对应最晚写回该FPR的指令
    reg[31:0]       PRF0_ready;
    reg[31:0]       PRF1_ready;         //每个PRF标记自己的结果是否已经生成

    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1) begin
            initial begin
                PRF0[i]=0;
                PRF1[i]=0;
            end
        end
    endgenerate

    assign rd_a_fs_data0=PRF0[rd_a_fs_addr0];
    assign rd_a_fs_data1=PRF1[rd_a_fs_addr1];
    assign rd_a_ft_data0=PRF0[rd_a_ft_addr0];
    assign rd_a_ft_data1=PRF1[rd_a_ft_addr1];
    assign rd_b_fs_data0=PRF0[rd_b_fs_addr0];
    assign rd_b_fs_data1=PRF1[rd_b_fs_addr1];
    assign rd_b_ft_data0=PRF0[rd_b_ft_addr0];
    assign rd_b_ft_data1=PRF1[rd_b_ft_addr1];
    
    //更新PRF
    always@(posedge clk) begin
        if(prf_wen1)
            PRF1[prf_waddr1]<=prf_wdata[63:32];
        if(prf_wen0)
            PRF0[prf_waddr0]<=prf_wdata[31:0];
    end

    //更新PRF提交状态
    generate
        for(i = 0; i < 32; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    PRF0_committed[i]<=(i < 16);
                    PRF1_committed[i]<=(i < 16);
                end
                else begin
                    if(fpr_wen0 & ((FPR0_head[fpr_waddr] == i) | (fpr_wprf0 == i)))
                        PRF0_committed[i]<=(fpr_wprf0 == i);
                    if(fpr_wen1 & ((FPR1_head[fpr_waddr] == i) | (fpr_wprf1 == i)))
                        PRF1_committed[i]<=(fpr_wprf1 == i);
                end
            end
        end
    endgenerate

    //维护PRF空闲状态
    wire[4:0] free0,free1;
    get_free_prf fp0(
        .state(PRF0_free),.index(free0)
    );
    get_free_prf fp1(
        .state(PRF1_free),.index(free1)
    );
    assign frename_busy=(frename_wen0 & ~(|PRF0_free)) | (frename_wen1 & ~(|PRF1_free));
    assign frename_prf0=free0;
    assign frename_prf1=free1;
    generate
        for(i = 0; i < 32; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    PRF0_free[i]<=(i >= 16);
                    PRF1_free[i]<=(i >= 16);
                end
                else begin
                    //flush时非Committed态PRF都空闲，并且，要考虑这个周期可能还有指令提交，有些PRF会变成非committed，它们也要变成空闲，也有的PRF会变成committed，它们不能变成空闲！
                    //Commit时原来的head空闲
                    //Rename时取得的free不空闲
                    if((flush & (~(fpr_wen0 & (fpr_wprf0 == i))) & ~PRF0_committed[i]) | (fpr_wen0 & (FPR0_head[fpr_waddr] == i)) | (frename_wen0 & (~frename_busy) & (free0 == i)))
                        PRF0_free[i]<=~(frename_wen0 & (~frename_busy) & (free0 == i));
                    if((flush & (~(fpr_wen1 & (fpr_wprf1 == i))) & ~PRF1_committed[i]) | (fpr_wen1 & (FPR1_head[fpr_waddr] == i)) | (frename_wen1 & (~frename_busy) & (free1 == i)))
                        PRF1_free[i]<=~(frename_wen1 & (~frename_busy) & (free1 == i));
                end
            end
        end
    endgenerate

    //维护队头
    generate
        for(i = 0; i < 16; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    FPR0_head[i]<=i;
                    FPR1_head[i]<=i;
                end
                else begin
                    if(fpr_wen0 & (fpr_waddr == i))
                        FPR0_head[i]<=fpr_wprf0;
                    if(fpr_wen1 & (fpr_waddr == i))
                        FPR1_head[i]<=fpr_wprf1;
                end
            end
        end
    endgenerate

    //维护队尾
    generate
        for(i = 0; i < 16; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    FPR0_tail[i]<=i;
                    FPR1_tail[i]<=i;
                end
                else begin
                    //flush时重置为head（注意这个瞬间有可能也在正常提交这个FPR）
                    //Rename时打上新标记
                    if(flush | (frename_wen0 & (~frename_busy) & (frename_waddr == i)))
                        FPR0_tail[i]<=flush ? ((fpr_wen0 & (fpr_waddr == i)) ? fpr_wprf0 : FPR0_head[i]) : free0;
                    if(flush | (frename_wen1 & (~frename_busy) & (frename_waddr == i)))
                        FPR1_tail[i]<=flush ? ((fpr_wen1 & (fpr_waddr == i)) ? fpr_wprf1 : FPR1_head[i]) : free1;
                end
            end
        end
    endgenerate

    //维护每个PRF的ready状态（仅仅表示是否有一条写它的指令正在执行中）
    generate
        for(i = 0; i < 32; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    PRF0_ready[i]<=1;
                    PRF1_ready[i]<=1;
                end
                else begin
                    //flush时将ready置1
                    //FRename时将fd的ready置0
                    //WB时将ready置1
                    if(flush | (frename_wen0 & (~frename_busy) & (free0 == i)) | (prf_wen0 & (prf_waddr0 == i)))
                        PRF0_ready[i]<=flush | (prf_wen0 & (prf_waddr0 == i));
                    if(flush | (frename_wen1 & (~frename_busy) & (free1 == i)) | (prf_wen1 & (prf_waddr1 == i)))
                        PRF1_ready[i]<=flush | (prf_wen1 & (prf_waddr1 == i));
                end
            end
        end
    endgenerate

    assign frename_fs_prf0=FPR0_tail[frename_fs_addr];
    assign frename_fs_prf1=FPR1_tail[frename_fs_addr];
    assign frename_ft_prf0=FPR0_tail[frename_ft_addr];
    assign frename_ft_prf1=FPR1_tail[frename_ft_addr];
    assign fdispatch_fs_ready0=PRF0_ready[fdispatch_fs_prf0] | (prf_wen0 & (prf_waddr0 == fdispatch_fs_prf0));
    assign fdispatch_fs_ready1=PRF1_ready[fdispatch_fs_prf1] | (prf_wen1 & (prf_waddr1 == fdispatch_fs_prf1));
    assign fdispatch_ft_ready0=PRF0_ready[fdispatch_ft_prf0] | (prf_wen0 & (prf_waddr0 == fdispatch_ft_prf0));
    assign fdispatch_ft_ready1=PRF1_ready[fdispatch_ft_prf1] | (prf_wen1 & (prf_waddr1 == fdispatch_ft_prf1));

endmodule