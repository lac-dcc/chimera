// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * 32-Bit Multiplier Module
 * ------------------------
 * This module implements a 32-bit multiplier capable of performing multiplication
 * on two 32-bit inputs (A and B), and generates a 64-bit output (Result).
 *
 * @module Multiplier_32bit
 * @author Mahmoud Abdelraouf
 * @version 1.0
 * @date 15 Oct 2023
 *
 * @input [31:0] A: 32-bit input operand A
 * @input [31:0] B: 32-bit input operand B
 * @output reg [63:0] Result: 64-bit result of the multiplication
 */
module Multiplier_32bit (
    input wire [31:0] A, // 32-bit input A
    input wire [31:0] B, // 32-bit input B
    output reg [63:0] Result // 64-bit output (multiplication result)
);

    wire [7:0] A_part [7:0]; // 8 groups of 4 bits from input A
    wire [7:0] B_part [7:0]; // 8 groups of 4 bits from input B
    wire [15:0] PartialResults [7:0]; // Partial results from 8 multiplications
    
    // Split 32-bit inputs into 8 groups of 4 bits
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : PARTITION
            assign A_part[i] = A[i*4 +: 4]; // Extract 4 bits from input A
            assign B_part[i] = B[i*4 +: 4]; // Extract 4 bits from input B
            Multiplier_4bit mult_inst (
                .A(A_part[i]),
                .B(B_part[i]),
                .Result(PartialResults[i])
            );
        end
    endgenerate
    
    // Combine the partial results to form the 32-bit output
    always @(*) begin
        Result = {
            PartialResults[7],
            PartialResults[6],
            PartialResults[5],
            PartialResults[4],
            PartialResults[3],
            PartialResults[2],
            PartialResults[1],
            PartialResults[0]
        };
    end
endmodule // Multiplier_32bit
