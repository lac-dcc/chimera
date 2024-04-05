`include "defines.v"

module ex(
    input  wire                      reset,
	
	input  wire[`ALUOpBus]           aluop_input,
	input  wire[`ALUSelBus]          alusel_input,
	input  wire[`RegisterBus]        reg1_input,
	input  wire[`RegisterBus]        reg2_input,
	input  wire[`RegisterAddressBus] wd_input,
	input  wire                      wreg_input,
	
	output reg[`RegisterAddressBus]  wd_output,
	output reg                       wreg_output,
	output reg[`RegisterBus]         wdata_output
);

    reg[`RegisterBus] logic_out;
	reg[`RegisterBus] shift_res;
	 
	always @ (*) begin
		if (reset == `ResetEnable) begin
			logic_out <= `ZeroWord;
		end else begin
			case (aluop_input)
				`EXE_OR_OP: begin
					logic_out <= reg1_input | reg2_input;
				end
				`EXE_AND_OP: begin
					logic_out <= reg1_input & reg2_input;
				end
				`EXE_NOR_OP: begin
					logic_out <= ~(reg1_input | reg2_input);
				end
				`EXE_XOR_OP: begin
					logic_out <= reg1_input ^ reg2_input;
				end
				default: begin
					logic_out <= `ZeroWord;
				end
			endcase
		end
	end
	
	always @ (*) begin
		if (reset == `ResetEnable) begin
			shift_res <= `ZeroWord;
		end else begin
			case (aluop_input)
				`EXE_SLL_OP: begin
					shift_res <= (reg2_input << reg1_input[4:0]);
				end
				`EXE_SRL_OP: begin
					shift_res <= (reg2_input >> reg1_input[4:0]);
				end
				`EXE_SRA_OP: begin
					//shift_res <= ({32{reg2_input[31]}} < (6'd32 - {1'b0, reg1_input[4:0]})) | reg2_input >> reg1_input[4:0];
					shift_res <= (reg2_input >>> reg1_input[4:0]);
				end
				default: begin
					shift_res <= `ZeroWord;
				end
			endcase
		end
	end

	always @ (*) begin
		wd_output <= wd_input;
		wreg_output <= wreg_input;
		case (alusel_input)
			`EXE_RES_LOGIC: begin
				wdata_output <= logic_out;
			end
			`EXE_RES_SHIFT: begin
				wdata_output <= shift_res;
			end
			default: begin
				wdata_output <= `ZeroWord;
			end
		endcase
	end

endmodule