`timescale 1ns/1ps
module triBuff4(input [3:0] data, input enable, output [3:0] dataOut);
    assign dataOut = enable ? data : 4'bzzzz;
endmodule