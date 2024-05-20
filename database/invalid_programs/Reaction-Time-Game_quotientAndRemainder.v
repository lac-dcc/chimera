// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef quotientAndRemainder
	`define quotientAndRemainder

`include "divideByTen.v"
`include "full_add_subtract13bit.v"
`include "multiplyByTen.v"

module quotientAndRemainder(Input, Quotient, Remainder);
  input [12:0] Input;
  output [12:0] Quotient;
  output [3:0] Remainder;

  wire [12:0] inbetween;
  wire [12:0] Quotient;

  divideByTen db10 (.dividend(Input), .quotient(Quotient));
  multiplyByTen mb10 (.X(Quotient), .Product(inbetween));
  full_add_subtract13bit FA13 (.X(Input), .Y(inbetween), .AddSub(1'b1), .S(Remainder), .Overflow(_ignore));

endmodule

`endif