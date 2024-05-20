// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module ALU_64_bit (input [63:0] a, input [63:0] b,
input [3:0] ALUOp, 
output reg [63:0] result, 
output wire zero,
output wire lt);

assign zero = (result == 0);
assign lt = (a < b); // less than

always @(*)
begin
    case (ALUOp[3:0])
        4'b0000: result <= a & b; // AND
        4'b0001: result <= a | b; // OR
        4'b0010: result <= a + b; // ADD
        4'b0110: result <= a - b; // Subtract
        4'b1100: result <= ~a & ~b; // NOR
        4'b1111: result <= a << b; // Shift left
    endcase
end

endmodule
