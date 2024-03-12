module part3 (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [15:0] Q;
  
  wire [15:0] T;

  megtff T0 (En, Clk, Clr, Q[0]);
  assign T[0] = En & Q[0];

  megtff T1 (T[0], Clk, Clr, Q[1]);
  assign T[1] = T[0] & Q[1];

  megtff T2 (T[1], Clk, Clr, Q[2]);
  assign T[2] = T[1] & Q[2];

  megtff T3 (T[2], Clk, Clr, Q[3]);
  assign T[3] = T[2] & Q[3];

  megtff T4 (T[3], Clk, Clr, Q[4]);
  assign T[4] = T[3] & Q[4];

  megtff T5 (T[4], Clk, Clr, Q[5]);
  assign T[5] = T[4] & Q[5];

  megtff T6 (T[5], Clk, Clr, Q[6]);
  assign T[6] = T[5] & Q[6];

  megtff T7 (T[6], Clk, Clr, Q[7]);
  assign T[7] = T[6] & Q[7];

  megtff T8 (T[7], Clk, Clr, Q[8]);
  assign T[8] = T[7] & Q[8];

  megtff T9 (T[7], Clk, Clr, Q[9]);
  assign T[9] = T[7] & Q[9];

  megtff T10 (T[9], Clk, Clr, Q[10]);
  assign T[10] = T[9] & Q[10];

  megtff T11 (T[10], Clk, Clr, Q[11]);
  assign T[11] = T[10] & Q[11];

  megtff T12 (T[11], Clk, Clr, Q[12]);
  assign T[12] = T[11] & Q[12];

  megtff T13 (T[12], Clk, Clr, Q[13]);
  assign T[13] = T[12] & Q[13];

  megtff T14 (T[13], Clk, Clr, Q[14]);
  assign T[14] = T[13] & Q[14];

  megtff T15 (T[14], Clk, Clr, Q[15]);
  //assign T[15] = T[14] & Q[15];

endmodule
