// This program was cloned from: https://github.com/Shofuuu/tt06-timer_counter-UGM
// License: Apache License 2.0

`default_nettype none
// `timescale 1ns/1ns

module mux#(
    parameter DATA = 4
)(
    input wire [DATA-1:0] seg0, seg1, seg2, seg3,
    input wire [1:0] sel,
    output wire [DATA-1:0] y
);

    assign y = (sel[1] ? (sel[0] ? seg3 : seg2) : (sel[0] ? seg1 : seg0));

endmodule



