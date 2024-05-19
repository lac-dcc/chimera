// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module DpRegFile #(	parameter addrLen = 5,
parameter dataLen = 32)(
	clk,
	reset,

	rd,
	wrt,
	
	rdAddr,
	wrtAddr,
	
	dataOut,
	dataIn
);
	//--------------------------------------------------------------------------------------


	//--------------------------------------------------------------------------------------
	input clk;
	input reset;
	
	input rd;
	input wrt;
	
	input[addrLen - 1: 0] rdAddr;
	input[addrLen - 1: 0] wrtAddr;
	
	output[dataLen - 1: 0] dataOut;
	input[dataLen - 1: 0]  dataIn;
	
	//output [dataLen - 1: 0] data0, data1, data2, data3;

	//--------------------------------------------------------------------------------------
	reg[dataLen - 1: 0] data[0: (1 << addrLen) - 1];
	
	//assign data0 = data[0];
	//assign data1 = data[1];
	//assign data2 = data[2];
	//assign data3 = data[3];
	
	//--------------------------------------------------------------------------------------
	assign dataOut = data[rdAddr];

	//--------------------------------------------------------------------------------------
	always @(posedge clk)
		if (wrt)
			data[wrtAddr] <= dataIn;

endmodule
