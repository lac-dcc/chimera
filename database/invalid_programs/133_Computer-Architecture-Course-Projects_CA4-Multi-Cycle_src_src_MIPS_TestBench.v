// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "MIPS_MultiCycle.v"

`define clock_dur 50

module TestBench ();
  reg clk = 1'b1, rst = 1'b1;
  MIPS to_be_tested (
      .clk(clk),
      .rst(rst)
  );

  initial begin
	#5;
    #`clock_dur rst = 1'b0;
    #(`clock_dur * 10000) $stop;
  end

  always begin
    #`clock_dur clk = ~clk;
  end
endmodule
