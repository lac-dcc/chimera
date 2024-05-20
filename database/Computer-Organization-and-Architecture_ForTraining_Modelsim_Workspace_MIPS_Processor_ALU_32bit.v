// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * 32-Bit Arithmetic Logic Unit (ALU) Module
 * -----------------------------------------
 * This module implements a 32-bit Arithmetic Logic Unit capable of performing various
 * arithmetic and logical operations. It takes two 32-bit inputs (A and B), an operation
 * select signal (OpCode), and generates a 32-bit output (Result) along with carry-out (Cout),
 * zero flag (ZeroFlag), overflow flag (OverflowFlag), and ALU control signals (ALUControl).
 *
 * Supported Operations:
 * - ADD: Addition (A + B)
 * - SUB: Subtraction (A - B)
 * - AND: Bitwise AND (A & B)
 * - OR: Bitwise OR (A | B)
 * - XOR: Bitwise XOR (A ^ B)
 * - NOT: Bitwise NOT (~A)
 * - LSHIFT: Left Shift (A << B)
 * - RSHIFT: Right Shift (A >> B)
 *
 * @module ALU_32bit
 * @author Mahmoud Abdelraouf
 * @version 1.0
 * @date 4 Nov 2023
 *
 * @input [31:0] A: 32-bit input operand A
 * @input [31:0] B: 32-bit input operand B
 * @input [3:0] OpCode: 4-bit operation code
 * @output reg [31:0] Result: 32-bit result of the operation
 * @output reg Cout: Carry-out bit (for addition/subtraction)
 * @output reg ZeroFlag: Zero flag indicating if the result is zero
 * @output reg OverflowFlag: Overflow flag indicating signed overflow
 * @output [2:0] ALUControl: ALU control signals (ADD, SUB, AND, OR, XOR, NOT, LSHIFT, RSHIFT)
 */
module ALU_32bit (
    input [31:0] A,
    input [31:0] B,
    input [3:0] OpCode,
    output reg [31:0] Result,
    output reg Cout,
    output reg ZeroFlag,
    output reg OverflowFlag,
    output reg SLTFlag, 
    output reg [3:0] ALUControl
);

  reg [31:0] TempShift;

  // Implementation of the ALU logic
  always @(*) begin
      case (OpCode)
          4'b0000: begin // ADD operation
            Result = A + B;
            Cout = (A > (A + B)) ? 1 : 0; // Improved overflow detection for addition
            ZeroFlag = (Result == 0);
            OverflowFlag = ((A[31] == B[31]) && (Result[31] != A[31]));
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0000; // Indicate ADD operation
          end 
          4'b0001: begin // SUB operation
            Result = A - B;
            Cout = (A < B) ? 0 : 1; // Improved borrow detection for subtraction
            ZeroFlag = (Result == 0);
            OverflowFlag = (A[31] != B[31]) && (Result[31] != A[31]);
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0001; // Indicate SUB operation
          end
          4'b0010: begin // AND operation
            Result = A & B;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = 1'b0; // No overflow in bitwise AND
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0010; // Indicate AND operation  
          end
          4'b0011: begin // NAND operation
            Result = ~(A & B); // The NAND operation is the negation of AND
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = 1'b0; // No overflow in NAND
            SLTFlag = (A < B) ? 1 : 0;
            ALUControl = 4'b0011; // Indicate NAND operation
          end
          4'b0100: begin // OR operation
            Result = A | B;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = 1'b0; // No overflow in bitwise OR
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0100; // Indicate OR operation  
          end
          4'b0101: begin // XOR operation
            Result = A ^ B;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = 1'b0; // No overflow in bitwise XOR
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0101; // Indicate XOR operation  
          end
          4'b0110: begin // NOT operation
            Result = ~A;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = 1'b0; // No overflow in bitwise NOT
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0110; // Indicate NOT operation  for A
          end
          4'b0111: begin // NOT operation
            Result = ~B;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = 1'b0; // No overflow in bitwise NOT
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b0111; // Indicate NOT operation for B 
          end
          4'b1000: begin // LSHIFT operation
            TempShift = A;
            Result = A << B;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = (A < TempShift); // Overflow if the bit shifted out is not zero
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b1000; // Indicate LSHIFT operation  
          end
          4'b1001: begin // RSHIFT operation
            TempShift = A;
            Result = A >> B;
            Cout = 1'b0;
            ZeroFlag = (Result == 0);
            OverflowFlag = (A > TempShift); 
            SLTFlag = (A < B) ? 1 : 0; 
            ALUControl = 4'b1001; // Indicate RSHIFT operation  
          end
          default: begin
            Result = 32'b0;
            Cout = 1'b0;
            ZeroFlag = 1'b0;
            OverflowFlag = 1'b0;
            SLTFlag = 1'b0;
            ALUControl = 4'b0000;
          end
      endcase
      
  end


endmodule // ALU_32bit
