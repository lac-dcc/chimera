module register_tb;

  reg [7:0] in = 15;

  /* Make a reset that pulses once. */
  reg reset = 0;
  reg enable = 1;

  initial begin
     # 17 reset = 1;
     # 10  in = 10;
     # 10  enable = 0;
     # 10  in = 5;
     # 10  enable = 1;
     # 100 $stop;
  end

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  wire [7:0] value;
  register r1 (in, clk, enable, reset, value);

  initial
     $monitor("At time %t, value = %h (%0d), enable = %b",
              $time, value, value, enable);

endmodule
