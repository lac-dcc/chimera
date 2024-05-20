// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

module alu(
    input [31:0] A, B,       // ALU 32-bit Inputs                 
    input [5:0] ALU_Sel,     // ALU Selection
    output [31:0] ALU_Out,   // ALU 32-bit Output
    output CarryOut,         // Carry Out Flag
    output Zero,             // Zero Flag
    output Negative,         // Negative Flag
    output Overflow,          // Overflow Flag
    output [31:0] ZeroExt    // Zero Extension Output
);
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0, A} + {1'b0, B};
    assign CarryOut = tmp[32];   // Carryout flag
    assign ZeroExt = {32'b0, ALU_Result};
    
    always @(*)
    begin
        case (ALU_Sel)
            5'b00000: // Addition
                ALU_Result = A + B; 
            5'b00001: // Subtraction
                ALU_Result = A - B;
            5'b00010: // Multiplication
                ALU_Result = A * B;
            5'b00011: // Division
                ALU_Result = A / B;
            5'b00100: // Logical shift left
                ALU_Result = A << 1;
            5'b00101: // Logical shift right
                ALU_Result = A >> 1;
            5'b00110: // Rotate left
                ALU_Result = {A[30:0], A[31]};
            5'b00111: // Rotate right
                ALU_Result = {A[0], A[31:1]};
            5'b01000: // Logical and 
                ALU_Result = A & B;
            5'b01001: // Logical or
                ALU_Result = A | B;
            5'b01010: // Logical xor 
                ALU_Result = A ^ B;
            5'b01011: // Logical nor
                ALU_Result = ~(A | B);
            5'b01100: // Logical nand 
                ALU_Result = ~(A & B);
            5'b01101: // Logical xnor
                ALU_Result = ~(A ^ B);
            5'b01110: // Greater comparison
                ALU_Result = (A > B) ? 32'd1 : 32'd0;
            5'b01111: // Equal comparison   
                ALU_Result = (A == B) ? 32'd1 : 32'd0;
            5'b10000:
                ALU_Result = ZeroExt;
            default: ALU_Result = A + B; 
        endcase
    end
      // Flag assignments
      assign Zero = (ALU_Result == 32'd0);
      assign Negative = ALU_Result[31];
      assign Overflow = ((A[31] ^ B[31]) & (A[31] ^ ALU_Result[31]));
      
    
    
    
endmodule
