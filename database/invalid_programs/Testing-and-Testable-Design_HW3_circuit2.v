// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit1(x1,x2,x3,x4,x5,z);
input x1,x2,x3,x4,x5;
output z;
wire c1,c2,c3,c4,x1b;


GTECH_AND2 G1(x1,x2,c1);
GTECH_OR2 G2(x3,x4,c2);
GTECH_NOR2 G3(c1,c2,c3);
GTECH_NOT G6(x1,x1b);
GTECH_AND2 G4(x1b,x5,c4);
GTECH_OR2 G5(c3,c4,z);

endmodule