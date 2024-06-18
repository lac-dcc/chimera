// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg clk, reset, j, k;
  wire q, q_bar;

  jkff dut (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q),
    .q_bar(q_bar)
  );

  initial begin
    $dumpfile("jk.vcd");
    $dumpvars(1);
    clk = 0;
    j = 0;
    k = 0;


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
  always @(posedge clk) begin
    $display("Time=%t, j=%b, k=%b, q=%b, q_bar=%b", $time, j, k, q, q_bar);
  end

endmodule