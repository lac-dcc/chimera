// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点转定点
*/

module float_to_fixed
    #(  parameter exp_width = 11,
        parameter frac_width = 52,
        parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           flush,
    input           a_wait,
    output          busy,
    //input[exp_width + frac_width:0] float_num,
    input           float_sign,
    input[exp_width:0]              float_exp,
    input[frac_width:0]             float_frac,
    input[`SPEF_CNT - 1:0]          float_spef,
    input[info_width - 1:0]         info_in,
    input[1:0]                      round_mode,
    output reg[info_width - 1:0]    info_out,
    output reg[31:0]                result,
    output reg                      invalid
    );

    reg[1:0]    st0_round_mode;
    reg[info_width - 1:0]   st0_info;
    reg         st0_sign;
    reg[frac_width - 1:0]   st0_frac;
    reg[exp_width - 1:0]    st0_exp;
    reg         st0_zero;

    reg[1:0]    st1_round_mode;
    reg[info_width - 1:0]   st1_info;
    reg         st1_sign;
    reg         st1_invalid;
    reg[32:0]   st1_frac_int;   //多留1位防止溢出
    reg[1:0]    st1_frac_rest;

    reg[info_width - 1:0]   st2_info;
    reg         st2_sign;
    reg         st2_invalid;
    reg[32:0]   st2_frac_int;

    //st0
    always@(posedge clk) begin
        if(~resetn) begin
            st0_round_mode<=0;
            st0_info<=0;
            st0_sign<=0;
            st0_frac<=0;
            st0_exp<=0;
            st0_zero<=0;
        end
        else begin
            if(flush)
                st0_info[0]<=0;
            else if(~a_wait)
                st0_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st0_info[info_width - 1:1]<=info_in[info_width - 1:1];
                st0_round_mode<=round_mode;
                st0_sign<=float_sign;
                st0_frac<=float_frac[frac_width - 1:0];
                st0_exp<=float_exp[exp_width - 1:0];
                st0_zero<=float_spef[`SPEF_ZERO];
            end
        end
    end

    //st1
    wire[frac_width + 32:0] shifted={33'd1,st0_frac} << st0_exp[4:0];
    always@(posedge clk) begin
        if(~resetn) begin
            st1_round_mode<=0;
            st1_info<=0;
            st1_sign<=0;
            st1_invalid<=0;
            st1_frac_int<=0;
            st1_frac_rest<=0;
        end
        else begin
            if(flush)
                st1_info[0]<=0;
            else if(~a_wait)
                st1_info[0]<=st0_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st1_info[info_width - 1:1]<=st0_info[info_width - 1:1];
                st1_round_mode<=st0_round_mode;
                st1_sign<=st0_sign;
                st1_invalid<=(|st0_exp[exp_width - 1:5]) & ((~st0_exp[exp_width - 1]) | ~(|st0_exp[exp_width - 2:0]));
                st1_frac_int<=(st0_zero | st0_exp[exp_width - 1]) ? 0 : shifted[frac_width + 32:frac_width];
                st1_frac_rest<=st0_zero ? 0 : ((&st0_exp) ? {1'b1,|st0_frac} : (st0_exp[exp_width - 1] ? 2'b01 : {shifted[frac_width - 1],|shifted[frac_width - 2:0]}));
            end
        end
    end

    //st2
    wire[32:0] add1=st1_frac_int + 1;
    reg should_carry;
    always@(*) begin
        case(st1_round_mode)
        `ROUND_NEAR:    should_carry=st1_frac_rest[1] & (st1_frac_rest[0] | st1_frac_int[0]);
        `ROUND_ZERO:    should_carry=0;
        `ROUND_CEIL:    should_carry=((~st1_sign) & (|st1_frac_rest));
        `ROUND_FLOOR:   should_carry=st1_sign & (|st1_frac_rest);
        default:;
        endcase
    end
    always@(posedge clk) begin
        if(~resetn) begin
            st2_info<=0;
            st2_sign<=0;
            st2_invalid<=0;
            st2_frac_int<=0;
        end
        else begin
            if(flush)
                st2_info[0]<=0;
            else if(~a_wait)
                st2_info[0]<=st1_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st2_info[info_width - 1:1]<=st1_info[info_width - 1:1];
                st2_sign<=st1_sign;
                st2_invalid<=st1_invalid;
                st2_frac_int<=should_carry ? add1 : st1_frac_int;
            end
        end
    end

    //output
    assign inv=st2_invalid | st2_frac_int[32] | (st2_frac_int[31] & ((|st2_frac_int[30:0]) | ~st2_sign));
    always@(posedge clk) begin
        if(~resetn) begin
            info_out<=0;
            result<=0;
            invalid<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=st2_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=st2_info[info_width - 1:1];
                invalid<=inv;
                result<=inv ? 32'h7fffffff : (st2_sign ? (0 - st2_frac_int[31:0]) : st2_frac_int[31:0]);
            end
        end
    end

    assign busy=a_wait;             //TODO?

endmodule