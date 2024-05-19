// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Trivial module
*/

module lab00_test(
    input wire clk,

    output wire clk1
);

assign clk1 = clk;

endmodule
