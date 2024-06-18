// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module CpuTest ();

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [31:0] debug_if_pc;
	wire [31:0] debug_if_nextPc;
	wire [31:0] debug_if_instruction;
	wire [31:0] debug_id_instruction;
	wire debug_id_shouldStall;
	wire debug_id_shouldForwardRegisterRs;
	wire debug_id_shouldForwardRegisterRt;
	wire [1023:0] debug_id_registers;
	wire [31:0] debug_ex_instruction;
	wire [31:0] debug_ex_aluInputA;
	wire [31:0] debug_ex_aluInputB;
	wire [31:0] debug_ex_aluOutput;
	wire [31:0] debug_mem_instruction;
	wire [31:0] debug_mem_memoryAddress;
	wire [31:0] debug_mem_memoryReadData;
	wire debug_mem_shouldWriteMemory;
	wire [31:0] debug_mem_memoryWriteData;
	wire [31:0] debug_wb_instruction;
	wire debug_wb_shouldWriteRegister;
	wire [4:0] debug_wb_registerWriteAddress;
	wire [31:0] debug_wb_registerWriteData;

	// Instantiate the Unit Under Test (UUT)
	Cpu uut (
		.clock(clock), 
		.reset(reset), 
		.debug_if_pc(debug_if_pc), 
		.debug_if_nextPc(debug_if_nextPc), 
		.debug_if_instruction(debug_if_instruction), 
		.debug_id_instruction(debug_id_instruction), 
		.debug_id_shouldStall(debug_id_shouldStall), 
		.debug_id_shouldForwardRegisterRs(debug_id_shouldForwardRegisterRs), 
		.debug_id_shouldForwardRegisterRt(debug_id_shouldForwardRegisterRt), 
		.debug_id_registers(debug_id_registers), 
		.debug_ex_instruction(debug_ex_instruction), 
		.debug_ex_aluInputA(debug_ex_aluInputA), 
		.debug_ex_aluInputB(debug_ex_aluInputB), 
		.debug_ex_aluOutput(debug_ex_aluOutput), 
		.debug_mem_instruction(debug_mem_instruction), 
		.debug_mem_memoryAddress(debug_mem_memoryAddress), 
		.debug_mem_memoryReadData(debug_mem_memoryReadData), 
		.debug_mem_shouldWriteMemory(debug_mem_shouldWriteMemory), 
		.debug_mem_memoryWriteData(debug_mem_memoryWriteData), 
		.debug_wb_instruction(debug_wb_instruction), 
		.debug_wb_shouldWriteRegister(debug_wb_shouldWriteRegister), 
		.debug_wb_registerWriteAddress(debug_wb_registerWriteAddress), 
		.debug_wb_registerWriteData(debug_wb_registerWriteData)
	);

	initial begin

		// Initialize Inputs
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		forever begin
			#5;
			clock = ~clock;
		end
	end     
endmodule
