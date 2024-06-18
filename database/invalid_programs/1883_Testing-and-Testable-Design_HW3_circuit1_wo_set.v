// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit1(x1,x2,x3,CP,z);
input x1,x2,x3,CP;
output z;
wire c1,y1;


GTECH_NOR3 G1 (x2,x3,y1,c1);
GTECH_UDP_FD1 F1 (y1,c1,CP);  // CP - clk aka clock pulse
//primitive GTECH_UDP_FD1  (Q, D, CP);
GTECH_OR2 G2 (x1,c1,z);


endmodule