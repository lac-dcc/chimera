// This program was cloned from: https://github.com/lnis-uofu/OpenFPGA
// License: MIT License

//-----------------------------
// 8-bit multiplier
//-----------------------------
module mult_8x8 (
  input [0:7] A,
  input [0:7] B,
  output [0:15] Y
);
  parameter A_SIGNED = 0;
  parameter B_SIGNED = 0;
  parameter A_WIDTH = 0;
  parameter B_WIDTH = 0;
  parameter Y_WIDTH = 0;

  mult_8 #(.MODE(1'b1)) _TECHMAP_REPLACE_ (
    .A    (A),
    .B    (B),
    .Y    (Y) );

endmodule

//-----------------------------
// 16-bit multiplier
//-----------------------------
module mult_16x16 (
  input [0:15] A,
  input [0:15] B,
  output [0:31] Y
);
  parameter A_SIGNED = 0;
  parameter B_SIGNED = 0;
  parameter A_WIDTH = 0;
  parameter B_WIDTH = 0;
  parameter Y_WIDTH = 0;

  mult_16 #(.MODE(1'b0)) _TECHMAP_REPLACE_ (
    .A    (A),
    .B    (B),
    .Y    (Y) );

endmodule
