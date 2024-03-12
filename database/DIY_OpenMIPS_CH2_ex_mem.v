`include "defines.v"

module ex_mem(
    input  wire                      clock,
	input  wire                      reset,
	input  wire[`RegisterAddressBus] ex_wd,
	input  wire                      ex_wreg,
	input  wire[`RegisterBus]        ex_wdata,
	output reg[`RegisterAddressBus]  mem_wd,
	output reg                       mem_wreg,
	output reg[`RegisterBus]         mem_wdata
);

    always @ (posedge clock) begin
		if (reset == `ResetEnable) begin
			mem_wd <= `NOPRegisterAddress;
			mem_wreg <= `WriteDisable;
			mem_wdata <= `ZeroWord;
		end else begin
			mem_wd <= ex_wd;
			mem_wreg <= ex_wreg;
			mem_wdata <= ex_wdata;
		end
	end

endmodule