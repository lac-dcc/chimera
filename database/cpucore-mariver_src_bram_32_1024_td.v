// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    32b*1024 BRAM，2读2写端口，支持字节写，保证无读写冲突
*/

module bram_32_1024_td(
    input           clk,
    input           resetn,
    input[9:0]      addr0,
    input[3:0]      wen0,
    input           rden0,
    output[31:0]     rdata0,
    input[31:0]    wdata0,
    input[9:0]      addr1,
    input[3:0]      wen1,
    output[31:0]     rdata1,
    input[31:0]    wdata1
    );

    reg[3:0] tmp_wen1;
    reg[31:0] tmp_wdata1;
    wire[31:0] tmp_rdata0;

    bram_td bt(
        .clka(clk),
        .clkb(clk),
        .addra(addr0),
        .addrb(addr1),
        .ena(rden0 | (|wen0)),
        .wea(wen0),
        .web(wen1),
        .dina(wdata0),
        .douta(tmp_rdata0),
        .dinb(wdata1),
        .doutb(rdata1)
    );

    always@(posedge clk) begin
        if(~resetn) begin
            tmp_wen1<=0;
            tmp_wdata1<=0;
        end
        else if(rden0) begin
            if(addr0 == addr1) begin
                tmp_wen1<=wen1;
                tmp_wdata1<=wdata1;
            end
            else begin
                tmp_wen1<=0;
                tmp_wdata1<=0;
            end
        end
    end

    assign rdata0={
        tmp_wen1[3] ? tmp_wdata1[31:24] : tmp_rdata0[31:24],
        tmp_wen1[2] ? tmp_wdata1[23:16] : tmp_rdata0[23:16],
        tmp_wen1[1] ? tmp_wdata1[15:8] : tmp_rdata0[15:8],
        tmp_wen1[0] ? tmp_wdata1[7:0] : tmp_rdata0[7:0]
    };
        

endmodule