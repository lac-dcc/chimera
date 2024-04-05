`include "defines.v"

module mem_wb(
    input  wire                      clock,
	 input  wire                      reset,
	 
	 input  wire[`RegisterAddressBus] mem_wd,
	 input  wire                      mem_wreg,
	 input  wire[`RegisterBus]        mem_wdata,
	 
	 output reg[`RegisterAddressBus]  wb_wd,
	 output reg                       wb_wreg,
	 output reg[`RegisterBus]         wb_wdata
);

    always @ (posedge clock) begin
	     if (reset == `ResetEnable) begin
		      wb_wd <= `NOPRegisterAddress;
				wb_wreg <= `WriteDisable;
				wb_wdata <= `ZeroWord;
		  end else begin
		      wb_wd <= mem_wd;
				wb_wreg <= mem_wreg;
				wb_wdata <= mem_wdata;
		  end
	 end

endmodule