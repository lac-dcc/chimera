`ifndef SC_DATAPATH
`define SC_DATAPATH
`include "im.v"
`include "dm.v"
`include "regFile.v"
`include "alu.v"
`include "aluCU.v"
`include "mainCU.v"
`include "signExt.v"
`include "shifter.v"
`include "fulladder_32bit.v"
`include "mux_2to1_32bit.v"
`include "reg_32bit.v"


	module SCDatapath(
		input reset,
	);
		
		//PC with address 0
		reg clk;
		reg [4:0] pcOut;
		reg5bit pc( 5'b0, clk, pcOut );
		
		//instr memory
		im instrMem( pc, reset , instr );
		
	
	endmodule
	
	module reg5bit(
	input [4:0] inp,
	input clk,
	output [4:0] outp);
		
		always @(posedge clk)	
			outp = inp;
		
	endmodule
`endif