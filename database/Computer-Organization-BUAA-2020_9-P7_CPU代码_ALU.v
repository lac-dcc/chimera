`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:51:37 11/17/2020 
// Design Name: 
// Module Name:    ALU 
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
// do not include the macros.v !!!
`define ADDU	4'b0000 // in fact, all plus use this op
`define SUBU	4'b0001
`define AND		4'b0010
`define	OR		4'b0011
`define	LUI		4'b0100
`define NOR		4'b0101
`define XOR		4'b0110
`define SLL		4'b0111	// shift left logically
`define SRL		4'b1000	// shift right logical
`define SRA		4'b1001	// shift right arithmetic
`define SLT		4'b1010	// set less than
`define SLTU	4'b1011	// set less than unsigned

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
    output reg [31:0] res,
	output reg ovf
    );
	reg msb; // most significant bit
	always@(*) begin
		case(ALUOp)
			`ADDU : begin
				{msb, res} = {A[31], A} + {B[31], B}; // use "=" not "<="
				ovf = (msb != res[31]);
			end
			`SUBU : begin
				{msb, res} = {A[31], A} - {B[31], B};
				ovf = (msb != res[31]);
			end
			`AND : begin
				res = A & B;
				ovf = 1'bx;
			end
			`OR : begin
				res = A | B;
				ovf = 1'bx;
			end
			`LUI: begin
				res = {B[15:0], 16'h0};
				ovf = 1'bx;
			end
			`NOR: begin
				res = ~(A | B);
				ovf = 1'bx;
			end
			`XOR : begin
				res = A ^ B;
				ovf = 1'bx;
			end
			`SLL : begin
				res = B << A[4:0];
				ovf = 1'bx;
			end
			`SRL : begin
				res = B >> A[4:0];
				ovf = 1'bx;
			end
			`SRA : begin
				res = $signed(B) >>> A[4:0];
				ovf = 1'bx;
			end
			`SLT : begin
				res = ($signed(A) < $signed(B));
				ovf = 1'bx;
			end
			
			`SLTU : begin
				res = (A < B);
				ovf = 1'bx;
			end
			default : begin
				{ovf, res} = 33'bx;
			end
		endcase
	end
endmodule
