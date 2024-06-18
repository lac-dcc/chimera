// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0




`timescale 1ns / 1ps  

module tb_alu;
//Inputs
reg [31:0] A, B;
reg [5:0] ALU_Sel;

//Outputs
wire [31:0] ALU_Out;

//flags
wire CarryOut;
wire Zero;             // Zero Flag
wire Negative;         // Negative Flag
wire Overflow ;         // Overflow Flag


// Verilog code for ALU
integer i;
alu test_unit(
    .A(A),                      // ALU 32-bit Inputs                 
    .B(B),
    .ALU_Sel(ALU_Sel),          // ALU Selection
    .ALU_Out(ALU_Out),          // ALU 32-bit Output
    .CarryOut(CarryOut),        // Carry Out Flag
    .Zero(Zero),                // Zero Flag
    .Negative(Negative),        // Negative Flag
    .Overflow(Overflow),        // Overflow Flag
    .ZeroExt(ZeroExt)
);

initial begin
    // hold reset state for 100 ns.
    A = 32'h0A;
    B = 4'h02;
    ALU_Sel = 5'd0;
    #10;
    
    for (i = 0; i <= 15; i = i + 1) begin
        ALU_Sel = ALU_Sel + 1;
        #10;
    end
    
    //zero flag testing
    A = 32'd10;
    B = 32'd10;
    ALU_Sel = 5'b00001;
    #10;
    
    //negative flag testing
    A = 32'd10;
    B = 32'd20;
    ALU_Sel = 5'b00001;
    #10;
    
    //overflow flag
    A = 32'hffffffff;
    B = 32'hffffffff;
    ALU_Sel = 5'b00001;
    #10;
        
    // Testcase 1 - Overflow
        A = 32'h7FFFFFFF; // Max positive value
        B = 32'h00000001; // 1
        ALU_Sel = 5'b00000; // Addition
    
        #10;
        $display("A + B = %d", ALU_Out);
        $display("CarryOut: %b, Zero: %b, Negative: %b, Overflow: %b", CarryOut, Zero, Negative, Overflow);
        #10;
    
        // Testcase 2 - No Overflow
        A = 32'h7FFFFFFF; // Max positive value
        B = 32'h00000000; // 0
        ALU_Sel = 5'b00000; // Addition
    
        #10;
        $display("A + B = %d", ALU_Out);
        $display("CarryOut: %b, Zero: %b, Negative: %b, Overflow: %b", CarryOut, Zero, Negative, Overflow);
        #10;
    
        // Testcase 3 - Negative Overflow
        A = 32'h80000000; // Min negative value
        B = 32'hFFFFFFFF; // -1
        ALU_Sel = 5'b00000; // Addition
    
        #10;
        $display("A + B = %d", ALU_Out);
        $display("CarryOut: %b, Zero: %b, Negative: %b, Overflow: %b", CarryOut, Zero, Negative, Overflow);
        #10;    
    
    
    
    $finish;
end

endmodule

