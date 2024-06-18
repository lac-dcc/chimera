// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module FullAdder_32bit (
    input [31:0] A, input [31:0] B, input Cin,
    output [31:0] Sum, output Cout
);
    wire [1:0] CarryChain; // Create a chain of carry-out signals

    FullAdder_16bit FA0 (.A(A[15:0]), .B(B[15:0]), .Cin(Cin), .Sum(Sum[15:0]), .Cout(CarryChain[0]));
    FullAdder_16bit FA1 (.A(A[31:16]), .B(B[31:16]), .Cin(CarryChain[0]), .Sum(Sum[31:16]), .Cout(CarryChain[1]));

    assign Cout = CarryChain[1]; // The final carry-out is the last element of the chain

endmodule // FullAdder_4bit
