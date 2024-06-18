// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/*
   1-Bit Full Adder Module
   ------------------------
   This module performs addition of three input bits (A, B, Cin).
   It calculates the sum (Sum) and the carry-out (Cout) of the addition operation.
*/

module FullAdder (
    input A, input B, input Cin, 
    output Sum, output Cout
);
    // Sum output equation: Sum = A XOR B XOR Cin
    assign Sum = A ^ B ^ Cin;

    // Carry output equation: Cout = (A AND B) OR (B AND Cin) OR (A AND Cin)
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule // FullAdder
