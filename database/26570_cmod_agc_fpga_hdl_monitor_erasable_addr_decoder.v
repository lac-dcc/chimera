// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module erasable_addr_decoder(
    input wire  [11:9] eb,
    input wire  [12:1] s,
    output wire [11:1] eaddr
);

// Logic functions taken module A15
assign eaddr[8:1] = s[8:1];
assign eaddr[9] = s[9] & (eb[9] | ~s[10]);
assign eaddr[10] = s[10] & (eb[10] | ~s[9]);
assign eaddr[11] = eb[11] & s[10] & s[9];

endmodule
`default_nettype wire
