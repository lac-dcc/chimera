// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off UNOPTFLAT

`include "../lib/assertion.v"
`include "hct74163.v"

module test();
logic CP;
logic _MR;
logic CEP1;
logic CEP2;
logic CET1;
logic CET2;
logic _PE;
logic [3:0] D1;
logic [3:0] D2;
logic [3:0] Q1;
logic [3:0] Q2;

wire TC1;
wire TC2;

// naming from https://www.ti.com/lit/ds/symlink/sn74f163a.pdf
hct74163 LO
(
  .CP(CP),
  ._MR(_MR),
  .CEP(CEP1),
  .CET(CET1),
  ._PE(_PE),
  .D(D1),

  .Q(Q1),
  .TC(TC1)
);

hct74163 HI
(
  .CP(CP),
  ._MR(_MR),
  .CEP(CEP2),
  .CET(CET2),
  ._PE(_PE),
  .D(D2),

  .Q(Q2),
  .TC(TC2)
);

task clkpulse;
  begin
  #50
  CP= 1'b0;
  #50
  CP= 1'b1;
  end
endtask


  always @(*)
    $display("Q1=%4b", Q1, " Q2=%4b", Q2);

initial begin
  
  CEP1 = 1'b1;
  CET1 = 1'b1;
  CEP2 = 1'b1;
  assign CET2 = TC1; // CHAIN 
  
  _PE = 1'b1;
  _MR = 1'b1;
  CP = 1'b1;
  D1 = 4'b1110;
  D2 = 4'b0000;

  #100;
  _PE = 1'b0;
  
  clkpulse;
  
  #100;
  _PE = 1'b1;
  `Equals(Q1, 4'b1110);
  `Equals(Q2, 4'b0000);

  clkpulse;
  
  #100;
  `Equals(Q1, 4'b1111);
  `Equals(Q2, 4'b0000);

  clkpulse;
  
  #100;
  `Equals(Q1, 4'b0000);
  `Equals(Q2, 4'b0001);
end

endmodule: test
