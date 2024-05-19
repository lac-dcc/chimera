// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点开根器前端
*/

module f_sqrter_front
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
    input                   op_a_sign,
    input[exp_width:0]      op_a_exp,
    input[frac_width:0]     op_a_frac,
    input[info_width - 1:0] info_in,    //指令附加信息，与运算无关，随流水线流动
    //输出的是未经规格化的指数+长尾数
    output reg[exp_width + 1:0] result_exp,     //结果指数多取2位
    output reg[frac_width * 2 + 3:0]    result_frac,    //结果尾数取52+3+52+1=108位，未舍入，有符号数
                                        //小数点前是[107:105]3位，这结果一定不会溢出
    output reg[info_width - 1:0]    info_out,
    output reg          invalid         //是否引发无效运算（若invalid=1则result无意义）
    );

    reg[5:0] state;
    reg[info_width - 1:0] info;
    reg[exp_width:0] input_exp;
    reg input_sign;
    reg[frac_width + 1:0] input_frac;
    reg[frac_width + 1:0] rest_x;
    reg[frac_width + 1:0] d;
    reg[frac_width + 1:0] result_c;
    reg[frac_width + 1:0] c_plus_d;
    reg[frac_width + 1:0] c_2_plus_d;

    wire[frac_width + 2:0] x_c_plus_d={1'b0,rest_x} - {1'b0,c_plus_d};
    always@(posedge clk) begin
        if(~resetn) begin
            state<=0;
            info<=0;
            input_frac<=0;
            rest_x<=0;
            d<=0;
            result_c<=0;
            c_plus_d<=0;
            c_2_plus_d<=0;
            result_exp<=0;
            result_frac<=0;
            info_out<=0;
            invalid<=0;
            input_sign<=0;
        end
        else begin
            c_plus_d<=result_c + d;
            c_2_plus_d<={1'b0,result_c[frac_width + 1:1]} + d;
            if(flush) begin
                info[0]<=0;
                state<=0;
            end
            else if(~a_wait) begin
                if(state == 0)
                    info[0]<=info_in[0];
                if(state == 0)
                    state<=info_in[0] ? 55 : 0;
                else
                    state<=state - 1;
            end
            if(~a_wait) begin
                input_frac<={1'b0,op_a_frac};
                if(state == 0) begin
                    info[info_width - 1:1]<=info_in[info_width - 1:1];
                    input_sign<=op_a_sign;
                    input_exp<=op_a_exp;
                    invalid<=input_sign;
                    info_out[info_width - 1:1]<=info[info_width - 1:1];
                    info_out[0]<=info[0];
                    result_exp<={{2{input_exp[exp_width]}},input_exp[exp_width:1]} + 1023;
                    result_frac<={2'b0,result_c[26:0],{(frac_width * 2 + 4 - 29){1'b0}}};
                end
                else
                    info_out[0]<=0;
                if(state == 55) begin
                    d<={2'b01,52'b00};
                    result_c<=0;
                    rest_x<=(~input_exp[0]) ? input_frac : {input_frac[frac_width:0],1'b0};
                end
                else if(state[0]) begin
                    d<={2'b00,d[53:2]};
                    result_c<=x_c_plus_d[frac_width + 2] ? {1'b0,result_c[frac_width + 1:1]} : c_2_plus_d;
                    rest_x<=x_c_plus_d[frac_width + 2] ? rest_x : x_c_plus_d[frac_width + 1:0];
                end 
            end
        end
    end

    assign busy=(|state) | a_wait;

endmodule