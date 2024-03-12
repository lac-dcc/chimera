// flipflop
module part3 (SW, LEDR, LEDG);
  input [1:0] SW;
  output [1:0] LEDR, LEDG;
  assign LEDR = SW;
  
  wire Q;

  flippyfloppy F0 (SW[1], SW[0], LEDG[0]);
endmodule

module mylatch (Clk, D, Q);
  input Clk, D;
  output Q;

  wire S, R;

  assign S = D;
  assign R = ~D;

  wire R_g, S_g, Qa, Qb /* synthesis keep */ ;

  assign R_g = R & Clk;
  assign S_g = S & Clk;
  assign Qa = ~(R_g | Qb);
  assign Qb = ~(S_g | Qa);

  assign Q = Qa;
endmodule

module flippyfloppy (Clk, D, Q);
  input Clk, D;
  output Q;
  
  wire Qm;
  mylatch D0 (~Clk, D, Qm);
  mylatch D1 (Clk, Qm, Q);
endmodule
