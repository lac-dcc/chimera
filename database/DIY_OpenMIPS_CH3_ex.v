`include "defines.v"

module ex(
    input  wire                      reset,
	
	input  wire[`ALUOpBus]           aluop_input,
	input  wire[`ALUSelBus]          alusel_input,

	input  wire[`RegisterBus]        reg1_input,
	input  wire[`RegisterBus]        reg2_input,

	input  wire[`RegisterAddressBus] write_reg_address_input,
	input  wire                      write_reg_enable_input,

	input  wire[`RegisterBus]        hi_input,
	input  wire[`RegisterBus]        lo_input,

	input  wire[`RegisterBus]        wb_hi_input,
	input  wire[`RegisterBus]        wb_lo_input,
	input  wire                      wb_whilo_input,

	input  wire[`RegisterBus]        mem_hi_input,
	input  wire[`RegisterBus]        mem_lo_input,
	input  wire                      mem_whilo_input,
	
	output reg[`RegisterAddressBus]  write_reg_address_output,
	output reg                       write_reg_enable_output,
	output reg[`RegisterBus]         write_reg_data_output,

	output reg[`RegisterBus]         hi_output,
	output reg[`RegisterBus]         lo_output,
	output reg                       whilo_output
);

    reg[`RegisterBus] logic_res;
	reg[`RegisterBus] shift_res;
	reg[`RegisterBus] move_res;
	reg[`RegisterBus] HI;
	reg[`RegisterBus] LO;
	 
	always @ (*) begin
		if (reset == `ResetEnable) begin
			{HI, LO} <= {`ZeroWord, `ZeroWord};
		end else if (mem_whilo_input == `WriteEnable) begin
			{HI, LO} <= {mem_hi_input, mem_lo_input};
		end else if (wb_whilo_input == `WriteEnable) begin
			{HI, LO} <= {wb_hi_input, wb_lo_input};
		end else begin
			{HI, LO} <= {hi_input, lo_input};
		end
	end

	always @ (*) begin
		if (reset == `ResetEnable) begin
			move_res <= `ZeroWord;
		end else begin
			move_res <= `ZeroWord;
			case (aluop_input)
				`EXE_MFHI_OP: begin
					move_res <= HI;
				end
				`EXE_MFLO_OP: begin
					move_res <= LO;
				end
				`EXE_MOVZ_OP: begin
					move_res <= reg1_input;
				end
				`EXE_MOVN_OP: begin
					move_res <= reg1_input;
				end
				default: begin
				end
			endcase
		end
	end

	always @ (*) begin
		if (reset == `ResetEnable) begin
			logic_res <= `ZeroWord;
		end else begin
			case (aluop_input)
				`EXE_OR_OP: begin
					logic_res <= reg1_input | reg2_input;
				end
				`EXE_AND_OP: begin
					logic_res <= reg1_input & reg2_input;
				end
				`EXE_NOR_OP: begin
					logic_res <= ~(reg1_input | reg2_input);
				end
				`EXE_XOR_OP: begin
					logic_res <= reg1_input ^ reg2_input;
				end
				default: begin
					logic_res <= `ZeroWord;
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
		write_reg_address_output <= write_reg_address_input;
		write_reg_enable_output <= write_reg_enable_input;
		case (alusel_input)
			`EXE_RES_LOGIC: begin
				write_reg_data_output <= logic_res;
			end
			`EXE_RES_SHIFT: begin
				write_reg_data_output <= shift_res;
			end
			`EXE_RES_MOVE: begin
				write_reg_data_output <= move_res;
			end
			default: begin
				write_reg_data_output <= `ZeroWord;
			end
		endcase
	end

	always @ (*) begin
		if (reset == `ResetEnable) begin
			whilo_output <= `WriteDisable;
			hi_output <= `ZeroWord;
			lo_output <= `ZeroWord;
		end else if (aluop_input == `EXE_MTHI_OP) begin
			whilo_output <= `WriteEnable;
			hi_output <= reg1_input;
			lo_output <= LO;
		end else if (aluop_input == `EXE_MTLO_OP) begin
			whilo_output <= `WriteEnable;
			hi_output <= HI;
			lo_output <= reg1_input;
		end else begin
			whilo_output <= `WriteDisable;
			hi_output <= `ZeroWord;
			lo_output <= `ZeroWord;
		end
	end

endmodule