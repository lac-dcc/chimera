module part1 (SW, KEY, LEDG, HEX3, HEX2, HEX1, HEX0);
  input [3:0] SW;
  input [3:0] KEY;
  output [7:0] LEDG;
  output [0:6] HEX3, HEX2, HEX1, HEX0;

  wire [15:0] Q;
  wire [3:0] Q2;

  counter_16bit C0 (SW[1], KEY[0], SW[0], Q);


  hex_ssd H0 (Q[3:0], HEX0);
  hex_ssd H1 (Q[7:4], HEX1);
  hex_ssd H2 (Q[11:8], HEX2);
  hex_ssd H3 (Q[15:12], HEX3);


  counter_4bit C1 (SW[1], KEY[0], SW[0], Q2);



endmodule

module counter_4bit (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [3:0] Q;

  wire [3:0] T, Qs;

  t_flipflop T0 (En, Clk, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  t_flipflop T1 (T[0], Clk, Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  t_flipflop T2 (T[1], Clk, Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  t_flipflop T3 (T[2], Clk, Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];

  assign Q = Qs;
endmodule

module counter_16bit (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [15:0] Q;

  wire [15:0] T, Qs;

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

  t_flipflop T9 (T[7], Clk, Clr, Qs[9]);
  assign T[9] = T[7] & Qs[9];

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
  //assign T[15] = T[14] & Qs[15];

  assign Q = Qs;
endmodule

module t_flipflop (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output reg Q;

  always @ (posedge Clk)
    if (Clr)
      Q = 0;
    else if (En)
      Q = ~Q;

endmodule

module b2d_ssd (X, SSD);
  input [3:0] X;
  output reg [0:6] SSD;

  always
    case (X)
      0:SSD=7'b0000001;
      1:SSD=7'b1001111;
      2:SSD=7'b0010010;
      3:SSD=7'b0000110;
      4:SSD=7'b1001100;
      5:SSD=7'b0100100;
      6:SSD=7'b0100000;
      7:SSD=7'b0001111;
      8:SSD=7'b0000000;
      9:SSD=7'b0001100;
    endcase
endmodule

module hex_ssd (BIN, SSD);
  input [15:0] BIN;
  output reg [0:6] SSD;

  always begin
    case(BIN)
      0:SSD=7'b0000001;
      1:SSD=7'b1001111;
      2:SSD=7'b0010010;
      3:SSD=7'b0000110;
      4:SSD=7'b1001100;
      5:SSD=7'b0100100;
      6:SSD=7'b0100000;
      7:SSD=7'b0001111;
      8:SSD=7'b0000000;
      9:SSD=7'b0001100;
      10:SSD=7'b0001000;
      11:SSD=7'b1100000;
      12:SSD=7'b0110001;
      13:SSD=7'b1000010;
      14:SSD=7'b0110000;
      15:SSD=7'b0111000;
    endcase
  end
endmodule
