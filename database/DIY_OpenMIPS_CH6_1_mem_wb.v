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

	input  wire[`StopAllBus]         stop_all,

	output reg[`RegisterAddressBus]  wb_write_reg_address_output,
	output reg                       wb_write_reg_enable_output,
	output reg[`RegisterBus]         wb_write_reg_data_output,

	output reg[`RegisterBus]         wb_hi_output,
	output reg[`RegisterBus]         wb_lo_output,
	output reg                       wb_whilo_output
);

	always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			wb_write_reg_address_output <= `NOPRegisterAddress;
			wb_write_reg_enable_output <= `WriteDisable;
			wb_write_reg_data_output <= `ZeroWord;
			wb_hi_output <= `ZeroWord;
			wb_lo_output <= `ZeroWord;
			wb_whilo_output <= `WriteDisable;
		end else if (stop_all[4] == `Stop && stop_all[5] == `NoStop) begin
			wb_write_reg_address_output <= `NOPRegisterAddress;
			wb_write_reg_enable_output <= `WriteDisable;
			wb_write_reg_data_output <= `ZeroWord;
			wb_hi_output <= `ZeroWord;
			wb_lo_output <= `ZeroWord;
			wb_whilo_output <= `WriteDisable;
		end else if (stop_all[4] == `NoStop) begin
			wb_write_reg_address_output <= mem_write_reg_address_input;
			wb_write_reg_enable_output <= mem_write_reg_enable_input;
			wb_write_reg_data_output <= mem_write_reg_data_input;
			wb_hi_output <= mem_hi_input;
			wb_lo_output <= mem_lo_input;
			wb_whilo_output <= mem_whilo_input;
		end
	end

endmodule