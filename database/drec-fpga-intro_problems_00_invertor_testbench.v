// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for problem set #00
*/

module testbench(); /* No inputs, no outputs */

reg clk = 1'b0; /* Represents clock, initial value is 0 */

always begin
    #1 clk = ~clk; /* Toggle clock every 1ns */
end

wire clk1; /* For output of tested module */

pset00_test pset00_test(.in(clk), .out(clk1)); /* Tested module instance */

/*
*   Problem 3/5:
*   add wire for pset00_invertor output
*/

/*
*   Problem 3/5:
*   add instance of pset00_invertor here
*/

initial begin
    $dumpvars;      /* Open for dump of signals */
    $display("Test started...");   /* Write to console */
    #10 $finish;    /* Stop simulation after 10ns */
end

endmodule
