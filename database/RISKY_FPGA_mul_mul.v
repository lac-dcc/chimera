// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module mul #( 
  parameter BITS = 32
) ( 
  input [BITS-1:0] a,
  input b,
  output [BITS-1:0] c
);

assign c = b ? a : {BITS{1'b0}};

endmodule
