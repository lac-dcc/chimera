// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef full_add_subtract13bit
  `define full_add_subtract13bit

`include "full_adder_13bit.v"
module full_add_subtract13bit(X, Y, AddSub, Overflow, S);
  input [12:0] X;
  input [12:0] Y;
  input AddSub;
  output Overflow;
  output [12:0] S;

  wire [12:0] In;

  assign In[0] = AddSub ^ Y[0];
  assign In[1] = AddSub ^ Y[1];
  assign In[2] = AddSub ^ Y[2];
  assign In[3] = AddSub ^ Y[3];
  assign In[4] = AddSub ^ Y[4];
  assign In[5] = AddSub ^ Y[5];
  assign In[6] = AddSub ^ Y[6];
  assign In[7] = AddSub ^ Y[7];
  assign In[8] = AddSub ^ Y[8];
  assign In[9] = AddSub ^ Y[9];
  assign In[10] = AddSub ^ Y[10];
  assign In[11] = AddSub ^ Y[11];
  assign In[12] = AddSub ^ Y[12];

  full_adder_13bit FA (.X(X), .Y(In), .Cin(AddSub), .Sout(S), .Cout(_ignore), .Overflow(Overflow));

endmodule

`endif

