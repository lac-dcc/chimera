// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef RegisterRow
  `define RegisterRow

`include "RegisterFile/Register.v"

module RegisterRow(In, Load, Clock, CLRN, Q);
  input [12:0] In;
  input Load;
  input Clock;
  input CLRN;
  output [12:0] Q;

  Register register1 (.In(In[0]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[0]));
  Register register2 (.In(In[1]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[1]));
  Register register3 (.In(In[2]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[2]));
  Register register4 (.In(In[3]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[3]));
  Register register5 (.In(In[4]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[4]));
  Register register6 (.In(In[5]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[5]));
  Register register7 (.In(In[6]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[6]));
  Register register8 (.In(In[7]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[7]));
  Register register9 (.In(In[8]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[8]));
  Register register10 (.In(In[9]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[9]));
  Register register11 (.In(In[10]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[10]));
  Register register12 (.In(In[11]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[11]));
  Register register13 (.In(In[12]), .Load(Load), .Clock(Clock), .CLRN(CLRN), .Q(Q[12]));


  endmodule
`endif
