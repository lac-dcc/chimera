// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module zvn #(
  parameter WIDTH = 32
)(
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input [WIDTH-1:0] s, 
  input alufn_sig,
  output z,
  output v,
  output n
);

wire xb;

assign xb = b[WIDTH-1]^alufn_sig;

assign v = (a[WIDTH-1]&xb&~s[WIDTH-1])|(~a[WIDTH-1]&~xb&s[WIDTH-1]);

assign z = ~|s;

assign n = s[WIDTH-1];

endmodule

