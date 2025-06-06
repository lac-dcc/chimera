// This program was cloned from: https://github.com/dawsonjon/fpu
// License: MIT License

module test_bench_tb;
  reg  clk;
  reg  rst;
  
  initial
  begin
    rst <= 1'b1;
    #50 rst <= 1'b0;
  end

  
  initial
  begin
    #500000 $finish;
  end

  
  initial
  begin
    clk <= 1'b0;
    while (1) begin
      #5 clk <= ~clk;
    end
  end

  test_bench uut(
    .clk(clk),
    .rst(rst));
endmodule
