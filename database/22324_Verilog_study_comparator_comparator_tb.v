// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

`timescale 1ns/1ps
module comparator_tb;
  // inputs
  reg x1, y1;   // reg = input variable

  // outputs
  wire z1;    // wire = output variable
  // instantiate the Unit Under Test (uut)
  comparator uut(.x(x1), .y(y1), .z(z1));
  initial begin
    $dumpfile("comparator_tb.vcd");
    $dumpvars(0, comparator_tb);    // Initialize Inputs of the UUT
    // Initialize Inputs
    x1 = 0;
    y1 = 0;

    // this time gap is same for each execution
    // otherwise they will execute at the same time

    #20 x1 = 0; y1 = 1;
    #20 x1 = 1; y1 = 0;
    #20 x1 = 1; y1 = 1;
    #20;
  end

  initial begin
    $monitor("x=%b, y=%b, z=%b", x1, y1, z1);
  end
endmodule