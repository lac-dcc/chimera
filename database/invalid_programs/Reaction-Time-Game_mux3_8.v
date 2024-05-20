// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef mux3_8
  `define mux3_8

  `include "mux4to1.v"
  module mux3_8(S2, S1, S0, X7, X6, X5, X4, X3, X2, X1, X0, F);
    input X7;
    input X6;
    input X5;
    input X4;
    input X3;
    input X2;
    input X1;
    input X0;

    input S2;
    input S1;
    input S0;
	 
	 output F;

    wire SW1;
    wire SW2;

    wire [1:0] S12Bus;
    assign S12Bus = {S1, S0};

    mux4to1 m41SW1 (.W0(X0), .W1(X1), .W2(X2), .W3(X3), .S(S12Bus), .F(SW1));
    mux4to1 m41SW2 (.W0(X4), .W1(X5), .W2(X6), .W3(X7), .S(S12Bus), .F(SW2));

    assign F = (S2) ? (SW2) : (SW1);


  endmodule

`endif
