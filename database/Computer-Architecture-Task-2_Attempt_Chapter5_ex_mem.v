// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef ex_mem.v
`else
 `define ex_mem.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module ex_mem(
	      input wire 	       clk,
	      input wire 	       rst,


	      //来自执行阶段的信息	
	      input wire [`RegAddrBus] ex_wd,
	      input wire 	       ex_wreg,
	      input wire [`RegBus]     ex_wdata, 

	      //送到访存阶段的信息
	      output reg [`RegAddrBus] mem_wd,
	      output reg 	       mem_wreg,
	      output reg [`RegBus]     mem_wdata

	      );

   always @ (posedge clk) 
     begin
	if(rst == `RstEnable) 
	  begin
	     mem_wd <= `NOPRegAddr;
	     mem_wreg <= `WriteDisable;
	     mem_wdata <= `ZeroWord;	
	  end 
	else 
	  begin
	     mem_wd <= ex_wd;
	     mem_wreg <= ex_wreg;
	     mem_wdata <= ex_wdata;			
	  end // else: !if(rst == `RstEnable)
     end // always @ (posedge clk)

endmodule // ex_mem

// --------------------------------------------------------------------------------
`endif
