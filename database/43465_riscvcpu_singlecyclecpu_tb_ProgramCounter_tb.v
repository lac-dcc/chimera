// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns
module ProgramCounter_tb();
reg							clk;
wire	[31:0]		pcReadData;
reg							pcWriteEnable;
reg		[31:0]		pcWriteData;
reg		[2:0]			pcOp;

initial begin
	$dumpfile("build/test.vcd");
	$dumpvars;
	clk = 0;
	pcOp = 0;
	pcWriteEnable = 1;
	pcWriteData = 0;
end
always #50 clk = ~clk;
always #100 pcWriteEnable = ~pcWriteEnable;
always #500 begin
	pcWriteData = pcWriteData + 100;
	pcOp = pcOp ^ 2;
end

ProgramCounter PC(clk, pcReadData, pcWriteEnable, pcWriteData, pcOp);
endmodule
