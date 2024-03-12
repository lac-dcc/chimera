`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:54 11/24/2020 
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
    input JType,
    input JReg,
    input [31:0] PCF,
    input [31:0] PCD,
    input [25:0] imm26D,
    input [31:0] RegJump,
    output [31:0] NPC
    );
	wire [31:0] PCD4;
	assign PCD4 = PCD + 4;
	assign NPC =	(branch)? PCD + 4 + {{14{imm26D[15]}}, imm26D[15:0], 2'b0}:
					(JType)? {PCD4[31:28], imm26D, 2'b0}:
					(JReg)? RegJump:
					PCF + 4;		// default the PC + 4


endmodule
