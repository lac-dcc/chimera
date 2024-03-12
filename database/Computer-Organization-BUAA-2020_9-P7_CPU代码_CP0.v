`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: JZM longlive company, 1926~infity
// Create Date:    17:28:35 12/22/2020 
// Module Name:    CP0 
// Project Name: P7-1.0
// Additional Comments: f*_*k CP0
//////////////////////////////////////////////////////////////////////////////////
`define SRAddr		12
`define CAUSEAddr	13
`define EPCAddr		14
`define PrIDAddr	15
///////////////////////////////////////////////////////////////////////
// the function of CP0 can be divided into several pieces
// detect interrupt, this guides PC to handle function
//		1. detect internal interrupt
//		2. detct external interrupt	--
//		3. generate the EPC
//		4. 
// update the status, prevent to go into interrupt again
//		1. SR
//		2. CAUSE
// return from handle 
//		eret-clr
///////////////////////////////////////////////////////////////////////

module CP0(
    input clk,
    input reset,
	input WE,
	// read and write, just like GRF
    input [4:0] addr,
    input [31:0] DIn,
	
	// calculate EPC
    input BD,
    input [31:2] PC,
	
	// detect the Int
    input [6:2] ExcCode,
    input [7:2] HWInt,
	
    input eret,	// the eret will restart all
	
	// Interruption external / internal
    output IntReq,
    output reg [31:0] EPC,	// guide the PC to the handle segement
	
    output [31:0] DOut
    );

/////////////////
	// regs in CP0
	// SR		{16'b0, IM, 8'b0, EXL, IE}
	// Cause	{BDReg, 15'b0, IP, 3'b0, ExcCodeReg, 2'b0}
	// EPC		{EPC} 
	// PRID: Personalized Code, like "Damn CS" or something
///////////////////

/// SR: status register
	reg [15:10] IM;	// interrruption mask, who can interrupt
	reg EXL, IE;	// exception level, interruption enable, 

/// Cause: CP0 works when Exc and Int occur
	// this reg record why CP0 works, thats why it called "Cause"
	reg [15:10] IP;	// which external device request a int?
	reg [6:2] ExcCodeReg;	//which exception occurs?

/// EPC: guides the PC
	reg BDReg;
	// reg [31:0] EPC;
//// PrID
	reg [31:0] PrID;
	
	// Generate IntReq
	wire InterInt, ExterInt;
	assign InterInt = (ExcCode != 0);
	assign ExterInt = (|(HWInt[7:2] & IM[15:10])) & IE;
	assign IntReq = ( ExterInt | InterInt) & !EXL;	// req a int external || internal


	always@(posedge clk) begin
		if (reset) begin
			IM <= 0;
			EXL <= 0;
			IE <= 0;
			
			IP <= 0;
			ExcCodeReg <= 0;
			
			BDReg <= 0;
			EPC <= 0;
			PrID <= "PrID";
		end
		else if(eret) begin
			EXL <= 0;	// eret clear 
		end
		else if(IntReq) begin	// EXL must be 0, u can push a IntReq. upd the SR and CAUSE
			BDReg <= BD;
			EPC <= BD ? {PC[31:2] - 1, 2'b0} : {PC[31:2], 2'b0};
			ExcCodeReg <= ExterInt ? 5'b0 : ExcCode;
			EXL <= 1;	// level raise
		end
		// read and write
		else if (WE) begin
			if (addr == `SRAddr) begin
				IM <= DIn[15:10];
				EXL <= DIn[1];
				IE <= DIn[0];
			end
			else if (addr == `EPCAddr) begin
				 EPC <= DIn;	// multi tasks slide
			end
			else begin
			end
		end
		else begin
		end
		
		if (!reset) begin 
			IP <= HWInt;
		end
	end


	assign DOut = 	(addr == `SRAddr)? {16'b0, IM, 8'b0, EXL, IE} :
					(addr == `CAUSEAddr)? {BDReg, 15'b0, IP, 3'b0, ExcCodeReg, 2'b0} :
					(addr == `EPCAddr)? EPC :
					(addr == `PrIDAddr)? PrID :
					32'b0;

endmodule
