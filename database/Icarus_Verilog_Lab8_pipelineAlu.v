`ifndef PIPELINE_ALU
`define PIPELINE_ALU
`include "pipelineEnc.v"	

	module pipelineAlu(
		input [2:0] opcode,
		input [3:0] srcA,
		input [3:0] srcB,
		output [3:0] aluOut
	);
	
		wire [3:0] aluOut;
		
		assign aluOut = (opcode == `ADD) ? (srcA + srcB) :
						(opcode == `SUB) ? (srcA - srcB) :
						(opcode == `XOR) ? (srcA ^ srcB) :
						(opcode == `OR) ? (srcA | srcB) :
						(opcode == `AND) ? (srcA & srcB) :
						(opcode == `NOR) ? ~(srcA | srcB) :
						(opcode == `NAND) ? ~(srcA & srcB) :
						(opcode == `XNOR) ? ~(srcA ^ srcB) : 4'b0;
	
	
	endmodule
	
`endif