// This program was cloned from: https://github.com/clowdur/HPAM_mul8
// License: MIT License

// Oliver Huang & Jared Yoder
// EE 478 Capstone Project
// testbench for multipliers
//`default_nettype None
//
//`timescale 1ns/1ps

module testbench;

  /* Dump Test Waveform To VPD File */
  initial begin
    $fsdbDumpfile("waveform.fsdb");
    $fsdbDumpvars();
  end

  logic clk;
  logic [15:0] result; 
  logic [7:0] a, b;
  real true_result;
  real rel_error;
  real tot_error, mred;
  assign true_result = (a && b) ? (real'(a)*real'(b)) : real'(0.000000000000001); //approximate zero to avoid divide by zero
  assign rel_error = (a && b || (result != 0)) ? ((real'(result)-true_result)/true_result) : real'(0);
  assign mred = tot_error / 65536;

  parameter T = 20;
  //define simulated clock if sequential logic is used
  initial begin
    clk <= 0;
    forever #(T/2) clk <= ~clk;
  end // initial clock

  mult_wrapper dut (.Y(result), .inA(a), .inB(b), .clk(clk));
  
  integer i, j;
  integer fd;
  initial tot_error = 0;
  initial begin
    
    // open lookup table file
    fd = $fopen("LUT.txt", "w");
    if (fd) $display("LUT file was opened successfully");
    else $display("LUT file was not opened successfully");

    $write("%c[1;32m",27); $display("\nBegin: Multiplier Test Cases\n");
    $write("%c[0m",27);
    for(i = 0; i < 2**8; i++) begin
      // write a newline to LUT if not the first row of results
      if (i && fd) $fwrite(fd, "\n");
      for (j = 0; j < 2**8; j++) begin
        a <= i; b <= j; @(posedge clk); @(posedge clk); @(posedge clk); //3 cycles for update (1: load input reg D, 2: compute & load output reg D, 3: see output reg Q)
        $display("inputs: a:%d, b:%d", a, b); 
        $display("result: %d  true: %.1f  error: %f\n", result, true_result, rel_error); 

        // write results to lookup table file
        if (fd) $fwrite(fd, "%d ", result);
        
        if (rel_error < 0) tot_error -= rel_error;
        else tot_error += rel_error; //65536 iterations
      end  
    end

    $display("Total error: %f", tot_error);
    $display("Mean Relative Error Distance (MRED): %f", mred);
    $write("%c[1;32m",27); $display("End: Multiplier Test Cases\n"); @(posedge clk);
    $write("%c[0m",27);
    $finish;
  end

endmodule
