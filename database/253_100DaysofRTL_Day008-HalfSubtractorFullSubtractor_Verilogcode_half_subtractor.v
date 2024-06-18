// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module half_subtractor(
  input a, b,
  output diff, bout
);

  assign diff = a ^ b;
  assign bout = ~a & b;
  
endmodule
