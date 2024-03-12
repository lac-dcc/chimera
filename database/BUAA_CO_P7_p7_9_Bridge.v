`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:11 12/12/2018 
// Design Name: 
// Module Name:    Bridge 
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
module Bridge(
    input [31:0] PrAddr,
	 input PrWE,
    output [31:0] PrRD,
    input [31:0] PrWD,
    output [31:0] DEV_Addr,
    output [31:0] DEV_WD,
    input [31:0] DEV0_RD,
    input [31:0] DEV1_RD,
	 output WeDEV0,
	 output WeDEV1,
	 input [7:2] HWIntIn,
	 output [7:2] HWIntOut
    );
	 
	`define DEBUG_DEV_DATA 32'b0
	
	//DEV0 00007F00-00007F0B 
	//DEV1 00007F10-00007F1B 
	wire HitDEV0,HitDEV1;
	assign HitDEV0 = (PrAddr[31:4]==28'h00007F0);
	assign HitDEV1 = (PrAddr[31:4]==28'h00007F1);
	
	assign PrRD = (HitDEV0) ? DEV0_RD :
					  (HitDEV1) ? DEV1_RD :
					  `DEBUG_DEV_DATA;
	
	assign WeDEV0 = PrWE&&HitDEV0;
	assign WeDEV1 = PrWE&&HitDEV1;
	
	assign DEV_Addr = PrAddr;
	assign DEV_WD = PrWD;
	
	assign HWIntOut = HWIntIn;
endmodule
