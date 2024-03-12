module part7 (SW, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input [17:0] SW;
  output [17:0] LEDR;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;


  //multiplier M0 (SW[11:8], SW[3:0], LEDR[7:0]);
  lpm_multiplier_8bit M0 (SW[15:8], SW[7:0], LEDR[15:0]);
  
  hex_ssd H7 (SW[15:12], HEX7);
  hex_ssd H6 (SW[11:8], HEX6);

  hex_ssd H5 (SW[7:4], HEX5);
  hex_ssd H4 (SW[3:0], HEX4);

  hex_ssd H3 (LEDR[15:12], HEX3);
  hex_ssd H2 (LEDR[11:8], HEX2);
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

// implements a 8-bit by 8-bit multiplier with 12-bit result
module multiplier_8bit (A, B, P);
  input [7:0] A, B;
  output [15:0] P;

  wire c01, c02, c03, c04, c05, c06, c07, c08;
  wire s02, s03, s04, s05, s06, s07, s08;

  wire c12, c13, c14, c15, c16, c17, c18, c19;
  wire s13, s14, s15, s16, s17, s18, s19;

  wire c23, c24, c25, c26, c27, c28, c29, c20;
  wire s24, s25, s26, s27, s28, s29, s20;

  wire c34, c35, c36, c37, c38, c39, c30, c31;
  wire s35, s36, s37, s38, s39, s30, s31;

  wire c45, c46, c47, c48, c49, c40, c41, c42;
  wire s46, s47, s48, s49, s40, s41, s42;

  wire c56, c57, c58, c59, c50, c51, c52, c53;
  wire s57, s58, s59, s50, s51, s52, s53;

  wire c67, c68, c69, c60, c61, c62, c63, c64;

  assign P[0] = A[0] & B[0];

  fulladder F01 (A[1] & B[0], A[0] & B[1], 0, P[1], c01);
  fulladder F02 (A[2] & B[0], A[1] & B[1], c01, s02, c02);
  fulladder F03 (A[3] & B[0], A[2] & B[1], c02, s03, c03);
  fulladder F04 (A[4] & B[0], A[3] & B[1], c03, s04, c04);
  fulladder F05 (A[5] & B[0], A[4] & B[1], c04, s05, c05);
  fulladder F06 (A[6] & B[0], A[5] & B[1], c05, s06, c06);
  fulladder F07 (A[7] & B[0], A[6] & B[1], c06, s07, c07);
  fulladder F08 (0, A[7] & B[1], c07, s08, c08);

  fulladder F12 (s02, A[0] & B[2], 0, P[2], c12);
  fulladder F13 (s03, A[1] & B[2], c12, s13, c13);
  fulladder F14 (s04, A[2] & B[2], c13, s14, c14);
  fulladder F15 (s05, A[3] & B[2], c14, s15, c15);
  fulladder F16 (s06, A[4] & B[2], c15, s16, c16);
  fulladder F17 (s07, A[5] & B[2], c16, s17, c17);
  fulladder F18 (s08, A[6] & B[2], c17, s18, c18);
  fulladder F19 (c08, A[7] & B[2], c18, s19, c19);

  fulladder F23 (s13, A[0] & B[3], 0, P[3], c23);
  fulladder F24 (s14, A[1] & B[3], c23, s24, c24);
  fulladder F25 (s15, A[2] & B[3], c24, s25, c25);
  fulladder F26 (s16, A[3] & B[3], c25, s26, c26);
  fulladder F27 (s17, A[4] & B[3], c26, s27, c27);
  fulladder F28 (s18, A[5] & B[3], c27, s28, c28);
  fulladder F29 (s19, A[6] & B[3], c28, s29, c29);
  fulladder F20 (c19, A[7] & B[3], c29, s20, c20);

  fulladder F34 (s24, A[0] & B[4], 0, P[4], c34);
  fulladder F35 (s25, A[1] & B[4], c34, s35, c35);
  fulladder F36 (s26, A[2] & B[4], c35, s36, c36);
  fulladder F37 (s27, A[3] & B[4], c36, s37, c37);
  fulladder F38 (s28, A[4] & B[4], c37, s38, c38);
  fulladder F39 (s29, A[5] & B[4], c38, s39, c39);
  fulladder F30 (s20, A[6] & B[4], c39, s30, c30);
  fulladder F31 (c20, A[7] & B[4], c30, s31, c31);

  fulladder F45 (s35, A[0] & B[5], 0, P[5],  c45);
  fulladder F46 (s36, A[1] & B[5], c45, s46, c46);
  fulladder F47 (s37, A[2] & B[5], c46, s47, c47);
  fulladder F48 (s38, A[3] & B[5], c47, s48, c48);
  fulladder F49 (s39, A[4] & B[5], c48, s49, c49);
  fulladder F40 (s30, A[5] & B[5], c49, s40, c40);
  fulladder F41 (s31, A[6] & B[5], c40, s41, c41);
  fulladder F42 (c31, A[7] & B[5], c41, s42, c42);

  fulladder F56 (s46, A[0] & B[6], 0, P[6],  c56);
  fulladder F57 (s47, A[1] & B[6], c56, s57, c57);
  fulladder F58 (s48, A[2] & B[6], c57, s58, c58);
  fulladder F59 (s49, A[3] & B[6], c58, s59, c59);
  fulladder F50 (s40, A[4] & B[6], c59, s50, c50);
  fulladder F51 (s41, A[5] & B[6], c50, s51, c51);
  fulladder F52 (s42, A[6] & B[6], c51, s52, c52);
  fulladder F53 (c42, A[7] & B[6], c52, s53, c53);

  fulladder F67 (s57, A[0] & B[7], 0,   P[7 ], c67);
  fulladder F68 (s58, A[1] & B[7], c67, P[8 ], c68);
  fulladder F69 (s59, A[2] & B[7], c68, P[9 ], c69);
  fulladder F60 (s50, A[3] & B[7], c69, P[10], c60);
  fulladder F61 (s51, A[4] & B[7], c60, P[11], c61);
  fulladder F62 (s52, A[5] & B[7], c61, P[12], c62);
  fulladder F63 (s53, A[6] & B[7], c62, P[13], c63);
  fulladder F64 (c53, A[7] & B[7], c63, P[14], P[15]);
endmodule
