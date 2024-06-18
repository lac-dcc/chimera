// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

module reg_sign (
	input clk,
	input rst,
	input [31:0] instr_reg_fetch,
	input [31:0] alu_control_decode,
	output [31:0] operand_a,
	output [31:0] operand_b,
	output [31:0] imm_data_decode
	);
	
register_bank reg_bank_inst(
	.clk(clk),
	.rst(rst),
	.instr_reg_fetch(instr_reg_fetch),
	.alu_control_decode(alu_control_decode),
	.operand_a(operand_a),
	.operand_b(operand_b)
	);

sign_extension sign_ext_inst(
	.rst(rst),
	.instr_reg_fetch(instr_reg_fetch),
	.imm_data_decode(imm_data_decode)
	);

endmodule





module register_bank(
	input clk,
	input rst,
	input [31:0] instr_reg_fetch,
	input [31:0] alu_control_decode,
	output reg [31:0] operand_a,
	output reg [31:0] operand_b
	);

	reg [31:0] reg_bank [31:0];
	integer i;
	
always@(*) begin
	if(!rst) begin
		for (i = 0; i < 32; i = i + 1) begin
                reg_bank[i] = 32'h00000000;
                end
		operand_a = 32'h0;
		operand_b = 32'h0;
	end
	else begin
		if(alu_control_decode[1]== 1) begin
			operand_a = reg_bank[instr_reg_fetch[19:15]];
			operand_b = reg_bank[instr_reg_fetch[24:20]];
		end
		else begin
			operand_a = operand_a;
			operand_b = operand_b;
		end
	end
end

endmodule


module sign_extension(
	input rst,
	input [31:0] instr_reg_fetch,
	output reg [31:0] imm_data_decode
	);

	parameter r_type = 7'b0110011;
	parameter i_type = 7'b0010011;
	parameter b_type = 7'b1100011;
	parameter s_type = 7'b0100011;
	parameter l_type = 7'b0000011;

always@(*) begin
	if(!rst) begin
		imm_data_decode = 32'h0;
	end
	else begin
		case(instr_reg_fetch[6:0])
			r_type: imm_data_decode = 32'h0; //no imm data 
		        i_type: imm_data_decode = {{20{instr_reg_fetch[31]}},instr_reg_fetch[31:20]};
		        s_type: imm_data_decode = {{20{instr_reg_fetch[31]}},instr_reg_fetch[31:25],instr_reg_fetch[11:7]};
			b_type: imm_data_decode  = {{20{instr_reg_fetch[31]}},instr_reg_fetch[31],instr_reg_fetch[7],instr_reg_fetch[30:25],instr_reg_fetch[11:8]};		
		        l_type:  imm_data_decode = {{20{instr_reg_fetch[31]}},instr_reg_fetch[31:20]};
			default: imm_data_decode = 32'h0;
		endcase
	end
end

endmodule
