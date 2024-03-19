`timescale 1ns / 1ps

module ProcessorTestbench;
   parameter DisplayBufferSize = 256;
   
   reg clk;
   reg RESET;
   reg IRQ;
   
   wire [DisplayBufferSize-1:0] DisplayBuffer;

   integer 	i = 0;
   reg [31:0] 	ver[1023:0];
   
   assign expAddress = ver[i];
   
   Processor uut
     (
      .clk(clk),
      .RESET(RESET),
      .IRQ(IRQ),
       
      .DisplayBuffer(DisplayBuffer)
      );
   
   initial begin
       clk = 1;
       RESET = 0;
       IRQ = 0;  
       #20 RESET = 1;
       #25 RESET = 0;
       
   end
   
   always begin
       #40 clk = ~clk;
   end

endmodule // ProcessorTestbench

