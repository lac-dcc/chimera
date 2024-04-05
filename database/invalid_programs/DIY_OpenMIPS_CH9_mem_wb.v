`include "defines.v"

module mem_wb(
	input  wire                      clock,
	input  wire                      reset,

	input  wire[`RegisterAddressBus] mem_write_reg_address_input,
	input  wire                      mem_write_reg_enable_input,
	input  wire[`RegisterBus]        mem_write_reg_data_input,

	input  wire[`RegisterBus]        mem_hi_input,
	input  wire[`RegisterBus]        mem_lo_input,
	input  wire                      mem_whilo_input,

	input  wire                      mem_cp0_reg_write_enable_input,
    input  wire[4:0]                 mem_cp0_reg_write_address_input,
    input  wire[`RegisterBus]        mem_cp0_reg_data_input,

	input  wire[`StopAllBus]         stop_all,

	input  wire 					 mem_LLbit_write_enable_input,
	input  wire 					 mem_LLbit_input,

	input  wire                      flush_input,

	output reg[`RegisterAddressBus]  wb_write_reg_address_output,
	output reg                       wb_write_reg_enable_output,
	output reg[`RegisterBus]         wb_write_reg_data_output,

	output reg[`RegisterBus]         wb_hi_output,
	output reg[`RegisterBus]         wb_lo_output,
	output reg                       wb_whilo_output,

	output reg 						 wb_LLbit_write_enable_output,
	output reg 						 wb_LLbit_output,

	output reg                       wb_cp0_reg_write_enable_output,
    output reg[4:0]                  wb_cp0_reg_write_address_output,
    output reg[`RegisterBus]         wb_cp0_reg_data_output
);

	always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			wb_write_reg_address_output <= `NOPRegisterAddress;
			wb_write_reg_enable_output <= `WriteDisable;
			wb_write_reg_data_output <= `ZeroWord;
			wb_hi_output <= `ZeroWord;
			wb_lo_output <= `ZeroWord;
			wb_whilo_output <= `WriteDisable;
			wb_LLbit_write_enable_output <= 1'b0;
			wb_LLbit_output <= 1'b0;
			wb_cp0_reg_write_enable_output <= `WriteDisable;
			wb_cp0_reg_write_address_output <= 5'b00000;
			wb_cp0_reg_data_output <= `ZeroWord;
		end else if (flush_input == 1'b1) begin
			wb_write_reg_address_output <= `NOPRegisterAddress;
			wb_write_reg_enable_output <= `WriteDisable;
			wb_write_reg_data_output <= `ZeroWord;
			wb_hi_output <= `ZeroWord;
			wb_lo_output <= `ZeroWord;
			wb_whilo_output <= `WriteDisable;
			wb_LLbit_write_enable_output <= 1'b0;
			wb_LLbit_output <= 1'b0;
			wb_cp0_reg_write_enable_output <= `WriteDisable;
			wb_cp0_reg_write_address_output <= 5'b00000;
			wb_cp0_reg_data_output <= `ZeroWord;
		end else if (stop_all[4] == `Stop && stop_all[5] == `NoStop) begin
			wb_write_reg_address_output <= `NOPRegisterAddress;
			wb_write_reg_enable_output <= `WriteDisable;
			wb_write_reg_data_output <= `ZeroWord;
			wb_hi_output <= `ZeroWord;
			wb_lo_output <= `ZeroWord;
			wb_whilo_output <= `WriteDisable;
			wb_LLbit_write_enable_output <= 1'b0;
			wb_LLbit_output <= 1'b0;
			wb_cp0_reg_write_enable_output <= `WriteDisable;
			wb_cp0_reg_write_address_output <= 5'b00000;
			wb_cp0_reg_data_output <= `ZeroWord;
		end else if (stop_all[4] == `NoStop) begin
			wb_write_reg_address_output <= mem_write_reg_address_input;
			wb_write_reg_enable_output <= mem_write_reg_enable_input;
			wb_write_reg_data_output <= mem_write_reg_data_input;
			wb_hi_output <= mem_hi_input;
			wb_lo_output <= mem_lo_input;
			wb_whilo_output <= mem_whilo_input;
			wb_LLbit_write_enable_output <= mem_LLbit_write_enable_input;
			wb_LLbit_output <= mem_LLbit_input;
			wb_cp0_reg_write_enable_output <= mem_cp0_reg_write_enable_input;
			wb_cp0_reg_write_address_output <= mem_cp0_reg_write_address_input;
			wb_cp0_reg_data_output <= mem_cp0_reg_data_input;
		end
	end

endmodule