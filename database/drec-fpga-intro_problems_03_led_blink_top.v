// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Problem set #03
*/

/*
*   Top-level module
*/
module top(
    input CLK,

    output DS_C,
    output DS_EN1, DS_EN2, DS_EN3, DS_EN4
);

assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = 4'b1111;

/*
*   Problem 1/:
*   Make an instance of the parametrized clock divider module (clk_div)
*   written in the previous problem set.
*   Connect CLK to the input and DS_C to the output of the divider.
*   Choose any value of parameter X in range [11; 14].
*/

endmodule
