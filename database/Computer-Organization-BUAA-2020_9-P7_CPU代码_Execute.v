`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:53 11/25/2020 
// Design Name: 
// Module Name:    Execute
//////////////////////////////////////////////////////////////////////////////////
module Execute(
    input clk,
    input reset,
	
	// Int and eret
	// stop MDU
	input IntReq,
	input eret,	
	
    input [31:0] InstrE,
    input [31:0] imm32E,
	
	input [4:0] A3E,
    input [31:0] WDE,
    input [31:0] FwdE1,
    input [31:0] FwdE2,
	
	input [6:2] ExcCodeE,
	
	
	output [4:0] A3EM,
    output [31:0] WDEM,
	output [31:0] ResEM,
    output [31:0] RD2EM,
	
	// stall sigals
	output start,
	output busy,
	output E1Use,
	output E2Use,
	
	// Exc
	output [6:2] ExcCodeEM
    );
	wire [3:0] ALUOp;
	wire ALUASel, ALUBSel;
	wire[31:0] ALUA, ALUB, res;
	wire ovf;
	wire [1:0] WDSelE;
	wire [2:0] MDUOp;
	wire HIWrite, LOWrite;
	wire [31:0] HI, LO;
	
	wire Ov, Ld, St;
	
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
	.E2Use(E2Use),
	
	// pre detect the addr/cal ovf
	.Ov(Ov),
	.Ld(Ld),
	.St(St)
    );
	
	assign ALUA = (ALUASel == 0)? FwdE1 : {27'b0, InstrE[10:6]};	// shift not v will use s
	assign ALUB = (ALUBSel == 0)? FwdE2 : imm32E;
	
	ALU alu (
    .A(ALUA), 
    .B(ALUB), 
    .ALUOp(ALUOp), 
    .res(res),
	.ovf(ovf)
    );
	
	
	// Instantiate the module
	MDU mdu (
    .clk(clk), 
    .reset(reset), 
	.IntReq(IntReq),
	
    .A(FwdE1),
    .B(FwdE2), 
    .start(start), 
    .MDUOp(MDUOp), 
    .HIWrite(HIWrite & !eret & !IntReq), 
    .LOWrite(LOWrite & !eret & !IntReq), 
	
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
	
	assign ExcCodeEM =	(Ov && ovf && (ExcCodeE == 0))? 5'd12 :	// self trapping
						(Ld && ovf && (ExcCodeE == 0))? 5'd4 :	// Addr Error for Load
						(St && ovf && (ExcCodeE == 0))? 5'd5 :	// Addr Error for Store
						ExcCodeE;
						// it can only detect the ovf Exc
						// lb/lw ... need more precise logic
endmodule
