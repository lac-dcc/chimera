`include "defines.v"

module if_id(
    input  wire               clock,
	 input  wire               reset,
	 input  wire[`AddressBus]  if_pc,
	 input  wire[`DataBus]     if_instruction,
	 output reg[`AddressBus]   id_pc,
	 output reg[`DataBus]      id_instruction
);

    always @ (posedge clock) begin
	     if (reset == `ResetEnable) begin
		      id_pc <= `ZeroWord;
				id_instruction <= `ZeroWord;
		  end else begin
		      id_pc <= if_pc;
				id_instruction <= if_instruction;
		  end
	 end

endmodule