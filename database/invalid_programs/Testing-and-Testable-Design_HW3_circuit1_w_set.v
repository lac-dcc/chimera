// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit1(x1,x2,x3,CP,CD,SD,z);
input x1,x2,x3,CP,CD,SD;
output z;
wire c1,y1;


GTECH_NOR3 G1 (x2,x3,y1,c1);
GTECH_UDP_FD3 F1 (y1,c1,CP,CD,SD);  // CP - clk aka clock pulse
//GTECH_UDP_FD3 (Q, D, CP, CD, SD);
GTECH_OR2 G2 (x1,c1,z);


endmodule