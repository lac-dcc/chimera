// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef mem.v
`else
 `define mem.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module mem(
	   input wire 		    rst,
   
	   //来自执行阶段的信息	
	   input wire [`RegAddrBus] wd_i,
	   input wire 		    wreg_i,
	   input wire [`RegBus]     wdata_i,

	   //送到回写阶段的信息
	   output reg [`RegAddrBus] wd_o,
	   output reg 		    wreg_o,
	   output reg [`RegBus]     wdata_o
	   );

   always @ (*) 
     begin
	if (rst == `RstEnable) 
	  begin
	     wd_o <= `NOPRegAddr;
	     wreg_o <= `WriteDisable;
	     wdata_o <= `ZeroWord;
	  end 
	else
	  begin
	     wd_o <= wd_i;
	     wreg_o <= wreg_i;
	     wdata_o <= wdata_i;
	  end // else: !if(rst == `RstEnable)
     end // always @ (*)

endmodule // mem

// --------------------------------------------------------------------------------
`endif
