`include "defines.v"

module mem(
    input  wire                      reset,
	input  wire[`RegisterAddressBus] wd_input,
	input  wire                      wreg_input,
	input  wire[`RegisterBus]        wdata_input,
	
	output reg[`RegisterAddressBus]  wd_output,
	output reg                       wreg_output,
	output reg[`RegisterBus]         wdata_output
);

    always @ (*) begin
		if (reset == `ResetEnable) begin
			wd_output <= `NOPRegisterAddress;
			wreg_output <= `WriteDisable;
			wdata_output <= `ZeroWord;
		end else begin
			wd_output <= wd_input;
			wreg_output <= wreg_input;
			wdata_output <= wdata_input;
		end
	end

endmodule