// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

module counter8_async_resetb_tb;

  reg clk, resetb;
  wire [7:0] result;

  counter8_async_resetb DUT(
    .clk(clk), 
    .resetb(resetb), 
    .result(result)
  );
  
  initial begin
    #0 resetb = 1'b0; clk = 1'b0;
    #100 resetb = 1'b1;
  end

  always begin
    #10 clk = ~clk;
  end
  
  initial begin
    #5000 $stop;
  end

endmodule
