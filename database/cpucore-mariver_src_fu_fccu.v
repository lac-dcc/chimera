// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    FPU中执行FCC相关指令的功能单元，阻塞非流水，严格顺序执行
    这些指令包括：
    C.cond (修改FCC)
    movf/movt (传送FCC条件到CPU)
    movf/movt.fmt (根据FCC选择性修改fd)
    bc1f/bc1t (根据FCC判断分支预测是否失败)
*/

module fu_fccu
    #(parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           flush,
    input[7:0]      flush_fcc,      //当flush时用体系结构可见FCC重写内部FCC
                                    //注意：flush的这个瞬间有可能在修改FCC
    input           a_wait,
    output          busy,
    //输入端（采用自己的输入寄存器）
    input           valid,
    input[63:0]     op_a,
    input[63:0]     op_b,           //对于fpr条件传送，应为rd的原值
    input[2:0]      fcc_addr,       //涉及到的FCC位
    input[31:0]     PC,             //供bc1f/bc1t
    input           predict,
    input[31:0]     predict_target, //供bc1f/bc1t判断分支预测
    input[15:0]     inst_lo,        //指令字的低16位，供bc1f/bc1t/c.cond使用
    input[`FCCUCTRL_CNT - 1:0]  fccu_ctrl,
    input[$clog2(`ROB_SIZE) - 1:0]  robnum,
    input[info_width - 1:0]     info_in,    //注意！这个info不包含valid！也不包含robnum
    //输出端（组合逻辑）
    output          ready,
    output[63:0]    result,
    output[$clog2(`ROB_SIZE) - 1:0] wbnum,
    output[info_width - 1:0]    info_out,
    output          invalid,        //比较时可能会报错
    //传送到CPU
    output reg      tocpu_valid,
    output reg[$clog2(`ROB_SIZE) - 1:0] tocpu_num,
    output reg      tocpu_data
    );

    reg[7:0]        FCC;
    reg             r_valid;
    reg[63:0]       r_op_a;
    reg[63:0]       r_op_b;
    reg[2:0]        r_fcc_addr;
    reg[31:0]       r_PC;
    reg             r_predict;
    reg[31:0]       r_predict_target;
    reg[$clog2(`ROB_SIZE) - 1:0]    r_robnum;
    reg[15:0]       r_inst_lo;
    reg[`FCCUCTRL_CNT - 1:0]    r_fccu_ctrl;
    reg[info_width - 1:0]       r_info_in;

    reg             ro_en;
    reg[63:0]       ro_result;

    wire            comp_invalid;
    wire            comp_busy;
    wire            comp_ready;
    wire            comp_result;
    f_comp cmp(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.flush(flush),.busy(comp_busy),
        .valid(r_valid & r_fccu_ctrl[`FCCUCTRL_CMP] & (~comp_busy) & (~a_wait) & (~comp_ready)),
        .op_a(r_op_a),.op_b(r_op_b),.opsng(r_fccu_ctrl[`FCCUCTRL_OPSNG]),
        .cmp_cond(r_inst_lo[3:0]),.ready(comp_ready),.result(comp_result),.invalid(comp_invalid)
    );

    assign busy=r_valid | comp_busy | a_wait;

    //input
    always@(posedge clk) begin
        if(~resetn) begin
            r_valid<=0;
            r_op_a<=0;
            r_op_b<=0;
            r_fcc_addr<=0;
            r_PC<=0;
            r_predict<=0;
            r_predict_target<=0;
            r_inst_lo<=0;
            r_fccu_ctrl<=0;
            r_info_in<=0;
            r_robnum<=0;
        end
        else begin
            if(flush)
                r_valid<=0;
            else if(~busy)
                r_valid<=valid;
            else if((~comp_busy) & (~a_wait))
                r_valid<=0;
            if(~busy) begin
                r_op_a<=op_a;
                r_op_b<=op_b;
                r_fcc_addr<=fcc_addr;
                r_PC<=PC;
                r_predict<=predict;
                r_predict_target<=predict_target;
                r_inst_lo<=inst_lo;
                r_fccu_ctrl<=fccu_ctrl;
                r_info_in<=info_in;
                r_robnum<=robnum;
            end
        end
    end

    wire real_cond=FCC[r_fcc_addr] ^ r_fccu_ctrl[`FCCUCTRL_FALSE];

    //对于转移指令，result的格式为：
    //result[31:0]=target，result[32]指示是否转移，result[33]指示是否失败，result[34]=是否因target失败
    //这与ALU一致
    //对于C.cond，result的格式为：
    //result[0]=newcc, result[3:1]=fccaddr
    wire[31:0] target=r_PC + {{14{r_inst_lo[15]}},r_inst_lo,2'b0} + 4;
    wire fail=(real_cond ^ r_predict) | (r_predict & (target != r_predict_target));
    wire[63:0] bresult={29'b0,(r_predict & real_cond & (target != r_predict_target)),
        fail,real_cond,real_cond ? target : (r_PC + 8)};
    wire[63:0] rresult=real_cond ? r_op_a : r_op_b;
    always@(posedge clk) begin
        if(~resetn) begin
            ro_en<=0;
            ro_result<=0;
        end
        else begin
            ro_en<=r_valid & (~flush) & ~r_fccu_ctrl[`FCCUCTRL_CMP];
            ro_result<=r_fccu_ctrl[`FCCUCTRL_BRANCH] ? bresult : (
                {r_fccu_ctrl[`FCCUCTRL_TOHIGH] ? rresult[31:0] : rresult[63:32],rresult[31:0]});
        end
    end

`ifdef FPU_ENABLED
    //传送至CPU
    always@(posedge clk) begin
        if(~resetn) begin
            tocpu_valid<=0;
            tocpu_num<=0;
            tocpu_data<=0;
        end
        else begin
            tocpu_valid<=r_valid & r_fccu_ctrl[`FCCUCTRL_TOCPU];
            tocpu_num<=r_robnum;
            tocpu_data<=real_cond;
        end
    end
`else
    initial begin
        tocpu_valid=0;
        tocpu_num=0;
        tocpu_data=0;
    end
`endif

    //维护FCC
    always@(posedge clk) begin
        if(~resetn)
            FCC<=0;
        else if(flush)
            FCC<=flush_fcc;
        else if(comp_ready)
            FCC[r_fcc_addr]<=comp_result;
    end

    //组合逻辑输出
    assign ready=comp_ready | ro_en;
    assign result=ro_en ? ro_result : {60'b0,r_fcc_addr,comp_result};
    assign wbnum=r_robnum;
    assign info_out=r_info_in;
    assign invalid=comp_ready & comp_invalid;

endmodule