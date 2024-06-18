// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 10:39:11 AM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// ALU 1
module ALU(
    input [31:0] A, B,       // ALU 32-bit Inputs                 
    input [5:0] ALU_Sel,     // ALU Selection
    
    output reg [31:0] ALU_Out,   // ALU 32-bit Output
    output reg CarryOut,         // Carry Out Flag
    output reg Zero,             // Zero Flag
    output reg Negative,         // Negative Flag
    output reg Overflow          // Overflow Flag
);
    reg Cout;
    wire [31:0]Sum;


    assign Sum = (ALU_Sel[0] == 1'b0) ? A + B : //ARITHMETIC ADITION
                               (A + ((~B)+1)) ; //ARITHMETIC SUBTRACTION using 2's compliment
    
    always @(*)
    begin
        case ( ALU_Sel )
            6'b000000: 
                ALU_Out =  Sum ;                            //ARITHMETIC ADITION
            6'b000001: 
                ALU_Out =  Sum ;                            //ARITHMETIC SUBTRACTION using 2's compliment
            6'b000010: 
                ALU_Out =  A * B;                            //ARITHMETIC Multiplication
            6'b000011: 
                ALU_Out = A & B ;                           // bitwise and  
            6'b000100: 
               ALU_Out = A | B ;                           // bitwise or
            6'b00101: 
                ALU_Out = A ^ B ;                           // bitwise XOR
            6'b000110:
                ALU_Out = A >> B ;                          // Logical shift right B times
            6'b000111:
                ALU_Out = A << B ;                          // Logical shift right B times
            6'b001000: 
                ALU_Out = (A >= B) ? 32'd1 : 32'd0;          // Greater equal comparison
            6'b001001: 
                ALU_Out = (A == B) ? 32'd1 : 32'd0;         // Equal comparison
            6'b001010: 
                ALU_Out = (A != B) ? 32'd1 : 32'd0;         // Not Equal comparison
            6'b001011: 
                ALU_Out = (A < B) ? 32'd1 : 32'd0;          // Less Then comparison
            6'b001100:
               ALU_Out  = (A < B) ? 32'd1 : 32'd0; //slt, set less then
            6'b111111:
               { Cout, ALU_Out } = {{33{1'b0}}} ;          //Ecall = Ebreak = end
            default: 
                {Cout, ALU_Out} = {33{1'b0}};                //Nothing            
        
        endcase
        Overflow = ((Sum[31] ^ A[31]) & (~(ALU_Sel[0] ^ B[31] ^ A[31])) & (~ALU_Sel[1]));
        
        CarryOut = ((~ALU_Sel[1]) & Cout);
        Zero = ~|ALU_Out;
        Negative = ALU_Out[31];
     end                 


endmodule
