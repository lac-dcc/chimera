// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点加法器/乘法器/除法器共用的后端
    进行规格化的处理
    Note: normal干的事情仅仅是输出一个2^(exp-1023)*1.frac
    不需要管exp
*/

module f_normal
    #(parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           a_wait,         //阻塞信号
    input           flush,          //flush有效时仅清除info[0]
    output          busy,
    input[12:0]     exp,            
    //Note: 这里输入的exp和机器数有一点不同，它是严格意义上的线性映射，没有特殊值
    //也就是说，若exp=0，它表示-1023
    //并且，exp可能会有负值！这是除法造成的
    input[107:0]    frac,           
    input           frac_signed,    //考虑到乘法器输出的是unsigned，而加法器输出的是signed
    input           frac_sign,      //若frac_signed=1则不考虑
    input           op_invalid,
    input[info_width - 1:0]         info_in,
    output reg[info_width - 1:0]    info_out,
    output reg[107:0]               result_frac,    //无符号
    output reg[12:0]                result_exp,
    output reg                      result_sign,
    output reg      invalid
    );

    //postInput/preNormal流水线寄存器
    reg         pipn_sign;      //符号
    reg[107:0]  pipn_frac;      //unsigned
    reg[12:0]   pipn_exp;
    reg[info_width - 1:0]   pipn_info;
    reg         pipn_invalid;
    reg[6:0]    pipn_zeros;

    //preNormal/Normal流水线寄存器
    reg         pnnm_sign;
    reg[107:0]  pnnm_frac;      //已经右移过1位
    reg[12:0]   pnnm_exp;       //未加过的
    reg[info_width - 1:0]   pnnm_info;
    reg         pnnm_invalid;
    reg         pnnm_rshift;    //若=1则需要令exp++，zerocnt无效
    reg[6:0]    pnnm_zerocnt;   //若rshift=0，则其需要减到exp上，并且frac还要左移其

    //postInput
    //注意：前导0从第105位开始数！
    wire[107:0] pi_real_frac=(frac[107] & frac_signed) ? (107'b0 - frac) : frac;
    always@(posedge clk) begin
        if(~resetn) begin
            pipn_sign<=0;
            pipn_frac<=0;
            pipn_exp<=0;
            pipn_info<=0;
            pipn_invalid<=0;
            pipn_zeros<=0;
        end
        else begin
            if(flush)
                pipn_info[0]<=0;
            else if(~a_wait)
                pipn_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    pipn_info[info_width - 1:1]<=info_in[info_width - 1:1];
                pipn_exp<=exp;
                pipn_frac<=pi_real_frac;
                pipn_invalid<=op_invalid;
                pipn_sign<=frac_signed ? frac[107] : frac_sign;
                pipn_zeros[6]<=~(|pi_real_frac[105:90]);
                pipn_zeros[5]<=~(|pi_real_frac[89:74]);
                pipn_zeros[4]<=~(|pi_real_frac[73:58]);
                pipn_zeros[3]<=~(|pi_real_frac[57:42]);
                pipn_zeros[2]<=~(|pi_real_frac[41:26]);
                pipn_zeros[1]<=~(|pi_real_frac[25:10]);
                pipn_zeros[0]<=~(|pi_real_frac[9:0]);
            end
        end
    end

    //preNormal
    wire[3:0] pn_cnts[0:6];
    clz_16 cz(.din({pipn_frac[9:0],6'b0}),.dout(pn_cnts[0]));
    genvar i;
    generate
        for(i = 6; i >= 1; i = i - 1) begin
            clz_16 tcz(.din(pipn_frac[105 - (6 - i) * 16 : 106 - (7 - i) * 16]),.dout(pn_cnts[i]));
        end
    endgenerate
    always@(posedge clk) begin
        if(~resetn) begin
            pnnm_exp<=0;
            pnnm_frac<=0;
            pnnm_info<=0;
            pnnm_invalid<=0;
            pnnm_rshift<=0;
            pnnm_sign<=0;
            pnnm_zerocnt<=0;
        end
        else begin
            if(flush)
                pnnm_info[0]<=0;
            else if(~a_wait)
                pnnm_info[0]<=pipn_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    pnnm_info[info_width - 1:1]<=pipn_info[info_width - 1:1];
                pnnm_exp<=pipn_exp;
                pnnm_invalid<=pipn_invalid;
                pnnm_sign<=pipn_sign;
                pnnm_rshift<=pipn_frac[106];
                pnnm_frac<=pipn_frac[106] ? {1'b0,pipn_frac[107:1]} : pipn_frac;
                pnnm_zerocnt<=(&pipn_zeros[6:3]) ? (&pipn_zeros[2:1] ? {3'b110,pn_cnts[0]} : (pipn_zeros[2] ? {3'b101,pn_cnts[1]} : {3'b100,pn_cnts[2]})) : (
                    (&pipn_zeros[6:5]) ? (pipn_zeros[4] ? {3'b011,pn_cnts[3]} : {3'b010,pn_cnts[4]}) : (
                        pipn_zeros[6] ? {3'b001,pn_cnts[5]} : {3'b000,pn_cnts[6]}));
            end
        end
    end

    //Normal
    wire[12:0] nm_newexp=pnnm_exp - {1'b0,pnnm_zerocnt};
    always@(posedge clk) begin
        if(~resetn) begin
            info_out<=0;
            invalid<=0;
            result_exp<=0;
            result_frac<=0;
            result_sign<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=pnnm_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=pnnm_info[info_width - 1:1];
                result_sign<=pnnm_sign;
                result_exp<=pnnm_rshift ? (pnnm_exp + 1) : nm_newexp;
                result_frac<=pnnm_rshift ? pnnm_frac : (pnnm_frac << pnnm_zerocnt);
                invalid<=pnnm_invalid;
            end
        end
    end

    assign busy=a_wait;         //TODO?

endmodule
