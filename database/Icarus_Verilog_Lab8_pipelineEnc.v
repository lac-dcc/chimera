`ifndef PIPELINE_ENC
`define PIPELINE_ENC

`define ADD 3'b000
`define SUB 3'b001
`define XOR 3'b010
`define OR 3'b011
`define AND 3'b100
`define NOR 3'b101
`define NAND 3'b110
`define XNOR 3'b111

	module pipelineEnc(
		input [7:0] fncode,
		output [2:0] opcode);
		
		reg [2:0] opcode;

		always @(fncode) begin
			case (fncode)
				8'b00000001 : opcode = `ADD;
				8'b00000010 : opcode = `SUB;
				8'b00000100 : opcode = `XOR;
				8'b00001000 : opcode = `OR;
				8'b00010000 : opcode = `AND;
				8'b00100000 : opcode = `NOR;
				8'b01000000 : opcode = `NAND;
				8'b10000000 : opcode = `XNOR;
			endcase
		end
		
		
	endmodule
	
`endif