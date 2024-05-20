// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module RegsMemWb(
    input clk, rst,
    input wbEnIn, memREnIn,
    input [31:0] aluResIn, memDataIn,
    input [3:0] destIn,
    input freeze,
    output wbEnOut, memREnOut,
    output [31:0] aluResOut, memDataOut,
    output [3:0] destOut
);
    Register #(1) wbEnReg(
        .clk(clk), .rst(rst),
        .in(wbEnIn), .ld(~freeze), .clr(1'b0),
        .out(wbEnOut)
    );

    Register #(1) memREnReg(
        .clk(clk), .rst(rst),
        .in(memREnIn), .ld(~freeze), .clr(1'b0),
        .out(memREnOut)
    );

    Register #(32) aluResReg(
        .clk(clk), .rst(rst),
        .in(aluResIn), .ld(~freeze), .clr(1'b0),
        .out(aluResOut)
    );

    Register #(32) memDataReg(
        .clk(clk), .rst(rst),
        .in(memDataIn), .ld(~freeze), .clr(1'b0),
        .out(memDataOut)
    );

    Register #(4) destReg(
        .clk(clk), .rst(rst),
        .in(destIn), .ld(~freeze), .clr(1'b0),
        .out(destOut)
    );
endmodule
