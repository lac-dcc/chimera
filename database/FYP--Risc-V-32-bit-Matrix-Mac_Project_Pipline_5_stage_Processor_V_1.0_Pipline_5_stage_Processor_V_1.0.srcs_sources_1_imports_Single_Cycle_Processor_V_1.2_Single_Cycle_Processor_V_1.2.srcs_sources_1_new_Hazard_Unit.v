// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 05:07:20 PM
// Design Name: 
// Module Name: Hazard_Unit
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


module Hazard_Unit(
    input clk, rst, RegWriteM, RegWriteW, 
    input [4:0] RD_M, RD_W, RS1_E, RS2_E,
    output [1:0] ForwardAE, ForwardBE
    
    );
    
    assign ForwardAE = ( rst == 1'b0 ) ? 2'b00 :
                       ( ( RegWriteM == 1'b1 ) & (RD_M != 5'h00) &( RD_M == RS1_E) ) ? 2'b10 :
                       ( ( RegWriteW == 1'b1 ) & (RD_W != 5'h00) &( RD_W == RS1_E) ) ? 2'b01 :
                       2'b00 ;
    
    assign ForwardBE = ( rst == 1'b0 ) ? 2'b00 :
                       ( ( RegWriteM == 1'b1 ) & (RD_M != 5'h00) &( RD_M == RS2_E) ) ? 2'b10 :
                       ( ( RegWriteW == 1'b1 ) & (RD_W != 5'h00) &( RD_W == RS2_E) ) ? 2'b01 :
                        2'b00 ;    
    
    
    
    
    
    
    
    
    
endmodule















