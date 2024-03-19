`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:32 05/04/2018 
// Design Name: 
// Module Name:    chaoqian 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module chaoqian(C,G,P,Ci);
output[4:1] C;
input[3:0] G,P;
input Ci;
wire[4:1] C;
wire[3:0] G,P;
assign C[1]=G[0]|(P[0]&Ci);
assign C[2]=G[1]|(P[1]&G[0])|(P[1]&P[0]&Ci);
assign C[3]=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&Ci);
assign C[4]=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&Ci);
endmodule
