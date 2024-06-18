// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef Decoder3to8
`define Decoder3to8

module Decoder3to8(
input [2:0] X,
input Enable,
output [7:0] OUT
);

assign OUT[0] = ~X[2] & ~X[1] & ~X[0] & Enable;
assign OUT[1] = ~X[2] & ~X[1] & X[0] & Enable;
assign OUT[2] = ~X[2] & X[1] & ~X[0] & Enable;
assign OUT[3] = ~X[2] & X[1] & X[0] & Enable;
assign OUT[4] = X[2] & ~X[1] & ~X[0] & Enable;
assign OUT[5] = X[2] & ~X[1] & X[0] & Enable;
assign OUT[6] = X[2] & X[1] & ~X[0] & Enable;
assign OUT[7] = X[2] & X[1] & X[0] & Enable;

endmodule

`endif