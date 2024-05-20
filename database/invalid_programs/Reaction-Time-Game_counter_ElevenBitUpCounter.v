// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`include "TFlipFlop.v"
module ElevenBitUpCounter(Enable, .Clock(Clock), S, Reset);
  input Enable;
  input Clock;
  input Reset;

  output [10:0] S;

  
  TFlipFlop TA1 (.T(Enable), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA1), .Qn(_ignore));
  assign cond1 = QA1 & Enable;
  TFlipFlop TA2 (.T(cond1), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA2), .Qn(_ignore));
  assign cond2 = cond1 & QA2;
  TFlipFlop TA3 (.T(cond2), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA3), .Qn(_ignore));
  assign cond3 = cond2 & QA3;
  TFlipFlop TA4 (.T(cond3), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA4), .Qn(_ignore));
  assign cond4 = cond3 & QA4;
  TFlipFlop TA5 (.T(cond4), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA5), .Qn(_ignore));
  assign cond5 = cond4 & QA5;
  TFlipFlop TA6 (.T(cond5), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA6), .Qn(_ignore));
  assign cond6 = cond5 & QA6;
  TFlipFlop TA7 (.T(cond6), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA7), .Qn(_ignore));
  assign cond7 = cond6 & QA7;
  TFlipFlop TA8 (.T(cond7), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA8), .Qn(_ignore));
  assign cond8 = cond7 & QA8;
  TFlipFlop TA9 (.T(cond8), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA9), .Qn(_ignore));
  assign cond9 = cond8 & QA9;
  TFlipFlop TA10 (.T(cond9), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA10), .Qn(_ignore));
  assign cond10 = cond9 & QA10;
  TFlipFlop TA11 (.T(cond10), .Clock(Clock), .ClearN(Reset), .PresetN(1'b1), .Q(QA11), .Qn(_ignore)); 


  assign S[0] = QA1;
  assign S[1] = QA2;
  assign S[2] = QA3;
  assign S[3] = QA4;
  assign S[4] = QA5;
  assign S[5] = QA6;
  assign S[6] = QA7;
  assign S[7] = QA8;
  assign S[8] = QA9;
  assign S[9] = QA10;
  assign S[10] = QA11;


endmodule
