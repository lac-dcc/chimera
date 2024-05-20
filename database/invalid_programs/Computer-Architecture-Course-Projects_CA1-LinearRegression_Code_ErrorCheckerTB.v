// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "ErrorCheckerDriver.v"
`timescale 1ns / 1ns
`define clock_dur 50

module ErrorChecker_Tb ();

  reg [19:0] x_bus, y_bus, b1_bus, b0_bus;
  reg en, clk = 1'b1, rst = 1'b1;
  wire [19:0] error_bus, error_checker_ready, error_checker_done;

  initial begin
    
  end

  always begin
    #(`clock_dur * 2 * 1);
    clk = ~clk;
  end

endmodule
