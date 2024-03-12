`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:07 11/15/2018 
// Design Name: 
// Module Name:    aluController 
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
module aluController(
    input [2:0] ALUOp,
    input [5:0] func,
    output reg[2:0] ALUCtrl
    );

	always@(*)begin
		case (ALUOp)
			3'b000: begin
				case(func)
					6'b100001: ALUCtrl<=3'b010;
					6'b100011: ALUCtrl<=3'b011;
					6'b001000: ALUCtrl<=3'b010;
					default :  ALUCtrl<=3'b111;
				endcase
			end
			3'b001: ALUCtrl<=3'b010;
			3'b010: ALUCtrl<=3'b011;
			3'b011: ALUCtrl<=3'b111;
			3'b111: ALUCtrl<=3'b001;
			default: ALUCtrl<=3'b111;
		endcase
	end

endmodule
