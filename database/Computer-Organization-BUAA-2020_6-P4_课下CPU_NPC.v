`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:25 11/17/2020 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input branch,
    input JType,		// j and jal is the same
    input JReg,
    input [31:0] PC,
    input [31:0] RegJump,
    input [25:0] imm26,
    output [31:0] PC4,
    output reg [31:0] NPC
    );
	assign PC4 = PC + 4;
	always@(*) begin
		if(branch) begin
			NPC = PC + 4 + {{14{imm26[15]}}, imm26[15:0], 2'b00};
		end
		else if (JType) begin
			NPC = {PC[31:28], imm26, 2'b00};
		end
		else if (JReg) begin
			NPC = RegJump;
		end
		else begin
			NPC = PC + 4;
		end
	end
endmodule
