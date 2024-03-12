`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:07 10/25/2018 
// Design Name: 
// Module Name:    splitter 
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
module splitter(
    input [31:0] A,
    output [7:0] O1,
    output [7:0] O2,
    output [7:0] O3,
    output [7:0] O4
    );

	assign O4 = A[7:0];//{A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0]};
	assign O3 = {A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8]};
	assign O2 = {A[23],A[22],A[21],A[20],A[19],A[18],A[17],A[16]};
	assign O1 = {A[31],A[30],A[29],A[28],A[27],A[26],A[25],A[24]};
endmodule

