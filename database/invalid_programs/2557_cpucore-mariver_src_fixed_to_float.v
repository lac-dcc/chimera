// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    定点转浮点
*/

module fixed_to_float
    #(  parameter exp_width = 11,
        parameter frac_width = 52,
        parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           flush,
    input           a_wait,
    output          busy,
    input[31:0]     fixed_num,
    input[info_width - 1:0] info_in,
    output reg[info_width - 1:0]        info_out,
    output reg      result_sign,
    output reg[exp_width + 1:0]         result_exp,
    output reg[frac_width * 2 + 3:0]    result_frac
    );

    reg st0_sign;
    reg[31:0] st0_num;
    reg[info_width - 1:0] st0_info;
    
    reg st1_sign;
    reg[31:0] st1_num;  //移位后的
    reg[exp_width:0] st1_exp;
    reg[2:0] st1_subexp;
    reg[info_width - 1:0] st1_info;
    reg st1_zero;

    //st0
    always@(posedge clk) begin
        if(~resetn) begin
            st0_sign<=0;
            st0_num<=0;
            st0_info<=0;
        end
        else begin
            if(flush)
                st0_info[0]<=0;
            else if(~a_wait)
                st0_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st0_info[info_width - 1:1]<=info_in[info_width - 1:1];
                st0_sign<=fixed_num[31];
                st0_num<=fixed_num[31] ? (0 - fixed_num) : fixed_num;
            end
        end
    end

    //st1
    wire zero0=~(|st0_num[31:24]);
    wire zero1=~(|st0_num[23:16]);
    wire zero2=~(|st0_num[15:8]);
    wire zero3=~(|st0_num[7:0]);
    wire[2:0] subexps[0:3];
    genvar i;
    generate
        for(i = 24; i >= 0; i = i - 8) begin
            assign subexps[3 - i / 8]=(|st0_num[i + 7:i + 4]) ? (
                (|st0_num[i + 7:i + 6]) ? (st0_num[i + 7] ? 0 : 1) : (st0_num[i + 5] ? 2 : 3)) : (
                (|st0_num[i + 3:i + 2]) ? (st0_num[i + 3] ? 4 : 5) : (st0_num[i + 1] ? 6 : 7));
        end
    endgenerate
    always@(posedge clk) begin
        if(~resetn) begin
            st1_sign<=0;
            st1_num<=0;
            st1_exp<=0;
            st1_subexp<=0;
            st1_info<=0;
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
                st1_num<=(zero0 & zero1) ? (zero2 ? {st0_num[7:0],24'b0} : {st0_num[15:0],16'b0}) :
                    (zero0 ? {st0_num[23:0],8'b0} : st0_num);
                st1_exp<=(zero0 & zero1) ? (zero2 ? 24 : 16) : (zero0 ? 8 : 0);
                st1_subexp<=(zero0 & zero1) ? (zero2 ? subexps[3] : subexps[2]) :
                    (zero0 ? subexps[1] : subexps[0]);
                st1_zero<=zero0 & zero1 & zero2 & zero3;
            end
        end
    end

    //output
    wire[exp_width:0] tmpexp=(((1 << (exp_width - 1)) + 30) - st1_exp - st1_subexp);
    always@(posedge clk) begin
        if(~resetn) begin
            info_out<=0;
            result_sign<=0;
            result_exp<=0;
            result_frac<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=st1_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=st1_info[info_width - 1:1];
                result_sign<=st1_sign;
                result_exp<=st1_zero ? 0 : {1'b0,tmpexp}; 
                if(st1_zero)
                    result_frac<=0;
                else begin
                    case(st1_subexp)
                    0:  result_frac<={3'b001,st1_num[30:0],{(frac_width * 2 + 4 - 34){1'b0}}};
                    1:  result_frac<={3'b001,st1_num[29:0],{(frac_width * 2 + 4 - 33){1'b0}}};
                    2:  result_frac<={3'b001,st1_num[28:0],{(frac_width * 2 + 4 - 32){1'b0}}};
                    3:  result_frac<={3'b001,st1_num[27:0],{(frac_width * 2 + 4 - 31){1'b0}}};
                    4:  result_frac<={3'b001,st1_num[26:0],{(frac_width * 2 + 4 - 30){1'b0}}};
                    5:  result_frac<={3'b001,st1_num[25:0],{(frac_width * 2 + 4 - 29){1'b0}}};
                    6:  result_frac<={3'b001,st1_num[24:0],{(frac_width * 2 + 4 - 28){1'b0}}};
                    7:  result_frac<={3'b001,st1_num[23:0],{(frac_width * 2 + 4 - 27){1'b0}}};
                    default:;
                    endcase
                end
            end
        end
    end

    assign busy=a_wait;     //TODO?

endmodule 