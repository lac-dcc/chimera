// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// iverilog dlatch_tb.v; vvp a.out; gtkwave --save dlatch_tb.gtkw dlatch_tb.vcd
`include "dlatch.v"

// Testbench for D Latch
module dlatch_tb;

  // Declare variables for testbench signals
  reg d;
  reg en;
  wire q;
  wire q_n;

  // Instantiate the D latch module
  dlatch dl0 (
    .d(d),
    .en(en),
    .q(q),
    .q_n(q_n)
  );

  // Initialize testbench variables
  initial begin
    $dumpfile("dlatch_tb.vcd" );
    $dumpvars(0, dlatch_tb);
    $monitor("[%0t] en=%0b d=%0b q=%0b q_n=%0b", $time, en, d, q, q_n);

    // Apply stimulus
    d = 0;
    en = 0;
    #10;
    en = 1;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    en = 0;
    d = 1;
    #10;
    $finish;
  end

endmodule
