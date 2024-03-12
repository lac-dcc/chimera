module part5 (SW, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input [17:0] SW;
  output [17:0] LEDR;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  assign HEX7 = 7'b1111111;
  assign HEX5 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX2 = 7'b1111111;

  multiplier M0 (SW[11:8], SW[3:0], LEDR[7:0]);
  
  hex_ssd H6 (SW[11:8], HEX6);
  hex_ssd H4 (SW[3:0], HEX4);
  hex_ssd H1 (LEDR[7:4], HEX1);
  hex_ssd H0 (LEDR[3:0], HEX0);
endmodule

// implements a 4-bit by 4-bit multiplier with 8-bit result
module multiplier (A, B, P);
  input [3:0] A, B;
  output [7:0] P;

  wire c01, c02, c03, c04;
  wire s02, s03, s04;

  wire c12, c13, c14, c15;
  wire s13, s14, s15;

  wire c23, c24, c25, c26;

  assign P[0] = A[0] & B[0];

  fulladder F01 (A[1] & B[0], A[0] & B[1], 0, P[1], c01);
  fulladder F02 (A[2] & B[0], A[1] & B[1], c01, s02, c02);
  fulladder F03 (A[3] & B[0], A[2] & B[1], c02, s03, c03);
  fulladder F04 (0, A[3] & B[1], c03, s04, c04);

  fulladder F12 (s02, A[0] & B[2], 0, P[2], c12);
  fulladder F13 (s03, A[1] & B[2], c12, s13, c13);
  fulladder F14 (s04, A[2] & B[2], c13, s14, c14);
  fulladder F15 (c04, A[3] & B[2], c14, s15, c15);

  fulladder F23 (s13, A[0] & B[3], 0, P[3], c23);
  fulladder F24 (s14, A[1] & B[3], c23, P[4], c24);
  fulladder F25 (s15, A[2] & B[3], c24, P[5], c25);
  fulladder F26 (c15, A[3] & B[3], c25, P[6], P[7]);


endmodule

module fulladder (a, b, ci, s, co);
  input a, b, ci;
  output co, s;

  wire d;

  assign d = a ^ b;
  assign s = d ^ ci;
  assign co = (b & ~d) | (d & ci);
endmodule
