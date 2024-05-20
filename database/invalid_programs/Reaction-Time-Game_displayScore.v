// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`include "quotientAndRemainder.v"
`include "RegisterFile/RegisterRow.v"
`include "seven_seg_decoder_bus.v"

module displayScore(X, Screen1, Screen2, Screen3, Screen4, Load, Clock, CLRN, Display);
  input [12:0] X; // Number to display as a 13 bit bus
  input Load; // should be high when we want the signal to propogate to the seven segment displays
  input Clock; // Should always be hooked up to the main clock
  input CLRN; // Should be high, unless you wish to reset the whole state, in which case it should temporarily be low
  input Display; // controls the enable for the seven segment displays. Should be high to enable them
  output [6:0] Screen1; // the 4 bit buses that are meant to go to each seven segment display
  output [6:0] Screen2; // ...
  output [6:0] Screen3; // ...
  output [6:0] Screen4; // ...

  wire [3:0] Screen1Pre;
  wire [3:0] Screen2Pre;
  wire [3:0] Screen3Pre;
  wire [3:0] Screen4Pre;

  wire [12:0] Inbetween1_2; // X / 10
  wire [12:0] Inbetween2_3; // Inbetween1_2 / 10
  wire [12:0] Inbetween3_4; // Inbetween2_3 / 10

  quotientAndRemainder db10_1 (.Input(X), .Quotient(Inbetween1_2), .Remainder(Screen1Pre));
  quotientAndRemainder db10_2 (.Input(Inbetween1_2), .Quotient(Inbetween2_3), .Remainder(Screen2Pre));
  quotientAndRemainder db10_3 (.Input(Inbetween2_3), .Quotient(Inbetween3_4), .Remainder(Screen3Pre));
  quotientAndRemainder db10_4 (.Input(Inbetween3_4), .Quotient(_ignore), .Remainder(Screen4Pre));

  wire [6:0] display1;
  wire [6:0] display2;
  wire [6:0] display3;
  wire [6:0] display4;
  
  // connect to registers to keep the screens values
  RegisterRow rw1 (.In(Screen1Pre), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(display1));
  RegisterRow rw2 (.In(Screen2Pre), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(display2));
  RegisterRow rw3 (.In(Screen3Pre), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(display3)); 
  RegisterRow rw4 (.In(Screen4Pre), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(display4)); 
  
  // The seven segment decoders outputs
  seven_seg_decoder_bus s1 (.X(display1), .Result(Screen1), .En(Display));
  seven_seg_decoder_bus s2 (.X(display2), .Result(Screen2), .En(Display)); 
  seven_seg_decoder_bus s3 (.X(display3), .Result(Screen3), .En(Display)); 
  seven_seg_decoder_bus s4 (.X(display4), .Result(Screen4), .En(Display)); 

endmodule
