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

	input  wire[`StopAllBus]         stop_all,
	input  wire[`DoubleRegisterBus]  hilo_input,
	input  wire[1:0]                 count_clock_input,

	input  wire[`ALUOpBus]			 ex_aluop_input,
	input  wire[`RegisterBus]        ex_memory_address_input,
	input  wire[`RegisterBus]        ex_reg2_input,

	input  wire                      ex_cp0_reg_write_enable_input,
	input  wire[4:0]                 ex_cp0_reg_write_address_input,
	input  wire[`RegisterBus]        ex_cp0_reg_data_input,

	input  wire                      flush_input,
	input  wire[31:0]                ex_exception_type,
	input  wire                      ex_is_in_delay_slot,
	input  wire[`RegisterBus]        ex_current_instruction_address,

	output reg[`RegisterAddressBus]  mem_write_reg_address_output,
	output reg                       mem_write_reg_enable_output,
	output reg[`RegisterBus]         mem_write_reg_data_output,

	output reg[`RegisterBus]         mem_hi_output,
	output reg[`RegisterBus]         mem_lo_output,
	output reg                       mem_whilo_output,
	output reg[`DoubleRegisterBus]   hilo_output,
	output reg[1:0]                  count_clock_output,

	output reg[`ALUOpBus]            mem_aluop_output,
	output reg[`RegisterBus]		 mem_memory_address_output,
	output reg[`RegisterBus]         mem_reg2_output,

	output reg                       mem_cp0_reg_write_enable_output,
	output reg[4:0]                  mem_cp0_reg_write_address_output,
	output reg[`RegisterBus]         mem_cp0_reg_data_output,

	output reg[31:0]                 mem_exception_type,
	output reg                       mem_is_in_delay_slot,
	output reg[`RegisterBus]         mem_current_instruction_address
);

    always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			mem_write_reg_address_output <= `NOPRegisterAddress;
			mem_write_reg_enable_output <= `WriteDisable;
			mem_write_reg_data_output <= `ZeroWord;
			mem_hi_output <= `ZeroWord;
			mem_lo_output <= `ZeroWord;
			mem_whilo_output <= `WriteDisable;
			hilo_output <= {`ZeroWord, `ZeroWord};
			count_clock_output <= 2'b00;
			mem_aluop_output <= `EXE_NOP_OP;
			mem_memory_address_output <= `ZeroWord;
			mem_reg2_output <= `ZeroWord;
			mem_cp0_reg_write_enable_output <= `WriteDisable;
			mem_cp0_reg_write_address_output <= 5'b00000;
			mem_cp0_reg_data_output <= `ZeroWord;
			mem_exception_type <= `ZeroWord;
			mem_is_in_delay_slot <= `NotInDelaySlot;
			mem_current_instruction_address <= `ZeroWord;
		end else if (flush_input == 1'b1) begin
			mem_write_reg_address_output <= `NOPRegisterAddress;
			mem_write_reg_enable_output <= `WriteDisable;
			mem_write_reg_data_output <= `ZeroWord;
			mem_hi_output <= `ZeroWord;
			mem_lo_output <= `ZeroWord;
			mem_whilo_output <= `WriteDisable;
			mem_aluop_output <= `EXE_NOP_OP;
			mem_memory_address_output <= `ZeroWord;
			mem_reg2_output <= `ZeroWord;
			mem_cp0_reg_write_enable_output <= `WriteDisable;
			mem_cp0_reg_write_address_output <= 5'b00000;
			mem_cp0_reg_data_output <= `ZeroWord;
			mem_exception_type <= `ZeroWord;
			mem_is_in_delay_slot <= `NotInDelaySlot;
			mem_current_instruction_address <= `ZeroWord;
			hilo_output <= {`ZeroWord, `ZeroWord};
			count_clock_output <= 2'b00;
		end else if (stop_all[3] == `Stop && stop_all[4] == `NoStop) begin
			mem_write_reg_address_output <= `NOPRegisterAddress;
			mem_write_reg_enable_output <= `WriteDisable;
			mem_write_reg_data_output <= `ZeroWord;
			mem_hi_output <= `ZeroWord;
			mem_lo_output <= `ZeroWord;
			mem_whilo_output <= `WriteDisable;
			hilo_output <= hilo_input;
			count_clock_output <= count_clock_input;
			mem_aluop_output <= `EXE_NOP_OP;
			mem_memory_address_output <= `ZeroWord;
			mem_reg2_output <= `ZeroWord;
			mem_cp0_reg_write_enable_output <= `WriteDisable;
			mem_cp0_reg_write_address_output <= 5'b00000;
			mem_cp0_reg_data_output <= `ZeroWord;
			mem_exception_type <= `ZeroWord;
			mem_is_in_delay_slot <= `NotInDelaySlot;
			mem_current_instruction_address <= `ZeroWord;
		end else if (stop_all[3] == `NoStop) begin
			mem_write_reg_address_output <= ex_write_reg_address_intput;
			mem_write_reg_enable_output <= ex_write_reg_enable_intput;
			mem_write_reg_data_output <= ex_write_reg_data_intput;
			mem_hi_output <= ex_hi_input;
			mem_lo_output <= ex_lo_input;
			mem_whilo_output <= ex_whilo_input;
			hilo_output <= hilo_input;
			count_clock_output <= 2'b00;
			mem_aluop_output <= ex_aluop_input;
			mem_memory_address_output <= ex_memory_address_input;
			mem_reg2_output <= ex_reg2_input;
			mem_cp0_reg_write_enable_output <= ex_cp0_reg_write_enable_input;
			mem_cp0_reg_write_address_output <= ex_cp0_reg_write_address_input;
			mem_cp0_reg_data_output <= ex_cp0_reg_data_input;
			mem_exception_type <= ex_exception_type;
			mem_is_in_delay_slot <= ex_is_in_delay_slot;
			mem_current_instruction_address <= ex_current_instruction_address;
		end else begin
			hilo_output <= hilo_input;
			count_clock_output <= count_clock_input;
		end
	end

endmodule