// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
    16-Bit Full Adder Module
    ------------------------
    This module performs addition of two 16-bit input numbers (A and B) along with a carry-in (Cin).
    It calculates the 16-bit sum (Sum) and the carry-out (Cout) of the addition operation.
*/

module FullAdder_16bit (
    input [15:0] A,        // 16-bit input A
    input [15:0] B,        // 16-bit input B
    input Cin,             // Carry-in input
    output [15:0] Sum,     // 16-bit output Sum
    output Cout            // Carry-out output
);
    wire [3:0] CarryChain; // Create a chain of carry-out signals

    // Instantiate four 4-bit Full Adders
    FullAdder_4bit FA0 (.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .Sum(Sum[3:0]), .Cout(CarryChain[0]));
    FullAdder_4bit FA1 (.A(A[7:4]), .B(B[7:4]), .Cin(CarryChain[0]), .Sum(Sum[7:4]), .Cout(CarryChain[1]));
    FullAdder_4bit FA2 (.A(A[11:8]), .B(B[11:8]), .Cin(CarryChain[1]), .Sum(Sum[11:8]), .Cout(CarryChain[2]));
    FullAdder_4bit FA3 (.A(A[15:12]), .B(B[15:12]), .Cin(CarryChain[2]), .Sum(Sum[15:12]), .Cout(CarryChain[3]));

    assign Cout = CarryChain[3]; // The final carry-out is the last element of the chain

endmodule // FullAdder_16bit
