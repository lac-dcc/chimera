`timescale 1ns/1ps
module ALU(input op, input [7:0] A, input [7:0] B, output [8:0] res);
assign res[8:0] = op ? (A[7:0] - B[7:0]) : (A[7:0] + B[7:0]);
endmodule