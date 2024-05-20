// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module FullAdder(X, Y, Z, S, C);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule
module FullAdderProp(X, Y, Z, S, C, P);
  output C;
  output S;
  output P;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
  assign P = X ^ Y;
endmodule
module HalfAdder(X, Y, S, C);
  output C;
  output S;
  input X;
  input Y;
  assign C = X & Y;
  assign S = X ^ Y;
endmodule
module ConstatntOne(O);
  output O;
  assign O = 1;
endmodule
module Counter(X1, X2, X3, X4, X5, X6, X7, S3, S2, S1);
output S1;
output S2;
output S3;
input X1;
input X2;
input X3;
input X4;
input X5;
input X6;
input X7;
wire W1;
wire W2;
wire W3;
wire W4;
wire W5;
wire W6;
assign W1 = X1 ^ X2 ^ X3;
assign W2 = X4 ^ X5 ^ ( X6 ^ X7 );
assign W3 = ~ ( ( ~ ( X1 & X2 ) ) & ( ~ ( X1 & X3 ) ) & ( ~ ( X2 & X3 ) ) );
assign W4 = ~ ( ( ~ ( ( X4 | X5 ) & ( X6 | X7 ) ) ) & ( ~ ( ( X4 & X5 ) | ( X6 & X7 ) ) ) );
assign W5 = ~ ( X4 & X5 & X6 & X7 );
assign W6 = ~ ( ( ~ ( W4 & W5 ) ) ^ W3 );
assign S3 = W1 ^ W2;
assign S2 = ~ ( W6 ^ ( ~ ( W1 & W2 ) ) );
assign S1 = ~ ( W5 & ( ~ ( W3 & W4 ) ) & ( ~ ( W1 & W2 & W6 ) ) );
endmodule
module S_SP_2_3(IN1, IN2 , P0, P1, P2, P3, P4, P5);
  input [1:0] IN1;
  input [2:0] IN2;
  output [0:0] P0;
  output [1:0] P1;
  output [2:0] P2;
  output [2:0] P3;
  output [0:0] P4;
  output [0:0] P5;
  wire w14;
  wire w15;
  assign P0[0] = IN1[0]&IN2[0];
  assign P1[0] = IN1[0]&IN2[1];
  assign P2[0] = ~(IN1[0]&IN2[2]);
  assign P1[1] = IN1[1]&IN2[0];
  assign P2[1] = IN1[1]&IN2[1];
  assign P3[0] = ~(IN1[1]&IN2[2]);
  assign P2[2] = ~(IN1[1]&IN2[0]);
  assign P3[1] = ~(IN1[1]&IN2[1]);
  assign P4[0] = IN1[1]&IN2[2];
  ConstatntOne U9 (P3[2]);
  ConstatntOne U10 (P5[0]);

endmodule
module WT(IN0, IN1, IN2, IN3, IN4, IN5, Out1, Out2);
  input [0:0] IN0;
  input [1:0] IN1;
  input [2:0] IN2;
  input [2:0] IN3;
  input [0:0] IN4;
  input [0:0] IN5;
  output [5:0] Out1;
  output [2:0] Out2;
  HalfAdder U0 (IN1[0], IN1[1], Out1[1], Out1[2]);
  FullAdder U1 (IN2[0], IN2[1], IN2[2], Out2[0], Out1[3]);
  FullAdder U2 (IN3[0], IN3[1], IN3[2], Out2[1], Out2[2]);
  assign Out1[0] = IN0[0];
  assign Out1[4] = IN4[0];
  assign Out1[5] = IN5[0];

endmodule
module CL_4_3(IN1, IN2, Out);
  input [3:0] IN1;
  input [2:0] IN2;
  output [4:0] Out;
  wire w8;
  wire w9;
  wire w10;
  wire w11;
  wire w12;
  wire w13;
  wire w14;
  wire w15;
  HalfAdder U0 (IN1[0], IN2[0], Out[0], w8);
  HalfAdder U1 (IN1[1], IN2[1], w9, w10);
  HalfAdder U2 (IN1[2], IN2[2], w11, w12);
  assign Out[1] = w9^w13;
  assign Out[2] = w11^w14;
  assign Out[3] = IN1[3]^w15;

  assign w13 = (w8);
  assign w14 = (w9 & w8) | (w10);
  assign w15 = (w11 & w9 & w8) | (w11 & w10) | (w12);
  assign Out[4] = (IN1[3] & w11 & w9 & w8) | (IN1[3] & w11 & w10) | (IN1[3] & w12);
endmodule
module Mult_2_3(IN1, IN2, Out);
  input [1:0] IN1;
  input [2:0] IN2;
  output [4:0] Out;
  wire [0:0] P0;
  wire [1:0] P1;
  wire [2:0] P2;
  wire [2:0] P3;
  wire [0:0] P4;
  wire [0:0] P5;
  wire [5:0] R1;
  wire [2:0] R2;
  wire [6:0] aOut;
  S_SP_2_3 S0 (IN1, IN2 , P0, P1, P2, P3, P4, P5);
  WT S1 (P0, P1, P2, P3, P4, P5, R1, R2);
  CL_4_3 S2 (R1[5:2], R2, aOut[6:2]);
  assign aOut[0] = R1[0];
  assign aOut[1] = R1[1];
  assign Out = aOut[4:0];
endmodule