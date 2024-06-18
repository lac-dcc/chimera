// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 09:08:09 AM
// Design Name: 
// Module Name: MAC_Decoder
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


module MAC_Decoder(
//    input [6:0]OP,
    input [2:0]funct3,
    input MAC_OP,       //different than MAC_OP, MAC_OP is a signal which only tells if its a matrix instruction or not
    input [1:0] MACOP,  //whereas MACOP tells which type of matrix instruction it is: load, clear, operation or store
           
    output reg [3:0] MACControl,
    output [1:0] MACDM
    );
    
    
    always @(*) 
    begin
        if (MAC_OP == 1'b1) begin
            case ({MACOP, funct3})
                5'b00_000: MACControl = 4'b0000; // LOAD MAC A
                5'b00_001: MACControl = 4'b0001; // LOAD MAC B
                5'b01_000: MACControl = 4'b0010; // CLEAR A
                5'b01_001: MACControl = 4'b0011; // CLEAR B
                5'b01_010: MACControl = 4'b0100; // CLEAR R
                5'b01_011: MACControl = 4'b0101; // CLEAR ALL
                5'b10_000: MACControl = 4'b0110; // MAC MULTIPLY
                5'b10_001: MACControl = 4'b0111; // MAC ADD
                5'b10_010: MACControl = 4'b1000; // MAC SUB
                5'b10_011: MACControl = 4'b1001; // SUB MAC
                5'b11_000: MACControl = 4'b1010; // STORE RESULTANT
                default: MACControl = 4'b0111;    // DEFAULT ADD
            endcase
        end
        else begin
            MACControl = 4'b0111; // Set MACControl to zero if MAC_op is not equal to 1'b1
        end
    end

    
//    assign MACControl = ( (MACOP == 2'b00) & (funct3 == 3'b000) ) ? 4'b0000 : //LOAD MAC A
//                        ( (MACOP == 2'b00) & (funct3 == 3'b001) ) ? 4'b0001 : //LOAD MAC B
//                        ( (MACOP == 2'b01) & (funct3 == 3'b000) ) ? 4'b0010 : //CLEAR A
//                        ( (MACOP == 2'b01) & (funct3 == 3'b001) ) ? 4'b0011 : //CLEAR B
//                        ( (MACOP == 2'b01) & (funct3 == 3'b010) ) ? 4'b0100 : //CLEAR R
//                        ( (MACOP == 2'b01) & (funct3 == 3'b011) ) ? 4'b0101 : //CLEAR ALL
//                        ( (MACOP == 2'b10) & (funct3 == 3'b000) ) ? 4'b0110 : //MAC MULTIPLY
//                        ( (MACOP == 2'b10) & (funct3 == 3'b001) ) ? 4'b0111 : //MAC ADD
//                        ( (MACOP == 2'b10) & (funct3 == 3'b010) ) ? 4'b1000 : //MAC SUB
//                        ( (MACOP == 2'b10) & (funct3 == 3'b011) ) ? 4'b1001 : //SUB MAC
//                        ( (MACOP == 2'b11) & (funct3 == 3'b000) ) ? 4'b1010 : //STORE RESULTANT
//                                                                    4'b0111 ; //DEFAULT ADD
     //2'b11 = write to mem 
     //2'b10 = read from mem for matB
     //2'b01 = read from mem for matA
    assign MACDM =  MACControl == 4'b1010  ? 2'b11 : 
                    MACControl == 4'b0001 ? 2'b10 : 
                    (MACControl == 4'b0000 && MAC_OP == 1'b1 )? 2'b01 : 2'b00;
endmodule














