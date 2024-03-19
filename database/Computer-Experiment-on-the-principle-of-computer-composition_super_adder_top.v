`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:44 05/04/2018 
// Design Name: 
// Module Name:    top 
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
module top(A,B,Ci,F,Co);
input[3:0] A,B;
input Ci;
output[3:0] F;
output[4:1] Co;
wire[3:0] A,B,F,G,P;
wire Ci;
wire[4:1] Co;
and AU0(G[0],A[0],B[0]),
    AU1(G[1],A[1],B[1]),
	 AU2(G[2],A[2],B[2]),
	 AU3(G[3],A[3],B[3]);
or  OU0(P[0],A[0],B[0]),
    OU1(P[1],A[1],B[1]),
	 OU2(P[2],A[2],B[2]),
	 OU3(P[3],A[3],B[3]);
chaoqian M(Co,G,P,Ci);
First_M FA0(A[0],B[0],Ci,F[0]),
        FA1(A[1],B[1],Co[1],F[1]),
		  FA2(A[2],B[2],Co[2],F[2]),
		  FA3(A[3],B[3],Co[3],F[3]);
endmodule

