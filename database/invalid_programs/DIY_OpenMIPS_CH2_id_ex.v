`include "defines.v"

module id_ex(
    input  wire                      clock,
	input  wire                      reset,
	input  wire[`ALUOpBus]           id_aluop,
	input  wire[`ALUSelBus]          id_alusel,
	input  wire[`RegisterBus]        id_reg1,
	input  wire[`RegisterBus]        id_reg2,
	input  wire[`RegisterAddressBus] id_wd,
	input  wire                      id_wreg,
	
	output reg[`ALUOpBus]            ex_aluop,
	output reg[`ALUSelBus]           ex_alusel,
	output reg[`RegisterBus]         ex_reg1,
	output reg[`RegisterBus]         ex_reg2,
	output reg[`RegisterAddressBus]  ex_wd,
	output reg                       ex_wreg
);

	always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			ex_aluop <= `EXE_NOP_OP;
			ex_alusel <= `EXE_RES_NOP;
			ex_reg1 <= `ZeroWord;
			ex_reg2 <= `ZeroWord;
			ex_wd <= `NOPRegisterAddress;
			ex_wreg <= `WriteDisable;
		end else begin
			ex_aluop <= id_aluop;
			ex_alusel <= id_alusel;
			ex_reg1 <= id_reg1;
			ex_reg2 <= id_reg2;
			ex_wd <= id_wd;
			ex_wreg <= id_wreg;
		end
	end

endmodule