module part1 (SW, HEX0, HEX1, HEX2, HEX3);
   input [17:0] SW;
   output [0:6] HEX0, HEX1, HEX2, HEX3;

   b2d_7seg B0 (SW[3:0], HEX0);
   b2d_7seg B1 (SW[7:4], HEX1);
   b2d_7seg B2 (SW[11:8], HEX2);
   b2d_7seg B3 (SW[15:12], HEX3);
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
