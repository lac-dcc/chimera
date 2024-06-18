// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

//correctly working, every instruction checked on testbench
module Main_Decoder_Testbench;

  // Inputs
  reg [6:0] Op;

  // Outputs
  wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
  wire [1:0] ImmSrc, ALUOp;

  // Instantiate the unit under test (UUT)
  Main_Decoder dut (
    .Op(Op),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ALUOp(ALUOp)
  );

  // Initialize inputs
  initial begin
     // Test case 1: Load instruction
     Op = 7'b0000011; // LW opcode
     #10;
     // Test case 2: Load instruction
     Op = 7'b0100011; // SW opcode
     #10;
     // Test case 3: Load instruction
     Op = 7'b0110011; // R-Type instructions opcode
     #10;
     // Test case 4: Branch instruction
     Op = 7'b1100011; // BEQ opcode
     #10;
         
    $finish; // Finish simulation after a delay
  end

endmodule
