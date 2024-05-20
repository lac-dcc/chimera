// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
    32-Bit Full Adder Module
    ------------------------
    This module performs addition of two 32-bit input numbers (A and B) along with a carry-in (Cin).
    It calculates the 32-bit sum (Sum) and the carry-out (Cout) of the addition operation.
*/

module FullAdder_32bit (
    input [31:0] A,        // 32-bit input A
    input [31:0] B,        // 32-bit input B
    input Cin,             // Carry-in input
    output [31:0] Sum,     // 32-bit output Sum
    output Cout            // Carry-out output
);
    wire [1:0] CarryChain; // Create a chain of carry-out signals

    // Instantiate two 16-bit Full Adders
    FullAdder_16bit FA0 (.A(A[15:0]), .B(B[15:0]), .Cin(Cin), .Sum(Sum[15:0]), .Cout(CarryChain[0]));
    FullAdder_16bit FA1 (.A(A[31:16]), .B(B[31:16]), .Cin(CarryChain[0]), .Sum(Sum[31:16]), .Cout(CarryChain[1]));

    assign Cout = CarryChain[1]; // The final carry-out is the last element of the chain

endmodule // FullAdder_32bit
