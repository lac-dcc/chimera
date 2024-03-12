module part5 (SW, LEDG, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input [17:0] SW;
  output [8:0] LEDR, LEDG;
  output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

  assign LEDR[8:0] = SW[8:0];
  assign HEX3 = 7'b1111111;
  
  // show inputs A and B
  b2d_7seg H7 (SW[15:12], HEX7);
  b2d_7seg H6 (SW[11:8], HEX6);
  b2d_7seg H5 (SW[7:4], HEX5);
  b2d_7seg H4 (SW[3:0], HEX4);

  // check for input errors
  wire e1, e2, e3, e4;

  comparator C0 (SW[3:0], e1);
  comparator C1 (SW[7:4], e2);
  comparator C2 (SW[11:8], e3);
  comparator C3 (SW[15:12], e4);

  assign LEDG[8] = e1 | e2 | e3 | e4;


  // sum decimal "ones"
  wire c1, c2, c3;
  wire [4:0] S0;

  fulladder FA0 (SW[0], SW[8], SW[16], S0[0], c1);
  fulladder FA1 (SW[1], SW[9], c1, S0[1], c2);
  fulladder FA2 (SW[2], SW[10], c2, S0[2], c3);
  fulladder FA3 (SW[3], SW[11], c3, S0[3], S0[4]);

  assign LEDG[3:0] = S0[3:0];
  
  wire z0;
  wire [3:0] A0, M0;

  comparator9 C4 (S0[4:0], z0);
  circuitA AA (S0[3:0], A0);
  mux_4bit_2to1 MUX0 (z0, S0[3:0], A0, M0);
  //circuitB BB (z, HEX1);
  b2d_7seg H0 (M0, HEX0);



  wire c4, c5, c6;
  wire [4:0] S1;

  fulladder FA4 (SW[4], SW[12], z0, S1[0], c4);
  fulladder FA5 (SW[5], SW[13], c4, S1[1], c5);
  fulladder FA6 (SW[6], SW[14], c5, S1[2], c6);
  fulladder FA7 (SW[7], SW[15], c6, S1[3], S1[4]);

  assign LEDG[7:4] = S1[3:0];

  wire z1;
  wire [3:0] A1, M1;

  comparator9 C5 (S1[4:0], z1);
  circuitA AB (S1[3:0], A1);
  mux_4bit_2to1 MUX1 (z1, S1[3:0], A1, M1);
  circuitB H2 (z1, HEX2);
  b2d_7seg H1 (M1, HEX1);


endmodule

module fulladder (a, b, ci, s, co);
  input a, b, ci;
  output co, s;

  wire d;

  assign d = a ^ b;
  assign s = d ^ ci;
  assign co = (b & ~d) | (d & ci);
endmodule





module b2d_7seg (X, SSD);
  input [3:0] X;
  output [0:6] SSD;

  assign SSD[0] = ((~X[3] & ~X[2] & ~X[1] &  X[0]) | (~X[3] &  X[2] & ~X[1] & ~X[0]));
  assign SSD[1] = ((~X[3] &  X[2] & ~X[1] &  X[0]) | (~X[3] &  X[2] &  X[1] & ~X[0]));
  assign SSD[2] =  (~X[3] & ~X[2] &  X[1] & ~X[0]);
  assign SSD[3] = ((~X[3] & ~X[2] & ~X[1] &  X[0]) | (~X[3] &  X[2] & ~X[1] & ~X[0]) | (~X[3] &  X[2] & X[1] & X[0]) | (X[3] & ~X[2] & ~X[1] & X[0]));
  assign SSD[4] = ~((~X[2] & ~X[0]) | (X[1] & ~X[0]));
  assign SSD[5] = ((~X[3] & ~X[2] & ~X[1] &  X[0]) | (~X[3] & ~X[2] &  X[1] & ~X[0]) | (~X[3] & ~X[2] & X[1] & X[0]) | (~X[3] & X[2] & X[1] & X[0]));
  assign SSD[6] = ((~X[3] & ~X[2] & ~X[1] &  X[0]) | (~X[3] & ~X[2] & ~X[1] & ~X[0]) | (~X[3] &  X[2] & X[1] & X[0]));
endmodule

// 4 bit >9 comparator
module comparator (V, z);
  input [3:0] V;
  output z;

  assign z = (V[3] & (V[2] | V[1]));
endmodule

// 5 bit >9 comparator
module comparator9 (V, z);
  input [4:0] V;
  output z;

  assign z = V[4] | ((V[3] & V[2]) | (V[3] & V[1]));
endmodule

module circuitA (V, A);
  input [3:0] V;
  output [3:0] A;

  assign A[0] = V[0];
  assign A[1] = ~V[1];
  assign A[2] = (~V[3] & ~V[1]) | (V[2] & V[1]);
  assign A[3] = (~V[3] & V[1]);
endmodule

module circuitB (z, SSD);
  input z;
  output [0:6] SSD;

  assign SSD[0] = z;
  assign SSD[1:2] = 2'b00;
  assign SSD[3:5] = {3{z}};
  assign SSD[6] = 1;
endmodule

module mux_4bit_2to1 (s, U, V, M);
  // if ~s, send U
  input s;
  input [3:0] U, V;
  output [3:0] M;

  assign M = ({4{~s}} & U) | ({4{s}} & V);
endmodule
