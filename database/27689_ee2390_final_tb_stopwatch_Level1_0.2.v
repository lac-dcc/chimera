// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

`timescale 100ms/10ns  // Timescale: 1/10th of a second per unit, 10ns precision

module Stopwatch_tb;

  reg clk;
  reg reset;
  reg Start;
  reg Stop;
  reg Clear;
  reg CountDown;

  wire [3:0] Minutes;
  wire [3:0] SecondsTens;
  wire [3:0] SecondsOnes;
  wire [3:0] TenthsOfSeconds;

  Stopwatch dut (
    .clk(clk),
    .reset(reset),
    .Start(Start),
    .Stop(Stop),
    .Clear(Clear),
    .CountDown(CountDown),
    .Minutes(Minutes),
    .SecondsTens(SecondsTens),
    .SecondsOnes(SecondsOnes),
    .TenthsOfSeconds(TenthsOfSeconds)
  );

  // Clock generation (10 Hz)
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  // Test case: Run for 10 minutes
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Stopwatch_tb);

    reset <= 1'b1;
    #200; reset <= 1'b0;  // Deassert reset after 2 seconds (20 clock cycles)

    // Start the stopwatch
    Start <= 1'b1;
	CountDown <= 1'b0;
    @(posedge clk);      // Wait for one clock cycle
    Start <= 1'b0;      // Deassert Start immediately
	

    // Wait for almost 1 minute (around 59.9 seconds)
    #5992;

    // Assert Stop signal for 1 clock cycle (simulate a brief stop)
     Stop <= 1'b1;
	 @(negedge clk); 
     Stop <= 1'b0;

	#5990;
	reset <=1'b1;
	@(posedge clk);
	reset <= 1'b0;
	// Start the stopwatch
    Start <= 1'b1;
    @(posedge clk);      // Wait for one clock cycle
    Start <= 1'b0;      // Deassert Start immediately
    // Wait for remaining time (around 9 minutes and 0.1 seconds)
	#5990
	CountDown <= 1'b1;
    #48020;              
    $finish;
  end

endmodule