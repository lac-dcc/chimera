// This program was cloned from: https://github.com/TheSUPERCD/8bit_MicroComputer_Verilog
// License: MIT License

`timescale 1ns/1ps
module triBuff4(input [3:0] data, input enable, output [3:0] dataOut);
    assign dataOut = enable ? data : 4'bzzzz;
endmodule