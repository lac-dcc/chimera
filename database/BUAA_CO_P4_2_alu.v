`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:29:14 11/15/2018 
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
    input [2:0] ALUCtrl,
    output reg[31:0] Result,
    output Zero
    );

	reg[31:0] sum;
	reg over;
	always@(*) begin
		case(ALUCtrl) 
			3'b000: begin
				Result = A & B;
			end
			3'b001: begin
				Result = A | B;
			end
			3'b010: begin
				Result = A + B;
			end
			3'b011: begin
				Result = A - B;
			end
			3'b100: begin
				Result = 0;
			end
			3'b101: begin
				Result = 0;
			end
			3'b110: begin
				Result = 0;
			end
			3'b111: begin
				Result = 0;
			end
			default: begin
				Result = 0;
			end
		endcase
	end
	assign  Zero = (A==B) ? 1'b1 : 1'b0;
endmodule
