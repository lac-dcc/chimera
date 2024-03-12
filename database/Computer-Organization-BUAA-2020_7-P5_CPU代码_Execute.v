`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:53 11/25/2020 
// Design Name: 
// Module Name:    Execute 
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
module Execute(
    input clk,
    input reset,
	
    input [31:0] InstrE,
    input [31:0] imm32E,
	
    input [31:0] WDE,
    input [31:0] FwdE1,
    input [31:0] FwdE2,
	
    output [31:0] WDEM,
	output [31:0] ResEM,
    output [31:0] RD2EM,
	
	// stall sigals
	output E1Use,
	output E2Use
    );
	wire [3:0] ALUOp;
	wire ALUASel, ALUBSel;
	wire[31:0] ALUA, ALUB, res;
	wire [1:0] WDSelE;
	
	Control CtrlE (
    .instr(InstrE), 
    .ALUOp(ALUOp), 
    .ALUASel(ALUASel), 
    .ALUBSel(ALUBSel), 
    .WDSelE(WDSelE),
	
	// Stall Signals 
	.E1Use(E1Use),
	.E2Use(E2Use)
    );
	
	assign ALUA = (ALUASel == 0)? FwdE1 : {27'b0, InstrE[10:6]};
	assign ALUB = (ALUBSel == 0)? FwdE2 : imm32E;
	
	ALU alu (
    .A(ALUA), 
    .B(ALUB), 
    .ALUOp(ALUOp), 
    .res(res)
    );
	assign WDEM =	(WDSelE == 2'b00)? WDE :
					(WDSelE == 2'b01)? res :
					WDE;// waiting for P6 to add the HI and LO
	assign ResEM = res;
	assign RD2EM = FwdE2;
endmodule
