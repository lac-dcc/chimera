// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module fixed_addr_encoder(
    input wire [16:1] faddr,
    output wire [7:5] fext,
    output wire [15:11] fb,
    output wire [12:1] s
);

assign fext[7] = faddr[16];
assign fext[6:5] = faddr[16] ? faddr[15:14] : 2'b0;

assign fb[15:14] = faddr[16] ? 2'b11 : faddr[15:14];
assign fb[13:11] = faddr[13:11];

assign s = {2'b01, faddr[10:1]};

endmodule
`default_nettype wire
