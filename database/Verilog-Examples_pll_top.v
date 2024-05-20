// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`default_nettype none

module top (
    input wire clk25,
    input wire reset_n,
    output wire [7:0] led
    );

    wire reset_n_pu;
    wire reset = ~reset_n_pu;

    SB_IO #(
        .PIN_TYPE(6'b0000_01),  // output = 0, input = 1
        .PULLUP(1'b1)           // enable the pullup = 1
    ) reset_n_pullup (
        .PACKAGE_PIN(reset_n),  // the physical pin number with the pullup on it
        .D_IN_0(reset_n_pu)     // an internal wire for this pin
    );


    wire clk100;

    localparam CLOCK_HZ = 100000000;
    pll_25_100 upll(.clock_in(clk25), .global_clock(clk100));

    counter c (
        .clk(clk100),
        .reset(reset),
        .out(led)
        );

endmodule
