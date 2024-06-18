// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns

module RegsFile_tb;
  reg						clk;
	reg		[4:0]		regNum0;
	reg		[4:0]		regNum1;
	wire	[31:0]	regReadData0;
	wire	[31:0]	regReadData1;

	reg						regsWriteEnable;
	reg		[31:0]  regWriteNum;
	reg		[31:0]  regWriteData;

	integer i;
	initial begin
		$dumpfile("build/test.vcd");
		$dumpvars;
		clk = 0;
		regNum0 = 0;
		regNum1 = 1;

		regsWriteEnable = 0;
		regWriteNum = 1;
		regWriteData = 1;
		i	=	0;
	end
	always #50 clk = ~clk;
	always #100 regWriteData = regWriteData + 1;
	always #300 if(regWriteNum < 31)regWriteNum = regWriteNum+1; 
	always #500 regsWriteEnable = ~regsWriteEnable;
	always #1000 regNum1 = regNum1 + 1;
	always begin
		i = i + 1;
		#500
		if (i == 50) $stop;
	end
	RegsFile regs(clk, regNum0, regNum1, regReadData0, regReadData1, regsWriteEnable, regWriteNum, regWriteData);

endmodule
