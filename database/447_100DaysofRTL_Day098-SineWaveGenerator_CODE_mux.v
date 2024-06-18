// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mux(o,i1,i2,s);                  //2x1 MUX
input i1,i2,s;
output o;
wire x1,x2,sc;
not(sc,s);
and(x1,i1,sc);
and(x2,i2,s);
or(o,x1,x2);
endmodule
