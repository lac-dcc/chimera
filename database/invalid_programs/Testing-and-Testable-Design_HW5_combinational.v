// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

`include "gtech_lib.v"
module circuit(x,CP,z);
input x,CP;
output z;

wire y1,y2,y3,Y3,c3,c4,c5,c8,c9;

GTECH_AND2 G1(x,y1,c3);
GTECH_OR3 G2(x,y2,y3,c4);
GTECH_AND2 G3(c3,c4,c5);
GTECH_OR2 G4(c5,y2,c8);
GTECH_AND2 G5(c5,y3,c9);
GTECH_AND2 G6(c8,c9,Y3);
GTECH_NOT G7(c8,z);

//GTECH_UDP_FD1 FF1 (y1,c5,CP);
//GTECH_UDP_FD1 FF2 (y2,c8,CP);
//GTECH_UDP_FD1 FF3 (y3,Y3,CP);

endmodule