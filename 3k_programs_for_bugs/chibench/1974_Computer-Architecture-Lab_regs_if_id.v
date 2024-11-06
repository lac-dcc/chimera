// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module RegsIfId(
    input clk, rst,
    input freeze, flush,
    input [31:0] pcIn, instructionIn,
    output [31:0] pcOut, instructionOut
);
    Register #(32) pcReg(
        .clk(clk), .rst(rst),
        .in(pcIn), .ld(~freeze), .clr(flush),
        .out(pcOut)
    );

    Register #(32) instReg(
        .clk(clk), .rst(rst),
        .in(instructionIn), .ld(~freeze), .clr(flush),
        .out(instructionOut)
    );
endmodule
