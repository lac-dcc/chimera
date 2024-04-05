`include "defines.v"

module id_ex(
    input  wire                      clock,
	input  wire                      reset,
	input  wire[`ALUOpBus]           id_aluop_input,
	input  wire[`ALUSelBus]          id_alusel_input,
	input  wire[`RegisterBus]        id_reg1_input,
	input  wire[`RegisterBus]        id_reg2_input,
	input  wire[`RegisterAddressBus] id_write_reg_address_input,
	input  wire                      id_write_reg_enable_input,
	
	output reg[`ALUOpBus]            ex_aluop_output,
	output reg[`ALUSelBus]           ex_alusel_output,
	output reg[`RegisterBus]         ex_reg1_output,
	output reg[`RegisterBus]         ex_reg2_output,
	output reg[`RegisterAddressBus]  ex_write_reg_address_output,
	output reg                       ex_write_reg_enable_output
);

	always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			ex_aluop_output <= `EXE_NOP_OP;
			ex_alusel_output <= `EXE_RES_NOP;
			ex_reg1_output <= `ZeroWord;
			ex_reg2_output <= `ZeroWord;
			ex_write_reg_address_output <= `NOPRegisterAddress;
			ex_write_reg_enable_output <= `WriteDisable;
		end else begin
			ex_aluop_output <= id_aluop_input;
			ex_alusel_output <= id_alusel_input;
			ex_reg1_output <= id_reg1_input;
			ex_reg2_output <= id_reg2_input;
			ex_write_reg_address_output <= id_write_reg_address_input;
			ex_write_reg_enable_output <= id_write_reg_enable_input;
		end
	end

endmodule