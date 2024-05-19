// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点的一些基本处理逻辑
*/

module check_spef       //检查特殊浮点数
    #(  parameter exp_width = 11,
        parameter frac_width = 52)
    (
    input[exp_width + frac_width:0] num,
    output[`SPEF_CNT - 1:0]         spef
    );

    assign spef[`SPEF_ZERO]=~(|num[exp_width + frac_width - 1:0]);
    assign spef[`SPEF_DENORM]=~(|num[exp_width + frac_width - 1:frac_width]);
    assign spef[`SPEF_INF]=(&num[exp_width + frac_width - 1:frac_width]) & ~(|num[frac_width - 1:0]);
    assign spef[`SPEF_NAN]=(&num[exp_width + frac_width - 1:frac_width]) & (|num[frac_width - 1:0]);

endmodule


module clz_16(          //数前导0
    input[15:0]     din,    
    output[3:0]     dout    //仅考虑din!=0的情况，[0,15]个0
    );
    wire w15_8_0=~(|din[15:8]);
    wire w15_12_0=~(|din[15:12]);
    wire w7_4_0=~(|din[7:4]);
    wire[1:0] c15_12=(|din[15:14]) ? (din[15] ? 0 : 1) : (din[13] ? 2 : 3);
    wire[1:0] c11_8=(|din[11:10]) ? (din[11] ? 0 : 1) : (din[9] ? 2 : 3);
    wire[1:0] c7_4=(|din[7:6]) ? (din[7] ? 0 : 1) : (din[5] ? 2 : 3);
    wire[1:0] c3_0=(|din[3:2]) ? (din[3] ? 0 : 1) : (din[1] ? 2 : 3);
    assign dout={
        w15_8_0,
        w15_8_0 ? w7_4_0 : w15_12_0,
        w15_8_0 ? (w7_4_0 ? c3_0 : c7_4) : (w15_12_0 ? c11_8 : c15_12)
    };
endmodule


module float_prepare(
    input[63:0]     num,            //若为single则低32位有效
    input           single_en,
    output          sign,
    output[11:0]    exp,            //多1位
    output[52:0]    frac,           //0/1.xxxxx
    output[`SPEF_CNT - 1:0] spef
    );

    wire[`SPEF_CNT - 1:0]   spef_single;
    wire[`SPEF_CNT - 1:0]   spef_double;
    assign spef_single[`SPEF_ZERO]=~(|num[30:0]);
    assign spef_single[`SPEF_DENORM]=~(|num[30:23]);
    assign spef_single[`SPEF_INF]=(&num[30:23]) & ~(|num[22:0]);
    assign spef_single[`SPEF_NAN]=(&num[30:23]) & (|num[22:0]);
    assign spef_double[`SPEF_ZERO]=~(|num[62:0]);
    assign spef_double[`SPEF_DENORM]=~(|num[62:52]);
    assign spef_double[`SPEF_INF]=(&num[62:52]) & ~(|num[51:0]);
    assign spef_double[`SPEF_NAN]=(&num[62:52]) & (|num[51:0]);

    wire[11:0] exp_single=(spef_single[`SPEF_DENORM] | spef_single[`SPEF_INF]) ? (spef_single[`SPEF_DENORM] ? -126 : 1024) : ({4'b0,num[30:23]} - 127);
    wire[11:0] exp_double=spef_double[`SPEF_DENORM] ? -1022 : ({1'b0,num[62:52]} - 1023);

    wire[52:0] frac_single={~spef_single[`SPEF_DENORM],num[22:0],29'b0};
    wire[52:0] frac_double={~spef_double[`SPEF_DENORM],num[51:0]};

    wire sign_single=num[31];
    wire sign_double=num[63];

    assign sign=single_en ? sign_single : sign_double;
    assign exp=single_en ? exp_single : exp_double;
    assign frac=single_en ? frac_single : frac_double;
    assign spef=single_en ? spef_single : spef_double;

endmodule