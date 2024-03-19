`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:12 05/04/2018 
// Design Name: 
// Module Name:    Adder_one 
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
module Adder_one(A,B,Ci,F,Co);
input A,B,Ci;
output F,Co;
wire A,B,Ci,F,Co;
wire S1,S2,S3;
xor XU1(F,A,B,Ci),
    XU2(S1,A,B);
and AU1(S2,A,B),
    AU2(S3,S1,Ci);
or  OU1(Co,S2,S3);
endmodule

