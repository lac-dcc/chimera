`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 3 (PreLab)
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input       [31:0]  Address;        // Input Address 

    output   [31:0]  Instruction;    // Instruction at memory location Address
    
    reg [31:0] mem[0:1024];


    /* Please fill in the implementation here */


	initial
	begin
		$readmemh("code.txt",mem);
	end

	assign Instruction = mem[Address>>2];	
	

endmodule
