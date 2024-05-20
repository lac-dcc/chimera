// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`include "RegisterFile/regfile.v"
`include "RegisterFile/RegisterRow.v"
`include "fullstate.v"
`include "seven_seg_decoder_bus.v"
`include "elevenBitUpCount.v"
`include "thirteenBitUpCounter.v"
`include "divideByFiftyThousandCounter.v"
`include "twoBitUpCounterREAL.v"

module Reaction_Time_Game(buttonStart, buttonHit, buttonReset, GreenLed, RedLed, Screen1, Screen2, Screen3, Screen4, Screen5, Clock, state, delayCounterDone, reg0);
  input buttonStart;
  input buttonHit;
  input buttonReset;
  input Clock;
  output GreenLed;
  output RedLed;
  output [6:0] Screen1; // Right most screen
  output [6:0] Screen2; // ...
  output [6:0] Screen3; // ...
  output [6:0] Screen4; // Left most screen
  output [6:0] Screen5; // run counter display AKA what is at reg[0]
  output [2:0] state;
  output delayCounterDone;

  output wire [12:0] reg0; // is going to be the data on DATAP which in our case will always be the value stored in register 0

  wire [12:0] dataQ;

  wire [2:0] rp;
  assign rp = {1'b0, 1'b0, 1'b0};

  wire [2:0] rq;
  wire [12:0] ld_data;
  wire registerLoad;
  wire [2:0] wa;
  wire SCEn;
  
  assign buttonStartReal = (~buttonStart);
  assign buttonHitReal = (~buttonHit);
  assign buttonResetReal = (~buttonReset);

  // wire delayCounterDone;
  wire delayCounterEnable;
  
  wire OneKhzClock;

  divideByFiftyThousandCounter dbftc (.Enable(1'b1), .Clock(Clock), .ClockOut(OneKhzClock));
  
  elevenBitUpCount dc (.Enable(delayCounterEnable), .Clock(OneKhzClock), .Reset(delayCounterEnable), .Done(delayCounterDone));
 
  wire [12:0] scoreFromCounter;


  thirteenBitUpCounter scd (.Enable(SCEn), .Clock(OneKhzClock), .count(scoreFromCounter), .Reset(~SCEn));

  regfile rf (.DATAP(reg0), .DATAQ(dataQ), .RP(rp), .RQ(rq), .WA(wa), .LD_DATA(ld_data), .WR(registerLoad), .CLK(OneKhzClock), .CLRN(buttonReset));
  
  
  wire [2:0] tbupcntr;
  wire twobitClRN;

  twoBitUpCounterREAL tb2 (.EnableReal(twobitClRN), .CLK1(buttonHitReal), .Q0(tbupcntr[0]), .Q1(tbupcntr[1]), .Q3(tbupcntr[2]), .CLRN1(twobitClRN));

  fullstate fs (.buttonStart(buttonStartReal), .buttonHit(buttonHitReal), .buttonReset(buttonReset), .Clock(OneKhzClock), .ReadQ(rq), .registerLoad(registerLoad), .delayCounterDone(delayCounterDone), .delayCounterEnable(delayCounterEnable), .WriteAddress(wa), .ledGreen(GreenLed), .RedLed(RedLed), .scoreCounterEnable(SCEn), .scoreCounter(scoreFromCounter), .registerDataP(reg0), .registerDataQ(dataQ), .registerLoadData(ld_data), .twoBitCounterClear(twobitClRN), .State(state), .twoBitCounterCurrent(tbupcntr));
  
  wire [12:0] outputDisplay; // TODO: change if base 10 output
  wire [3:0] Screen5Pre; 
  
  assign Screen5Pre = /*(twobitClRN) ? (tbupcntr) : */ ({reg0[3], reg0[2], reg0[1], reg0[0]});

  wire RunScoreDisplay;
  assign RunScoreDisplay = 1'b1;

  wire RunCountDisplay;
  assign RunCountDisplay = 1'b1;

  seven_seg_decoder_bus ssd1 (.X({dataQ[3], dataQ[2], dataQ[1], dataQ[0]}), .En(RunScoreDisplay), .Result(Screen1));
  seven_seg_decoder_bus ssd2 (.X({dataQ[7], dataQ[6], dataQ[5], dataQ[4]}), .En(RunScoreDisplay), .Result(Screen2));
  seven_seg_decoder_bus ssd3 (.X({dataQ[11], dataQ[10], dataQ[9], dataQ[8]}), .En(RunScoreDisplay), .Result(Screen3));
  seven_seg_decoder_bus ssd4 (.X({1'b0, 1'b0, 1'b0, dataQ[12]}), .En(RunScoreDisplay), .Result(Screen4));
  seven_seg_decoder_bus ssd5 (.X(Screen5Pre), .En(RunCountDisplay), .Result(Screen5));

endmodule
