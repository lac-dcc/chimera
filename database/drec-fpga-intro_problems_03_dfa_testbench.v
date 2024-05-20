// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

module testbench();
   reg clk = 1'b0; always #1 clk = ~clk;

   reg input_sequence = 0, reset = 1;
   dfa_two_last_bits_are_01 dfa(.clk(clk), .reset(reset), .input_sequence(input_sequence));

   initial begin
      $dumpvars;
      $display("Test started...");
      #2 reset = 0;
      #2 input_sequence = 0;
      #2 input_sequence = 0;
      #2 input_sequence = 1;
      #2 input_sequence = 0;
      #2 input_sequence = 1;
      #2 input_sequence = 1;
      #2 input_sequence = 0;
      #2 input_sequence = 0;
      #2 input_sequence = 1;
      #4 $finish;
   end
endmodule
