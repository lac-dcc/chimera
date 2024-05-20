// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module Multiplier_4bit #(parameter BIT_WIDTH = 4) (
    input wire [BIT_WIDTH-1:0] A, // N-bit input A
    input wire [BIT_WIDTH-1:0] B, // N-bit input B
    output reg [2*BIT_WIDTH-1:0] Result // 2N-bit output (multiplication result)
);
    wire [2*BIT_WIDTH-1:0] PartialProducts; // Partial products
    
    // Generate partial products
    assign PartialProducts = A * B;
    
    // Generate the final result
    always @(*) begin
        Result = PartialProducts;
    end
endmodule // Multiplier_4bit
