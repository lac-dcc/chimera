`timescale 1ns/1ps
module tristateBuff(input [7:0] data, input enable, output [7:0] dataOut);
    assign dataOut = enable ? data : 8'bzzzzzzzz;
endmodule