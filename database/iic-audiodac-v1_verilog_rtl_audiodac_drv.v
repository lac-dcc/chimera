// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

`default_nettype none

module audiodac_drv(
`ifdef USE_POWER_PINS
    input vdd,
    input vss,
`endif
    input in_p,
    input in_n,
    input in_hi,
    output wire out_p,
    output wire out_n
);

assign out_p = (in_hi) ? in_p : 1'bx;
assign out_n = (in_hi) ? in_n : 1'bx;

endmodule
`default_nettype wire
