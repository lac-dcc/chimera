// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 02:16:29 PM
// Design Name: 
// Module Name: ZigzagOrderROM
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


module zigzagOrderROM (
    input [3:0] address,
    output reg [3:0] data
);

    always @* begin
        case(address)
            4'h0: data = 4'h0;
            4'h1: data = 4'h1;
            4'h2: data = 4'h4;
            4'h3: data = 4'h8;
            4'h4: data = 4'h5;
            4'h5: data = 4'h2;
            4'h6: data = 4'h3;
            4'h7: data = 4'h6;
            4'h8: data = 4'h9;
            4'h9: data = 4'hC;
            4'ha: data = 4'hD;
            4'hb: data = 4'hA;
            4'hc: data = 4'h7;
            4'hd: data = 4'hB;
            4'he: data = 4'hE;
            4'hf: data = 4'hF;
            default: data = 4'h0000;
        endcase
    end
endmodule
