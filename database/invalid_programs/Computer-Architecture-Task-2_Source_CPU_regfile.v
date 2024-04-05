`ifdef regfile.v
`else
 `define regfile.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module regfile
  (

   input wire 		    clk,
   input wire 		    rst,

   //写端口
   input wire 		    we,
   input wire [`RegAddrBus] waddr,
   input wire [`RegBus]     wdata,

   //读端口1
   input wire 		    re1,
   input wire [`RegAddrBus] raddr1,
   output reg [`RegBus]     rdata1,

   //读端口2
   input wire 		    re2,
   input wire [`RegAddrBus] raddr2,
   output reg [`RegBus]     rdata2

   );

   reg [`RegBus] 	    regs[0:`RegNum-1];

   always @ (posedge clk) 
     begin
	
	if (rst == `RstDisable) 
	  if((we == `WriteEnable) && (waddr != `RegNumLog2'h0)) 
	    begin
	       regs[waddr] <= wdata;
	       $display("Write %h to x%d.",wdata,waddr);
	    end

     end

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
