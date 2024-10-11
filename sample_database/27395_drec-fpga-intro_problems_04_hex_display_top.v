// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

wire [15:0]d = 16'hCAFE; /* Data to display */

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

/*
*   Problem 1/7:
*   Make an instance of clock divider here.
*   Connect CLK to the input.
*/

/*
*   Problem 4/7:
*   Make an instance of hex display driver (hex_display) here.
*   Connect 'anodes', 'segments', 'data' to corresponding wires in current
*   module.
*/

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

wire [15:0]d = 16'hCAFE; /* Data to display */

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

/*
*   Problem 1/7:
*   Make an instance of clock divider here.
*   Connect CLK to the input.
*/

/*
*   Problem 4/7:
*   Make an instance of hex display driver (hex_display) here.
*   Connect 'anodes', 'segments', 'data' to corresponding wires in current
*   module.
*/

endmodule
