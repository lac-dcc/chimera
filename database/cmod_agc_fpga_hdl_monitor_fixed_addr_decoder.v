// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module fixed_addr_decoder(
    input wire [7:5]   fext,
    input wire [15:11] fb,
    input wire [12:1]  s,
    output wire [16:1] faddr
);

// Logic functions taken from Digital Development Memo #219
assign faddr[10:1] = s[10:1];
assign faddr[11] = (s[12] & s[11]) | (~s[12] & fb[11]);
assign faddr[12] = s[12] | fb[12];
assign faddr[13] = ~s[12] & fb[13];
assign faddr[14] = ~s[12] & fb[14] & (~fb[15] | ~fext[7] | fext[5]);
assign faddr[15] = ~s[12] & fb[15] & (~fb[14] | ~fext[7] | fext[6]);
assign faddr[16] = ~s[12] & fb[15] & fb[14] & fext[7];

endmodule
`default_nettype wire
