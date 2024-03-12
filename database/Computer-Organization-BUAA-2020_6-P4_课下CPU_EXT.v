`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:07 11/17/2020 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0] imm16,
    input sign,
    output reg [31:0] imm32
    );
	always@(*) begin
		case(sign)		//signed ext or not
			0 : 
				imm32 = {16'h0, imm16};		// not sign
			1 :
				imm32 = {{16{imm16[15]}}, imm16};		// sign
			default :
				imm32 = 0;
		
		endcase
	end

endmodule
