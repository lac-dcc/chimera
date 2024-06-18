// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module rdFifo #(
    parameter addrLen = 5,
	parameter dataLen = 32,
	parameter peId = 0
	)
(
	clk,
	reset,
	
	noStall,

	rd,
	
	restart,
	
	dataOut
);
	//--------------------------------------------------------------------------------------
	

	//--------------------------------------------------------------------------------------
	input clk;
	input reset;
	input noStall;
	
	input rd;
	
	input restart;
	
	output [dataLen - 1: 0] dataOut;

	//--------------------------------------------------------------------------------------
	wire headCntEn;
	wire[addrLen - 1: 0] headIn;
	wire[addrLen - 1: 0] headOut;

	wire fullEmptyBWrt;
	wire fullEmptyBIn;
	wire fullEmptyBOut;

	wire headTailEq;

	//--------------------------------------------------------------------------------------
	assign headIn = 0;
	
	Cnter #(addrLen) head (
		clk,
		reset,
		restart,
		rd,
		headIn,
		headOut
	);
	
	//--------------------------------------------------------------------------------------
	wire [dataLen - 1 : 0] dataOutBuffer;
	
	`ifdef SIMULATION
	   iBuffer_ASIC #(
			.addrLen(addrLen), 
			.dataLen(dataLen), 
			.peId(peId)
		) 
		inst_buffer (
			.clk(clk),
			.noStall(noStall),
			.rdAddr(headOut),
			.dataOut(dataOut)
		);
	`elsif FPGA
		iBuffer #(
			.addrLen(addrLen), 
			.dataLen(dataLen), 
			.peId(peId)
		) 
		inst_buffer (
			.clk(clk),
			.noStall(noStall),
			.rdAddr(headOut),
			.dataOut(dataOut)
		);
	`else
		iBuffer_ASIC #(
			.addrLen(addrLen), 
			.dataLen(dataLen), 
			.peId(peId)
		) 
		inst_buffer (
			.clk(clk),
			.noStall(noStall),
			.rdAddr(headOut),
			.dataOut(dataOut)
		);
	`endif


endmodule
