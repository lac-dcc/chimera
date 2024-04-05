`include "defines.v"

module hilo_reg(
    input  wire               clock,
	input  wire               reset,
	
	input  wire               write_enable,
	input  wire[`RegisterBus] hi_input,
	input  wire[`RegisterBus] lo_input,
	
	output reg[`RegisterBus]  hi_output,
	output reg[`RegisterBus]  lo_output
);

	always @ (posedge clock) begin
        if (reset == `ResetEnable) begin
            hi_output <= `ZeroWord;
            lo_output <= `ZeroWord;
        end else if (write_enable == `WriteEnable) begin
            hi_output <= hi_input;
            lo_output <= lo_input;
        end
    end

endmodule