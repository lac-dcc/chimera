// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module Toplevel_stopwatch(an, clk, Clear, reset,Start,Stop,Countdown, Seg);

input clk;
input reset,Start,Stop,Clear,Countdown;

wire [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds;
output [3:0] an;
output [6:0] Seg;
	stopwatch M0(
	  .clk(clk),
	  .reset(reset),
	  .Start(Start), 
	  .Stop(Stop), 
	  .Clear(Clear), 
	  .Countdown(Countdown), 
	  .Minutes(Minutes), 
	  .Tens_Seconds(Tens_Seconds), 
	  .Ones_Seconds(Ones_Seconds), 
	  .Tenths_Seconds(Tenths_Seconds));
	
	
	//Minutes, Tens_Seconds, Ones_Seconds, Tenths_Second
	sevensegBCDdecoder M1(.Minutes(Minutes), 
	  .Tens_Seconds(Tens_Seconds), 
	  .Ones_Seconds(Ones_Seconds), 
	  .Tenths_Seconds(Tenths_Seconds),
	  .Seg(Seg),
	  .an(an),
	  .clk(clk)
	  );               
               
endmodule