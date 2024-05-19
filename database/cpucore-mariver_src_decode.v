// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    Decode模块
*/

module decode(
    input           clk,
    input           resetn,
    //来自Buffer输出端的输入
    input[63:0]     buffer_RAS,         //指令0/1共用的RAS
    input           buffer_valid0,      //当Buffer为空时，将valid置0即可
    input[31:0]     buffer_PC0,
    input[31:0]     buffer_inst0,
    input           buffer_predict0,
    input[31:0]     buffer_predict_target0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] buffer_excode0,
    input           buffer_valid1,
    input[31:0]     buffer_PC1,
    input[31:0]     buffer_inst1,
    input           buffer_predict1,
    input[31:0]     buffer_predict_target1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] buffer_excode1,
    //传递给Buffer的反馈信号
    output          decode_busy,        //不要修改Buffer的head
    //来自Rename的反馈信号
    input           rename_busy,        //不要修改Decode的输出
    //用于push全局RAS
    output          RAS_push_en,        //来自Decode的call指令的push RAS
    output[63:0]    RAS_push_data,      //来自Decode的call指令的push RAS（整个64位字）
    //来自Commit
    input           flush,
    input           llbit,
    input           cp0_en,             //是否可以使用CP0特权指令
    //Decode/Rename流水线寄存器输出
    output reg                              decode_valid0,
    output reg                              decode_valid1,
    output reg[31:0]                        decode_inst0,
    output reg[31:0]                        decode_inst1,   //需要把inst传递下去
    output reg[31:0]                        decode_PC0,
    output reg[31:0]                        decode_PC1,
    output reg[63:0]                        decode_RAS,
    output reg                              decode_predict0,
    output reg[31:0]                        decode_predict_target0,
    output reg                              decode_predict1,
    output reg[31:0]                        decode_predict_target1,
    output reg[`CNT_FU - 1:0]               decode_futype0, //若decode检测出异常则视作ALU指令
    output reg[$clog2(`CNT_ALUOP) - 1:0]    decode_aluop0,  //若ALU指令则操作码
    output reg[`CNT_MDUOP - 1:0]            decode_mduop0,
    output reg[$clog2(`CNT_MUOP) - 1:0]     decode_muop0,
    output reg[`CNT_CTRL - 1:0]             decode_ctrl0,
    output reg[$clog2(`CNT_CMP) - 1:0]      decode_cmpop0,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    decode_excode0,
    output reg[4:0]                         decode_rs0,
    output reg[4:0]                         decode_rt0,
    output reg[4:0]                         decode_real_rd0,    //真正的写回GPR
    output reg[5:0]                         decode_cp0addr0,
    output reg[`CNT_FU - 1:0]               decode_futype1, //若decode检测出异常则视作ALU指令
    output reg[$clog2(`CNT_ALUOP) - 1:0]    decode_aluop1,  //若ALU指令则操作码
    output reg[`CNT_MDUOP - 1:0]            decode_mduop1,
    output reg[$clog2(`CNT_MUOP) - 1:0]     decode_muop1,
    output reg[`CNT_CTRL - 1:0]             decode_ctrl1,
    output reg[$clog2(`CNT_CMP) - 1:0]      decode_cmpop1,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    decode_excode1,
    output reg[4:0]                         decode_rs1,
    output reg[4:0]                         decode_rt1,
    output reg[4:0]                         decode_real_rd1,    //真正的写回GPR
    output reg[5:0]                         decode_cp0addr1,
    output reg decode_nop0,
    output reg decode_nop1,

    //FPU支持
    input                                   fpu_fetched,        //这个周期是否有一条指令成功输入FPU，用于取消fpuvalid
    output reg                              decode_fpuvalid0,
    output reg                              decode_fpuvalid1
    );

    wire[`CNT_FU - 1:0] futype0,futype1;
    wire[$clog2(`CNT_ALUOP) - 1:0] aluop0,aluop1;
    wire[`CNT_MDUOP - 1:0] mduop0,mduop1;
    wire[$clog2(`CNT_MUOP) - 1:0] muop0,muop1;
    wire[`CNT_CTRL - 1:0] ctrl0,ctrl1;
    wire[$clog2(`CNT_CMP) - 1:0] cmpop0,cmpop1;
    wire[$clog2(`CNT_EXCEPTION) - 1:0] excode0,excode1;
    wire[4:0] rs0,rs1;
    wire[4:0] rt0,rt1;
    wire[4:0] real_rd0,real_rd1;
    wire[5:0] cp0addr0,cp0addr1;
    wire iscall0,iscall1;

    decoder decoder0(.inst(buffer_inst0),.pre_excode(buffer_excode0),.pred(buffer_predict0),.llbit(llbit),.cp0_en(cp0_en),
        .futype(futype0),.aluop(aluop0),.mduop(mduop0),.muop(muop0),.ctrl(ctrl0),
        .cmpop(cmpop0),.excode(excode0),.rs(rs0),.real_rt(rt0),.real_rd(real_rd0),.cp0addr(cp0addr0),.iscall(iscall0));
    decoder decoder1(.inst(buffer_inst1),.pre_excode(buffer_excode1),.pred(buffer_predict1),.llbit(llbit),.cp0_en(cp0_en),
        .futype(futype1),.aluop(aluop1),.mduop(mduop1),.muop(muop1),.ctrl(ctrl1),
        .cmpop(cmpop1),.excode(excode1),.rs(rs1),.real_rt(rt1),.real_rd(real_rd1),.cp0addr(cp0addr1),.iscall(iscall1));
    
    //处理RAS
    assign RAS_push_en=(buffer_valid0 & iscall0) | (buffer_valid1 & iscall1);
    wire[31:0] ra0=buffer_PC0 + 8;
    wire[31:0] ra1=buffer_PC1 + 8;
    assign RAS_push_data={buffer_RAS[47:0],(buffer_valid0 & iscall0) ? ra0[17:2] : ra1[17:2]};

    assign decode_busy=rename_busy;

    always@(posedge clk) begin
        if(~resetn) begin
            decode_RAS<=0;
            decode_valid0<=0; decode_valid1<=0;
            decode_inst0<=0; decode_inst1<=0;
            decode_PC0<=0; decode_PC1<=0;
            decode_predict0<=0; decode_predict1<=0;
            decode_predict_target0<=0; decode_predict_target1<=0;
            decode_futype0<=0; decode_futype1<=0;
            decode_aluop0<=0; decode_aluop1<=0;
            decode_mduop0<=0; decode_mduop1<=0;
            decode_muop0<=0; decode_muop1<=0;
            decode_ctrl0<=0; decode_ctrl1<=0;
            decode_cmpop0<=0; decode_cmpop1<=0;
            decode_excode0<=0; decode_excode1<=0;
            decode_rs0<=0; decode_rs1<=0;
            decode_rt0<=0; decode_rt1<=0;
            decode_real_rd0<=0; decode_real_rd1<=0;
            decode_cp0addr0<=0; decode_cp0addr1<=0;
            decode_nop0<=0; decode_nop1<=0;

            decode_fpuvalid0<=0; decode_fpuvalid1<=0;
        end
        else begin
            if(~rename_busy) begin
                decode_RAS<=buffer_RAS;
                decode_inst0<=buffer_inst0;
                decode_inst1<=buffer_inst1;
                decode_PC0<=buffer_PC0;
                decode_PC1<=buffer_PC1;
                decode_predict0<=buffer_predict0 & ~ctrl0[`CTRL_likely];
                decode_predict1<=buffer_predict1 & ~ctrl1[`CTRL_likely];
                decode_predict_target0<=buffer_predict_target0;
                decode_predict_target1<=buffer_predict_target1;
                decode_futype0<=futype0;
                decode_futype1<=futype1;
                decode_aluop0<=aluop0;
                decode_aluop1<=aluop1;
                decode_mduop0<=mduop0;
                decode_mduop1<=mduop1;
                decode_muop0<=muop0;
                decode_muop1<=muop1;
                decode_ctrl0<=(|excode0) ? 0 : ctrl0;
                decode_ctrl1<=(|excode1) ? 0 : ctrl1;
                decode_rs0<=rs0;
                decode_rs1<=rs1;
                decode_rt0<=rt0;
                decode_rt1<=rt1;
                decode_real_rd0<=real_rd0;
                decode_real_rd1<=real_rd1;
                decode_cp0addr0<=cp0addr0;
                decode_cp0addr1<=cp0addr1;
                decode_cmpop0<=cmpop0;
                decode_cmpop1<=cmpop1;
                decode_excode0<=excode0;
                decode_excode1<=excode1;
                decode_nop0<=(~(|buffer_inst0)) & ~(|buffer_excode0);
                decode_nop1<=(~(|buffer_inst1)) & ~(|buffer_excode1);

                decode_fpuvalid0<=ctrl0[`CTRL_fpu];
                decode_fpuvalid1<=ctrl1[`CTRL_fpu];
            end
            else begin
                if(decode_fpuvalid0)
                    decode_fpuvalid0<=~(decode_fpuvalid0 & fpu_fetched);
            end
            if(flush | ~rename_busy) begin
                decode_valid0<=buffer_valid0 & ~flush;
                decode_valid1<=buffer_valid1 & ~flush;
            end
        end
    end

endmodule