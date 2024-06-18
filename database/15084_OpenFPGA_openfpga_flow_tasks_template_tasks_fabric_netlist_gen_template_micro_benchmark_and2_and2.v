// This program was cloned from: https://github.com/lnis-uofu/OpenFPGA
// License: MIT License

/////////////////////////////////////////
//  Functionality: 2-input AND 
//  Author:        Xifan Tang
////////////////////////////////////////
`timescale 1ns / 1ps

module and2(
  a,
  b,
  c);

input wire a;
input wire b;
output wire c;

assign c = a & b;

endmodule
