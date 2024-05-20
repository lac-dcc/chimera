// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// iverilog srlatch_tb.v; vvp a.out; gtkwave --save srlatch_tb.gtkw srlatch_tb.vcd
`include "srlatch.v"

// Testbench for SR Latch
module srlatch_tb;

  // Declare variables for testbench signals
  reg s;
  reg r;
  wire q;
  wire q_n;

  // Instantiate the SR latch module
  srlatch sr0 (
    .s(s),
    .r(r),
    .q(q),
    .q_n(q_n)
  );

  // Initialize testbench variables
  initial begin
    $dumpfile("srlatch_tb.vcd" );
    $dumpvars(0, srlatch_tb);
    $monitor("[%0t] s=%0b r=%0b q=%0b q_n=%0b", $time, s, r, q, q_n);

    // Apply stimulus
    s = 0;
    r = 0;
    #10;
    s = 1;
    #10;
    r = 1;
    #10;
    s = 0;
    #10;
    r = 0;
    #10;
    $finish;
  end

endmodule
