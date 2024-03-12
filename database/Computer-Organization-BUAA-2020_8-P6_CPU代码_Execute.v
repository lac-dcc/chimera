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
	
	input [4:0] A3E,
    input [31:0] WDE,
    input [31:0] FwdE1,
    input [31:0] FwdE2,
	
	
	output [4:0] A3EM,
    output [31:0] WDEM,
	output [31:0] ResEM,
    output [31:0] RD2EM,
	
	// stall sigals
	output start,
	output busy,
	output E1Use,
	output E2Use
    );
	wire [3:0] ALUOp;
	wire ALUASel, ALUBSel;
	wire[31:0] ALUA, ALUB, res;
	wire [1:0] WDSelE;
	wire [2:0] MDUOp;
	wire HIWrite, LOWrite;
	wire [31:0] HI, LO;
	
	Control CtrlE (
    .instr(InstrE), 
	
	// ALU
    .ALUOp(ALUOp), 
    .ALUASel(ALUASel), 
    .ALUBSel(ALUBSel), 
	
	// MDU
	.start(start),
	.MDUOp(MDUOp),
	.HIWrite(HIWrite),
	.LOWrite(LOWrite),
	
    .WDSelE(WDSelE),
	
	// Stall Signals 
	.E1Use(E1Use),
	.E2Use(E2Use)
    );
	
	assign ALUA = (ALUASel == 0)? FwdE1 : {27'b0, InstrE[10:6]};	// shift not v will use s
	assign ALUB = (ALUBSel == 0)? FwdE2 : imm32E;
	
	ALU alu (
    .A(ALUA), 
    .B(ALUB), 
    .ALUOp(ALUOp), 
    .res(res)
    );
	
	
	// Instantiate the module
	MDU mdu (
    .clk(clk), 
    .reset(reset), 
    .A(FwdE1), 
    .B(FwdE2), 
    .start(start), 
    .MDUOp(MDUOp), 
    .HIWrite(HIWrite), 
    .LOWrite(LOWrite), 
	
    .HI(HI), 
    .LO(LO),
	.busy(busy) 	// output to hzd
    );
	
	assign A3EM = A3E;
	
	assign WDEM =	(WDSelE == 2'b00)?	WDE :
					(WDSelE == 2'b01)?	res :
					(WDSelE == 2'b10)?	HI :
					(WDSelE == 2'b11)?	LO :
					WDE;// Default use WD from E
	assign ResEM = res;
	assign RD2EM = FwdE2;
endmodule
