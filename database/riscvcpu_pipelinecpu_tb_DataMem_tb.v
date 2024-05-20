// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns
module DataMem_tb();
reg            clk;
reg   [31:0]   memAddr; 
reg						 memReadEnable;
wire  [31:0]   memReadData;
reg            memWriteEnable;
reg   [31:0]   memWriteData;
reg   [31:0]   pcReadData;
DataMem mem(clk,memAddr,memReadEnable,memReadData,memWriteEnable,memWriteData,pcReadData);
integer i;
initial begin
	$dumpfile("build/test.vcd");	
	$dumpvars(0, DataMem_tb);
  clk = 1;
  memAddr = 32'h200;
	memReadEnable	=	1;
  memWriteEnable = 0;
  memWriteData = 0;
  pcReadData = 0;
	i = 0;
end
always begin
  #50
  clk = ~clk;
  memWriteData  = memWriteData + 1;
	i = i + 1;
	if (i == 100) $stop;
end
always #200 memWriteEnable = ~memWriteEnable;
endmodule
