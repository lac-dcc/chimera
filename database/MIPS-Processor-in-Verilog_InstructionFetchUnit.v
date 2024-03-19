`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory.
//
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////

module InstructionFetchUnit(Instruction, Reset, Clk,NewPC,Jump,PCNow,PCNext4,PCWrite);

	/* Please fill in the implementation here... */
	wire [31:0] PCAdderOut,PCNext,Instruction,PCOut;
	input Reset,Clk,Jump,PCWrite;
	input [31:0] NewPC;
	output [31:0] Instruction,PCNext4,PCNow;


	PCAdder adder(PCOut,PCAdderOut);
	ProgramCounter PC(PCNext,PCOut,Reset,Clk,PCWrite);
	InstructionMemory mem(PCOut,Instruction);
	mux_2to1_32bit JumpOrPCNext4Mux(PCNext,PCAdderOut,NewPC,Jump); 
	// mux_2to1_32bit JumpOrBranchMux(PCNext,PCNextBeforeBranch,ALUResult,Branch);
	// mux_2to1_32bit jumpsel(JumpIn, {PCOut[31:26],(JumpInstruction<<2)}, JumpRegister, JumpSel); 
	// ALU32Bit OffsetCalc(4'd2,PCOut,(InstructOffset<<2),ALUResult,Zero);

	assign PCNow = PCOut;
	assign PCNext4 = PCAdderOut;

endmodule

