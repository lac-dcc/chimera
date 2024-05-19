// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

module counter8_async_reset_tb;

  reg clk, reset;
  wire [7:0] result;

  counter8_async_reset DUT(
    .clk(clk), 
    .reset(reset), 
    .result(result)
  );
  
  initial begin
    #0 reset = 1'b1; clk = 1'b0;
    #100 reset = 1'b0;
  end

  always begin
    #10 clk = ~clk;
  end
  
  initial begin
    #5000 $stop;
  end

endmodule
