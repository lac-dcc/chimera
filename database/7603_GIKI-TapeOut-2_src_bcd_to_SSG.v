// This program was cloned from: https://github.com/HUZAIFA-TARIQ/GIKI-TapeOut-2
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 06:03:43 PM
// Design Name: 
// Module Name: bcd_to_SSG
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


module bcd_to_SSG(
        input [3:0] BCD,
        output reg [7:0] SSD
    );
    
    always @(*)
    begin
        case(BCD)
        0:     SSD     <= 8'hc0;
        1:     SSD     <= 8'hf9;
        2:     SSD     <= 8'ha4;
        3:     SSD     <= 8'hb0;
        4:     SSD     <= 8'h99;
        5:     SSD     <= 8'h92;
        6:     SSD     <= 8'h82;
        7:     SSD     <= 8'hf8;
        8:     SSD     <= 8'h80;
        9:     SSD     <= 8'h98;
     //  10:    SSD     <= 8'b10001000; // A */8'b10111111;//daah
     //  11:    SSD     <= 8'b10000001;
     //  12:    SSD     <= 8'b11000110;
     //  13:    SSD     <= 8'b11000000;
     //  14:    SSD     <= 8'b10000110;
     //  15:    SSD     <= 8'b10001110;
        default: SSD   <= 8'b11000000;
        endcase
    end
    
    
    
    
endmodule
