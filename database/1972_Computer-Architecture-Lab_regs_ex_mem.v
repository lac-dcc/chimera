// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module RegsExMem(
    input clk, rst,
    input wbEnIn, memREnIn, memWEnIn,
    input [31:0] aluResIn, valRmIn,
    input [3:0] destIn,
    input freeze,
    output wbEnOut, memREnOut, memWEnOut,
    output [31:0] aluResOut, valRmOut,
    output [3:0] destOut
);
    Register #(1) wbEn(
        .clk(clk), .rst(rst),
        .in(wbEnIn), .ld(~freeze), .clr(1'b0),
        .out(wbEnOut)
    );

    Register #(1) memREn(
        .clk(clk), .rst(rst),
        .in(memREnIn), .ld(~freeze), .clr(1'b0),
        .out(memREnOut)
    );

    Register #(1) memWEn(
        .clk(clk), .rst(rst),
        .in(memWEnIn), .ld(~freeze), .clr(1'b0),
        .out(memWEnOut)
    );

    Register #(32) aluRes(
        .clk(clk), .rst(rst),
        .in(aluResIn), .ld(~freeze), .clr(1'b0),
        .out(aluResOut)
    );

    Register #(32) valRm(
        .clk(clk), .rst(rst),
        .in(valRmIn), .ld(~freeze), .clr(1'b0),
        .out(valRmOut)
    );

    Register #(4) dest(
        .clk(clk), .rst(rst),
        .in(destIn), .ld(~freeze), .clr(1'b0),
        .out(destOut)
    );
endmodule
