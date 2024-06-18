// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

//tb_Stopwatch_V5.v

// Testbench for Stopwatch Counter
`timescale 10ms/1ms
module stopwatch_tb;

  // Inputs
  reg clk;
  reg reset;
  reg Start;
  reg Stop;
  reg Countdown;
  reg Lap;

  // Outputs
  wire [3:0] disp_Tenths_Seconds;
  wire [3:0] disp_Ones_Seconds;
  wire [3:0] disp_Tens_Seconds;
  wire [3:0] disp_Minutes;

  stopwatch dut (
    .clk(clk),
    .reset(reset),
	.Start(Start),
	.Stop(Stop),
	.Countdown(Countdown),
	.Lap(Lap),
    .disp_Tenths_Seconds(disp_Tenths_Seconds),
    .disp_Ones_Seconds(disp_Ones_Seconds),
    .disp_Tens_Seconds(disp_Tens_Seconds),
    .disp_Minutes(disp_Minutes)
  );

  // Clock generation
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // Generate clock with 50ns period (20MHz)
  end

  // Stimulus (reset for 100ns, then run for 1 minute)
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,stopwatch_tb);
    reset = 1'b1;
	Start = 1'b1;
	Countdown = 1'b0;
    #10; //
    reset = 1'b0;
	Start = 1'b0;
	#1000
	Stop = 1'b1;
	#100;
	Stop = 1'b0;
	#2000;
	Start = 1'b1;
    #10; //
    Start = 1'b0;
	#500;
	Lap = 1'b1;
	#10;
	Lap = 1'b0;
	#68000;
	Stop = 1'b1;
	#1
	Stop = 1'b0;
	#20000;
	Start = 1'b1;
    #11000; // Wait for 1 minute (60 seconds * 1 billion ns/second)
    $finish;
  end



endmodule
