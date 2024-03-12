`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:30 11/23/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCtrl,
    output reg[31:0] Result,
	 output over
    );

	reg[32:0] temp;
	
	assign over = (temp[32]!=temp[31]);
	
	always@(*) begin
		case(ALUCtrl) 
			4'b0000: begin
				Result = A & B;
			end
			4'b0001: begin
				Result = A | B;
			end
			4'b0010: begin
				temp = {A[31],A[31:0]} + {B[31],B[31:0]};
				Result = A + B;
			end
			4'b0011: begin
				temp = {A[31],A[31:0]} - {B[31],B[31:0]};
				Result = A - B;
			end
			4'b0100: begin
				Result = A^B;
			end
			4'b0101: begin
				Result = ~(A|B);
			end
			4'b0110: begin//sll sllv Âß¼­×ó
				Result = B << A[4:0];
			end
			4'b0111: begin//srl srlv Âß¼­ÓÒ
				Result = B >> A[4:0];
			end
			4'b1000: begin//sra srav ËãÊýÓÒ
				Result = $signed($signed(B) >>> A[4:0]);
			end
			4'b1001: begin
				Result = ($signed(A)<$signed(B)) ? 32'b1 : 32'b0;
			end
			4'b1010: begin
				Result = (A<B) ? 32'b1 : 32'b0;
			end
			default: begin
				Result = 0;
			end
		endcase
	end
	
endmodule
