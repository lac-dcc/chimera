// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module alu
    #(  parameter opcodeSize = 3,
        parameter dataSize = 8)
    (   clk, rst_n, func, data1, data2, dataOut);
input clk, rst_n;
input [opcodeSize-1 : 0] func;
input [dataSize-1 : 0] data1, data2;
output [dataSize-1 : 0] dataOut;

reg [dataSize-1 : 0] dataOut;

always @(posedge clk, negedge rst_n)
    if(rst_n == 1'b0) begin
        dataOut <= 0;
    end else begin
        case(func)
            3'b000: dataOut <= data1 + data2;
            3'b001: dataOut <= data1 - (~data2) + 1;
            3'b010: dataOut <= data1[((dataSize/2) - 1) : 0] * data2[((dataSize/2) - 1) : 0];
            3'b011: dataOut <= data1 & data2;
            3'b100: dataOut <= data1 | data2;
            3'b101: dataOut <= data1 ^ data2;
            3'b110: dataOut <= data1 ~^ data2;
            3'b111: dataOut <= data1 ^~ data2;
            default: dataOut <= 0;
        endcase
    end
endmodule;
