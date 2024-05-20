// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg clk, reset, j, k;
  wire q, q_bar;

  jk_flip_flop dut (
    .clk(clk),
    .j(j),
    .k(k),
    .reset(reset),
    .q(q),
    .q_bar(q_bar)
  );

  initial begin
    $dumpfile("jk.vcd");
    $dumpvars(1);
    clk = 0;
    reset = 1;
    j = 0;
    k = 0;

    #5 reset = 0;

    #5 j = 1;
    #10 j = 0;

    #5 k = 1;
    #10 k = 0;

    #5 j = 1;
    #5 k = 1;
    #10 j = 0;
    #10 k = 0;

    #5 j = 0;
    #5 k = 0;

    #5 j = 1;
    #5 k = 1;

    #5 $finish;
  end

  always #1 clk = ~clk;

endmodule
