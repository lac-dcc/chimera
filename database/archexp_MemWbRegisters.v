`timescale 1ns / 1ps

module MemWbRegisters (

		input clock,
		input reset,

		input [31:0] mem_instruction,

		input mem_shouldWriteRegister,
		input [4:0] mem_registerWriteAddress,
		input mem_shouldWriteMemoryElseAluOutputToRegister,
		input [31:0] mem_memoryData,
		input [31:0] mem_aluOutput,

		output reg [31:0] wb_instruction = 0,

		output reg wb_shouldWriteRegister = 0,
		output reg [4:0] wb_registerWriteAddress = 0,
		output reg wb_shouldWriteMemoryElseAluOutputToRegister = 0,
		output reg [31:0] wb_memoryData = 0,
		output reg [31:0] wb_aluOutput = 0
	);

	always @(posedge clock) begin

		if (reset) begin

			wb_instruction <= 0;

			wb_shouldWriteRegister <= 0;
			wb_registerWriteAddress <= 0;
			wb_shouldWriteMemoryElseAluOutputToRegister <= 0;
			wb_memoryData <= 0;
			wb_aluOutput <= 0;

		end else begin

			wb_instruction <= mem_instruction;

			wb_shouldWriteRegister <= mem_shouldWriteRegister;
			wb_registerWriteAddress <= mem_registerWriteAddress;
			wb_shouldWriteMemoryElseAluOutputToRegister <= mem_shouldWriteMemoryElseAluOutputToRegister;
			wb_memoryData <= mem_memoryData;
			wb_aluOutput <= mem_aluOutput;
		end
	end
endmodule
