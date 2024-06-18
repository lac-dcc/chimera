// This program was cloned from: https://github.com/pontazaricardo/Verilog_Calculator_Matrix_Multiplication
// License: Mozilla Public License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ricardo Pontaza
// 
// Create Date:    15:56:39 08/03/2017 
// Design Name: 
// Module Name:    Calculator 
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
module Calculator(A,B,Result);

	input [143:0] A;
	input [143:0] B;
	output [143:0] Result;
	
	reg [143:0] Result;
	reg [15:0] A1 [0:2][0:2];
	reg [15:0] B1 [0:2][0:2];
	reg [15:0] Res1 [0:2][0:2];
	
	integer i,j,k;
	
	always@ (A or B)
	begin
		//We convert the 1D arrays into 2D
		{A1[0][0],A1[0][1],A1[0][2],A1[1][0],A1[1][1],A1[1][2],A1[2][0],A1[2][1],A1[2][2]} = A;
		{B1[0][0],B1[0][1],B1[0][2],B1[1][0],B1[1][1],B1[1][2],B1[2][0],B1[2][1],B1[2][2]} = B;
		{Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]} = 144'd0;
		
		i=0; j=0; k=0;
		
		//$display ("Multiplying");
		
		for(i=0;i<3;i=i+1)
		begin
			for(j=0;j<3;j=j+1)
			begin
				for(k=0;k<3;k=k+1)
				begin
					Res1[i][j]=Res1[i][j]+ (A1[i][k]*B1[k][j]);
				end
			end
		end
		
		Result = {Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]};
	end

endmodule
