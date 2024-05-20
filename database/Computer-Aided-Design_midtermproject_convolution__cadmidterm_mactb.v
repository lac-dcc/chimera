// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module MacTB();

  reg clk,reset;
  reg start;
  wire ready;

 mac dut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .ready(ready)
);

  initial
  begin
    reset = 1;
    start = 0;
    #7 reset = 0;
    #10 start = 1;
    #10 start = 0;

    #40000 $stop;
  end

  initial
  begin
    clk = 0;
    forever
    begin
      #5 clk = ~clk;
    end
  end

endmodule
