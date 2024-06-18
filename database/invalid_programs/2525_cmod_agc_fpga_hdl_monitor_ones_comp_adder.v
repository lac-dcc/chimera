// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

`include "monitor_defs.v"

module ones_comp_adder(
    input wire [15:1] x,
    input wire [15:1] y,
    output wire [15:1] u
);

wire [16:1] sum;

assign sum = {1'b0, x} + {1'b0, y};
assign u = sum[15:1] + {14'b0, sum[16]};

endmodule
`default_nettype wire
