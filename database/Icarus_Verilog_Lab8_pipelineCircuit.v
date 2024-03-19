`ifndef PIPELINE_CIRCUIT
`define PIPELINE_CIRCUIT
`include "pipelineParGen.v"
`include "pipelineAlu.v"
`include "pipelineEnc.v"
		
	module pipelineCircuit(
		input [7:0] fncode,
		input [3:0] srcA,
		input [3:0] srcB,
		output parity
	);
		/*
			ToDo: Use these registers for implementation, Code not correct right now as per labsheet requirements.
		*/
		reg [10:0] IF_EXReg;
		reg [3:0] EX_PARReg;
		
		wire [2:0] opcode;
		wire [3:0] aluOut;
		
		pipelineEnc enc(fncode, opcode);
		pipelineAlu alu(opcode, srcA, srcB, aluOut);
		pipelineParGen pargen(aluOut, parity);
		
		
	endmodule
	
	
		
`endif
