`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:07 10/25/2018 
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
    input [2:0] ALUOp,
    output reg [31:0] C
    );
	 
	always@(*) begin
		if(ALUOp==3'b000) begin
			C =  A + B;
		end
		else if(ALUOp==3'b001) begin
			C = A - B;
		end
		else if(ALUOp==3'b010) begin
			C = A & B;
		end
		else if(ALUOp==3'b011) begin
			C = A | B;
		end
		else if(ALUOp==3'b100) begin
			C = A >> B;
		end
		else if(ALUOp==3'b101) begin
			C = $signed(A) >>> B; //$signed($signed(A) >>> B);
		end
		else if(ALUOp==3'b110) begin
			C = C;
		end
		else if(ALUOp==3'b111) begin
			C = C;
		end
	end
endmodule
