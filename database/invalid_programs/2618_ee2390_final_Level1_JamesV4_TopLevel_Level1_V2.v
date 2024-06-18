// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module top_level;

  input clk, reset, Start, Stop, Clear, Countdown;
  output wire [0:6] Seg_Minutes, Seg_Tens_Seconds, Seg_Ones_Seconds, Seg_Tenths_Seconds;

  wire [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds;

generate
      sevensegBCDdecoder minutes_decoder(Minutes, clk, reset, Seg_Minutes);
      sevensegBCDdecoder tens_seconds_decoder(Tens_Seconds, clk,reset, Seg_Tens_Seconds);
      sevensegBCDdecoder ones_seconds_decoder(Ones_Seconds, clk,reset, Seg_Ones_Seconds);
      sevensegBCDdecoder tenths_seconds_decoder(Tenths_Seconds, clk,reset, Seg_Tenths_Seconds);
endgenerate

  stopwatch stopwatch_inst (
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


endmodule