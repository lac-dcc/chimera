`timescale 1ns/1ps

module iBuffer_ASIC_header #(
    parameter integer addrLen = 5,
	parameter integer dataLen = 32,
	parameter integer peId	= 1
)(
	clk,
	rdAddr,
	noStall,
	dataOut
);

	input clk;
	input noStall;
	input[addrLen - 1: 0] rdAddr;
	output reg[dataLen - 1: 0] dataOut;

	//--------------------------------------------------------------------------------------
	reg[dataLen - 1: 0] mem	[0: (1 << addrLen) - 1];
	
	// ******************************************************************
	// Initialization
	// ******************************************************************

    localparam DATA_WIDTH = dataLen;
    localparam DEPTH = (1<<addrLen);
    wire     [addrLen-1:0]        address;
    reg     [DATA_WIDTH-1:0]        rdata;

    assign address = rdAddr;
	
	always @(posedge clk) begin
 		if(noStall) dataOut <= rdata;
	end
	
    // `include "instructions.v" // TODO

	//-------------------------------------------------------------------------------------
 	
