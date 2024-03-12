`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 13:52:22
// Design Name: 
// Module Name: Hex_To_7Seg
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


module Hex_To_7Seg(
    input [3:0] hex,
    output reg [7:0] dispcode
    );
    
    always @(hex) begin
        //  '0'- ÁÁµÆ£¬'1'- Ï¨µÆ
        // [7:0] ´Ó×óµ½ÓÒ£ºDP,g,f,e,d,c,b,a
        case(hex)
            4'h0: dispcode <= 8'b1100_0000; //0
            4'h1: dispcode <= 8'b1111_1001; //1
            4'h2: dispcode <= 8'b1010_0100; //2
            4'h3: dispcode <= 8'b1011_0000; //3
            4'h4: dispcode <= 8'b1001_1001; //4
            4'h5: dispcode <= 8'b1001_0010; //5
            4'h6: dispcode <= 8'b1000_0010; //6
            4'h7: dispcode <= 8'b1101_1000; //7
            4'h8: dispcode <= 8'b1000_0000; //8
            4'h9: dispcode <= 8'b1001_0000; //9
            4'hA: dispcode <= 8'b1000_1000; //A
            4'hB: dispcode <= 8'b1000_0011; //b
            4'hC: dispcode <= 8'b1100_0110; //C
            4'hD: dispcode <= 8'b1010_0001; //d
            4'hE: dispcode <= 8'b1000_0110; //E
            4'hF: dispcode <= 8'b1000_1110; //F
            default: dispcode <= 8'b0000_0000; // ²»ÁÁ
        endcase
    end
    
endmodule
