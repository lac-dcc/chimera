// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 03:50:05 PM
// Design Name: 
// Module Name: nbit_mux
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


module  nbit_mux #(parameter n=8)(input[n-1:0] a,b,input s,output [n-1:0]c);
genvar i;


generate 
    for (i=0;i<n;i=i+1)
    begin 
        Mux2x1 mx(.a(a[i]),.b(b[i]),.s(s),.c(c[i]));     
    end
endgenerate 
endmodule
