// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// toplevel_Lab04.v for EE 2390 Lab #4
`timescale 1ns / 1ps
module toplevel_Lab04(seg,an,led0,sw);
    output [0:6] seg;
    output [3:0] an;
    output       led0;
    input  [7:0] sw;

    sevenseghexdecoder  u1(.Seg(seg),.HexVal(sw[3:0]));
    decoder2x4          u2(.D(an),.A(sw[6]),.B(sw[5]),.EN(sw[4]));
    directleddriver     u3(.led(led0),.sw(sw[7]));

endmodule
