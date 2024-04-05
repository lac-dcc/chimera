`include "defines.v"

module id(
    input  wire                     reset,
	 input  wire[`AddressBus]        pc_input,
	 input  wire[`DataBus]           instruction_input,
	 input  wire[`RegisterBus]       reg1_data_input,
	 input  wire[`RegisterBus]       reg2_data_input,
	 output reg                      reg1_read_output,
	 output reg                      reg2_read_output,
	 output reg[`RegisterAddressBus] reg1_addr_output,
	 output reg[`RegisterAddressBus] reg2_addr_output,
	 output reg[`ALUOpBus]           aluop_output,
	 output reg[`ALUSelBus]          alusel_output,
	 output reg[`RegisterBus]        reg1_output,
	 output reg[`RegisterBus]        reg2_output,
	 output reg[`RegisterAddressBus] wd_output,
	 output reg                      wreg_output
);

    wire[5:0] op  = instruction_input[31:26];
	 wire[4:0] op2 = instruction_input[10:6];
	 wire[5:0] op3 = instruction_input[5:0];
	 wire[4:0] op4 = instruction_input[20:16];
	 
	 reg[`RegisterBus] imm;
	 reg instruction_valid;
	 
	 always @ (*) begin
	     if (reset == `ResetEnable) begin
		      aluop_output <= `EXE_NOP_OP;
				alusel_output <= `EXE_RES_NOP;
				wd_output <= `NOPRegisterAddress;
				wreg_output <= `WriteDisable;
				instruction_valid <= `InstructionValid;
				reg1_read_output <= 1'b0;
				reg2_read_output <= 1'b0;
				reg1_addr_output <= `NOPRegisterAddress;
				reg2_addr_output <= `NOPRegisterAddress;
				imm <= 32'h0;
		  end else begin
		      aluop_output <= `EXE_NOP_OP;
				alusel_output <= `EXE_RES_NOP;
				wd_output <= instruction_input[15:11];
				wreg_output <= `WriteDisable;
				instruction_valid <= `InstructionValid;
				reg1_read_output <= 1'b0;
				reg2_read_output <= 1'b0;
				reg1_addr_output <= instruction_input[25:21];
				reg2_addr_output <= instruction_input[20:16];
				imm <= `ZeroWord;
				
				case (op)
				    `EXE_ORI: begin
					     wreg_output <= `WriteEnable;
						  aluop_output <= `EXE_OR_OP;
						  alusel_output <= `EXE_RES_LOGIC;
						  reg1_read_output <= 1'b1;
						  reg2_read_output <= 1'b0;
						  imm <= {16'h0, instruction_input[15:0]};
						  wd_output <= instruction_input[20:16];
						  instruction_valid <= `InstructionValid;
					 end
					 default: begin
					 end
				endcase
		  end
	 end
	 
	 always @ (*) begin
	     if (reset == `ResetEnable) begin
		      reg1_output <= `ZeroWord;
		  end else if (reg1_read_output == 1'b1) begin
		      reg1_output <= reg1_data_input;
		  end else if (reg1_read_output == 1'b0) begin
		      reg1_output <= imm;
		  end else begin
		      reg1_output <= `ZeroWord;
		  end
	 end

	 always @ (*) begin
	     if (reset == `ResetEnable) begin
		      reg2_output <= `ZeroWord;
		  end else if (reg2_read_output == 1'b1) begin
		      reg2_output <= reg1_data_input;
		  end else if (reg2_read_output == 1'b0) begin
		      reg2_output <= imm;
		  end else begin
		      reg2_output <= `ZeroWord;
		  end
	 end
	 
endmodule