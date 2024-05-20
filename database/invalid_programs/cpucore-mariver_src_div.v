// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    除法器
*/

module div(
    input           clk,
    input           resetn,
    input           flush,      //来自Commit
    input[31:0]     A,
    input[31:0]     B,
    input           signed_en,
    input           start,      //若start且不busy，则读取操作数并开始
    output          busy,
    output          done,       //仅生效一个周期，且这个周期后busy才拉低
    output[31:0]    q,          //商
    output[31:0]    rem         //余数
    );

    //原始数据
    reg[63:0] remain;       //剩余的被除数
    reg[63:0] divb;         //不断右移的除数
    reg[31:0] result;       //商
    reg is_q_neg;           //商是否需要取反
    reg is_rem_neg;         //余数是否需要取反
    reg[5:0] state;         //状态（0-空闲，1~32-作除法时的i）
    reg reg_done;
    assign done=reg_done;
    assign q=is_q_neg ? (-result) : result;
    assign rem=is_rem_neg ? (-remain[31:0]) : remain[31:0];

    wire[63:0] midres=remain - divb;

    wire f16_0=(~(|A[31:16])) & ~(|B[31:16]);
    wire f24_0=(~(|A[31:8])) & ~(|B[31:8]);
    wire f28_0=(~(|A[31:4])) & ~(|B[31:4]);

    always@(posedge clk) begin
        if(~resetn) begin
            remain<=0;
            divb<=0;
            is_q_neg<=0;
            is_rem_neg<=0;
            result<=0;
            reg_done<=0;
        end
        else begin
            if(state == 0) begin
                result<=0;
                remain<={32'b0,(A[31] & signed_en) ? (-A) : A};
                divb<=f28_0 ? {29'b0,B,3'b0} : (
                    f24_0 ? {25'b0,B,7'b0} : (
                    f16_0 ? {17'b0,B,15'b0} : {1'b0,(B[31] & signed_en) ? (-B) : B,31'b0}));
                is_rem_neg<=A[31] & signed_en;
                is_q_neg<=(A[31] ^ B[31]) & signed_en;
                reg_done<=0;
            end
            else begin
                reg_done<=(state == 1);
                result<={result[30:0],~midres[63]};
                remain<=midres[63] ? remain : midres;
                divb<={1'b0,divb[63:1]};
            end
        end
    end

    

    always@(posedge clk) begin
        if(~resetn)
            state<=0;
        else if(flush)
            state<=0;
        else if(state == 0)
            state<=start ? {f28_0 ? 4 : (f24_0 ? 8 : (f16_0 ? 16 : 32))} : 0;
        else
            state<=state - 1;
    end

    assign busy=(state != 0);

endmodule