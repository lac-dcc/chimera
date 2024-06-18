// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * Multiplier_32_bit Module
 * ------------------------
 * This module performs multiplication of two 32-bit input numbers (A and B).
 * It splits the inputs into 8 groups of 4 bits each and performs 4-bit 
 * multiplications for each group. The partial results are then combined to 
 * form the 64-bit output (Result).
 *
 * Inputs:
 *   A [31:0] - 32-bit input A
 *   B [31:0] - 32-bit input B
 *
 * Outputs:
 *   Result [63:0] - 64-bit output (multiplication result)
 *
 * Operation:
 *   1. The 32-bit inputs A and B are divided into 8 groups of 4 bits each.
 *   2. For each group, a 4-bit multiplication is performed.
 *   3. The 8 partial results are combined to form the 64-bit output.
 *
 * Example Usage:
 *   Multiplier_32_bit #(
 *       .A(32'hABCDEFFF), // Example 32-bit input A
 *       .B(32'h12345678)  // Example 32-bit input B
 *   ) uut (
 *       .A(A),
 *       .B(B),
 *       .Result(Result)
 *   );
 *
 * Note:
 *   - Inputs A and B must be provided as 32-bit vectors.
 *   - The module internally divides inputs into 4-bit groups for multiplication.
 */

module Multiplier_32_bit (
    input wire [31:0] A, // 32-bit input A
    input wire [31:0] B, // 32-bit input B
    output reg [63:0] Result // 64-bit output (multiplication result)
);
    reg [7:0] A_part [7:0];       // 4-bit groups of input A
    reg [7:0] B_part [7:0];       // 4-bit groups of input B
    reg [15:0] PartialResults [7:0]; // Partial multiplication results
    integer i;

    // Split 32-bit inputs into 8 groups of 4 bits and perform multiplication
    always @(A or B) begin
        for (i = 0; i < 8; i = i + 1) begin
            A_part[i] = A[i*4 +: 4]; // Divide input A into 4-bit groups
            B_part[i] = B[i*4 +: 4]; // Divide input B into 4-bit groups
            PartialResults[i] = A_part[i] * B_part[i]; // Perform 4-bit multiplication
        end

        // Combine the partial results into Result
        Result = {PartialResults[7], PartialResults[6], PartialResults[5], PartialResults[4],
                  PartialResults[3], PartialResults[2], PartialResults[1], PartialResults[0]};
    end
endmodule // Multiplier_32_bit
