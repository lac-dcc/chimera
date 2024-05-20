// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit3(x1,x2,x3,x4,x5,z);
input x1,x2,x3,x4,x5;
output z;
wire n1,n2,n3,n4,n5;

GTECH_AND2 G1 (x2,x3,n1);
GTECH_OR2 G2 (x3,x4,n2);
GTECH_AND2 G3 (n1,n2,n3);
GTECH_AND2 G4 (x1,n3,n4);
GTECH_OR2 G5 (n3,x5,n5);
GTECH_AND2 G6 (n4,n5,z);

endmodule