`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:39:29 11/29/2020 
// Design Name: 
// Module Name:    hazard 
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
module hazard(
    input clk,
    input reset,
	
///// Decode
	// ID/EX knows which Decode to use
    input [4:0] A1D,
    input [4:0] A2D,
	
	// Decode store the values
    input [31:0] RD1D,
    input [31:0] RD2D,
	
	// is the instr of Decode-Stage using the GRF?
    input D1Use,
    input D2Use,
	// gonna use MDU??
	input MD,
	
	
///// Execute /////
	// ID/EX know the Addr of the regs that Execute use
    input [4:0] A1E,
    input [4:0] A2E,
	
	// ID/EX store the value itself
    input [31:0] RD1E,
    input [31:0] RD2E,
	
	// is the instr of Execute-Stage using the GRF?
    input E1Use,
    input E2Use,
	input start,
	input busy,

	
	// the forward-unit need to know
    input [4:0] A3E,
    input [31:0] WDE,
	
///// Memory /////
	// EX/MEM knows the Mem-stage will use ...
    input [4:0] A2M,
    input [31:0] RD2M,
	
	// detect the stall
    input M2Use,
	
	// EX/MEM stores the calculated res 
    input [4:0] A3M,
    input [31:0] WDM,
	
///// Write Back /////
	// MEM/WB stored the counted vals
    input [4:0] A3W,
    input [31:0] WDW,
	
	
	
    output [31:0] FwdD1,
    output [31:0] FwdD2,
    output [31:0] FwdE1,
    output [31:0] FwdE2,
    output [31:0] FwdM2,
	
	
	// stall-out 
    output EnPC,
    output EnIFID,
    output EnIDEX,
    output FlushIDEX,
    output FlushEXMEM
    );
	// forward from GRF, because the RD1DE is directly to Execute-Stage
	// it should be forward
	reg [4:0] A3R;
	reg [31:0] WDR;
	initial begin
		A3R = 0;
		WDR = 0;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			A3R <= 0;
			WDR <= 0;
		end
		else if(A3W != 0) begin
			A3R <= A3W;
			WDR <= WDW;
		end
	end

///////////////// Stall Signals //////////////////////

	// D-Stage needs, 
	// but the stage havn't caculated it out,
	// or the 
	// so the WriteData(WD) is 32'bz
	assign StallD =	(
					(
					(D1Use && A1D == A3E && A3E != 0 && WDE === 32'bz) ||
					(D1Use && A1D == A3M && A3M != 0 && WDM === 32'bz && !(A1D == A3E && A3E != 0 && WDE !== 32'bz))
					)||
					(
					(D2Use && A2D == A3E && A3E != 0 && WDE === 32'bz) ||
					(D2Use && A2D == A3M && A3M != 0 && WDM === 32'bz && !(A2D == A3E && A3E != 0 && WDE !== 32'bz))
					)||
					((start || busy) && MD)
					)&& !StallE;	// priority of E is higher than priority of D
					// || (A3E === 5'bz)
					
				
	assign StallE =	(E1Use && A1E == A3M && A3M != 0 && WDM === 32'bz) ||
					(E2Use && A2E == A3M && A3M != 0 && WDM === 32'bz);
					// ||(A3M === 5'bz)
					
	// StallD means Decode-Stage needs the data
	// instr should be freezed on D-Stage and the stages before it, 
	// nop would be instered into the D/E, which use flush
	assign EnPC = ~(StallD || StallE);	// once Stall happens, PC and IEID stop
	assign EnIFID = ~(StallD || StallE);	// the instr and PC would not read to IEID
	assign FlushIDEX = 	StallD;

	// StallE means Execute-Stage needs the data
	// instr should be freezed on E-Stage and the stages before it, 
	// nop would be instered into the D/E, which use flush
	assign EnIDEX = ~StallE;
	assign FlushEXMEM = StallE;



///////////////// Forwasrd Signals //////////////////

	// 'Cause the internal Fwd in GRF, so there are only two fwd
	assign FwdD1 =	(A1D == A3E && A3E != 0)? WDE :
					(A1D == A3M && A3M != 0)? WDM :
					RD1D;
	assign FwdD2 =	(A2D == A3E && A3E != 0)? WDE :
					(A2D == A3M && A3M != 0)? WDM :
					RD2D;
					
	// ALU use the fwd, fwd back from EX/MEM and MEM/WB
	assign FwdE1 =	(A1E == A3M && A3M != 0)? WDM :
					(A1E == A3W && A3W != 0)? WDW :
					(A1E == A3R && A3R != 0)? WDR :
					RD1E;
	assign FwdE2 =	(A2E == A3M && A3M != 0)? WDM :
					(A2E == A3W && A3W != 0)? WDW :
					(A2E == A3R && A3R != 0)? WDR :
					RD2E;
					
	assign FwdM2 =	(A2M == A3W && A3W != 0)? WDW :
					RD2M;



endmodule
