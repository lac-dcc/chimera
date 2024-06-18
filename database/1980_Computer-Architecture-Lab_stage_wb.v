// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module StageWb(
    input clk, rst,
    input wbEnIn, memREn,
    input [31:0] aluRes, memData,
    input [3:0] destIn,
    output wbEnOut,
    output [31:0] wbValue,
    output [3:0] destOut
);
    assign wbEnOut = wbEnIn;
    assign destOut = destIn;

    Mux2To1 #(32) wbMux(
        .a0(aluRes),
        .a1(memData),
        .sel(memREn),
        .out(wbValue)
    );
endmodule
