`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:29 11/25/2020 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input clk,
    input reset,
	
    input [31:0] PCM,
    input [31:0] InstrM,
	
    input [31:0] WDM,	// Write Data Mem-Stage
	input [31:0] ResM,
    input [31:0] FwdM2,
	
    output [31:0] WDMW	// Write Data from Mem-Stage to Write-Stage
    );
	wire WEMem;
	wire [1:0] width;
	wire LoadSign;
	wire [31:0] MRD; // Mem Read Data
	
	wire WDSelM;
	
	Control CtrlM(
    .instr(InstrM), 
	
    .WEMem(WEMem), 
    .width(width), 
    .LoadSign(LoadSign), 
    .WDSelM(WDSelM)
    );
	
	DM dm (
    .clk(clk), 
    .reset(reset),
	
    .WE(WEMem), 
    .width(width), 
    .LoadSign(LoadSign), 
	
    .addr(ResM), 
    .WD(FwdM2), 
	
    .RD(MRD), 
    .PC(PCM)
    );
	
	assign WDMW = (WDSelM == 0)? WDM : MRD;


endmodule
