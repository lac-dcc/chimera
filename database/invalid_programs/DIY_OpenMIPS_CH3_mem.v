`include "defines.v"

module mem(
    input  wire                      reset,

	input  wire[`RegisterAddressBus] write_reg_address_input,
	input  wire                      write_reg_enable_input,
	input  wire[`RegisterBus]        write_reg_data_input,
	
	input  wire[`RegisterBus]        hi_input,
	input  wire[`RegisterBus]        lo_input,
	input  wire                      whilo_input,

	output reg[`RegisterAddressBus]  write_reg_address_output,
	output reg                       write_reg_enable_output,
	output reg[`RegisterBus]         write_reg_data_output,

	output reg[`RegisterBus]         hi_output,
	output reg[`RegisterBus]         lo_output,
	output reg                       whilo_output
);

    always @ (*) begin
		if (reset == `ResetEnable) begin
			write_reg_address_output <= `NOPRegisterAddress;
			write_reg_enable_output <= `WriteDisable;
			write_reg_data_output <= `ZeroWord;
			hi_output <= `ZeroWord;
			lo_output <= `ZeroWord;
			whilo_output <= `WriteDisable;
		end else begin
			write_reg_address_output <= write_reg_address_input;
			write_reg_enable_output <= write_reg_enable_input;
			write_reg_data_output <= write_reg_data_input;
			hi_output <= hi_input;
			lo_output <= lo_input;
			whilo_output <= whilo_input;
		end
	end

endmodule