// A gated RS latch
module part2 (SW, LEDR, LEDG);
  input [1:0] SW;
  output [1:0] LEDR, LEDG;
  assign LEDR = SW;
  
  wire Q;

  flippyfloppy D0 (SW[0], SW[1], LEDG[0]);
endmodule

module flippyfloppy (Clk, D, Q);
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
