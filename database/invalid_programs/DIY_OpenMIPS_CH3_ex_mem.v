`include "defines.v"

module ex_mem(
    input  wire                      clock,
	input  wire                      reset,
	
	input  wire[`RegisterAddressBus] ex_write_reg_address_intput,
	input  wire                      ex_write_reg_enable_intput,
	input  wire[`RegisterBus]        ex_write_reg_data_intput,

	input  wire[`RegisterBus]        ex_hi_input,
	input  wire[`RegisterBus]        ex_lo_input,
	input  wire                      ex_whilo_input,

	output reg[`RegisterAddressBus]  mem_write_reg_address_output,
	output reg                       mem_write_reg_enable_output,
	output reg[`RegisterBus]         mem_write_reg_data_output,

	output reg[`RegisterBus]         mem_hi_output,
	output reg[`RegisterBus]         mem_lo_output,
	output reg                       mem_whilo_output
);

    always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			mem_write_reg_address_output <= `NOPRegisterAddress;
			mem_write_reg_enable_output <= `WriteDisable;
			mem_write_reg_data_output <= `ZeroWord;
			mem_hi_output <= `ZeroWord;
			mem_lo_output <= `ZeroWord;
			mem_whilo_output <= `WriteDisable;
		end else begin
			mem_write_reg_address_output <= ex_write_reg_address_intput;
			mem_write_reg_enable_output <= ex_write_reg_enable_intput;
			mem_write_reg_data_output <= ex_write_reg_data_intput;
			mem_hi_output <= ex_hi_input;
			mem_lo_output <= ex_lo_input;
			mem_whilo_output <= ex_whilo_input;
		end
	end

endmodule