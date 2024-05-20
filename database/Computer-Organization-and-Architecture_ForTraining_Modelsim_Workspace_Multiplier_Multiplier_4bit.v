// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module Multiplier_4bit (
    input wire [3:0] A, // 4-bit input A
    input wire [3:0] B, // 4-bit input B
    output reg [7:0] Result // 8-bit output (multiplication result)
);
    wire [7:0] P1, P2, P3, P4; // Partial products
    wire [7:0] S1, S2, S3, S4, S5, S6, S7; // Sum bits
    
    // Generate partial products
    assign P1 = A[0] & B;
    assign P2 = A[1] & B;
    assign P3 = A[2] & B;
    assign P4 = A[3] & B;
    
    // Generate sum bits
    assign S1 = P1[0];
    assign S2 = P1[1] ^ P2[0];
    assign S3 = P1[2] ^ P2[1] ^ P3[0];
    assign S4 = P1[3] ^ P2[2] ^ P3[1] ^ P4[0];
    assign S5 = P2[3] ^ P3[2] ^ P4[1];
    assign S6 = P3[3] ^ P4[2];
    assign S7 = P4[3];
    
    // Generate the final result
    always @(*) begin
        Result = {S7, S6, S5, S4, S3, S2, S1, P4[0]};
    end
endmodule // Multiplier_4bit
