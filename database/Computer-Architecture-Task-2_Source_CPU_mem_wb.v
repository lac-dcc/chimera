// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef mem_wb.v
`else
 `define mem_wb.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module mem_wb
  (
   input wire 		    clk,
   input wire 		    rst,

   input wire [5:0] 	    stall, 

   //来自访存阶段的信息	
   input wire [`RegAddrBus] mem_wd,
   input wire 		    mem_wreg,
   input wire [`RegBus]     mem_wdata,

   //送到回写阶段的信息
   output reg [`RegAddrBus] wb_wd,
   output reg 		    wb_wreg,
   output reg [`RegBus]     wb_wdata	       
   );

   always @ (posedge clk) 
     begin

	if(rst == `RstEnable) 
	  begin
	     wb_wd <= `NOPRegAddr;
	     wb_wreg <= `WriteDisable;
	     wb_wdata <= `ZeroWord;	
	  end 

	if (stall[4] == 1'b1&&stall[5] == 1'b0)
	  begin
	     wb_wd <= `NOPRegAddr;
	     wb_wreg <= `WriteDisable;
	     wb_wdata <= `ZeroWord;	
	  end
	
	else if (stall[4] == 1'b0)
	  begin
	     wb_wd <= mem_wd;
	     wb_wreg <= mem_wreg;
	     wb_wdata <= mem_wdata;
	  end // else: !if(rst == `RstEnable)

     end // always @ (posedge clk)

endmodule // mem_wb

// --------------------------------------------------------------------------------
`endif
