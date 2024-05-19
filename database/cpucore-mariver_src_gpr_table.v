// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    GPR状态表
*/

module gpr_table(
    input           clk,
    input           resetn,
    input           flush,
    //来自Rename段的4个读端口
    input[4:0]      raddr0,
    output[$clog2(`ROB_SIZE) - 1:0]     rnum0,          //ROB编号
    output          rbusy0,         //该GPR是否真的被占用
    input[4:0]      raddr1,
    output[$clog2(`ROB_SIZE) - 1:0]     rnum1,
    output          rbusy1,       
    input[4:0]      raddr2,
    output[$clog2(`ROB_SIZE) - 1:0]     rnum2,
    output          rbusy2,
    input[4:0]      raddr3,
    output[$clog2(`ROB_SIZE) - 1:0]     rnum3,
    output          rbusy3,
    //来自Rename段的2个写端口（以写端口1为准）
    input[4:0]      waddr0,
    input           wen0,
    input[$clog2(`ROB_SIZE) - 1:0]      wnum0,          //ROB编号
    input[4:0]      waddr1,
    input           wen1,
    input[$clog2(`ROB_SIZE) - 1:0]      wnum1,
    //来自Commit段的释放端口（若释放则释放，优先级比写端口低）
    input[4:0]      commit_addr0,   //GPR地址
    input[$clog2(`ROB_SIZE) - 1:0]      commit_num0,    //ROB编号
    input           commit_en0,     //释放使能
    input[4:0]      commit_addr1,
    input[$clog2(`ROB_SIZE) - 1:0]      commit_num1,
    input           commit_en1
    );

    reg[31:0] gpr_busy; //记录各个GPR是否被ROB表项占用
    reg[$clog2(`ROB_SIZE) - 1:0] gpr_num[0:31]; //ROB表项

    assign rbusy0=gpr_busy[raddr0];
    assign rbusy1=gpr_busy[raddr1];
    assign rbusy2=gpr_busy[raddr2];
    assign rbusy3=gpr_busy[raddr3];
    assign rnum0=gpr_num[raddr0];
    assign rnum1=gpr_num[raddr1];
    assign rnum2=gpr_num[raddr2];
    assign rnum3=gpr_num[raddr3];

    genvar i;
    generate
        for(i=1; i < 32; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    gpr_busy[i]<=0;
                    gpr_num[i]<=0;
                end
                else begin
                    if((wen0 & (waddr0 == i)) | (wen1 & (waddr1 == i)))
                        gpr_num[i]<=(wen1 & (waddr1 == i)) ? wnum1 : wnum0;
                    if(flush | (wen0 & (waddr0 == i)) | (wen1 & (waddr1 == i)) | (commit_en0 & (commit_addr0 == i) & (commit_num0 == gpr_num[i])) | (commit_en1 & (commit_addr1 == i) & (commit_num1 == gpr_num[i])))
                        gpr_busy[i]<=((wen0 & (waddr0 == i)) | (wen1 & (waddr1 == i))) & ~flush;
                end
            end
        end
    endgenerate
    always@(posedge clk) begin
        if(~resetn) begin
            gpr_busy[0]<=0;
            gpr_num[0]<=0;
        end
    end

endmodule