module part4 (SW, LEDR, LEDG);
  input [1:0] SW;
  output [17:0] LEDR, LEDG;
  assign LEDR[1:0] = SW[1:0];
  
  wire Q;

  D_latch L0 (SW[1], SW[0], LEDG[0]);
  flippyfloppy F0 (SW[1], SW[0], LEDG[1]);
  flippyfloppy F1 (~SW[1], SW[0], LEDG[2]);
endmodule

module D_latch (Clk, D, Q);
  input D, Clk;
  output reg Q;
  always @ (D, Clk)
    if (Clk)
      Q = D;
endmodule

module flippyfloppy (Clk, D, Q);
  input Clk, D;
  output Q;
  
  wire Qm;
  D_latch D0 (~Clk, D, Qm);
  D_latch D1 (Clk, Qm, Q);
endmodule
