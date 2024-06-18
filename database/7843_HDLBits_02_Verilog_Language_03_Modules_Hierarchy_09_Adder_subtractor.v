// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
  wire [31:0] b_in;
  wire [15:0] sum1;
  wire [15:0] sum2;
  wire cout1;

  assign b_in = {32{sub}} ^ b;

  add16 add16_inst1
  (
    .a(a[15:0]),
    .b(b_in[15:0]),
    .cin(sub),
    .sum(sum1),
    .cout(cout1)
  );

  add16 add16_inst2
  (
    .a(a[31:16]),
    .b(b_in[31:16]),
    .cin(cout1),
    .sum(sum2),
    .cout()
  );

  assign sum = {sum2, sum1}; 

endmodule