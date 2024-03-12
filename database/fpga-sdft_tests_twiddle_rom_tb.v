`default_nettype none
module test;

  reg reset = 0;
  reg [3:0] addr = 0;

  initial begin
     $dumpfile("test.vcd");
     $dumpvars(0,test);
     # 32
     $finish;
  end

  // clock
  reg clk = 0;
  always #1 clk = !clk;
  always #1 addr <= addr + 1;

  twiddle_rom dut(.clk (clk), .addr(addr)); 

endmodule // test
