module part2 (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [15:0] Q;

  wire [15:0] T, Qs;

  tff_mine T0 (En, Clk, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  tff_mine T1 (T[0], Clk, Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  tff_mine T2 (T[1], Clk, Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  tff_mine T3 (T[2], Clk, Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];

  tff_mine T4 (T[3], Clk, Clr, Qs[4]);
  assign T[4] = T[3] & Qs[4];

  tff_mine T5 (T[4], Clk, Clr, Qs[5]);
  assign T[5] = T[4] & Qs[5];

  tff_mine T6 (T[5], Clk, Clr, Qs[6]);
  assign T[6] = T[5] & Qs[6];

  tff_mine T7 (T[6], Clk, Clr, Qs[7]);
  assign T[7] = T[6] & Qs[7];

  tff_mine T8 (T[7], Clk, Clr, Qs[8]);
  assign T[8] = T[7] & Qs[8];

  tff_mine T9 (T[7], Clk, Clr, Qs[9]);
  assign T[9] = T[7] & Qs[9];

  tff_mine T10 (T[9], Clk, Clr, Qs[10]);
  assign T[10] = T[9] & Qs[10];

  tff_mine T11 (T[10], Clk, Clr, Qs[11]);
  assign T[11] = T[10] & Qs[11];

  tff_mine T12 (T[11], Clk, Clr, Qs[12]);
  assign T[12] = T[11] & Qs[12];

  tff_mine T13 (T[12], Clk, Clr, Qs[13]);
  assign T[13] = T[12] & Qs[13];

  tff_mine T14 (T[13], Clk, Clr, Qs[14]);
  assign T[14] = T[13] & Qs[14];

  tff_mine T15 (T[14], Clk, Clr, Qs[15]);
  //assign T[15] = T[14] & Qs[15];

  assign Q = Qs;
endmodule

module tff_mine (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output reg Q;

  always @ (posedge Clk)
    if (Clr)
      Q = 0;
    else if (En)
      Q <= Q + 1;

endmodule
