// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for counter
*/

module testbench(); /* No inputs, no outputs */

reg clk = 1'b0; /* Represents clock, initial value is 0 */

always begin
    #1 clk = ~clk; /* Toggle clock every 1ns */
end

wire clk2;

counter counter(.clk(clk), .clk2(clk2));

initial begin
    $dumpvars;      /* Open for dump of signals */
    $display("Test started...");   /* Write to console */
    #50 $finish;    /* Stop simulation after 10ns */
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for counter
*/

module testbench(); /* No inputs, no outputs */

reg clk = 1'b0; /* Represents clock, initial value is 0 */

always begin
    #1 clk = ~clk; /* Toggle clock every 1ns */
end

wire clk2;

counter counter(.clk(clk), .clk2(clk2));

initial begin
    $dumpvars;      /* Open for dump of signals */
    $display("Test started...");   /* Write to console */
    #50 $finish;    /* Stop simulation after 10ns */
end

endmodule
