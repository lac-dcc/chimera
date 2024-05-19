// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点比较器
*/

module f_comp(
    input           clk,
    input           resetn,
    input           flush,
    input           a_wait,
    output          busy,
    input           valid,
    input[63:0]     op_a,
    input[63:0]     op_b,
    input           opsng,              //操作数是否为single
    input[3:0]      cmp_cond,           //C.cond中的字段
    output reg      ready,
    output reg      invalid,
    output reg      result
    );

    reg             state;
    reg[`SPEF_CNT - 1:0]    spef_a;
    reg[`SPEF_CNT - 1:0]    spef_b;
    reg             exp_equ;
    reg             exp_a_gt;           //注意：对于exp的比较我们直接把sign也算进去，但是±0特殊，相等但可比较大小
    reg             frac_equ;
    reg             frac_a_gt;
    reg             signa;
    reg             signb;

    wire[`SPEF_CNT - 1:0]   spef_a_single;
    wire[`SPEF_CNT - 1:0]   spef_b_single;
    wire[`SPEF_CNT - 1:0]   spef_a_double;
    wire[`SPEF_CNT - 1:0]   spef_b_double;

    check_spef #(.exp_width(8),.frac_width(23)) cssa(
        .num(op_a[31:0]),.spef(spef_a_single)
    );
    check_spef #(.exp_width(8),.frac_width(23)) cssb(
        .num(op_b[31:0]),.spef(spef_b_single)
    );
    check_spef csda(
        .num(op_a),.spef(spef_a_double)
    );
    check_spef csdb(
        .num(op_b),.spef(spef_b_double)
    );
    
    always@(posedge clk) begin
        if(~resetn) begin
            state<=0;
            spef_a<=0;
            spef_b<=0;
            exp_equ<=0;
            exp_a_gt<=0;
            frac_equ<=0;
            frac_a_gt<=0;
            ready<=0;
            result<=0;
            invalid<=0;
            signa<=0;
            signb<=0;
        end
        else begin
            if(flush)
                state<=0;
            else if(~a_wait) begin
                if(state)
                    state<=0;
                else
                    state<=valid;
            end
            if(flush | ((~state) & ~a_wait))
                ready<=0;
            else if(state & ~a_wait)
                ready<=1;
            if((~state) & ~a_wait) begin
                spef_a<=opsng ? spef_a_single : spef_a_double;
                spef_b<=opsng ? spef_b_single : spef_b_double;
                exp_equ<=opsng ? 
                    ((op_a[31:23] == op_b[31:23]) | (spef_a_single[`SPEF_ZERO] & spef_b_single[`SPEF_ZERO])) : 
                    ((op_a[63:52] == op_b[63:52]) | (spef_a_double[`SPEF_ZERO] & spef_b_double[`SPEF_ZERO]));
                exp_a_gt<=opsng ? 
                    ($signed({op_a[31],op_a[31] ? (~op_a[30:23]) : op_a[30:23]}) > $signed({op_b[31],op_b[31] ? (~op_b[30:23]) : op_b[30:23]})) : 
                    ($signed({op_a[63],op_a[63] ? (~op_a[62:52]) : op_a[62:52]}) > $signed({op_b[63],op_b[63] ? (~op_b[62:52]) : op_b[62:52]}));
                frac_equ<=opsng ? (op_a[22:0] == op_b[22:0]) : (op_a[51:0] == op_b[51:0]);
                frac_a_gt<=opsng ? 
                    ($signed({op_a[31],op_a[31] ? (~op_a[22:0]) : op_a[22:0]}) > $signed({op_b[31],op_b[31] ? (~op_b[22:0]) : op_b[22:0]})) : 
                    ($signed({op_a[63],op_a[63] ? (~op_a[51:0]) : op_a[51:0]}) > $signed({op_b[63],op_b[63] ? (~op_b[51:0]) : op_b[51:0]}));
                signa<=opsng ? op_a[31] : op_a[63];
                signb<=opsng ? op_b[31] : op_b[63];
            end
            if(state & ~a_wait) begin
                invalid<=(spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN]) & cmp_cond[3];
                case(cmp_cond[2:0])
                0:  result<=0;
                1:  result<=spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN];
                2:  result<=exp_equ & frac_equ & ~(spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN]);
                3:  result<=(exp_equ & frac_equ) | spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN];
                4:  result<=((exp_equ & (~frac_a_gt) & ~frac_equ) | (signa & ~signb) | ((~exp_a_gt) & ~exp_equ)) & ~(spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN]);
                5:  result<=((exp_equ & (~frac_a_gt) & ~frac_equ) | (signa & ~signb) | ((~exp_a_gt) & ~exp_equ)) | spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN];
                6:  result<=((spef_a[`SPEF_ZERO] & spef_b[`SPEF_ZERO]) | (signa & ~signb) | (exp_equ & ~frac_a_gt) | ((~exp_a_gt) & ~exp_equ)) & ~(spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN]);
                7:  result<=((spef_a[`SPEF_ZERO] & spef_b[`SPEF_ZERO]) | (signa & ~signb) | (exp_equ & ~frac_a_gt) | ((~exp_a_gt) & ~exp_equ)) | spef_a[`SPEF_NAN] | spef_b[`SPEF_NAN];
                default:;
                endcase
            end
        end
    end

    assign busy=state;

endmodule