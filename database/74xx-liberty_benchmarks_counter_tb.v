module counter_tb ();
 
  reg clk, rst;
  wire led;
 
  counter DUT (
    .rst(rst),
    .clk(clk),
    .led(led)
  );
 
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,counter_tb);
    clk = 1'b0;
    rst = 1'b0;
    repeat(4) #10 clk = ~clk;
    rst = 1'b1;
    repeat(1024) #10 clk = ~clk;
  end
 
endmodule
