// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

module tb;
  reg clk,rst;
  wire [2:0] N,E,S,W;
  traffic_signal ts(clk,rst,N,E,S,W);
  always #5 clk = ~clk ;
  initial begin
   $dumpfile("tb.vcd");
   $dumpvars(1,tb);
    $monitor("time=%0d North=%b East=%b South=%b West=%b",$time,N,E,S,W);
    clk   = 0;
    rst = 1;
 #5 rst = 0;
 #400 $finish;
  end
endmodule