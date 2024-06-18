// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License


module testbench();

  parameter CLK_PERIOD = 10; // Clock period in ns

  reg clk;
  reg reset;
  reg j;
  reg k;
  wire q;
  wire q_bar;

  jkff jk_ff_inst (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q),
    .q_bar(q_bar)
  );

  always #((CLK_PERIOD / 2)) clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    j = 0;
    k = 0;

    #20 reset = 0; 
  end

  initial begin
    j = 0; k = 0;
    #10;
    j = 0; k = 1;
    #10;
    j = 1; k = 0;
    #10;
    j = 1; k = 1;
    #10;
    j = 0; k = 0;
    #10;
    j = 0; k = 1;
    #10;
    j = 1; k = 0;
    #10;
    j = 1; k = 1;
    #10;
    j = 1; k = 1;
    #10;
    $finish;
  end

  always @(posedge clk) begin
    $display("Time=%t, j=%b, k=%b, q=%b, q_bar=%b", $time, j, k, q, q_bar);
  end

endmodule
