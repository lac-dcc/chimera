// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef pc_reg.v
`else
 `define pc_reg.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module pc_reg(
	      input wire 		clk,
	      input wire 		rst,
	      output reg [`InstAddrBus] pc,
	      output reg 		ce
	      );
   always @ (posedge clk)
     begin
	if (ce == `ChipDisable) pc <= 32'h0000000;
	else pc <= pc+4'h4;
     end
   always @ (posedge clk)
     begin
	if (rst == `RstEnable) ce <= `ChipDisable;
	else ce <= `ChipEnable;
     end
endmodule // pc_reg

// --------------------------------------------------------------------------------
`endif
