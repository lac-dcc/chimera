// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns
module InstrMem_tb();
  reg		[31:0]	PC;
  wire	[31:0]	instrData;

  initial begin
    $readmemh("tb/riscv32_sim1.dat", instr.RAM);
		$dumpfile("build/test.vcd");
		$dumpvars;
    PC = 0;
  end
  always #50 PC = PC + 4;
  InstrMem instr(.instrAddr(PC), .instrData(instrData));
endmodule
