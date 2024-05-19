// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : alu.v
// Title        : ALU.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module alu(S, z, Cout, A, B, Cin, alu_ops);
output reg [31:0] S;
output z;
output reg Cout;
input [31:0] A;
input [31:0] B;
input Cin;
input [2:0] alu_ops;

assign z = ~|S;

always @(A or B or alu_ops)
begin
	case (alu_ops)
    3'b111: begin S = ~B; Cout = 0; end
    3'b110: begin S = ~A; Cout = 0; end
    3'b101: begin S = -A; Cout = 0; end
	3'b100: begin S = A ^ B; Cout = 0; end
	3'b011: begin S = A & B; Cout = 0; end
	3'b010: begin S = A | B; Cout = 0; end
	3'b001: {Cout, S} = A - B;
	default: {Cout, S} = A + B + Cin;
    endcase
end

endmodule
