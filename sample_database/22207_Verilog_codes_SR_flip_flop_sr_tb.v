// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg clk, reset, s, r;
  wire q, q_bar;

  sr_flip_flop dut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
    .q(q),
    .q_bar(q_bar)
  );

  initial begin
    $dumpfile("sr.vcd");
    $dumpvars(1);
    clk = 0;
    reset = 1;
    s = 0;
    r = 0;

    #5 reset = 0;

    #5 s = 1;
    #10 s = 0;

    #5 r = 1;
    #10 r = 0;

    #5 s = 1;
    #5 r = 1;

    #5 s = 0;
    #5 r = 0;

    #5 s = 1;
    #10 s = 0;

    #5 r = 1;
    #10 r = 0;

    #5 $finish;
  end

  always #1 clk = ~clk;

endmodule
