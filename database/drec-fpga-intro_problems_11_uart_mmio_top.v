// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G,

    output TXD
);

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

wire [15:0]hd_data;
cpu_top cpu_top(
    .clk(CLK),
    .data_out0(hd_data)
    /*
    * Problem 3:
    * Connect UART transmitter to CPU.
    * Don't forget about 'start' signal!
    */
);

hex_display hex_display(
    .clk(CLK),
    .data(hd_data),
    .anodes(anodes),
    .segments(segments)
);

/* Problem 3: instantiate UART transmitter */

endmodule
