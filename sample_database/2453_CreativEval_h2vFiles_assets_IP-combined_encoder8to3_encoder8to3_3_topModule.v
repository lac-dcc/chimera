// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

//Gate-level description of Encoder with priority
//See example 9-6
module top(Y0,Y1,Y2,I0,I1,I2,I3,I4,I5,I6,I7);
input I0,I1,I2,I3,I4,I5,I6,I7;
output Y0,Y1,Y2;
wire nI2,nI4,nI5,nI6;
wire and1,and2,and3,and4,and5;
not(nI2,I2);
not(nI4,I4);
not(nI5,I5);
not(nI6,I6);
and(and1,nI5,nI4,I3);
and(and2,nI5,nI4,I2);
and(and3,nI6,I5);
and(and4,nI6,nI4,I3);
and(and5,nI6,nI4,nI2,I1);
or(Y2,I7,I6,I5,I4);
or(Y1,I7,I6,and1,and2);
or(Y0,I7,and3,and4,and5);
endmodule
