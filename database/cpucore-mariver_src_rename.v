// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    Rename模块
*/

module rename(
    input           clk,
    input           resetn,
    //来自Decode输出端的输入
    //Note: Decode可能由于FPU阻塞的原因无法输入rename，这时要插入气泡
    //并且，如果ctrl.nocpu，则rename自己的流水线寄存器不要设为valid
    input           decode_cannotissue, //=decode.rename_busy

    input                               decode_valid0,
    input                               decode_valid1,
    input[31:0]                         decode_inst0,
    input[31:0]                         decode_inst1,
    input[31:0]                         decode_PC0,
    input[31:0]                         decode_PC1,
    input[63:0]                         decode_RAS,
    input                               decode_predict0,
    input[31:0]                         decode_predict_target0,
    input                               decode_predict1,
    input[31:0]                         decode_predict_target1,
    input[`CNT_FU - 1:0]                decode_futype0, //若decode检测出异常则视作ALU指令
    input[$clog2(`CNT_ALUOP) - 1:0]     decode_aluop0,  //若ALU指令则操作码
    input[`CNT_MDUOP - 1:0]             decode_mduop0,
    input[$clog2(`CNT_MUOP) - 1:0]      decode_muop0,
    input[`CNT_CTRL - 1:0]              decode_ctrl0,
    input[$clog2(`CNT_CMP) - 1:0]       decode_cmpop0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] decode_excode0,
    input[4:0]                          decode_rs0,
    input[4:0]                          decode_rt0,
    input[4:0]                          decode_real_rd0,    //真正的写回GPR
    input[5:0]                          decode_cp0addr0,
    input[`CNT_FU - 1:0]                decode_futype1, //若decode检测出异常则视作ALU指令
    input[$clog2(`CNT_ALUOP) - 1:0]     decode_aluop1,  //若ALU指令则操作码
    input[`CNT_MDUOP - 1:0]             decode_mduop1,
    input[$clog2(`CNT_MUOP) - 1:0]      decode_muop1,
    input[`CNT_CTRL - 1:0]              decode_ctrl1,
    input[$clog2(`CNT_CMP) - 1:0]       decode_cmpop1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] decode_excode1,
    input[4:0]                          decode_rs1,
    input[4:0]                          decode_rt1,
    input[4:0]                          decode_real_rd1,    //真正的写回GPR
    input[5:0]                          decode_cp0addr1,
    input decode_nop0,
    input decode_nop1,
    //来自Commit
    input           flush,
    //ARF与GPR状态表读端口
    output[4:0]     raddr0,
    output[4:0]     raddr1,
    output[4:0]     raddr2,
    output[4:0]     raddr3,         //这4个raddr由ARF和GPR状态表共用
    input[31:0]     rdata0,
    input[31:0]     rdata1,
    input[31:0]     rdata2,
    input[31:0]     rdata3,         //这4个rdata来自ARF
    input[$clog2(`ROB_SIZE) - 1:0]  rnum0,
    input[$clog2(`ROB_SIZE) - 1:0]  rnum1,
    input[$clog2(`ROB_SIZE) - 1:0]  rnum2,
    input[$clog2(`ROB_SIZE) - 1:0]  rnum3,      //这4个rnum来自GPR状态表
    input           rbusy0,
    input           rbusy1,
    input           rbusy2,
    input           rbusy3,         //这4个rbusy来自GPR状态表
    //GPR状态表写端口（以写端口1为准）
    output[4:0]     waddr0,
    output          wen0,
    output[$clog2(`ROB_SIZE) - 1:0]     wnum0,          //ROB编号
    output[4:0]     waddr1,
    output          wen1,
    output[$clog2(`ROB_SIZE) - 1:0]     wnum1,
    //传递给Decode的反馈信号
    output          rename_busy,
    //来自Dispatch的反馈信号
    input           dispatch_busy,
    //来自ROB的反馈信号
    input           rob_full,       //ROB此时已满
    input[$clog2(`ROB_SIZE) - 2:0]  rob_tail,   //ROB的tail指针，用于得知指令被分配的ROB编号
    //传递给ROB输入端的仅指令相关信息
    output          rob_push_en,                //ROB写使能，注意，必须当指令能流到Dispatch时才可生效一个周期
    output[63:0]    rob_RAS,
    output          rob_valid0,     
    output[31:0]    rob_PC0,
    output[`CNT_FU - 1:0]   rob_futype0,        //仅表示指令类型，无法区分出ALU0/1
    output[`CNT_CTRL - 1:0] rob_ctrl0,          //杂项控制信号
    output[4:0]     rob_waddr0,                 //指令0的rd
    output[5:0]     rob_cp0addr0,
    output          rob_valid1,     
    output[31:0]    rob_PC1,
    output[`CNT_FU - 1:0]   rob_futype1,        //仅表示指令类型，无法区分出ALU0/1
    output[`CNT_CTRL - 1:0] rob_ctrl1,          //杂项控制信号
    output[4:0]     rob_waddr1,                 //指令0的rd
    output[5:0]     rob_cp0addr1,
    output rob_nop0,
    output rob_nop1,
    //Rename/Dispatch流水线寄存器输出
    output reg                              rename_valid0,
    output reg[31:0]                        rename_PC0,
    output reg[31:0]                        rename_inst0,
    output reg                              rename_predict0,
    output reg[31:0]                        rename_predict_target0,
    output reg[`CNT_FU - 1:0]               rename_futype0, //若decode检测出异常则视作ALU指令
    output reg[$clog2(`CNT_ALUOP) - 1:0]    rename_aluop0,  //若ALU指令则操作码
    output reg[`CNT_MDUOP - 1:0]            rename_mduop0,
    output reg[$clog2(`CNT_MUOP) - 1:0]     rename_muop0,
    output reg[`CNT_CTRL - 1:0]             rename_ctrl0,
    output reg[$clog2(`CNT_CMP) - 1:0]      rename_cmpop0,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    rename_excode0,
    output reg[$clog2(`ROB_SIZE) - 1:0]     rename_num0,    //指令0的ROB编号
    output reg                              rename_readyrs0,    //指令0的操作数rs是否ready（直接用ARF的值，若不需要rs则置1）
    output reg                              rename_readyrt0,    //指令0的操作数rt是否ready（直接用ARF的值，若不需要rs则置1）
    output reg[31:0]                        rename_rsval0,
    output reg[31:0]                        rename_rtval0,      //这个val直接来自ARF
    output reg[$clog2(`ROB_SIZE) - 1:0]     rename_rsnum0,
    output reg[$clog2(`ROB_SIZE) - 1:0]     rename_rtnum0,      //这个num直接来自GPR状态表
    output reg[5:0]                         rename_cp0addr0,
    output reg                              rename_valid1,
    output reg[31:0]                        rename_PC1,
    output reg[31:0]                        rename_inst1,
    output reg                              rename_predict1,
    output reg[31:0]                        rename_predict_target1,
    output reg[`CNT_FU - 1:0]               rename_futype1, //若decode检测出异常则视作ALU指令
    output reg[$clog2(`CNT_ALUOP) - 1:0]    rename_aluop1,  //若ALU指令则操作码
    output reg[`CNT_MDUOP - 1:0]            rename_mduop1,
    output reg[$clog2(`CNT_MUOP) - 1:0]     rename_muop1,
    output reg[`CNT_CTRL - 1:0]             rename_ctrl1,
    output reg[$clog2(`CNT_CMP) - 1:0]      rename_cmpop1,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    rename_excode1,
    output reg[$clog2(`ROB_SIZE) - 1:0]     rename_num1,    //指令1的ROB编号
    output reg                              rename_readyrs1,    //指令1的操作数rs是否ready（直接用ARF的值，若不需要rs则置1）
    output reg                              rename_readyrt1,    //指令1的操作数rt是否ready（直接用ARF的值，若不需要rs则置1）
    output reg[31:0]                        rename_rsval1,
    output reg[31:0]                        rename_rtval1,
    output reg[$clog2(`ROB_SIZE) - 1:0]     rename_rsnum1,
    output reg[$clog2(`ROB_SIZE) - 1:0]     rename_rtnum1,      //这个num直接来自GPR状态表
    output reg[5:0]                         rename_cp0addr1
    );

    assign rename_busy=rob_full | dispatch_busy;
    assign raddr0=decode_rs0;
    assign raddr1=decode_rt0;
    assign raddr2=decode_rs1;
    assign raddr3=decode_rt1;

    wire rsready0=(~decode_ctrl0[`CTRL_use_rs]) | ~rbusy0; //指令0的rs是否可以直接用ARF的值
    wire rtready0=(~decode_ctrl0[`CTRL_use_rt]) | ~rbusy1;
    wire rsready1=(~decode_ctrl1[`CTRL_use_rs]) | ((~rbusy2) & ~(decode_valid0 & decode_ctrl0[`CTRL_wen] & (decode_rs1 == decode_real_rd0)));
    wire rtready1=(~decode_ctrl1[`CTRL_use_rt]) | ((~rbusy3) & ~(decode_valid0 & decode_ctrl0[`CTRL_wen] & (decode_rt1 == decode_real_rd0)));
    
    assign waddr0=decode_real_rd0;
    assign waddr1=decode_real_rd1;
    assign wnum0={1'b0,rob_tail};
    assign wnum1={1'b1,rob_tail};
    assign wen0=decode_valid0 & (~decode_cannotissue) & decode_ctrl0[`CTRL_wen] & ~rename_busy;
    assign wen1=decode_valid1 & (~decode_cannotissue) & decode_ctrl1[`CTRL_wen] & ~rename_busy;

    wire[$clog2(`ROB_SIZE) - 1:0] rsnum0=rnum0;
    wire[$clog2(`ROB_SIZE) - 1:0] rtnum0=rnum1;
    wire[$clog2(`ROB_SIZE) - 1:0] rsnum1=(decode_valid0 & decode_ctrl0[`CTRL_wen] & (decode_rs1 == decode_real_rd0)) ? {1'b0,rob_tail} : rnum2;
    wire[$clog2(`ROB_SIZE) - 1:0] rtnum1=(decode_valid0 & decode_ctrl0[`CTRL_wen] & (decode_rt1 == decode_real_rd0)) ? {1'b0,rob_tail} : rnum3;
    
    assign rob_push_en=(decode_valid0 | decode_valid1) & (~decode_cannotissue) & ~rename_busy;
    assign rob_RAS=decode_RAS;
    assign rob_valid0=decode_valid0;
    assign rob_valid1=decode_valid1;
    assign rob_PC0=decode_PC0;
    assign rob_PC1=decode_PC1;
    assign rob_futype0=decode_futype0;
    assign rob_futype1=decode_futype1;
    assign rob_ctrl0=decode_ctrl0;
    assign rob_ctrl1=decode_ctrl1;
    assign rob_waddr0=decode_real_rd0;
    assign rob_waddr1=decode_real_rd1;
    assign rob_cp0addr0=decode_cp0addr0;
    assign rob_cp0addr1=decode_cp0addr1;
    assign rob_nop0=decode_nop0;
    assign rob_nop1=decode_nop1;
    
    always@(posedge clk) begin
        if(~resetn) begin
            rename_valid0<=0; rename_valid1<=0;
            rename_PC0<=0; rename_PC1<=0;
            rename_inst0<=0; rename_inst1<=0;
            rename_predict0<=0; rename_predict1<=0;
            rename_predict_target0<=0; rename_predict_target1<=0;
            rename_futype0<=0; rename_futype1<=0;
            rename_aluop0<=0; rename_aluop1<=0;
            rename_mduop0<=0; rename_mduop1<=0;
            rename_muop0<=0; rename_muop1<=0;
            rename_ctrl0<=0; rename_ctrl1<=0;
            rename_cmpop0<=0; rename_cmpop1<=0;
            rename_excode0<=0; rename_excode1<=0;
            rename_num0<=0; rename_num1<=0;
            rename_readyrs0<=0; rename_readyrs1<=0;
            rename_readyrt0<=0; rename_readyrt1<=0;
            rename_rsval0<=0; rename_rsval1<=0;
            rename_rtval0<=0; rename_rtval1<=0;
            rename_rsnum0<=0; rename_rsnum1<=0;
            rename_rtnum0<=0; rename_rtnum1<=0;
            rename_cp0addr0<=0; rename_cp0addr1<=0;
        end
        else begin
            if(flush | ~dispatch_busy) begin
                rename_valid0<=decode_valid0 & (~decode_nop0) & (~decode_cannotissue) & (~decode_ctrl0[`CTRL_nocpu]) & (~rob_full) & ~flush;
                rename_valid1<=decode_valid1 & (~decode_nop1) & (~decode_cannotissue) & (~decode_ctrl1[`CTRL_nocpu]) & (~rob_full) & ~flush;
            end
            if(~dispatch_busy) begin
                rename_PC0<=decode_PC0;
                rename_PC1<=decode_PC1;
                rename_inst0<=decode_inst0;
                rename_inst1<=decode_inst1;
                rename_predict0<=decode_predict0;
                rename_predict1<=decode_predict1;
                rename_predict_target0<=decode_predict_target0;
                rename_predict_target1<=decode_predict_target1;
                rename_futype0<=decode_futype0;
                rename_futype1<=decode_futype1;
                rename_aluop0<=decode_aluop0;
                rename_aluop1<=decode_aluop1;
                rename_mduop0<=decode_mduop0;
                rename_mduop1<=decode_mduop1;
                rename_muop0<=decode_muop0;
                rename_muop1<=decode_muop1;
                rename_ctrl0<=decode_ctrl0;
                rename_ctrl1<=decode_ctrl1;
                rename_cmpop0<=decode_cmpop0;
                rename_cmpop1<=decode_cmpop1;
                rename_excode0<=decode_excode0;
                rename_excode1<=decode_excode1;
                rename_num0<={1'b0,rob_tail};
                rename_num1<={1'b1,rob_tail};
                rename_readyrs0<=rsready0;
                rename_readyrs1<=rsready1;
                rename_readyrt0<=rtready0;
                rename_readyrt1<=rtready1;
                rename_rsval0<=rdata0;
                rename_rtval0<=rdata1;
                rename_rsval1<=rdata2;
                rename_rtval1<=rdata3;
                rename_rsnum0<=rsnum0;
                rename_rsnum1<=rsnum1;
                rename_rtnum0<=rtnum0;
                rename_rtnum1<=rtnum1;
                rename_cp0addr0<=decode_cp0addr0;
                rename_cp0addr1<=decode_cp0addr1;
            end
        end
    end
   
endmodule