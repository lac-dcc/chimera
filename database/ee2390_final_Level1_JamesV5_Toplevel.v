// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module TopLevel (
  input clk, reset, Start, Stop, Clear, Countdown,
  output wire [6:0] LED_Out1, LED_Out2, LED_Out3, LED_Out4 // Outputs for each digit
);

  // Internal wires
  wire [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds;
  wire counter_trigger;

  // Instantiate modules
  StopwatchCounter counter (
    .clk(clk),
    .counter_trigger(counter_trigger)
  );

  Stopwatch stopwatch (
    .clk(clk),
    .reset(reset),
    .Start(Start),
    .Stop(Stop),
    .Clear(Clear),
    .Countdown(Countdown),
    .Minutes(Minutes),
    .Tens_Seconds(Tens_Seconds),
    .Ones_Seconds(Ones_Seconds),
    .Tenths_Seconds(Tenths_Seconds)
  );

  SevenSegmentDecoder decoder1 (
    .data(Minutes),
    .segment(LED_Out1)
  );

  SevenSegmentDecoder decoder2 (
    .data(Tens_Seconds),
    .segment(LED_Out2)
  );

  SevenSegmentDecoder decoder3 (
    .data(Ones_Seconds),
    .segment(LED_Out3)
  );

  SevenSegmentDecoder decoder4 (
    .data(Tenths_Seconds),
    .segment(LED_Out4)
  );

endmodule
