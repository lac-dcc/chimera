`ifndef PIPELINE_PAR_GEN
`define PIPELINE_PAR_GEN
`include "pipelineAlu.v"
`include "pipelineEnc.v"

	module pipelineParGen(
		input [3:0] aluOut,
		output parity
	);
		
		assign parity = aluOut[0] ^ aluOut[1] ^ aluOut[2] ^ aluOut[3];
		
	endmodule

`endif