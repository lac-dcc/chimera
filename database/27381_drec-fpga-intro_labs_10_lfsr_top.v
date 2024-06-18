// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output DS_EN1
);

wire [2:0]w;

lfsr lfsr(CLK, w);

assign DS_EN1 = w[0];

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output DS_EN1
);

wire [2:0]w;

lfsr lfsr(CLK, w);

assign DS_EN1 = w[0];

endmodule
