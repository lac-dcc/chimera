// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License


// -----------------------------------------------------------------------------
/* Description:

	The arithmetic logic operation unit can realize the corresponding basic operation 
	operations such as addition, and, different or, jump and so on according to 
	the input operation code respectively.
	
	This unit supports 8 kinds of operations.
	
	The opcode is used to select the calculation mode
	data is the data input
	accum is the accumulator output
	alu_ena is the module enable signal.
	clk is the system clock
*/
// Version: 0.1
// -----------------------------------------------------------------------------

module alu (
	input clk,    // Clock
	input alu_en, // Alu Enable
	input [2:0] opcode  , // Hign three bits are used as opcodes
	input [7:0] data    , // Data
	input [7:0] accum   , // accum out

	output reg [7:0] alu_out, 
	output zero
);
	parameter HLT = 3'b000 ;
	parameter SKZ = 3'b001 ;
	parameter ADD = 3'b010 ;
	parameter ANDD = 3'b011 ;
	parameter XORR = 3'b100 ;
	parameter LDA = 3'b101 ;
	parameter STO = 3'b110 ;
	parameter JMP = 3'b111 ;

	always @(posedge alu_en) begin

		casex(opcode)
			HLT : alu_out <= accum ;
			SKZ : alu_out <= accum ;
			ADD : alu_out <= data + accum ;
			ANDD: alu_out <= data & accum ;
			XORR: alu_out <= data ^ accum ;
			LDA : alu_out <= data ;
			STO : alu_out <= accum;
			JMP : alu_out <= accum;
			default : alu_out <= 8'bxxxx_xxxx ;
		endcase
		
	end

	assign zero = !accum ;

endmodule : alu