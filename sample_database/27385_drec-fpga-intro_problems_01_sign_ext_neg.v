// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module neg(
    input [31:0]x,

    output [31:0]minus_x
);

/*
*   Problem 3:
*   Describe sign-inversion logic here.
*/

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module neg(
    input [31:0]x,

    output [31:0]minus_x
);

/*
*   Problem 3 (solved):
*   Describe sign-inversion logic here.
*/
assign minus_x = ~x + 1;

endmodule
