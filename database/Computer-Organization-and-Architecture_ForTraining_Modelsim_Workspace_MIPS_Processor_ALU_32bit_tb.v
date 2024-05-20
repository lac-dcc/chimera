// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * @file ALU_32bit_tb.v
 *
 * @brief Test Bench for 32-Bit Arithmetic Logic Unit (ALU) Module
 *
 * This test bench verifies the functionality of the 32-Bit ALU module by applying
 * random stimulus and observing the output signals. It includes 10 random test cases
 * to cover a variety of scenarios.
 *
 * @author Mahmoud Abdelraouf Mahmoud
 * @version 1.0
 * @date 4 Nov 2023
 *
 * @module ALU_32bit_tb
 * @inputs
 *   [31:0] A: 32-bit input operand A
 *   [31:0] B: 32-bit input operand B
 *   [3:0] OpCode: 4-bit operation code
 * @outputs
 *   [31:0] Result: 32-bit result of the operation
 *   Cout: Carry-out bit (for addition/subtraction)
 *   ZeroFlag: Zero flag indicating if the result is zero
 *   OverflowFlag: Overflow flag indicating signed overflow
 *   [2:0] ALUControl: ALU control signals (ADD, SUB, AND, OR, XOR, NOT, LSHIFT, RSHIFT)
 */

module ALU_32bit_tb;

  // Define the signals
  reg [31:0] A, B;
  reg [3:0] OpCode;
  wire [31:0] Result;
  wire Cout, ZeroFlag, OverflowFlag, SLTFlag;
  wire [3:0] ALUControl;

  // Instantiate the ALU module
  ALU_32bit UUT (
    .A(A),
    .B(B),
    .OpCode(OpCode),
    .Result(Result),
    .Cout(Cout),
    .ZeroFlag(ZeroFlag),
    .OverflowFlag(OverflowFlag),
    .SLTFlag(SLTFlag),
    .ALUControl(ALUControl)
  );

    integer i = 0;

    // Apply stimulus
    initial begin

      A = 32'b0;
      B = 32'b0;
      OpCode = 4'b0;
      
      $display("Test Case %0d: A = %d, B = %d, OpCode = %b", i, A, B, OpCode);
      $display("Result = %d, Cout = %b, ZeroFlag = %b, OverflowFlag = %b, ALUControl = %b", Result, Cout, ZeroFlag, OverflowFlag, ALUControl);

      // Wait for a few simulation steps for the output to stabilize
      #10;

      i = 1;

      A = 32'hE56D2A62;
      B = 32'h87ED2F62;
      OpCode = 4'b0;

      $display("Test Case %0d: A = %d, B = %d, OpCode = %b", i, A, B, OpCode);
      $display("Result = %d, Cout = %b, ZeroFlag = %b, OverflowFlag = %b, ALUControl = %b", Result, Cout, ZeroFlag, OverflowFlag, ALUControl);

      // Wait for a few simulation steps for the output to stabilize
      #10;

      i = 2;

      A = -759211000;
      B = 599999900;
      OpCode = 4'b0001;

      $display("Test Case %0d: A = %d, B = %d, OpCode = %b", i, A, B, OpCode);
      $display("Result = %d, Cout = %b, ZeroFlag = %b, OverflowFlag = %b, ALUControl = %b", Result, Cout, ZeroFlag, OverflowFlag, ALUControl);

      // Wait for a few simulation steps for the output to stabilize
      #10;

      // Run 10 random test cases
      for(i = 3; i < 50; i = i + 1) begin
        // Generate random values for A, B, and OpCode
        A = $random;
        B = $random;
        OpCode = $random;

        // Wait for a few simulation steps for the output to stabilize
        #10;

        // Display the results
        $display("Test Case %0d: A = %d, B = %d, OpCode = %b", i, A, B, OpCode);
        $display("Result = %d, Cout = %b, ZeroFlag = %b, OverflowFlag = %b, ALUControl = %b", Result, Cout, ZeroFlag, OverflowFlag, ALUControl);
      end 

      $display("Simulation completed successfully!");
      $stop;
  end

endmodule
