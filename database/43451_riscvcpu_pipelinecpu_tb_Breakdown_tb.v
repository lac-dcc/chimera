// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

module Breakdown_tb();
	reg						clk;
	reg		[31:0]	instr;
	wire	[31:0]	immGen;
	
	initial begin
		$dumpfile("build/test.vcd");
		$dumpvars;
		clk = 0;
		instr = 32'b00000000110000010000000010010011; // imm = 000000 001100
		#200
		instr = 32'b00000000010000100010000110000011; // imm = 000000 000100
		#200
		instr = 32'b11111111111100110010001010010011; // imm = 111111 111111
		#200
		instr = 32'b00000000111101000111001110010011; // imm = 000000 001111
	end
	always #50 clk = ~clk;
	
	InstrProc process(clk, instr, immGen);

endmodule
