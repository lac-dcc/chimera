// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 10 ps
module kr1533kp11 #(parameter DELAY_RISE = 1, DELAY_FALL = 1)
(
    input [3:0] A,
    input [3:0] B,
    input SA,
    input CS,

    output [3:0] Y
);
assign #(DELAY_RISE, DELAY_FALL) Y = (CS)?(4'bz):((SA)?(B):(A));
endmodule