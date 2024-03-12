`include "defines.v"

module if_id(
    input  wire               clock,
	input  wire               reset,
	input  wire[`AddressBus]  if_program_counter,
	input  wire[`DataBus]     if_instruction,

	input  wire[`StopAllBus]  stop_all,

	output reg[`AddressBus]   id_program_counter,
	output reg[`DataBus]      id_instruction
);

    always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			id_program_counter <= `ZeroWord;
			id_instruction <= `ZeroWord;
		end else if (stop_all[1] == `Stop && stop_all[2] == `NoStop) begin
			id_program_counter <= `ZeroWord;
			id_instruction <= `ZeroWord;
		end else if (stop_all[1] == `NoStop) begin
			id_program_counter <= if_program_counter;
			id_instruction <= if_instruction;
		end
	end

endmodule