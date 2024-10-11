// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
  reg clk, reset, shift_left, shift_right;
  reg [7:0] parallel_in;
  wire [7:0] parallel_out;
  
  universal_shift_register dut (clk, reset, shift_left, shift_right, parallel_in, parallel_out);

  initial begin
    clk = 1'b0;
    forever #5 clk= ~clk;
  end

  initial begin
    reset = 1'b1;
    shift_left = 1'b0;
    shift_right = 1'b0;
    parallel_in = 8'he5;
    #10;
    
    reset = 1'b0;
    #10;

    shift_left = 1'b1;
    shift_right = 1'b0;
    #10;

    shift_left = 1'b0;
    shift_right = 1'b1;
    #10;
        
    shift_left = 1'b1;
    shift_right = 1'b0;
    #10;
    
    shift_left = 1'b1;
    shift_right = 1'b0;
    #10;

    shift_left = 1'b0;
    shift_right = 1'b1;
  end
  
  initial begin
  $monitor("\t input: %b right shift: %b  left shift: %b  output: %b", parallel_in, shift_right, shift_left, parallel_out);
  #75 $finish;
  end
endmodule

