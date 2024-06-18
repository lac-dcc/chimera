// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef delayCounterWithDone
  `define delayCounterWithDone

`include "equals13bit.v"
`include "elevenBitUpCounter.v"
module delayCounterWithDone(Enable, ClockIn, Done);
  input Enable;
  input ClockIn;
  output Done;

  wire [10:0] Y;

  ElevenBitUpCounter upper (.Enable(Enable), .Clock(ClockIn), .S(Y), .Reset(Enable));
  
  and(Done, Y[0], Y[1], Y[2], Y[3], Y[4], Y[5], Y[6], Y[7], Y[8], Y[9], Y[10]);


endmodule

`endif
