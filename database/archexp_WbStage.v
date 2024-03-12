`timescale 1ns / 1ps

module WbStage (
		input shouldWriteMemoryElseAluOutputToRegister, 	// WM2REG
		input [31:0] memoryData,
		input [31:0] aluOutput,
		output [31:0] registerWriteData
	);

	assign registerWriteData = shouldWriteMemoryElseAluOutputToRegister ? memoryData : aluOutput;
endmodule
