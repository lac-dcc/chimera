// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License


module sign_extension(
input rst,
input [31:0] instr_reg_fetch,
output reg [31:0] imm_data_decode);

parameter r_type = 7'b0110011;
parameter i_type = 7'b0010011;
parameter b_type = 7'b1100011;
parameter s_type = 7'b0100011;
parameter l_type = 7'b0000011;

always@(*)
begin
	if(!rst)
		begin
			imm_data_decode = 32'h0;
		end
	else
		begin
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
