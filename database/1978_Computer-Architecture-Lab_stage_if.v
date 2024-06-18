// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module StageIf(
    input clk, rst,
    input branchTaken, freeze,
    input [31:0] branchAddr,
    output [31:0] pc, instruction
);
    wire [31:0] pcRegIn, pcRegOut, pcAdderOut;

    Register #(32) pcReg(
        .clk(clk),
        .rst(rst),
        .in(pcRegIn),
        .ld(~freeze),
        .clr(1'b0),
        .out(pcRegOut)
    );

    Adder #(32) pcAdder(
        .a(pcRegOut),
        .b(32'd4),
        .out(pcAdderOut)
    );

    Mux2To1 #(32) pcMux(
        .a0(pcAdderOut),
        .a1(branchAddr),
        .sel(branchTaken),
        .out(pcRegIn)
    );

    InstructionMemory instMem(
        .pc(pcRegOut),
        .inst(instruction)
    );

    assign pc = pcAdderOut;
endmodule
