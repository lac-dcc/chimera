// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

/* No inputs, no outputs */
module testbench();

/* Represents clock, initial value is 0 */
reg clk = 1'b0;

always begin
    /* Toggle clock every 1ns */
    #1 clk = ~clk;
end

/* Input signals for dfa */
reg in1 = 1'b0;
reg in2 = 1'b0;
reg in5 = 1'b0;

/* Wires for output signals of dfa */
wire out1;
wire out2;
wire out2x2;
wire soda;

/* Create instance of dfa module */
dfa dfa(.clk(clk), .in1(in1), .in2(in2), .in5(in5), 
        .out1(out1), .out2(out2), .out2x2(out2x2), .soda(soda));

initial begin
    /* Open for dump of signals */
    $dumpvars;

    /* Write to console */
    $display("Test started...");

    /* S0 -> S1 */
    #0.5 in1 = 1;
    #1 in1 = 0;

    /* S1 -> S2 */
    #1 in1 = 1;
    #1 in1 = 0;

    /* S2 -> S3 */
    #1 in1 = 1;
    #1 in1 = 0;

    /* S3 -> S4 */
    #1 in1 = 1;
    #1 in1 = 0;

    /* S4 -> S0, soda */
    #1 in1 = 1;
    #1 in1 = 0;

    /* S0 -> S2 */
    #1 in2 = 1;
    #1 in2 = 0;

    #1 in1 = 1;
    #1 in1 = 0;

    /* S3 -> S0, soda */
    #1 in2 = 1;
    #1 in2 = 0;

    /* S0 -> S0, soda */
    #1 in5 = 1;
    #1 in5 = 0;

    #1 in1 = 1;
    #1 in1 = 0;

    /* S1 -> S3 */
    #1 in2 = 1;
    #1 in2 = 0;

    /* S3 -> S0, soda, out1&2 */
    #1 in5 = 1;
    #1 in5 = 0;

    #1 in2 = 1;
    #1 in2 = 0;

    /* S2 -> S4 */
    #1 in2 = 1;
    #1 in2 = 0;

    /* S4 -> S0, soda, out1 */
    #1 in2 = 1;
    #1 in2 = 0; 

    #1 in2 = 1;
    #1 in2 = 0;
    #1 in2 = 1;
    #1 in2 = 0;

    /* S4 -> S0, soda, out2x2 */
    #1 in5 = 1;
    #1 in5 = 0;

    #1 in2 = 1;
    #1 in2 = 0;

    /* S2 -> S0, soda, out2 */
    #1 in5 = 1;
    #1 in5 = 0;

    #1 in1 = 1;
    #1 in1 = 0;

    /* S1 -> S0, soda, out1*/
    #1 in5 = 1;
    #1 in5 = 0;

    /* Stop simulation after 10ns */
    #10 $finish;
end

endmodule
