// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
       
  wire [15:0] sum1;
  wire [15:0] sum2;
  wire [15:0] sum2a;
  wire [15:0] sum2b;
  wire cout1;

  add16 add16_inst1
  (
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(),
    .sum(sum1),
    .cout(cout1)
  );

  add16 add16_inst2
  (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1),
    .sum(sum2a),
    .cout()
  );
    
    add16 add16_inst3
  (
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(0),
    .sum(sum2b),
    .cout()
  );

    assign sum2 = cout1 ? {sum2a} : {sum2b};
    
    assign sum = {sum2,sum1};

endmodule