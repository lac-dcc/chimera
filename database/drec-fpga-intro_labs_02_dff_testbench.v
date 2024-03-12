`timescale 1 ns / 100 ps

/*
*   Introduction to FPGA and Verilog
*
*   Viktor Prutyanov, 2019
*
*   Testbench for D-flip-flops
*/

module testbench(); /* No inputs, no outputs */

reg clk = 1'b0; /* Represents clock, initial value is 0 */

always begin
    #1 clk = ~clk; /* Toggle clock every 1ns */
end

wire q; /* Output of 1st flip-flop */
wire q2;    /* Output of 2nd flip-flop */
reg d;  /* Input of flip-flops */
reg rst;    /* Reset for 2nd flip-flop */

initial begin
    d = 0;
    #2 d = 1;
    #5 d = 0;
end

initial begin
    rst = 1;
    #4.5 rst = 0;
    #0.25 rst = 1;
end

dff dff(.clk(clk), .d(d), .q(q));
dff2 dff2(.clk(clk), .d(d), .q(q2), .reset(rst));

initial begin
    $dumpvars;      /* Open for dump of signals */
    $display("Test started...");   /* Write to console */
    #10 $finish;    /* Stop simulation after 10ns */
end

endmodule
