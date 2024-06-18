// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps

module tb_branch_decision;

   // Inputs
   reg i_result;
   reg [2:0] i_func3;
   
   // Outputs
   wire o_branch;

   // Instantiate the module under test
   branch_decision dut (
      .i_result(i_result),
      .i_func3(i_func3),
      .o_branch(o_branch)
   );

   // Define clock
   reg clk = 0;
   always #5 clk = ~clk; // Clock period of 10 time units

   // Initial values
   initial begin
      i_result = 1'b1;
      i_func3 = 3'b000; // Initializing with BEQ condition
      #10; // Wait for 10 time units
      $dumpfile("waveform.vcd");
      $dumpvars(0, tb_branch_decision); // Dump signals to waveform file

      // Test cases
      // Case 1: BEQ condition
      i_result = 1'b1;
      i_func3 = 3'b000;
      #10; // Wait for 10 time units

      // Case 2: BNE condition
      i_result = 1'b0;
      i_func3 = 3'b001;
      #10; // Wait for 10 time units

      // Case 3: BLT condition
      i_result = 1'b0;
      i_func3 = 3'b100;
      #10; // Wait for 10 time units

      // Case 4: BGE condition
      i_result = 1'b1;
      i_func3 = 3'b101;
      #10; // Wait for 10 time units

      // Case 5: BLTU condition
      i_result = 1'b0;
      i_func3 = 3'b110;
      #10; // Wait for 10 time units

      // Case 6: BGEU condition
      i_result = 1'b1;
      i_func3 = 3'b111;
      #1000;
      $finish;
      
   end

endmodule

