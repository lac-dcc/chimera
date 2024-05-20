// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module d_ff_async_tb;
  reg clk1;
  reg rst_n1;
  reg d1;
  wire q1;

  d_ff_async uut(
    .clk(clk1),
    .rst_n(rst_n1),
    .d(d1),
    .q(q1)
  );

  always begin
    clk1 = ~clk1;   // not <=
    #5;
  end

  initial begin
    $dumpfile("d_ff_async_tb.vcd");
    $dumpvars(0, d_ff_async_tb);

    clk1 <= 0;
    rst_n1 <= 1;
    d1 <= 0;

    #20 rst_n1 <= 0; d1 <= 1;
    // try 17 ns, the rst_n1 and d1 changes accordingly then the clk1 changes
    // that's why the graph looks like output is changing in NEG clk cycle
    // but it's not, it's changing in POS clk cycle
    #20 rst_n1 <= 0; d1 <= 0;
    #20 rst_n1 <= 1; d1 <= 1;
    #20 $finish;
  end

    initial begin
      $monitor("time=%0t clk=%b rst_n=%b d=%b q=%b", $time, clk1, rst_n1, d1, q1);
    end
endmodule