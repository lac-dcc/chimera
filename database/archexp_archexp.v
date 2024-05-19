// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module archexp(

		input clock50Mhz,

		input [3:0] BTN,
		input [7:0] SW,
		output [3:0] AN,
		output [7:0] SEGMENT,
		output [7:0] LED,

		output vgaHSync,
		output vgaVSync,
		output [2:0] vgaRed,
		output [2:0] vgaGreen,
		output [1:0] vgaBlue
	);

	wire [3:0] button_out;
	wire reset;
	wire [7:0] SW_OK;

	wire [31:0] clockCounter;

	wire [31:0] cpu_if_pc;
	wire [31:0] cpu_if_nextPc;
	wire [31:0] cpu_if_instruction;
	wire [31:0] cpu_id_instruction;
	wire cpu_id_shouldStall;
	wire cpu_id_shouldForwardRegisterRs;
	wire cpu_id_shouldForwardRegisterRt;
	wire [32 * 32 - 1 : 0] cpu_id_registers;
	wire [31:0] cpu_ex_instruction;
	wire [31:0] cpu_ex_aluInputA;
	wire [31:0] cpu_ex_aluInputB;
	wire [31:0] cpu_ex_aluOutput;
	wire [31:0] cpu_mem_instruction;
	wire [31:0] cpu_mem_memoryAddress;
	wire [31:0] cpu_mem_memoryReadData;
	wire cpu_mem_shouldWriteMemory;
	wire [31:0] cpu_mem_memoryWriteData;
	wire [31:0] cpu_wb_instruction;
	wire cpu_wb_shouldWriteRegister;
	wire [4:0] cpu_wb_registerWriteAddress;
	wire [31:0] cpu_wb_registerWriteData;

	wire [9:0] vgaX;
	wire [8:0] vgaY;
	wire isVgaActive;
	wire [7:0] vgaColor;

	wire [11:0] terminalAddress;
	wire shouldWriteTerminal;
	wire [7:0] terminalWriteData;
	wire [7:0] terminalReadData;

	Anti_jitter U9 (
		.clk(clock50Mhz),
		.button(BTN[3:0]),
		.SW(SW[7:0]),
		.button_out(button_out[3:0]),
		.rst(reset),
		.button_pulse(),
		.SW_OK(SW_OK[7:0])
	);

	ClockDivider clockDivider (
		.clock(clock50Mhz),
		.reset(reset),
		.counter(clockCounter[31:0])
	);

	wire cpuClock = !button_out[1];	// So that memory read operates before CPU.
	Cpu cpu (

		.clock(cpuClock),
		.reset(reset),

		.debug_if_pc(cpu_if_pc[31:0]),
		.debug_if_nextPc(cpu_if_nextPc[31:0]),
		.debug_if_instruction(cpu_if_instruction[31:0]),
		.debug_id_instruction(cpu_id_instruction[31:0]),
		.debug_id_shouldStall(cpu_id_shouldStall),
		.debug_id_shouldForwardRegisterRs(cpu_id_shouldForwardRegisterRs),
		.debug_id_shouldForwardRegisterRt(cpu_id_shouldForwardRegisterRt),
		.debug_id_registers(cpu_id_registers[32 * 32 - 1 : 0]),
		.debug_ex_instruction(cpu_ex_instruction[31:0]),
		.debug_ex_aluInputA(cpu_ex_aluInputA[31:0]),
		.debug_ex_aluInputB(cpu_ex_aluInputB[31:0]),
		.debug_ex_aluOutput(cpu_ex_aluOutput[31:0]),
		.debug_mem_instruction(cpu_mem_instruction[31:0]),
		.debug_mem_memoryAddress(cpu_mem_memoryAddress[31:0]),
		.debug_mem_memoryReadData(cpu_mem_memoryReadData[31:0]),
		.debug_mem_shouldWriteMemory(cpu_mem_shouldWriteMemory),
		.debug_mem_memoryWriteData(cpu_mem_memoryWriteData[31:0]),
		.debug_wb_instruction(cpu_wb_instruction[31:0]),
		.debug_wb_shouldWriteRegister(cpu_wb_shouldWriteRegister),
		.debug_wb_registerWriteAddress(cpu_wb_registerWriteAddress[4:0]),
		.debug_wb_registerWriteData(cpu_wb_registerWriteData[31:0])
	);

	wire clock25Mhz = clockCounter[1];
	VgaController vgaController (
		.clock25Mhz(clock25Mhz),
		.reset(reset),
		.hSync(vgaHSync),
		.vSync(vgaVSync),
		.isActive(isVgaActive),
		.x(vgaX[9:0]),
		.y(vgaY[8:0])
	);

	Terminal terminal (

		.clock(clock50Mhz),

		.isVgaActive(isVgaActive),
		.vgaX(vgaX[9:0]),
		.vgaY(vgaY[8:0]),
		.vgaColor(vgaColor[7:0]),

		.textAddress(terminalAddress[11:0]),
		.textReadData(terminalReadData[7:0]),
		.shouldWriteText(shouldWriteTerminal),
		.textWriteData(terminalWriteData[7:0])
	);
	assign vgaRed = vgaColor[7:5];
	assign vgaGreen = vgaColor[4:2];
	assign vgaBlue = vgaColor[1:0];

	Debugger debugger (

		.clock(clock25Mhz),

		.cpu_if_pc(cpu_if_pc[31:0]),
		.cpu_if_nextPc(cpu_if_nextPc[31:0]),
		.cpu_if_instruction(cpu_if_instruction[31:0]),
		.cpu_id_instruction(cpu_id_instruction[31:0]),
		.cpu_id_shouldStall(cpu_id_shouldStall),
		.cpu_id_shouldForwardRegisterRs(cpu_id_shouldForwardRegisterRs),
		.cpu_id_shouldForwardRegisterRt(cpu_id_shouldForwardRegisterRt),
		.cpu_id_registers(cpu_id_registers[32 * 32 - 1 : 0]),
		.cpu_ex_instruction(cpu_ex_instruction[31:0]),
		.cpu_ex_aluInputA(cpu_ex_aluInputA[31:0]),
		.cpu_ex_aluInputB(cpu_ex_aluInputB[31:0]),
		.cpu_ex_aluOutput(cpu_ex_aluOutput[31:0]),
		.cpu_mem_instruction(cpu_mem_instruction[31:0]),
		.cpu_mem_memoryAddress(cpu_mem_memoryAddress[31:0]),
		.cpu_mem_memoryReadData(cpu_mem_memoryReadData[31:0]),
		.cpu_mem_shouldWriteMemory(cpu_mem_shouldWriteMemory),
		.cpu_mem_memoryWriteData(cpu_mem_memoryWriteData[31:0]),
		.cpu_wb_instruction(cpu_wb_instruction[31:0]),
		.cpu_wb_shouldWriteRegister(cpu_wb_shouldWriteRegister),
		.cpu_wb_registerWriteAddress(cpu_wb_registerWriteAddress[4:0]),
		.cpu_wb_registerWriteData(cpu_wb_registerWriteData[31:0]),

		.terminalAddress(terminalAddress[11:0]),
		.shouldWriteTerminal(shouldWriteTerminal),
		.terminalWriteData(terminalWriteData[7:0])
	);
endmodule
