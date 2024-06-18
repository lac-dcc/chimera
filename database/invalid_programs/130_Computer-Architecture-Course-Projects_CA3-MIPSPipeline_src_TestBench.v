// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "Processor.v"
`timescale 1ns / 1ns
`define clk_dur 50

module TestBench ();
  reg clk = 1'b1, rst = 1'b1;

  Processor to_be_tested (
      .clk(clk),
      .rst(rst)
  );

  initial begin
    #(`clk_dur) rst = 1'b0;
    #(`clk_dur * 1000) $stop;
  end

  always begin
    #(`clk_dur) clk = ~clk;
  end
endmodule
