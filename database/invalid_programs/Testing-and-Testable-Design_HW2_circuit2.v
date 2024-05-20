// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit2(x1,x2,x3,z);
input x1,x2,x3;
output z;
wire n1,n2,n3;

GTECH_NOT G1 (x2,n3);
GTECH_AND2 G2 (x1,x2,n1);
GTECH_AND2 G3 (n3,x3,n2);
GTECH_OR2 G4(n1,n2,z);

endmodule