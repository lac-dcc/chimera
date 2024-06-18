// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

`timescale 1ns/1ns
module mactb();

  reg clk,reset;
  reg start;
  wire ready;

 mac #(.N(4)) dut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .ready(ready)
);

  initial
  begin
    reset = 1;
    start = 0;
    #7 reset = 0;
    #10 start = 1;
    #10 start = 0;

    #90000 $stop;
  end

  initial
  begin
    clk = 0;
    forever
    begin
      #5 clk = ~clk;
    end
  end

endmodule
