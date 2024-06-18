// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

module alu_mux_480(
    input [31:0] immout,    //立即数的输出时alu的一个输入可能 
    input [31:0] RD2,
    input ALUSrc,
    output [31:0] B
    );
    assign B = (ALUSrc) ? immout : RD2;
endmodule