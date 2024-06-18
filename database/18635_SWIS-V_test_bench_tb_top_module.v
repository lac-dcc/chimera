// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module tb_top_module;

  // Declare signals
  reg clk;
  reg rst_n;

  // Instantiate the top module
  top_module dut (
    .clk(clk),
    .rst_n(rst_n)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Initial block
  initial begin
    clk = 0;
    rst_n = 0;
    #10;
    rst_n = 1;
    #1000; // Simulate for 1000 time units

    // Finish simulation
    $finish;
  end

  // Dump waveform
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_top_module);
    #10; // Delay before dumping
  end

endmodule

