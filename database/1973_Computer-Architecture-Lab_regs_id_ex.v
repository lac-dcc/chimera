// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module RegsIdEx(
    input clk, rst,
    input [31:0] pcIn,
    input [3:0] aluCmdIn,
    input memReadIn, memWriteIn, wbEnIn, branchIn, sIn,
    input [31:0] reg1In, reg2In,
    input immIn,
    input [11:0] shiftOperandIn,
    input signed [23:0] imm24In,
    input [3:0] destIn,
    input carryIn,
    input [3:0] src1In, src2In,
    input flush, freeze,
    output [31:0] pcOut,
    output [3:0] aluCmdOut,
    output memReadOut, memWriteOut, wbEnOut, branchOut, sOut,
    output [31:0] reg1Out, reg2Out,
    output immOut,
    output [11:0] shiftOperandOut,
    output signed [23:0] imm24Out,
    output [3:0] destOut,
    output [3:0] src1Out, src2Out,
    output carryOut
);
    Register #(32) pcReg(
        .clk(clk), .rst(rst),
        .in(pcIn), .ld(~freeze), .clr(flush),
        .out(pcOut)
    );

    Register #(4) aluCmdReg(
        .clk(clk), .rst(rst),
        .in(aluCmdIn), .ld(~freeze), .clr(flush),
        .out(aluCmdOut)
    );

    Register #(1) memReadReg(
        .clk(clk), .rst(rst),
        .in(memReadIn), .ld(~freeze), .clr(flush),
        .out(memReadOut)
    );
    Register #(1) memWriteReg(
        .clk(clk), .rst(rst),
        .in(memWriteIn), .ld(~freeze), .clr(flush),
        .out(memWriteOut)
    );
    Register #(1) wbEnReg(
        .clk(clk), .rst(rst),
        .in(wbEnIn), .ld(~freeze), .clr(flush),
        .out(wbEnOut)
    );
    Register #(1) branchReg(
        .clk(clk), .rst(rst),
        .in(branchIn), .ld(~freeze), .clr(flush),
        .out(branchOut)
    );
    Register #(1) sReg(
        .clk(clk), .rst(rst),
        .in(sIn), .ld(~freeze), .clr(flush),
        .out(sOut)
    );

    Register #(32) reg1Reg(
        .clk(clk), .rst(rst),
        .in(reg1In), .ld(~freeze), .clr(flush),
        .out(reg1Out)
    );

    Register #(32) reg2Reg(
        .clk(clk), .rst(rst),
        .in(reg2In), .ld(~freeze), .clr(flush),
        .out(reg2Out)
    );

    Register #(1) immReg(
        .clk(clk), .rst(rst),
        .in(immIn), .ld(~freeze), .clr(flush),
        .out(immOut)
    );

    Register #(12) shiftOperandReg(
        .clk(clk), .rst(rst),
        .in(shiftOperandIn), .ld(~freeze), .clr(flush),
        .out(shiftOperandOut)
    );

    Register #(24) imm24Reg(
        .clk(clk), .rst(rst),
        .in(imm24In), .ld(~freeze), .clr(flush),
        .out(imm24Out)
    );

    Register #(4) destReg(
        .clk(clk), .rst(rst),
        .in(destIn), .ld(~freeze), .clr(flush),
        .out(destOut)
    );

    Register #(1) carryReg(
        .clk(clk), .rst(rst),
        .in(carryIn), .ld(~freeze), .clr(flush),
        .out(carryOut)
    );

    Register #(4) src1Reg(
        .clk(clk), .rst(rst),
        .in(src1In), .ld(~freeze), .clr(flush),
        .out(src1Out)
    );

    Register #(4) src2Reg(
        .clk(clk), .rst(rst),
        .in(src2In), .ld(~freeze), .clr(flush),
        .out(src2Out)
    );
endmodule
