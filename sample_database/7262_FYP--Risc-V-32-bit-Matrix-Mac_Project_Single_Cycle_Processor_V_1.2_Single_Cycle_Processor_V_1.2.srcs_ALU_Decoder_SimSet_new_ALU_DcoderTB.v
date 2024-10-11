// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module ALU_Decoder_Testbench;

  // Inputs
  reg [1:0] ALUOp;
  reg [2:0] funct3;
  reg [6:0] funct7, op;

  // Outputs
  wire [2:0] ALUControl;

  // Instantiate the unit under test (UUT)
  ALU_Decoder dut (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),
    .op(op),
    .ALUControl(ALUControl)
  );

    // Initialize inputs
    initial begin
    // Test case A-1
    ALUOp = 2'b00;// arithmetic add
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    op = 7'bxx0xxxx;
    #10;

    // Test case B-1
    ALUOp = 2'b01;//arithmetic subtract
    funct3 = 3'b001;
    funct7 = 7'b0000000;
    op = 7'bxxxxxxx;
    #10;

    // Test case C-1 // use funct3 and funct7 bits to check -> Arithmetic Addition
    ALUOp = 2'b10;// 
    funct3 = 3'b000;
    op = 7'bxxxxxxx; //only checking 5th bit
    funct7 = 7'b0000000; //only checking 5th bit
    #10;

    // Test case C-2 // use funct3 and funct7 bits to check -> Arithmetic Addition
    ALUOp = 2'b10;//
    funct3 = 3'b000;
    op = 7'bxxxxxxx; //only checking 5th bit
    funct7 = 7'b0010000; //only checking 5th bit
    #10;    

    // Test case C-3 // use funct3 and funct7 bits to check -> Arithmetic Addition
    ALUOp = 2'b10;//
    funct3 = 3'b000;
    op = 7'bxx1xxxx; //only checking 5th bit
    funct7 = 7'b0000000; //only checking 5th bit
    #10;
    
    // Test case C-4 // use funct3 and funct7 bits to check -> Arithmetic Subtraction
    ALUOp = 2'b10;//
    funct3 = 3'b000;
    op = 7'bxx1xxxx; //only checking 5th bit
    funct7 = 7'b0010000; //only checking 5th bit
    #10;
    
    // Test case C-5 // use funct3 and funct7 bits to check -> SLT Instruction
    ALUOp = 2'b10;//
    funct3 = 3'b010;
    op = 7'bxxxxxxx; //only checking 5th bit
    funct7 = 7'b0000000; //only checking 5th bit
    #10;    
    
    // Test case C-6 // use funct3 and funct7 bits to check -> OR
    ALUOp = 2'b10;//
    funct3 = 3'b110;
    op = 7'bxxxxxxx; //only checking 5th bit
    funct7 = 7'b0000000; //only checking 5th bit
    #10;        

    // Test case C-7 // use funct3 and funct7 bits to check -> AND
    ALUOp = 2'b10;//
    funct3 = 3'b111;
    op = 7'bxxxxxxx; //only checking 5th bit
    funct7 = 7'b0000000; //only checking 5th bit
    #10;    

    // Test case D-1
    ALUOp = 2'b11;//nothing
    funct3 = 3'bxxx;
    funct7 = 7'bxxxxxxx;
    op = 7'bxxxxxxx;
    #10;
    
    
    
    
    // Add more test cases here

    $finish; // Finish simulation
  end

endmodule
