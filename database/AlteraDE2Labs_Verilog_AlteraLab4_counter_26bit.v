module counter_26bit (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [25:0] Q;

  wire [25:0] T, Qs;

  t_flipflop T0 (En, Clk, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  t_flipflop T1 (T[0], Clk, Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  t_flipflop T2 (T[1], Clk, Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  t_flipflop T3 (T[2], Clk, Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];

  t_flipflop T4 (T[3], Clk, Clr, Qs[4]);
  assign T[4] = T[3] & Qs[4];

  t_flipflop T5 (T[4], Clk, Clr, Qs[5]);
  assign T[5] = T[4] & Qs[5];

  t_flipflop T6 (T[5], Clk, Clr, Qs[6]);
  assign T[6] = T[5] & Qs[6];

  t_flipflop T7 (T[6], Clk, Clr, Qs[7]);
  assign T[7] = T[6] & Qs[7];

  t_flipflop T8 (T[7], Clk, Clr, Qs[8]);
  assign T[8] = T[7] & Qs[8];

  t_flipflop T9 (T[8], Clk, Clr, Qs[9]);
  assign T[9] = T[8] & Qs[9];

  t_flipflop T10 (T[9], Clk, Clr, Qs[10]);
  assign T[10] = T[9] & Qs[10];

  t_flipflop T11 (T[10], Clk, Clr, Qs[11]);
  assign T[11] = T[10] & Qs[11];

  t_flipflop T12 (T[11], Clk, Clr, Qs[12]);
  assign T[12] = T[11] & Qs[12];

  t_flipflop T13 (T[12], Clk, Clr, Qs[13]);
  assign T[13] = T[12] & Qs[13];

  t_flipflop T14 (T[13], Clk, Clr, Qs[14]);
  assign T[14] = T[13] & Qs[14];

  t_flipflop T15 (T[14], Clk, Clr, Qs[15]);
  assign T[15] = T[14] & Qs[15];

  t_flipflop T16 (T[15], Clk, Clr, Qs[16]);
  assign T[16] = T[15] & Qs[16];

  t_flipflop T17 (T[16], Clk, Clr, Qs[17]);
  assign T[17] = T[16] & Qs[17];

  t_flipflop T18 (T[17], Clk, Clr, Qs[18]);
  assign T[18] = T[17] & Qs[18];

  t_flipflop T19 (T[18], Clk, Clr, Qs[19]);
  assign T[19] = T[18] & Qs[19];

  t_flipflop T20 (T[19], Clk, Clr, Qs[20]);
  assign T[20] = T[19] & Qs[20];

  t_flipflop T21 (T[20], Clk, Clr, Qs[21]);
  assign T[21] = T[20] & Qs[21];

  t_flipflop T22 (T[21], Clk, Clr, Qs[22]);
  assign T[22] = T[21] & Qs[22];

  t_flipflop T23 (T[22], Clk, Clr, Qs[23]);
  assign T[23] = T[22] & Qs[23];

  t_flipflop T24 (T[23], Clk, Clr, Qs[24]);
  assign T[24] = T[23] & Qs[24];

  t_flipflop T25 (T[24], Clk, Clr, Qs[25]);
  assign T[25] = T[24] & Qs[25];

  assign Q = Qs;
endmodule
