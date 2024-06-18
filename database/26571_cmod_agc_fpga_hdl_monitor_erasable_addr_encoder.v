// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module erasable_addr_encoder(
    input wire  [11:1] eaddr,
    output wire [11:9] eb,
    output wire [12:1] s
);

assign eb = eaddr[11:9];
assign s[12:9] = 4'b0011;
assign s[8:1] = eaddr[8:1];

endmodule
`default_nettype wire
