// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 02:29:50 AM
// Design Name: 
// Module Name: nC_Selector
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


module nC_Selector #(parameter nWIDTH= 4)(
input   wire    [nWIDTH-1:0]    nA,
input   wire    [nWIDTH-1:0]    nB,

output   reg    [nWIDTH-1:0]    nC

    );
    
    always@*
        begin
            if (nA>0 | nB>0)
                nC= (nA+nB)>>1;
            else 
                nC= 0;
        end
    
    
    
endmodule
