// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

/*
 * 1364-1995 Verilog generated by Icarus Verilog VLOG95 Code Generator,
 * Version: 10.3 (stable) ()
 * Converted using TYPICAL delays and without signed support.
 */

`timescale 1s/1s
/* This module was originally defined in file flatten.v at line 1. */
module Mult_2_3(IN1, IN2, Out);
  input [1:0] IN1;
  input [2:0] IN2;
  output [4:0] Out;

  wire [1:0] IN1;
  wire [2:0] IN2;
  wire [4:0] Out;
  wire P0;
  wire [1:0] P1;
  wire [2:0] P2;
  wire [2:0] P3;
  wire P4;
  wire P5;
  wire [5:0] R1;
  wire [2:0] R2;
  wire [1:0] S0__IN1;
  wire [2:0] S0__IN2;
  wire S0__P0;
  wire [1:0] S0__P1;
  wire [2:0] S0__P2;
  wire [2:0] S0__P3;
  wire S0__P4;
  wire S0__P5;
  wire S0__U10__O;
  wire S0__U9__O;
  wire S0__w14;
  wire S0__w15;
  wire S1__IN0;
  wire [1:0] S1__IN1;
  wire [2:0] S1__IN2;
  wire [2:0] S1__IN3;
  wire S1__IN4;
  wire S1__IN5;
  wire [5:0] S1__Out1;
  wire [2:0] S1__Out2;
  wire S1__U0__C;
  wire S1__U0__S;
  wire S1__U0__X;
  wire S1__U0__Y;
  wire S1__U1__C;
  wire S1__U1__S;
  wire S1__U1__X;
  wire S1__U1__Y;
  wire S1__U1__Z;
  wire S1__U2__C;
  wire S1__U2__S;
  wire S1__U2__X;
  wire S1__U2__Y;
  wire S1__U2__Z;
  wire [3:0] S2__IN1;
  wire [2:0] S2__IN2;
  wire [4:0] S2__Out;
  wire S2__U0__C;
  wire S2__U0__S;
  wire S2__U0__X;
  wire S2__U0__Y;
  wire S2__U1__C;
  wire S2__U1__S;
  wire S2__U1__X;
  wire S2__U1__Y;
  wire S2__U2__C;
  wire S2__U2__S;
  wire S2__U2__X;
  wire S2__U2__Y;
  wire S2__w10;
  wire S2__w11;
  wire S2__w12;
  wire S2__w13;
  wire S2__w14;
  wire S2__w15;
  wire S2__w8;
  wire S2__w9;
  wire [6:0] aOut;

  assign S0__U10__O = -1;
  assign S0__U9__O = -1;

  assign S0__P1[0] = (S0__IN1[0] & S0__IN2[1]);
  assign S0__P2[0] = (~ (S0__IN1[0] & S0__IN2[2]));
  assign S0__P1[1] = (S0__IN1[1] & S0__IN2[0]);
  assign S0__P2[1] = (S0__IN1[1] & S0__IN2[1]);
  assign S0__P3[0] = (~ (S0__IN1[1] & S0__IN2[2]));
  assign S0__P2[2] = (~ (S0__IN1[1] & S0__IN2[0]));
  assign S0__P3[1] = (~ (S0__IN1[1] & S0__IN2[1]));
  assign S0__P3[2] = S0__U9__O;
  assign S1__U0__X = S1__IN1[0];
  assign S1__U0__Y = S1__IN1[1];
  assign S1__Out1[1] = S1__U0__S;
  assign S1__Out1[2] = S1__U0__C;
  assign S1__U1__X = S1__IN2[0];
  assign S1__U1__Y = S1__IN2[1];
  assign S1__U1__Z = S1__IN2[2];
  assign S1__Out2[0] = S1__U1__S;
  assign S1__Out1[3] = S1__U1__C;
  assign S1__U2__X = S1__IN3[0];
  assign S1__U2__Y = S1__IN3[1];
  assign S1__U2__Z = S1__IN3[2];
  assign S1__Out2[1] = S1__U2__S;
  assign S1__Out2[2] = S1__U2__C;
  assign S1__Out1[0] = S1__IN0;
  assign S1__Out1[4] = S1__IN4;
  assign S1__Out1[5] = S1__IN5;
  assign S2__U0__X = S2__IN1[0];
  assign S2__U0__Y = S2__IN2[0];
  assign S2__Out[0] = S2__U0__S;
  assign S2__U1__X = S2__IN1[1];
  assign S2__U1__Y = S2__IN2[1];
  assign S2__U2__X = S2__IN1[2];
  assign S2__U2__Y = S2__IN2[2];
  assign S2__Out[1] = (S2__w9 ^ S2__w13);
  assign S2__Out[2] = (S2__w11 ^ S2__w14);
  assign S2__Out[3] = (S2__IN1[3] ^ S2__w15);
  assign S2__Out[4] = (((((S2__IN1[3] & S2__w11) & S2__w9) & S2__w8) | ((S2__IN1[3] & S2__w11) & S2__w10)) | (S2__IN1[3] & S2__w12));
  assign S2__IN1 = R1[5:2];
  assign aOut[6:2] = S2__Out;
  assign aOut[0] = R1[0];
  assign aOut[1] = R1[1];
  assign Out = aOut[4:0];
  assign S0__P0 = (S0__IN1[0] & S0__IN2[0]);
  assign S0__P4 = (S0__IN1[1] & S0__IN2[2]);
  assign S0__P5 = S0__U10__O;
  assign S0__IN1 = IN1;
  assign S0__IN2 = IN2;
  assign P0 = S0__P0;
  assign P1 = S0__P1;
  assign P2 = S0__P2;
  assign P3 = S0__P3;
  assign P4 = S0__P4;
  assign P5 = S0__P5;
  assign S1__U0__C = (S1__U0__X & S1__U0__Y);
  assign S1__U0__S = (S1__U0__X ^ S1__U0__Y);
  assign S1__U1__C = (((S1__U1__X & S1__U1__Y) | (S1__U1__Y & S1__U1__Z)) | (S1__U1__Z & S1__U1__X));
  assign S1__U1__S = ((S1__U1__X ^ S1__U1__Y) ^ S1__U1__Z);
  assign S1__U2__C = (((S1__U2__X & S1__U2__Y) | (S1__U2__Y & S1__U2__Z)) | (S1__U2__Z & S1__U2__X));
  assign S1__U2__S = ((S1__U2__X ^ S1__U2__Y) ^ S1__U2__Z);
  assign S1__IN0 = P0;
  assign S1__IN1 = P1;
  assign S1__IN2 = P2;
  assign S1__IN3 = P3;
  assign S1__IN4 = P4;
  assign S1__IN5 = P5;
  assign R1 = S1__Out1;
  assign R2 = S1__Out2;
  assign S2__U0__C = (S2__U0__X & S2__U0__Y);
  assign S2__U0__S = (S2__U0__X ^ S2__U0__Y);
  assign S2__U1__C = (S2__U1__X & S2__U1__Y);
  assign S2__U1__S = (S2__U1__X ^ S2__U1__Y);
  assign S2__U2__C = (S2__U2__X & S2__U2__Y);
  assign S2__U2__S = (S2__U2__X ^ S2__U2__Y);
  assign S2__w8 = S2__U0__C;
  assign S2__w9 = S2__U1__S;
  assign S2__w10 = S2__U1__C;
  assign S2__w11 = S2__U2__S;
  assign S2__w12 = S2__U2__C;
  assign S2__w13 = S2__w8;
  assign S2__w14 = ((S2__w9 & S2__w8) | S2__w10);
  assign S2__w15 = ((((S2__w11 & S2__w9) & S2__w8) | (S2__w11 & S2__w10)) | S2__w12);
  assign S2__IN2 = R2;
endmodule  /* Mult_2_3 */
