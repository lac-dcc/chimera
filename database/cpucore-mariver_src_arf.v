// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

/*
    By ywy_c_asm
    ARF寄存器组
*/

module arf(
    input           clk,
    input           resetn,
    //4个读端口
    input[4:0]      raddr0,
    output[31:0]    rdata0,
    input[4:0]      raddr1,
    output[31:0]    rdata1,
    input[4:0]      raddr2,
    output[31:0]    rdata2,
    input[4:0]      raddr3,
    output[31:0]    rdata3,
    //2个并行写端口（写端口1优先）
    input[4:0]      waddr0,
    input           wen0,
    input[31:0]     wdata0,
    input[4:0]      waddr1,
    input           wen1,
    input[31:0]     wdata1
    );

    reg[31:0] arf0[0:31];
    assign rdata0=arf0[raddr0];
    assign rdata1=arf0[raddr1];
    assign rdata2=arf0[raddr2];
    assign rdata3=arf0[raddr3];
    genvar i;
    generate
        for(i=1; i < 32; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    arf0[i]<=0;
                end
                else if((wen0 & (waddr0 == i)) | (wen1 & (waddr1 == i))) begin
                    arf0[i]<=(wen1 & (waddr1 == i)) ? wdata1 : wdata0;
                end
            end
        end
    endgenerate
    always@(posedge clk) begin
        if(~resetn) begin
            arf0[0]<=0;
        end
    end
    
endmodule