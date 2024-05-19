// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef regfile.v
`else
 `define regfile.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module regfile(

	       input wire 		clk,
	       input wire 		rst,

	       //写端口
	       input wire 		we,
	       input wire [`RegAddrBus] waddr,
	       input wire [`RegBus] 	wdata,

	       //读端口1
	       input wire 		re1,
	       input wire [`RegAddrBus] raddr1,
	       output reg [`RegBus] 	rdata1,

	       //读端口2
	       input wire 		re2,
	       input wire [`RegAddrBus] raddr2,
	       output reg [`RegBus] 	rdata2

	       );
   reg [`RegBus] 			regs[0:`RegNum-1];

   always @ (posedge clk) 
     begin
	if (rst == `RstDisable) 
	  if((we == `WriteEnable) && (waddr != `RegNumLog2'h0)) 
	    begin
	       regs[waddr] <= wdata;
	       $display(wdata);
	    end
     end

   // always @ (*)
   //   begin
   // 	if (rst == `RstEnable)
   // 	  rdata1 <= `ZeroWord;
   // 	else if (raddr1 == `RegNumLog2'h0)
   // 	  rdata1 <= `ZeroWord;
   // 	else if ((raddr1 == waddr)&&(we == `WriteEnable)&&(re1 == `ReadEnable))
   // 	  raddr1 <= wdata;
   // 	else if (re1 == `ReadEnable)
   // 	  rdata1 <= regs[raddr1];
   // 	else rdata1 <= `ZeroWord;
   //   end // always @ (*)

   // always @ (*) 
   //   begin
   // 	if(rst == `RstEnable) 
   // 	  rdata2 <= `ZeroWord;
   // 	else if(raddr2 == `RegNumLog2'h0)
   // 	  rdata2 <= `ZeroWord;
   // 	else if((raddr2 == waddr) && (we == `WriteEnable) 
   // 	  	&& (re2 == `ReadEnable))
   // 	  rdata2 <= wdata;
   // 	else if(re2 == `ReadEnable) 
   // 	  rdata2 <= regs[raddr2];
   // 	else 
   // 	  rdata2 <= `ZeroWord;
   
   //   end // always @ (*)

 `define READ(re,raddr,rdata) \ 
   always @ (*) \ 
     begin \ 
   	if(rst == `RstEnable) \ 
   		rdata <= `ZeroWord; \ 
   		  else if(raddr == `RegNumLog2'h0) \ 
   				 rdata <= `ZeroWord; \ 
   				   else if((raddr == waddr) && (we == `WriteEnable) \ 
   	  				   && (re == `ReadEnable)) \ 
   						   rdata <= wdata; \ 
   						     else if(re == `ReadEnable) \ 
   								 rdata <= regs[raddr]; \ 
   								   else \ 
   								     rdata <= `ZeroWord; \ 
									      end

   `READ(re1,raddr1,rdata1)
   `READ(re2,raddr2,rdata2)
   
endmodule // regfile

// --------------------------------------------------------------------------------
`endif
