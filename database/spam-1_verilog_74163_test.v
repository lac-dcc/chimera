// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "../lib/assertion.v"
`include "hct74163.v"

`timescale 1ns/1ns

module counter_74163_tb();
logic CP;
logic _MR;
logic CEP;
logic CET;
logic _PE;
logic [3:0] D;
logic [3:0] Q;

wire TC;

always @(*)  begin
    $display(" %t TEST : CP=%1b _MR=%1b CEP=%1b CET=%1b _PE=%1b D=%4b Q=%4b ", $time, CP, _MR, CEP, CET, _PE, D, Q);
end

// naming from https://www.ti.com/lit/ds/symlink/sn74f163a.pdf
hct74163 DUT
(
  .CP(CP),
  ._MR(_MR),
  .CEP(CEP),
  .CET(CET),
  ._PE(_PE),
  .D(D),

  .Q(Q),
  .TC(TC)
);

`define CLOCK_PULSE  \
  #300 \
  CP= 1'b0; \
  #300 \
  CP= 1'b1; \
  #300 \
  CP= 1'b0; \
  #300

initial begin
  // Set up time printing format to nanoseconds with no decimal precision digits
  // $timeformat [ ( units_number , precision_number , suffix_string , minimum_field_width ) ] ;
  $timeformat(-9, 0, " ns", 10);
  $display("[%t]: initial state", $time);

  CP = 1'b0;
  CEP = 1'b0;
  CET = 1'b0;
  _PE = 1'b1;
  D = 4'b1111;

  // SYNC RESET
  _MR = 1'b0;
  #100;
  `Equals(Q, 4'bxxxx);

  // Clock the reset state into the latch
  $display("[%t]: clock pulse", $time);
  `CLOCK_PULSE
  `Equals(Q, 4'b0000);

  // Release reset state
  _MR = 1'b1;
  #100;

  // Load zero as initial counter state
  $display("[%t]: Load 1 as initial value", $time);
  D = 4'b0001;
  #10
  _PE = 1'b0;

  `CLOCK_PULSE 

  #100
  _PE = 1'b1;
  #100;

  `Equals(Q, 4'b0001);
  
  
  $display("[%t]: Regular count test", $time);
  CEP = 1'b1;
  CET = 1'b1;
  $display("COUNT %4b", Q);
  for (int i = 0; i < 10; i++)
  begin
    #300
    CP= 1'b1;
    #300
    CP= 1'b0;
  end

  `Equals(Q, 4'b1011);

  //////////
  $display("[%t]", $time, " both CEP and CET have to be High to count");
  CEP = 1'b0;
  CET = 1'b1;
  #50;

  // toggle clock
  CP= 1'b1;
  #300
  CP= 1'b0;
  #300
  $display("NO COUNT %4b", Q);
  `Equals(Q, 4'b1011);

  //////////
  $display("[%t]", $time, " both CEP and CET have to be High to count");
  CEP = 1'b1;
  CET = 1'b0; // other way round
  #50;

  // toggle clock
  CP= 1'b1;
  #300
  CP= 1'b0;
  #300
  $display("NO COUNT %4b", Q);
  `Equals(Q, 4'b1011);

  // MR sync with clock test
  // MR is synced with clock reset on new +ve edge of clock
  $display("[%t]", $time, " _MR test = _MR low");
  CEP = 1'b1;
  CET = 1'b1; 
  _MR= 1'b0;
  #300
  `Equals(Q, 4'b1011); // no reset cos no +ve clock
  
  $display("[%t]", $time, " _MR test = _MR low and CP low");
  CP= 1'b0;
  #300
  `Equals(Q, 4'b1011); // still no reset cos no +ve clock
  
  $display("[%t]", $time, " _MR test = _MR low and CP high");
  CP= 1'b1;
  #300
  `Equals(Q, 4'b0000); // now resets
  

  // PE sync with clock test
  // MR is synced with clock reset on new +ve edge of clock
  $display("[%t]", $time, " _PE test = _MR hi and CP high");
  CP= 1'b1;
  CEP = 1'b1;
  CET = 1'b1; 
  _MR= 1'b1;
  #300
  `Equals(Q, 4'b0000); // still 0

  $display("[%t]", $time, " _PE test = _PE low but no load yet as no +ve CP");
  D=4'b1110;
  _PE=1'b0;
  #300
  `Equals(Q, 4'b0000); // no load cos no +ve clock
  
  $display("[%t]", $time, " _PE test = _PE low but no load yet as no +ve CP");
  CP= 1'b0;
  #300
  `Equals(Q, 4'b0000); // still no load cos no +ve clock
  
  $display("[%t]", $time, " _PE test = _PE low expect load as +ve CP");
  CP= 1'b1;
  #300
  `Equals(Q, 4'b1110); // now loads
  
  // test overflow
  // The TC output is HIGH when CET is HIGH and the counter is at terminal count (HHHH);

  $display("[%t]", $time, " overflow test");
  `Equals(Q, 4'b1110); // initial state
  `Equals(TC, 1'b0); // not carry
  CEP = 1'b1;
  CET = 1'b1; 
  _MR= 1'b1;
  _PE= 1'b1;
  #300
  `Equals(TC, 1'b0); // not carry
  `Equals(Q, 4'b1110); // not counted
  
  CP= 1'b0;
  #300
  `Equals(TC, 1'b0); // not carry
  `Equals(Q, 4'b1110); // not counted
  
  CP= 1'b1;
  #300
  `Equals(TC, 1'b1); // now carry
  `Equals(Q, 4'b1111); // now loads
  
  CET=1'b0;
  #300
  `Equals(TC, 1'b0); // now no carry
  `Equals(Q, 4'b1111); // now loads
  `Equals(Q, 4'b1111); // now loads
  
end

endmodule
