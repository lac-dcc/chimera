// This program was cloned from: https://github.com/mmohamedkhaled/CPU_Design-
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps

module ALU (A, B, ALUSel, Result, ZFlag);
input [7:0] A, B;
input [2:0] ALUSel;
output reg [7:0] Result;
output ZFlag;
assign ZFlag = (Result==8'b0);
always @ (*) begin
case (ALUSel)
3'b000: Result = A + B; // addition
3'b001: Result = A - B; // subtraction
3'b010: Result = A - B; // subtraction
3'b011: Result = A - B; // subtraction
3'b100: Result = A | B; // bitwise OR
3'b101: Result = ~(A | B); // bitwise NOR
3'b110: Result = A & B; // bitwise AND
3'b111: Result = A ^ B; // bitwise XOR
endcase
end
endmodule