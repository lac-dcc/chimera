// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit1(x1,x2,z);
input x1,x2;
output z;
wire n1,n2;

GTECH_OR2 G1 (x1,x2,n1);
GTECH_XOR2 G2 (x1,x2,n2);
GTECH_XOR2 G3 (n1,n2,z);

endmodule