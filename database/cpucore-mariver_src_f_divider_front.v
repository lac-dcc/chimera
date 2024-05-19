// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点除法器前端
*/

module frac_divider
    #(parameter frac_width = 53)    //包括小数点前的
    (
    input           clk,
    input           resetn,
    input           flush,
    input[frac_width - 1:0] op_a,   //x.xxxxx
    input[frac_width - 2:0] op_b,   //1.xxxxx，小数点前省略
    input           div_start,
    output          div_done,
    output[frac_width - 1:0]    div_result
    );

    reg[5:0]    state;
    reg[frac_width:0]       remain;     //由于要左移，rem留出1位
    reg[frac_width - 1:0]   q;

    wire[frac_width:0]      midres=remain - {2'b01,op_b};

    assign div_done=(state == 1);
    assign div_result=q;

    always@(posedge clk) begin
        if(~resetn) begin
            state<=0;
            remain<=0;
            q<=0;
        end
        else begin
            if(div_start | flush) begin
                state<=flush ? 0 : (frac_width + 1);
                q<=0;
                remain<={1'b0,op_a};
            end
            else if(|state) begin
                state<=state - 1;
                remain<=midres[frac_width] ? {remain[frac_width - 1:0],1'b0} : {midres[frac_width - 1:0],1'b0};
                q<={q[frac_width - 2:0],~midres[frac_width]};
            end
        end
    end

endmodule



module f_divider_front
    #(  parameter info_width = 1,
        parameter exp_width = 11,
        parameter frac_width = 52)
    (
    input           clk,
    input           resetn,
    input           a_wait,             //阻塞信号
    input           flush,              //flush有效时仅清除info[0]
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
    output          busy,
    //输出的是未经规格化的指数+长尾数
    output reg[exp_width + 1:0] result_exp, //结果指数多取2位
    output reg[frac_width * 2 + 3:0]    result_frac,    //结果尾数取52+3+52+1=108位，未舍入，unsigned
                                        //小数点前是[107:105]3位，这结果一定不会溢出
    output reg      result_sign,
    output reg[info_width - 1:0]    info_out,
    output reg          dividebyzero,   //是否引发除0（若=1则result无意义）
    output reg          invalid         //是否引发无效运算（若invalid=1则result无意义）
    );

    reg[2:0]    state;
    reg[info_width - 1:0]   info;
    reg[`SPEF_CNT - 1:0]    input_a_spef;
    reg[`SPEF_CNT - 1:0]    input_b_spef;
    reg[exp_width:0]    input_a_exp;
    reg[exp_width:0]    input_b_exp;
    reg[frac_width:0]   input_a_frac;
    reg[frac_width:0]   input_b_frac;
    reg         sign;
    reg[exp_width + 1:0]    exp;
    reg[frac_width:0]   b_frac;     //用于左移分母的

    wire        div_done;
    wire[frac_width:0]  div_result;
    frac_divider #(.frac_width(frac_width + 1))
        fd(.clk(clk),.resetn(resetn),.flush(flush),
            .op_a(input_a_frac),.op_b(b_frac[frac_width - 1:0]),
            .div_start(state == 2),.div_done(div_done),.div_result(div_result));
    
    wire e_inv=(input_a_spef[`SPEF_ZERO] & input_b_spef[`SPEF_ZERO]) | 
        (input_a_spef[`SPEF_INF] & input_b_spef[`SPEF_INF]) | input_a_spef[`SPEF_NAN] | input_b_spef[`SPEF_NAN];
    wire e_divby0=input_b_spef[`SPEF_ZERO] & (~input_a_spef[`SPEF_ZERO]) & (~input_a_spef[`SPEF_NAN]);

    assign busy=(|state) | a_wait;

    always@(posedge clk) begin
        if(~resetn) begin
            state<=0;
            info<=0;
            input_a_spef<=0;
            input_b_spef<=0;
            input_a_exp<=0;
            input_b_exp<=0;
            input_a_frac<=0;
            input_b_frac<=0;
            sign<=0;
            exp<=0;
            b_frac<=0;
        end
        else begin
            if(flush) begin
                state<=0;
                info[0]<=0;
            end
            else begin
                case(state)
                0:  state<=(a_wait | ~info_in[0]) ? 0 : 1;
                1:  state<=(e_inv | e_divby0) ? 0 : 3;
                2:  state<=4;
                3:  state<=b_frac[frac_width] ? 2 : 3;
                4:  state<=div_done ? 0 : 4;
                default:;
                endcase
                if((state == 0) & info_in[0] & ~a_wait)
                    info[0]<=1;
            end
            if((state == 0) & info_in[0] & ~a_wait) begin
                if(info_width > 1)
                    info[info_width - 1:1]<=info_in[info_width - 1:1];
                input_a_spef<=op_a_spef;
                input_b_spef<=op_b_spef;
                input_a_exp<=op_a_exp;
                input_b_exp<=op_b_exp;
                input_a_frac<=op_a_frac;
                input_b_frac<=op_b_frac;
                sign<=op_a_sign ^ op_b_sign;
            end
            //state=1时计算exp
            //state=2时调整exp
            if(state == 1)
                exp<=({input_a_exp[exp_width],input_a_exp} - {input_b_exp[exp_width],input_b_exp}) + ((1 << (exp_width - 1)) - 1);
            else if((state == /*2*/3) & ~b_frac[frac_width])
                exp<=exp + (
                    (~(|b_frac[frac_width:frac_width - 15])) ? 16 : (
                    (~(|b_frac[frac_width:frac_width - 7])) ? 8 : (
                        (~(|b_frac[frac_width:frac_width - 3])) ? 4 : (
                            b_frac[frac_width - 1] ? 1 : (
                                b_frac[frac_width - 2] ? 2 : 3)))));
            //左移分母
            if(state == 1)
                b_frac<=input_b_frac;
            else if((state == /*2*/3) & ~b_frac[frac_width])
                b_frac<=(~(|b_frac[frac_width:frac_width - 15])) ? {b_frac[frac_width - 16:0],16'b0} : (
                    (~(|b_frac[frac_width:frac_width - 7])) ? {b_frac[frac_width - 8:0],8'b0} : (
                        (~(|b_frac[frac_width:frac_width - 3])) ? {b_frac[frac_width - 4:0],4'b0} : (
                            b_frac[frac_width - 1] ? {b_frac[frac_width - 1:0],1'b0} : (
                                b_frac[frac_width - 2] ? {b_frac[frac_width - 2:0],2'b0} : {b_frac[frac_width - 3:0],3'b0}))));
            
        end
    end

    //结果输出
    wire res_out_en=((state == 1) & (e_divby0 | e_inv)) | ((state == 4) & div_done);
    always@(posedge clk) begin
        if(~resetn) begin
            result_exp<=0;
            result_frac<=0;
            result_sign<=0;
            info_out<=0;
            invalid<=0;
            dividebyzero<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if((~a_wait)) begin
                if(res_out_en)
                    info_out[0]<=info[0];
                else
                    info_out[0]<=0;
            end
            if((~a_wait) & res_out_en) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=info[info_width - 1:1];
                result_exp<=exp;
                result_frac<={2'b0,div_result,{(frac_width + 1){1'b0}}};
                result_sign<=sign;
                invalid<=(state == 1) & e_inv;
                dividebyzero<=(state == 1) & e_divby0;
            end
        end
    end

endmodule