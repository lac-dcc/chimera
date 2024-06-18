// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps

module d_ff_tb;
  reg clk1;
  reg d1;
  wire q1;

  d_ff uut (
    .clk(clk1),
    .d(d1),
    .q(q1)
  );

  always begin
    #10 clk1 = ~clk1;
  end

  initial begin
    $dumpfile("d_ff_tb.vcd");
    $dumpvars(0, d_ff_tb);

    clk1 <= 0;
    d1 <= 0;
    #20;

    d1 <= 1;
    #20;

    d1 <= 0;
    #20;

    $finish;
  end

  initial begin
    $monitor("At time %t, d=%b, q=%b", $time, d1, q1);
  end

endmodule