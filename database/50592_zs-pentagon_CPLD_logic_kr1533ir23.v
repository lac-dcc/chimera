// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 10 ps
module kr1533ir23 #(parameter DELAY_RISE = 1, DELAY_FALL = 1)
(
    input [7:0] D,
    output [7:0] Q,
    input C,
    input OEn
);
reg [7:0] q = 8'b0;
//always @(posedge C) q <= D;
always @(posedge C) q = D;
assign #(DELAY_RISE, DELAY_FALL) Q = (OEn)?(8'bz):(q);
endmodule