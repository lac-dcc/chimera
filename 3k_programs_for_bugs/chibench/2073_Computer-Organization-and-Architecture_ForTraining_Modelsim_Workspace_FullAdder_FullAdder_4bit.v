// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
    4-Bit Full Adder Module
    -----------------------
    This module performs addition of two 4-bit input numbers (A and B) along with a carry-in (Cin).
    It calculates the 4-bit sum (Sum) and the carry-out (Cout) of the addition operation.
*/

module FullAdder_4bit (
    input [3:0] A,         // 4-bit input A
    input [3:0] B,         // 4-bit input B
    input Cin,             // Carry-in input
    output [3:0] Sum,      // 4-bit output Sum
    output Cout            // Carry-out output
);
    wire [3:0] CarryChain; // Create a chain of carry-out signals

    // Instantiate four 1-bit Full Adders
    FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(CarryChain[0]));
    FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(CarryChain[0]), .Sum(Sum[1]), .Cout(CarryChain[1]));
    FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(CarryChain[1]), .Sum(Sum[2]), .Cout(CarryChain[2]));
    FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(CarryChain[2]), .Sum(Sum[3]), .Cout(CarryChain[3]));

    assign Cout = CarryChain[3]; // The final carry-out is the last element of the chain

endmodule // FullAdder_4bit
