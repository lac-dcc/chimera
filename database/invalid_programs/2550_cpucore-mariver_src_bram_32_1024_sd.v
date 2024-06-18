// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    32b*1024 BRAM，一读一写端口，需要自动处理读写冲突
*/

module bram_32_1024_sd(
    input           clk,
    input           resetn,
    input[9:0]      raddr,
    input[9:0]      waddr,
    input           rden,
    input           wen,
    input[31:0]     wdata,
    output[31:0]    rdata
    );

    /*reg[31:0] catchdata;
    reg iscatched;
    always@(posedge clk) begin
        if(~resetn) begin
            catchdata<=0;
            iscatched<=0;
        end
        else begin
            if(rden) begin
                iscatched<=wen & (raddr == waddr);
                catchdata<=wdata;
            end
        end
    end

    wire[31:0] bram_rdata;
    assign rdata=iscatched ? catchdata : bram_rdata;*/
    
    bram_sd bs(
        .clka(clk),
        .clkb(clk),
        .addra(waddr),
        .dina(wdata),
        .wea(wen),
        .addrb(raddr),
        .enb(rden),
        .doutb(rdata)
    );

endmodule