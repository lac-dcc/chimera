// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点运算部件共用的舍入部件
    Note: 输入的一定是2^(exp-1023)*1.frac，exp甚至可以是负的
    最后，我们要同时生成single和double
*/

module f_round
    #(parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           a_wait,
    input           flush,
    output          busy,
    input[info_width - 1:0] info_in,
    input[107:0]    frac,       //一定是1.xxxx, [107:105].[104:0]，前两位一定都是0
    input[12:0]     exp,        //可能是负的
    input           sign,
    input           in_invalid,
    input           in_dividebyzero,
    input[1:0]      round_mode,
    input           fs,         //来自FCSR
    output reg[info_width - 1:0]    info_out,
    output reg[63:0]                result_double,
    output reg[31:0]                result_single,
    output reg      overflow_double,
    output reg      overflow_single,
    output reg      underflow_double,
    output reg      underflow_single,
    output reg      invalid,
    output reg      dividebyzero                
    );

    reg[info_width - 1:0]   st0_info;
    reg[12:0]               st0_exp_double;
    reg[12:0]               st0_negexp_double;
    reg[12:0]               st0_exp_single;
    reg[12:0]               st0_negexp_single;
    reg                     st0_sign;
    reg                     st0_invalid;
    reg                     st0_dividebyzero;
    reg[107:0]              st0_frac;

    reg[info_width - 1:0]   st1_info;
    reg[10:0]               st1_exp_double;     //真正的机器数，尽管之后还可能+1
    reg[7:0]                st1_exp_single;
    reg[52:0]               st1_frac_double;    //带上小数点前1位，据此判断是否非规格化数
    reg[1:0]                st1_frac_double_rest;
    reg[23:0]               st1_frac_single;
    reg[1:0]                st1_frac_single_rest;
    reg                     st1_sign;
    reg                     st1_overflow_single;//舍入只会令绝对值变大，之前检测的上溢一定还是有效的
    reg                     st1_overflow_double;
    reg                     st1_invalid;
    reg                     st1_dividebyzero;
    reg                     st1_zero;

    //st0
    wire[12:0] singleexp=exp - 896;
    always@(posedge clk) begin
        if(~resetn) begin
            st0_info<=0;
            st0_exp_double<=0;
            st0_negexp_double<=0;
            st0_exp_single<=0;
            st0_negexp_single<=0;
            st0_sign<=0;
            st0_invalid<=0;
            st0_dividebyzero<=0;
            st0_frac<=0;
        end
        else begin
            if(flush)
                st0_info[0]<=0;
            else if(~a_wait)
                st0_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st0_info[info_width - 1:1]<=info_in[info_width - 1:1];
                st0_sign<=sign;
                st0_invalid<=in_invalid;
                st0_dividebyzero<=in_dividebyzero;
                st0_frac<=frac;
                st0_exp_double<=(exp[12] | ~(|exp)) ? (exp - 1) : exp;  //若exp<=0，要令exp--，使得frac多右移1位才能使exp=0
                st0_negexp_double<=1 - exp;     //若exp>0，那么negexp没用，否则negexp一定为-(exp-1)
                st0_exp_single<=(singleexp[12] | ~(|singleexp)) ? (exp - 897) : singleexp;
                st0_negexp_single<=897 - exp;
            end
        end
    end

    //st1
    wire[116:0] double_frac_shifted={st0_frac[105:53],64'b0} >> st0_negexp_double[5:0];
    //Note: 移位时仅取尾数前53位（后面的一定会被移出去，仅关心是否全0）
    //为了不造成信息损失，在后面补64位，当然也只关心末63位是否为全0
    wire[55:0] single_frac_shifted={st0_frac[105:82],32'b0} >> st0_negexp_single[4:0];
    //同理，single补32位
    always@(posedge clk) begin
        if(~resetn) begin
            st1_info<=0;
            st1_exp_double<=0;
            st1_exp_single<=0;
            st1_frac_double<=0;
            st1_frac_double_rest<=0;
            st1_frac_single<=0;
            st1_frac_single_rest<=0;
            st1_sign<=0;
            st1_overflow_single<=0;
            st1_overflow_double<=0;
            st1_invalid<=0;
            st1_dividebyzero<=0;
            st1_zero<=0;
        end
        else begin
            if(flush)
                st1_info[0]<=0;
            else if(~a_wait)
                st1_info[0]<=st0_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st1_info[info_width - 1:1]<=st0_info[info_width - 1:1];
                st1_sign<=st0_sign;
                st1_invalid<=st0_invalid;
                st1_dividebyzero<=st0_dividebyzero;
                st1_exp_double<=st0_exp_double[12] ? 0 : st0_exp_double[10:0];
                //Note: 若overflow，exp就不用管了，反正最后直接取常数
                st1_exp_single<=st0_exp_single[12] ? 0 : st0_exp_single[7:0];
                st1_overflow_double<=(~st0_exp_double[12]) & ((&st0_exp_double[10:0]) | st0_exp_double[11]);
                st1_overflow_single<=(~st0_exp_single[12]) & ((&st0_exp_single[7:0]) | (|st0_exp_single[11:8]));
                st1_frac_double<=st0_exp_double[12] ? ((|st0_negexp_double[11:6]) ? 0 : double_frac_shifted[116:64]) : st0_frac[105:53];
                st1_frac_double_rest[1]<=st0_exp_double[12] ? ((|st0_negexp_double[11:6]) ? 0 : double_frac_shifted[63]) : st0_frac[52];
                st1_frac_double_rest[0]<=st0_exp_double[12] ? ((|st0_negexp_double[11:6]) ? (|st0_frac) : ((|st0_frac[52:0]) | (|double_frac_shifted[62:0]))) : (|st0_frac[51:0]);
                st1_frac_single<=st0_exp_single[12] ? ((|st0_negexp_single[11:5]) ? 0 : single_frac_shifted[55:32]) : st0_frac[105:82];
                st1_frac_single_rest[1]<=st0_exp_single[12] ? ((|st0_negexp_single[11:5]) ? 0 : single_frac_shifted[31]) : st0_frac[81];
                st1_frac_single_rest[0]<=st0_exp_single[12] ? ((|st0_negexp_single[11:5]) ? (|st0_frac) : ((|st0_frac[81:0]) | (|single_frac_shifted[30:0]))) : (|st0_frac[80:0]);
                st1_zero<=~(|st0_frac);
            end
        end
    end

    //output
    reg should_carry_single;
    reg should_carry_double;
    always@(*) begin
        case(round_mode)
        `ROUND_NEAR:    should_carry_single=st1_frac_single_rest[1] & (st1_frac_single_rest[0] | st1_frac_single[0]);
        `ROUND_ZERO:    should_carry_single=0;
        `ROUND_CEIL:    should_carry_single=(~st1_sign) & (|st1_frac_single_rest);
        `ROUND_FLOOR:   should_carry_single=st1_sign & (|st1_frac_single_rest);
        default:;
        endcase
    end
    always@(*) begin
        case(round_mode)
        `ROUND_NEAR:    should_carry_double=st1_frac_double_rest[1] & (st1_frac_double_rest[0] | st1_frac_double[0]);
        `ROUND_ZERO:    should_carry_double=0;
        `ROUND_CEIL:    should_carry_double=(~st1_sign) & (|st1_frac_double_rest);
        `ROUND_FLOOR:   should_carry_double=st1_sign & (|st1_frac_double_rest);
        default:;
        endcase
    end
    //Note: 末尾+1后可能导致exp++，甚至可能导致非规格变成规格
    wire cf_single=should_carry_single & (&st1_frac_single[22:0]);
    wire cf_double=should_carry_double & (&st1_frac_double[51:0]);
    wire[8:0] real_exp_single=cf_single ? ({1'b0,st1_exp_single} + 1) : {1'b0,st1_exp_single};
    wire[11:0] real_exp_double=cf_double ? ({1'b0,st1_exp_double} + 1) : {1'b0,st1_exp_double};
    wire real_overflow_single=st1_overflow_single | (cf_single & (&st1_exp_single[7:1]));
    wire real_overflow_double=st1_overflow_double | (cf_double & (&st1_exp_double[10:1]));
    wire[22:0] real_frac_single=should_carry_single ? (st1_frac_single[22:0] + 1) : st1_frac_single[22:0];
    wire[51:0] real_frac_double=should_carry_double ? (st1_frac_double[51:0] + 1) : st1_frac_double[51:0];
    //Note: 即便是进位需要右移1位，但这种情况下小数点后尾数一定是0，无需特殊处理
    //非规格变成规格也无需特殊处理，此时exp已经正常变成1，小数点前也变成1，没有任何问题

    //注意：对于0，我们应该特殊处理，它不应该引起underflow，并且它的exp必须是0
    //但是输入的frac=0即可表示0，输入的exp并没有这个保证
    always@(posedge clk) begin
        if(~resetn) begin
            info_out<=0;
            result_double<=0;
            result_single<=0;
            overflow_double<=0;
            overflow_single<=0;
            underflow_double<=0;
            underflow_single<=0;
            invalid<=0;
            dividebyzero<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=st1_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=st1_info[info_width - 1:1];
                overflow_single<=real_overflow_single & (~st1_zero) & (~st1_dividebyzero) & (~st1_invalid);
                overflow_double<=real_overflow_double & (~st1_zero) & (~st1_dividebyzero) & (~st1_invalid);
                invalid<=st1_invalid;
                dividebyzero<=st1_dividebyzero & (~st1_invalid);
                underflow_single<=(~(|real_exp_single)) & (~st1_zero) & (~st1_invalid);
                underflow_double<=(~(|real_exp_double)) & (~st1_zero) & (~st1_invalid);
                result_single<=(st1_invalid | real_overflow_single | st1_dividebyzero | st1_zero) ? 
                    (st1_invalid ? 32'h7fbfffff : {st1_sign,(st1_zero & ~st1_dividebyzero) ? 31'h0 : 31'h7f800000}) :
                    {st1_sign,real_exp_single[7:0],(fs & (~(|real_exp_single))) ? 23'b0 : real_frac_single};
                result_double<=(st1_invalid | real_overflow_double | st1_dividebyzero | st1_zero) ?
                    (st1_invalid ? 64'h7ff7ffffffffffff : {st1_sign,(st1_zero & ~st1_dividebyzero) ? 63'h0 : 63'h7ff0000000000000}) :
                    {st1_sign,real_exp_double[10:0],(fs & (~(|real_exp_double))) ? 52'b0 : real_frac_double};
            end
        end
    end

    assign busy=a_wait;     //TODO?

endmodule