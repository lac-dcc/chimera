// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

/*-----------------------------------------------\
 
The main state machine is the control core of the CPU and is used to generate a series of control signals.
The instruction cycle consists of 8 clock cycles, each of which accomplishes a fixed operation.

(1) On the 0th clock, the outputs of the CPU state controller, rd and load_ir, 
are high and the rest are low. The instruction register registers the 
high 8-bit instruction code sent from the ROM.

(2) The first clock, compared with the previous clock, 
only inc_pc is changed from 0 to 1, so PC is incremented by 1. 
The ROM sends the low 8-bit instruction code, and the instruction 
register registers the 8-bit instruction code.

(3) 2nd clock, null operation.

(4) 3rd clock, PC increments by 1, pointing to the next instruction.
If the operator is HLT, the output signal HLT is high.
Operator is not HLT, control line output is 0 except PC incremented by 1.

(5) 4th clock, operation.
Operator is AND, ADD, XOR or LDA, read the data of the corresponding address;
Operator is JMP, send the destination address to the program counter;
The operator is STO, which outputs the accumulator data.

(6) On the fifth clock, if the operator is ANDD, ADD or XORR, 
the arithmetic operator completes the corresponding calculation;
If the operator is LDA, the data is sent to the accumulator through the arithmetic operator;
The operator is SKZ, first determine whether the value of the accumulator is 0, 
if it is 0, PC add 1, otherwise keep the original value;
The operator is JMP, latches the destination address;
Operator is STO, write the data at the address.
(7) 6th clock, null operation.
(8) 7th clock, if operator is SKZ and accumulator is 0, PC value is added 1 again, skip one instruction, otherwise no change in PC.

\-----------------------------------------------*/

module machin (
	input clk,    // Clock
	input ena, // Clock Enable
	input zero,  // Asynchronous reset active low
	input [2:0] opcode,

	output reg inc_pc 	,
	output reg load_acc ,
	output reg load_pc  ,
	output reg rd 	    ,
	output reg wr	    ,
	output reg load_ir  ,
	output reg datactl_ena,
	output reg halt	    
);
	parameter HLT = 3'b000 ;
	parameter SKZ = 3'b001 ;
	parameter ADD = 3'b010 ;
	parameter ANDD = 3'b011 ;
	parameter XORR = 3'b100 ;
	parameter LDA = 3'b101 ;
	parameter STO = 3'b110 ;
	parameter JMP = 3'b111 ;

	reg [2 : 0] state ;

	always @(negedge clk) begin
		if (~ena) begin
			state <= 3'b000 ;
			{inc_pc, load_acc, load_pc, rd} <= 4'b0000;
			{wr, load_ir, datactl_ena, halt} <= 4'b0000;
		end else
			ctl_cycle;
	end

	task ctl_cycle;
		begin
			casex(state)
				3'b000: // load high 8 bits  instruction
					begin
						{inc_pc, load_acc, load_pc, rd} <= 4'b0001 ;
						{wr, load_ir, datactl_ena, halt} <= 4'b0100;
						state <= 3'b001 ;
					end
				3'b001: // pc increased by one then load low 8bits instruction
					begin
						{inc_pc, load_acc, load_pc, rd} <= 4'b1001 ;
						{wr, load_ir, datactl_ena, halt} <= 4'b0100;
						state <= 3'b010 ;
					end
				3'b010: // idle
					begin
						{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
						{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						state <= 3'b011 ;
					end
				3'b011: // next instruction address setup
					begin
						if (opcode == HLT) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0001;
						end else begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						state <= 3'b100 ;
					end
				3'b100: // fetch opcode
					begin
						if (opcode == JMP) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0010 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end 
						else if (opcode == ADD || opcode == ANDD || opcode == XORR || opcode == LDA) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0001 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						else if (opcode == STO) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0010;
						end
						else begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						state <= 3'b101 ;
					end
				3'b101: // operation
					begin
						if (opcode == ADD || opcode == ANDD || opcode == XORR || opcode == LDA) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0101 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						else if (opcode == SKZ && zero == 1) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b1000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						else if (opcode == JMP) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b1010 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						else if (opcode == STO) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b1010;
						end
						else begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						state <= 3'b110 ;
					end
				3'b110 : 
					begin
						if (opcode == STO) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0010;
						end else if (opcode == ADD || opcode == ANDD || opcode == XORR || opcode == LDA) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0001 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end else begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						state <= 3'b111 ;
					end 
				3'b111 : 
					begin
						if (opcode == SKZ && zero == 1) begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b1000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end else begin
							{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
							{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						end
						state <= 3'b000 ;
					end
				default: 
					begin
						{inc_pc, load_acc, load_pc, rd} <= 4'b0000 ;
						{wr, load_ir, datactl_ena, halt} <= 4'b0000;
						state <= 3'b000 ;
					end

			endcase

		end	
	endtask
	

endmodule
