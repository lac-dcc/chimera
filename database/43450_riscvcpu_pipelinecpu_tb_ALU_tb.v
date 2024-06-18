// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns
module ALU_tb();
reg   [3:0]	   aluOp;
reg   [31:0]   aluX;
reg   [31:0]   aluY;
wire  [31:0]   aluO;

initial begin
	$dumpfile("build/test.vcd");
	$dumpvars;
  aluOp = 0;
  aluX = 1;
  aluY = 2;
end   
always #300 aluOp = aluOp + 1;
ALU alu(.aluOp(aluOp), .aluX(aluX), .aluY(aluY), .aluO(aluO));

endmodule
