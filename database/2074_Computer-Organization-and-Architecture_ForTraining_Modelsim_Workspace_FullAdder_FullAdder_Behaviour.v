// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * FullAdder_Behaviour Module
 * -------------------------
 * This module implements a 32-bit full adder in behavioral Verilog. It takes two
 * 32-bit inputs A and B, along with a carry input Cin. It calculates the sum 
 * (Sum) and the carry-out (Cout) of the addition operation.
 *
 * @module FullAdder_Behaviour
 * @author [Mahmoud Abdelraouf]
 * @version 1.0
 * @date [22 October, 2023]
 *
 * @input [31:0] A: 32-bit input operand A
 * @input [31:0] B: 32-bit input operand B
 * @input Cin: Carry input bit
 * @output [31:0] Sum: 32-bit sum output
 * @output Cout: Carry-out bit
 */
module FullAdder_Behaviour (
    input [31:0] A, // 32-bit input operand A
    input [31:0] B, // 32-bit input operand B
    input Cin, // Carry input bit
    output reg [31:0] Sum, // 32-bit sum output
    output reg Cout // Carry-out bit
);

    reg [32:0] Temp; // Temporary variable to store the sum

    // Behavioral logic for full adder
    always @(*) begin
        Temp = A + B + Cin; // Calculate sum along with carry input
        Sum = Temp[31:0]; // Extract the lower 32 bits as the sum output
        Cout = Temp[32]; // Extract the 33rd bit as the carry-out output
    end

endmodule // FullAdder_Behaviour
