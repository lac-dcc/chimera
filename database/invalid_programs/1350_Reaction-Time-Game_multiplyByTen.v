// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef multiplyByTen
	`define multiplyByTen

`include "full_add_subtract13bit.v"

module multiplyByTen(X, Product);
  input [12:0] X;
  output [12:0] Product;

  // add x << 3 and x << 1 which is the same as X*2 + X*8 = 10X
  full_add_subtract13bit fa (.X({1'b0, 1'b0, 1'b0, X[0], X[1], X[2], X[3], X[4], X[5], X[6], X[7], X[8], X[9]}), .Y({1'b0, X[0], X[1], X[2], X[3], X[4], X[5], X[6], X[7], X[8], X[9], X[10], X[11]}), .AddSub(1'b0), .S(Product));

endmodule

`endif