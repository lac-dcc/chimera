// This program was cloned from: https://github.com/TheSUPERCD/8bit_MicroComputer_Verilog
// License: MIT License

`timescale 1ns/1ps
module tristateBuff(input [7:0] data, input enable, output [7:0] dataOut);
    assign dataOut = enable ? data : 8'bzzzzzzzz;
endmodule