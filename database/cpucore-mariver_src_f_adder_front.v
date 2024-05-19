// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点加法器前端
*/

module f_adder_front
    #(  parameter info_width = 1,
        parameter exp_width = 11,
        parameter frac_width = 52)
    (
    input           clk,
    input           resetn,
    input           a_wait,             //阻塞信号
    input           flush,              //flush有效时仅清除info[0]
    output          busy,
    //输入数据必定为double
    //input[exp_width + frac_width:0] op_a,
    //input[exp_width + frac_width:0] op_b,
    input                   op_a_sign,
    input[exp_width:0]      op_a_exp,
    input[frac_width:0]     op_a_frac,
    input[`SPEF_CNT - 1:0]  op_a_spef,
    input                   op_b_sign,
    input[exp_width:0]      op_b_exp,
    input[frac_width:0]     op_b_frac,
    input[`SPEF_CNT - 1:0]  op_b_spef,
    
    input[info_width - 1:0] info_in,    //指令附加信息，与运算无关，随流水线流动
    //输出的是未经规格化的指数+长尾数
    output reg[exp_width + 1:0] result_exp,     //结果指数多取2位
    output reg[frac_width * 2 + 3:0]    result_frac,    //结果尾数取52+3+52+1=108位，未舍入，有符号数
                                        //小数点前是[107:105]3位，这结果一定不会溢出
    output reg[info_width - 1:0]    info_out,
    output reg          invalid         //是否引发无效运算（若invalid=1则result无意义）
    );

    //Input/ExpSub流水线寄存器
    reg                     ie_op_a_sign;
    reg[exp_width:0]        ie_op_a_exp;
    reg[frac_width:0]       ie_op_a_frac;
    reg[`SPEF_CNT - 1:0]    ie_op_a_spef;
    reg                     ie_op_b_sign;
    reg[exp_width:0]        ie_op_b_exp;
    reg[frac_width:0]       ie_op_b_frac;
    reg[`SPEF_CNT - 1:0]    ie_op_b_spef;
    reg[info_width - 1:0]   ie_info;

    //ExpSub/preShift流水线寄存器
    reg[exp_width:0]   eps_exp;
    reg[$clog2(frac_width) - 1:0]   eps_subexp; //较小数右移位数
    reg[frac_width + 2:0]   eps_frac_a;
    reg[frac_width + 2:0]   eps_frac_b;     //52+3=55位尾数，小数点前3位，有符号，b为较小数
    reg[`SPEF_CNT - 1:0]    eps_a_spef;
    reg[`SPEF_CNT - 1:0]    eps_b_spef;
    reg[info_width - 1:0]   eps_info;

    //preShift/Add流水线寄存器
    reg[exp_width:0]    psa_exp;
    reg[frac_width + 2:0]   psa_frac_a;
    reg[frac_width + 2:0]   psa_frac_b;
    wire[frac_width + 2:0] addpsafrac=psa_frac_a + psa_frac_b;
    reg[frac_width:0]   psa_rest;           //较小数被右移出去的低位部分，结果尾数的低53位
    reg         psa_invalid;
    reg[info_width - 1:0]   psa_info;

    //Input
    always@(posedge clk) begin
        if(~resetn) begin
            ie_op_a_sign<=0;
            ie_op_a_exp<=0;
            ie_op_a_frac<=0;
            ie_op_a_spef<=0;
            ie_op_b_sign<=0;
            ie_op_b_exp<=0;
            ie_op_b_frac<=0;
            ie_op_b_spef<=0;
            ie_info<=0;
        end
        else begin
            if(flush)
                ie_info[0]<=0;
            else if(~a_wait)
                ie_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    ie_info[info_width - 1:1]<=info_in[info_width - 1:1];
                ie_op_a_sign<=op_a_sign;
                ie_op_a_exp<=op_a_exp;
                ie_op_a_frac<=op_a_frac;
                ie_op_a_spef<=op_a_spef;
                ie_op_b_sign<=op_b_sign;
                ie_op_b_exp<=op_b_exp;
                ie_op_b_frac<=op_b_frac;
                ie_op_b_spef<=op_b_spef;
            end
        end
    end

    //ExpSub
    wire[exp_width:0]   es_expa=ie_op_a_exp;
    wire[exp_width:0]   es_expb=ie_op_b_exp;
    wire[exp_width:0]   es_a_sub_b=es_expa - es_expb;
    wire[exp_width:0]   es_b_sub_a=es_expb - es_expa;
    wire        es_sela=es_b_sub_a[exp_width];
    wire[frac_width + 2:0]  es_fa={2'b0,ie_op_a_frac};
    wire[frac_width + 2:0]  es_fb={2'b0,ie_op_b_frac};
    wire[frac_width + 2:0]  es_fraca=ie_op_a_sign ? (0 - es_fa) : es_fa;
    wire[frac_width + 2:0]  es_fracb=ie_op_b_sign ? (0 - es_fb) : es_fb;
    always@(posedge clk) begin
        if(~resetn) begin
            eps_exp<=0;
            eps_frac_a<=0;
            eps_frac_b<=0;
            eps_info<=0;
            eps_subexp<=0;
            eps_a_spef<=0;
            eps_b_spef<=0;
        end
        else begin
            if(flush)
                eps_info[0]<=0;
            else if(~a_wait)
                eps_info[0]<=ie_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    eps_info[info_width - 1:1]<=ie_info[info_width - 1:1];
                eps_exp<=es_sela ? es_expa : es_expb;
                eps_subexp<=es_sela ? ((|es_a_sub_b[exp_width:$clog2(frac_width)]) ? ((1 << $clog2(frac_width)) - 1) : es_a_sub_b[$clog2(frac_width) - 1:0]) : 
                    ((|es_b_sub_a[exp_width:$clog2(frac_width)]) ? ((1 << $clog2(frac_width)) - 1) : es_b_sub_a[$clog2(frac_width) - 1:0]);
                eps_frac_a<=es_sela ? es_fraca : es_fracb;
                eps_frac_b<=es_sela ? es_fracb : es_fraca;
                eps_a_spef<=ie_op_a_spef;
                eps_b_spef<=ie_op_b_spef;
            end
        end
    end

    //preShift
    wire signed [frac_width + 2 + frac_width + 1:0] rsb={eps_frac_b,{(frac_width + 1){1'b0}}};
    wire[frac_width * 2 + 3:0] ps_shift=rsb >>> eps_subexp;
    always@(posedge clk) begin
        if(~resetn) begin
            psa_exp<=0;
            psa_frac_a<=0;
            psa_frac_b<=0;
            psa_info<=0;
            psa_invalid<=0;
            psa_rest<=0;
        end
        else begin
            if(flush)
                psa_info[0]<=0;
            else if(~a_wait)
                psa_info<=eps_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    psa_info[info_width - 1:1]<=eps_info[info_width - 1:1];
                psa_exp<=eps_exp;
                psa_frac_a<=eps_frac_a;
                psa_frac_b<=ps_shift[frac_width * 2 + 3:frac_width + 1];
                psa_rest<=ps_shift[frac_width:0];
                psa_invalid<=eps_a_spef[`SPEF_NAN] | eps_b_spef[`SPEF_NAN] | (eps_a_spef[`SPEF_INF] & eps_b_spef[`SPEF_INF] & (eps_frac_a[frac_width + 2] ^ eps_frac_b[frac_width + 2]));
            end
        end
    end

    //Add
    wire[exp_width:0] addpsaexp=psa_exp + ((1 << (exp_width - 1)) - 1);
    always@(posedge clk) begin
        if(~resetn) begin
            result_exp<=0;
            result_frac<=0;
            info_out<=0;
            invalid<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=psa_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=psa_info[info_width - 1:1];
                invalid<=psa_invalid;
                result_exp<={1'b0,addpsaexp};
                result_frac<={/*psa_frac_a + psa_frac_b*/addpsafrac,psa_rest};
            end
        end
    end

    assign busy=a_wait;         //TODO?

endmodule