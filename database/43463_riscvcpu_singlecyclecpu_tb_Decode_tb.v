// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns
module Decode_tb();
  reg						clk;
  reg		[6:0]		opcode;
  reg		[2:0]		func3;
  reg   [6:0]		func7;
	reg		[4:0]		regWriteNum;
	reg		[4:0]		regNum0;
	reg		[4:0]		regNum1;
	reg		[31:0]	imm;
	wire	[31:0]	aluO;

  initial begin
		$dumpfile("build/test.vcd");
		$dumpvars;
    clk								= 0;
    opcode						= 7'b0010011;
    func3							= 0;
    func7							= 0;
		regWriteNum				= 1;
		regNum0						= 1;
		regNum1						= 1;
		imm								= 1;
  end
  always #50 clk = ~clk;
	always #200 opcode = 7'b0110011;

	InstrDec decode(clk, opcode, func3, func7, regWriteNum, regNum0, regNum1, imm, aluO);
endmodule
